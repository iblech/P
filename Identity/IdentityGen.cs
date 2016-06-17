using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

using Microsoft.Formula.API.Generators;

namespace Microsoft.Identity
{
    class IdentityGen
    {
        private List<PProgram> parsedPrograms { get; set; }
        private Dictionary<P_Root.MachineDecl, StringBuilder> machineDeclToSB = new Dictionary<P_Root.MachineDecl, StringBuilder>();
        private Dictionary<P_Root.StateDecl, StringBuilder> stateDeclToSB = new Dictionary<P_Root.StateDecl, StringBuilder>();
        private Compiler compiler;

        public IdentityGen(CommandLineOptions options)
        {
            options.analyzeOnly = true;
            options.profile = true;
            compiler = new Compiler(options);
        }

        private static string getString(ICSharpTerm x)
        {
            return (x as P_Root.StringCnst).Value;
        }

        private static string getValue(ICSharpTerm x)
        {
            Microsoft.Formula.Common.Rational a = (x as P_Root.RealCnst).Value;
            if (a.IsInteger)
            {
                return a.ToString(0);
            }
            else
            {
                return a.ToString(100);
            }
        }

        private static void genBaseType(P_Root.BaseType t, StringBuilder sb)
        {
            if (t._0.Symbol.ToString() == "INT")
            {
                sb.Append("int");
            }
            else if (t._0.Symbol.ToString() == "BOOL")
            {
                sb.Append("bool");
            }
            else if (t._0.Symbol.ToString() == "REAL")
            {
                sb.Append("machine");
            }
            else if (t._0.Symbol.ToString() == "ANY")
            {
                sb.Append("any");
            }
            else if (t._0.Symbol.ToString() == "EVENT")
            {
                sb.Append("event");
            }
            else if (t._0.Symbol.ToString() == "NULL")
            {
                sb.Append("null");
            }
            return;
        }

        private static void genTupType(P_Root.TupType t, StringBuilder sb)
        {
            //Looks like singleton tuple TYPES do not need a comma in their DECLARATION.
            var x = t;
            sb.Append("(");
            while (x.tl.Symbol.ToString() != "NIL")
            {
                gentype(x.hd as P_Root.TypeExpr, sb);
                sb.Append(", ");
                x = x.tl as P_Root.TupType;
            }
            gentype(x.hd as P_Root.TypeExpr, sb);
            sb.Append(')');
        }

        private static void genNmdTupTypeField(P_Root.NmdTupTypeField f, StringBuilder sb)
        {
            genQualifier(f.qual as P_Root.Qualifier, sb);
            sb.Append(" " + getString(f.name) + ": ");
            gentype(f.type as P_Root.TypeExpr, sb);
        }

        private static void genNmdTupType(P_Root.NmdTupType t, StringBuilder sb)
        {
            //Looks like singleton named tuple TYPES do not need a comma in their DECLARATION.
            var x = t;
            while (x.tl.Symbol.ToString() != "NIL")
            {
                genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                sb.Append(", ");
                x = x.tl as P_Root.NmdTupType;
            }
            genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
        }

        private static void genQualifier(P_Root.Qualifier q, StringBuilder sb)
        {
            if (q.Symbol.ToString() == "SWAP")
                sb.Append("swap ");
            else if (q.Symbol.ToString() == "XFER")
                sb.Append("xfer ");
            return;
        }

        private static void genSeqType(P_Root.SeqType t, StringBuilder sb)
        {
            sb.Append("seq[");
            gentype(t.x as P_Root.TypeExpr, sb);
            sb.Append("]");
        }

        private static void genMapType(P_Root.MapType t, StringBuilder sb)
        {
            sb.Append("map[");
            gentype(t.k as P_Root.TypeExpr, sb);
            sb.Append(", ");
            gentype(t.v as P_Root.TypeExpr, sb);
            sb.Append("]");
        }

        private static void genNameType(P_Root.NameType t, StringBuilder sb)
        {
            sb.Append(getString(t.name));
        }

        private static void gentype(P_Root.TypeExpr t, StringBuilder sb)
        {
            if (t is P_Root.NameType)
            {
                genNameType(t as P_Root.NameType, sb);
            }
            else if (t is P_Root.BaseType)
            {
                genBaseType(t as P_Root.BaseType, sb);
            }
            else if (t is P_Root.SeqType)
            {
                genSeqType(t as P_Root.SeqType, sb);
            }
            else if (t is P_Root.TupType)
            {
                genTupType(t as P_Root.TupType, sb);
            }
            else if (t is P_Root.NmdTupType)
            {
                sb.Append("(");
                genNmdTupType(t as P_Root.NmdTupType, sb);
                sb.Append(")");
            }
            else if (t is P_Root.MapType)
            {
                genMapType(t as P_Root.MapType, sb);
            }
        }

        private static int genTypeDef(P_Root.TypeDef typeDef, StringBuilder sb)
        {
            sb.Append("type ");
            sb.Append(getString(typeDef.name));
            if(typeDef.type.Symbol.ToString() != "NIL")
            {
                sb.Append(" = ");
                gentype(typeDef.type as P_Root.TypeExpr, sb);
            }
            return 0;
        }

        private static void genName(P_Root.Name e, StringBuilder sb)
        {
            sb.Append(getString(e.name));
        }

        private static void genNew(P_Root.New e, StringBuilder sb)
        {
            sb.Append("new ");
            sb.Append(getString(e.name));
            sb.Append("(");
            if (e.arg.Symbol.ToString() != "NIL")
            {
                genExpr(e.arg as P_Root.Expr, sb);
            }
            sb.Append(")");
        }

        private static void genFunApp(P_Root.FunApp e, StringBuilder sb)
        {
            sb.Append(getString(e.name));
            sb.Append("(");
            genExpr(e.args as P_Root.Expr, sb);
            sb.Append(")");
        }

        private static void genNulApp(P_Root.NulApp e, StringBuilder sb)
        {
            if (e.op is P_Root.Integer)
            {
                sb.Append(getValue(e.op));
                return;
            }
            switch (e.op.Symbol.ToString() as String)
            {
                case "TRUE":
                    sb.Append("true");
                    break;
                case "FALSE":
                    sb.Append("false");
                    break;
                case "THIS":
                    sb.Append("this");
                    break;
                case "NONDET":
                    sb.Append("$");
                    break;
                case "FAIRNONDET":
                    sb.Append("$$");
                    break;
                case "NULL":
                    sb.Append("null");
                    break;
                case "HALT":
                    sb.Append("halt");
                    break;
                default:
                    Console.WriteLine("Error!");
                    break;
            }
        }

        private static void genUnApp(P_Root.UnApp e, StringBuilder sb)
        {
            switch (e.op.Symbol.ToString() as String)
            {
                case "NOT":
                    sb.Append("!(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "NEG":
                    sb.Append("-(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "KEYS":
                    sb.Append("keys(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(')');
                    break;
                case "VALUES":
                    sb.Append("values(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(')');
                    break;
                case "SIZEOF":
                    sb.Append("sizeof(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(')');
                    break;
            }
            return;
        }

        private static void genBinApp(P_Root.BinApp e, StringBuilder sb)
        {
            switch (e.op.Symbol.ToString())
            {
                case "ADD":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" + ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "SUB":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" - ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")"); break;
                case "MUL":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" * ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "INTDIV":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" / ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "AND":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" && ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "OR":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" || ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;  
                case "EQ":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" == ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "NEQ":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" != ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "LT":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" < ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "LE":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" <= ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "GT":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" > ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "GE":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" >= ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "IDX":
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append("[");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append("]");
                    break;
                case "IN":
                    sb.Append("(");
                    genExpr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" in ");
                    genExpr(e.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
            }
            return;
        }

        private static void genField(P_Root.Field e, StringBuilder sb)
        {
            genExpr(e.arg as P_Root.Expr, sb);
            sb.Append(".");
            sb.Append(e.name.Symbol.ToString());
        }

        private static void genDefault(P_Root.Default e, StringBuilder sb)
        {
            sb.Append("default(");
            gentype(e.type as P_Root.TypeExpr, sb);
            sb.Append(")");
            return;
        }

        private static void genCast(P_Root.Cast e, StringBuilder sb)
        {
            sb.Append("(");
            genExpr(e.arg as P_Root.Expr, sb);
            sb.Append(" as ");
            gentype(e.type as P_Root.TypeExpr, sb);
            sb.Append(")");
            return;
        }

        private static int genExprs(P_Root.Exprs e, StringBuilder sb)
        {
            var x = e;
            int i = 0;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                genQualifier(x.qual as P_Root.Qualifier, sb);
                genExpr(x.head as P_Root.Expr, sb);
                sb.Append(", ");
                x = x.tail as P_Root.Exprs;
                i++;
            }
            genQualifier(x.qual as P_Root.Qualifier, sb);
            genExpr(x.head as P_Root.Expr, sb);
            if (x.head.Symbol.ToString() != "NIL")
                i++;
            return i;
        }

        private static int genNamedExprs(P_Root.NamedExprs e, StringBuilder sb)
        {
            var x = e;
            int i = 0;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                sb.Append(getString(x.field) + " = ");
                genExpr(x.exp as P_Root.Expr, sb);
                sb.Append(", ");
                x = x.tail as P_Root.NamedExprs;
                i++;
            }
            sb.Append(getString(x.field) + " = ");
            genExpr(x.exp as P_Root.Expr, sb);
            i++;
            return i;
        }

        private static void genTuple(P_Root.Tuple e, StringBuilder sb)
        {
            //(Ugly?) Tuple generation logic. We need to put a comma at the end iff we have a singleton tuple
            //like (1,). We thus return the # of terms from genExprs().
            sb.Append('(');
            if (genExprs(e.body as P_Root.Exprs, sb) == 1)
                sb.Append(',');
            sb.Append(')');

        }

        private static void genNamedTuple(P_Root.NamedTuple e, StringBuilder sb)
        {
            //(Ugly?) Named Tuple generation logic. We need to put a comma at the end iff we have a singleton tuple
            //like (1,). We thus return the # of terms from genNamedExprs().
            sb.Append('(');
            if (genNamedExprs(e.body as P_Root.NamedExprs, sb) == 1)
                sb.Append(',');
            sb.Append(')');
        }

        private static void genExpr(P_Root.Expr e, StringBuilder sb)
        {
            if (e is P_Root.Name)
            {
                genName((e as P_Root.Name), sb);
            }
            else if (e is P_Root.New)
            {
                genNew((e as P_Root.New), sb);
            }
            else if (e is P_Root.FunApp)
            {
                genFunApp((e as P_Root.FunApp), sb);
            }
            else if (e is P_Root.NulApp)
            {
                genNulApp((e as P_Root.NulApp), sb);
            }
            else if (e is P_Root.UnApp)
            {
                genUnApp((e as P_Root.UnApp), sb);
            }
            else if (e is P_Root.BinApp)
            {
                genBinApp((e as P_Root.BinApp), sb);
            }
            else if (e is P_Root.Field)
            {
                genField((e as P_Root.Field), sb);
            }
            else if (e is P_Root.Default)
            {
                genDefault((e as P_Root.Default), sb);
            }
            else if (e is P_Root.Cast)
            {
                genCast((e as P_Root.Cast), sb);
            }
            else if (e is P_Root.Tuple)
            {
                genTuple((e as P_Root.Tuple), sb);
            }
            else if (e is P_Root.NamedTuple)
            {
                genNamedTuple((e as P_Root.NamedTuple), sb);
            }
            return;
        }

        private static void genNewStmt(P_Root.NewStmt s, StringBuilder sb)
        {
            sb.Append("new ");
            sb.Append(getString(s.name));
            sb.Append('(');
            if (s.arg.Symbol.ToString() != "NIL")
            {
                genExpr(s.arg as P_Root.Expr, sb);
            }
            sb.Append(')');
        }

        private static void genRaise(P_Root.Raise s, StringBuilder sb)
        {
            sb.Append("raise ");
            genExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                sb.Append(", ");
                genExpr(s.arg as P_Root.Expr, sb);
            }
        }

        private static void genSend(P_Root.Send s, StringBuilder sb)
        {
            genQualifier(s.qual as P_Root.Qualifier, sb);
            sb.Append("send ");
            genExpr(s.dest as P_Root.Expr, sb);
            sb.Append(", ");
            genExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                sb.Append(", ");
                genExpr(s.arg as P_Root.Expr, sb);
            }
            return;
        }

        private static void genMonitor(P_Root.Monitor s, StringBuilder sb)
        {
            sb.Append("monitor ");
            genExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                sb.Append(", ");
                genExpr(s.arg as P_Root.Expr, sb);
            }
        }

        private static void genFunStmt(P_Root.FunStmt s, StringBuilder sb)
        {
            if(s.aout.Symbol.ToString() != "NIL")
            {
                genName(s.aout as P_Root.Name, sb);
                sb.Append(" = ");
            }
            sb.Append(getString(s.name));
            sb.Append('(');
            if (s.args.Symbol.ToString() != "NIL")
            {
                genExprs(s.args as P_Root.Exprs, sb);
            }
            sb.Append(")");
            return;
        }

        private static void genNulStmt(P_Root.NulStmt s, StringBuilder sb)
        {
            if (s.op.Symbol.ToString() == "POP")
                sb.Append("pop");
        }

        private static void genBinStmt(P_Root.BinStmt s, StringBuilder sb)
        {
            genExpr(s.arg1 as P_Root.Expr, sb);

            if (s.op.Symbol.ToString() == "REMOVE")
            {
                sb.Append(" -= ");
            }
            else if (s.op.Symbol.ToString() == "ASSIGN")
            {
                sb.Append(" = ");
            }
            else if (s.op.Symbol.ToString() == "INSERT")
            {
                sb.Append(" += ");
            }

            genExpr(s.arg2 as P_Root.Expr, sb);
        }

        private static void genReturn(P_Root.Return s, StringBuilder sb)
        {
            sb.Append("return ");
            if (s.expr.Symbol.ToString() != "NIL")
            {
                genExpr(s.expr as P_Root.Expr, sb);
            }
        }

        private static void genWhile(P_Root.While s, StringBuilder sb)
        {
            sb.Append("while(");
            genExpr(s.cond as P_Root.Expr, sb);
            sb.Append(")\n{\n");
            genStmt(s.body as P_Root.Stmt, sb);
            sb.Append("\n}\n");
            return;
        }

        private static void genIte(P_Root.Ite s, StringBuilder sb)
        {
            sb.Append("if(");
            genExpr(s.cond as P_Root.Expr, sb);
            sb.Append(")\n{\n");
            genStmt(s.@true as P_Root.Stmt, sb);
            if (s.@false != null)
            {
                sb.Append("\n}else \n{\n");
                genStmt(s.@false as P_Root.Stmt, sb);
                sb.Append("}\n");
            }
            else
            {
                sb.Append("}\n");
            }
        }

        private static void genSeq(P_Root.Seq s, StringBuilder sb)
        {
            genStmt(s.s1 as P_Root.Stmt, sb);
            genStmt(s.s2 as P_Root.Stmt, sb);
        }

        private static void genCases(P_Root.Cases s, StringBuilder sb)
        {
            sb.Append("case " + getString(s.trig) + ": ");
            genAnonFunDecl(s.action as P_Root.AnonFunDecl, sb);
            if (s.cases.Symbol.ToString() != "NIL")
            {
                genCases(s.cases as P_Root.Cases, sb);
            }
        }

        private static void genReceive(P_Root.Receive s, StringBuilder sb)
        {
            sb.Append("receive {");
            genCases(s.cases as P_Root.Cases, sb);
            sb.Append("\n}\n");
        }

        private static void genAssert(P_Root.Assert s, StringBuilder sb)
        {
            sb.Append("assert (");
            genExpr(s.arg as P_Root.Expr, sb);
            sb.Append(")");
            if (s.msg.Symbol.ToString() != "NIL")
                sb.Append(", " + getString(s.msg));
        }

        private static void genPrint(P_Root.Print s, StringBuilder sb)
        {
            sb.Append("print " + getString(s.msg));
        }

        private static void genStmt(P_Root.Stmt s, StringBuilder sb)
        {
            if (s is P_Root.NewStmt)
            {
                genNewStmt(s as P_Root.NewStmt, sb);
            }
            else if (s is P_Root.Raise)
            {
                genRaise(s as P_Root.Raise, sb);
            }
            else if (s is P_Root.Send)
            {
                genSend(s as P_Root.Send, sb);
            }
            else if (s is P_Root.Monitor)
            {
                genMonitor(s as P_Root.Monitor, sb);
            }
            else if (s is P_Root.FunStmt)
            {
                genFunStmt(s as P_Root.FunStmt, sb);
            }
            else if (s is P_Root.NulStmt)
            {
                genNulStmt(s as P_Root.NulStmt, sb);
            }
            else if (s is P_Root.BinStmt)
            {
                genBinStmt(s as P_Root.BinStmt, sb);
            }
            else if (s is P_Root.Return)
            {
                genReturn(s as P_Root.Return, sb);
            }
            else if (s is P_Root.While)
            {
                genWhile(s as P_Root.While, sb);
            }
            else if (s is P_Root.Ite)
            {
                genIte(s as P_Root.Ite, sb);
            }
            else if (s is P_Root.Seq)
            {
                genSeq(s as P_Root.Seq, sb);
                return; //To avoid duplicate semicolons.
            }
            else if (s is P_Root.Receive)
            {
                genReceive(s as P_Root.Receive, sb);
            }
            else if (s is P_Root.Assert)
            {
                genAssert(s as P_Root.Assert, sb);
            }
            else if (s is P_Root.Print)
            {
                genPrint(s as P_Root.Print, sb);
            }
            sb.Append(";\n");
            return;
        }

        private static void genAssertMaxInstances(P_Root.AssertMaxInstances a, StringBuilder sb)
        {
            sb.Append(" assert ");
            sb.Append(getValue(a.bound));
        }

        private static void genAssumeMaxInstances(P_Root.AssumeMaxInstances a, StringBuilder sb)
        {
            sb.Append(" assume ");
            sb.Append(getValue(a.bound));
        }

        private static void genEventDecl(P_Root.EventDecl d, StringBuilder sb)
        {
            sb.Append("event ");
            sb.Append(getString(d.name));
            if (d.card is P_Root.AssertMaxInstances)
            {
                genAssertMaxInstances((d.card as Microsoft.Pc.Domains.P_Root.AssertMaxInstances), sb);
            }
            else if (d.card is P_Root.AssumeMaxInstances)
            {
                genAssumeMaxInstances((d.card as P_Root.AssumeMaxInstances), sb);
            }

            if (d.type.Symbol.ToString() != "NIL") //Not NIL
            {
                sb.Append(" : ");
                gentype(d.type as P_Root.TypeExpr, sb);
            }
            return;
        }

        private static void genMachineDecl(P_Root.MachineDecl d, StringBuilder sb)
        {
            if (d.isMain.Symbol.ToString() == "TRUE")
                sb.Append("main ");
            if (d.kind.Symbol.ToString() == "MODEL")
                sb.Append("model ");
            else if (d.kind.Symbol.ToString() == "MONITOR")
            {
                sb.Append("spec ");
                sb.Append(getString(d.name));
                return;
            }
            else if (d.kind.Symbol.ToString() == "REAL")
                sb.Append("machine ");
            sb.Append(getString(d.name) + " ");
            sb.Append("\n");
            sb.Append("{\n");
            return;
        }

        private static void genObservesDecl(P_Root.ObservesDecl d, StringBuilder sb)
        {
            genMachineDecl(d.monitor as P_Root.MachineDecl, sb);
            sb.Append(" monitors " + getString(d.ev) + "{\n");
            return;
        }

        private static void genVarDecl(P_Root.VarDecl d, StringBuilder sb)
        {
            sb.Append("var " + getString(d.name) + " : ");
            gentype(d.type as P_Root.TypeExpr, sb);
        }

        private static void genQualifiedName(P_Root.QualifiedName n, StringBuilder sb)
        {
            if (n.qualifier.Symbol.ToString() != "NIL")
            {
                genQualifiedName(n.qualifier as P_Root.QualifiedName, sb);
                sb.Append("_");
            }
            sb.Append(getString(n.name));
        }

        private static void genStateDecl(P_Root.StateDecl state, StringBuilder sb)
        {
            if (state.temperature.Symbol.ToString() == "HOT")
            {
                sb.Append("hot ");
            }
            else if (state.temperature.Symbol.ToString() == "COLD")
            {
                sb.Append("cold ");
            }
            sb.Append("state ");
            genQualifiedName(state.name as P_Root.QualifiedName, sb);
            sb.Append("{\n");
            sb.Append("entry");
            genAnonFunDecl(state.entryAction as P_Root.AnonFunDecl, sb);
            sb.Append("exit");
            if (state.exitFun is P_Root.AnonFunDecl)
            {
                var d = state.exitFun as P_Root.AnonFunDecl;
                genAnonFunDecl(d, sb, false);
            }
            else //It's a String.
            {
                sb.Append(" " + getString(state.exitFun) + ";");
            }
        }

        private static void genFuncDecl(P_Root.FunDecl d, StringBuilder sb)
        {
            if (d.kind.Symbol.ToString() == "MODEL")
            {
                sb.Append("model ");
            }
            sb.Append("fun " + getString(d.name));
            sb.Append("(");
            if (d.@params.Symbol.ToString() != "NIL")
            {
                genNmdTupType(d.@params as P_Root.NmdTupType, sb);
            }
            sb.Append(")");
            if (d.@return.Symbol.ToString() != "NIL")
            {
                sb.Append(" : ");
                gentype(d.@return as P_Root.TypeExpr, sb);
            }
            sb.Append("{\n");
            if (d.locals.Symbol.ToString() != "NIL")
            {
                var x = d.locals as P_Root.NmdTupType;
                while(x.tl.Symbol.ToString() != "NIL")
                {
                    sb.Append("var ");
                    genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                    sb.Append(";\n");
                    x = x.tl as P_Root.NmdTupType;
                }
                sb.Append("var ");
                genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                sb.Append(";\n");
            }
            genStmt(d.body as P_Root.Stmt, sb);
            sb.Append("\n}\n");
            return;
        }

        private static void genAnonFunDecl(P_Root.AnonFunDecl d, StringBuilder sb, bool gen_args=true)
        {
            if (d.envVars.Symbol.ToString() != "NIL" && gen_args)
            {
                sb.Append("(");
                var x = (d.envVars as P_Root.NmdTupType);
                while (x.tl.Symbol.ToString() != "NIL")
                {
                    x = x.tl as P_Root.NmdTupType;
                }
                genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                sb.Append(")");
            }
            sb.Append("{\n");
            if (d.locals.Symbol.ToString() != "NIL")
            {
                var x = d.locals as P_Root.NmdTupType;
                while (x.tl.Symbol.ToString() != "NIL")
                {
                    sb.Append("var ");
                    genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                    sb.Append(";\n");
                    x = x.tl as P_Root.NmdTupType;
                }
                sb.Append("var ");
                genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                sb.Append(";\n");
            }
            genStmt(d.body as P_Root.Stmt, sb);
            sb.Append("\n}\n");
            return;
        }

        private static void genTrig(ICSharpTerm t, StringBuilder sb)
        {
            if (t.Symbol.ToString() == "NULL")
            {
                sb.Append("null");
            }
            else if (t.Symbol.ToString() == "HALT")
            {
                sb.Append("halt");
            }
            else
            {
                sb.Append(getString(t));
            }
        }

        private static void genTransDecl(P_Root.TransDecl t, StringBuilder sb)
        {
            sb.Append("on ");
            genTrig(t.trig, sb);
            if (t.action.Symbol.ToString() == "PUSH")
            {
                sb.Append(" push ");
                genQualifiedName(t.dst as P_Root.QualifiedName, sb);
                sb.Append(";\n");
                return;
            }
            else if (t.action is P_Root.AnonFunDecl)
            {
                sb.Append(" goto ");
                genQualifiedName(t.dst as P_Root.QualifiedName, sb);
                sb.Append(" with ");
                genAnonFunDecl(t.action as P_Root.AnonFunDecl, sb);
            }
            else
            {
                sb.Append(" goto ");
                genQualifiedName(t.dst as P_Root.QualifiedName, sb);
                sb.Append(" with ");
                sb.Append(getString(t.action));
            }
            return;
        }

        private static void genDoDecl(P_Root.DoDecl d, StringBuilder sb)
        {
            if (d.action.Symbol.ToString() == "DEFER")
            {
                sb.Append("defer ");
                genTrig(d.trig, sb);
                sb.Append(";");
            }
            else if (d.action.Symbol.ToString() == "IGNORE")
            {
                sb.Append("ignore ");
                genTrig(d.trig, sb);
                sb.Append(";");
            }
            else if (d.action is P_Root.AnonFunDecl)
            {
                sb.Append("on ");
                genTrig(d.trig, sb);
                sb.Append(" do ");
                genAnonFunDecl(d.action as P_Root.AnonFunDecl, sb);
            }
            else
            {
                sb.Append("on ");
                genTrig(d.trig, sb);
                sb.Append(" do ");
                sb.Append(getString(d.action));
                sb.Append(";");
            }
            return;
        }

        public void genIdentity(string inputFileName, TextWriter writer)
        {
            //Read the file and parse it. If it's good, go ahead and emit code.
            if (ReadFile(inputFileName))
            {
                gentext(writer);
            }
            else
            {
                Environment.Exit(-1);
            }
        }

        private bool ReadFile(string inputFileName)
        {
            List<Microsoft.Formula.API.Flag> flags;
            var result = compiler.Compile(inputFileName, out flags);

            if (result)
            {
                parsedPrograms = new List<PProgram>(compiler.ParsedPrograms.Values);
                return true;
            }
            else
            {
                Console.WriteLine("Compilation failed. Compile from command line to see detailed error messages. Terminating...");
                return false;
            }

        }

        public void gentext(TextWriter writer)
        {
            foreach (var program in parsedPrograms)
            {
                //Go over the fields of class PProgram one by one and generate
                //the P code again. We do not really care about indentation.

                StringBuilder builder = new StringBuilder();

                //Write TypeDefs and Event Declarations first.
                foreach (var typedef in program.TypeDefs)
                {
                    genTypeDef(typedef, builder);
                    builder.Append(";");
                    writer.WriteLine(builder);
                    builder.Clear();
                }

                foreach (var event_ in program.Events)
                {
                    genEventDecl(event_, builder);
                    builder.Append(";");
                    writer.WriteLine(builder);
                    builder.Clear();
                }
                
                //Start generating code for machines.
                foreach (var observer in program.Observes)
                {
                    if (!machineDeclToSB.ContainsKey(observer.monitor as P_Root.MachineDecl))
                    {
                        StringBuilder sb = new StringBuilder();
                        genObservesDecl(observer as P_Root.ObservesDecl, sb);
                        machineDeclToSB[observer.monitor as P_Root.MachineDecl] = sb;
                    }
                    else
                    {
                        StringBuilder sb = machineDeclToSB[observer.monitor as P_Root.MachineDecl];
                        sb.Length -= 2;
                        sb.Append(", " + getString(observer.ev) + "{\n");
                    }
                }
                foreach (var machine in program.Machines)
                {
                    if (!machineDeclToSB.ContainsKey(machine as P_Root.MachineDecl))
                    {
                        StringBuilder sb = new StringBuilder();
                        genMachineDecl(machine, sb);
                        machineDeclToSB[machine] = sb;
                    }
                }

                //Bind the variable, function and state declarations to the relevant machine, 
                //and the transitions to the relevant state.
                foreach (var variable in program.Variables)
                {
                    //NO global variables.
                    StringBuilder sb = machineDeclToSB[variable.owner as P_Root.MachineDecl];
                    genVarDecl(variable, sb);
                    sb.Append(";\n");
                }

                foreach (var state in program.States)
                {
                    StringBuilder sb = new StringBuilder();
                    stateDeclToSB[state] = sb;
                    genStateDecl(state, sb);
                }

                foreach (var function in program.Functions)
                {
                    if (function.owner.Symbol.ToString() == "NIL")
                    {
                        StringBuilder sb = new StringBuilder("static ");
                        genFuncDecl(function, sb);
                        writer.WriteLine(sb.ToString());
                    }
                    else
                    {
                        StringBuilder sb = machineDeclToSB[function.owner as P_Root.MachineDecl];
                        genFuncDecl(function, sb);
                    }
                }

                foreach (var transition in program.Transitions)
                {
                    StringBuilder sb = stateDeclToSB[transition.src as P_Root.StateDecl];
                    genTransDecl(transition, sb);
                }

                foreach (var do_ in program.Dos)
                {
                    StringBuilder sb = stateDeclToSB[do_.src as P_Root.StateDecl];
                    genDoDecl(do_, sb);
                }

                //Iterate over states again to find the relevant machine so as to 
                //join the state declaration to that machine.
                foreach (var state in program.States)
                {
                    if ((state.owner as P_Root.MachineDecl).start as P_Root.QualifiedName == state.name)
                    {
                        machineDeclToSB[state.owner as P_Root.MachineDecl].Append("start ");
                    }
                    machineDeclToSB[state.owner as P_Root.MachineDecl].Append(stateDeclToSB[state]);
                    machineDeclToSB[state.owner as P_Root.MachineDecl].Append("}\n");
                }

                //Write out the machine declarations.
                foreach (var machine in program.Machines)
                {
                    writer.WriteLine(machineDeclToSB[machine]);
                    writer.WriteLine("\n}\n");
                }
            }
        }
    }
}

/***************************************TODO*****************************************
 *                                                                                  *
 *      Fix AnonFunctions and Annotations. The former do not seem to appear freely  *
 *      in the program; the latter do not have SEMANTIC significance.               *
 *                                                                                  *
 ************************************************************************************/