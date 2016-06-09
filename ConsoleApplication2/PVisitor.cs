using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.Formula.API.Generators;

namespace Microsoft.Identity
{
    abstract class PVisitor
    {
        private List<PProgram> parsedPrograms { get; set; }
        //private Dictionary<P_Root.MachineDecl, StringBuilder> machineDeclToSB = new Dictionary<P_Root.MachineDecl, StringBuilder>();
        //private Dictionary<P_Root.StateDecl, StringBuilder> stateDeclToSB = new Dictionary<P_Root.StateDecl, StringBuilder>();
        //private Compiler compiler;
        //private int level;  //Indent. DO LAST!

        private static string getName(ICSharpTerm x)
        {
            return (x as P_Root.StringCnst).Value;
        }

        private static string getValue(ICSharpTerm x)
        {
            Microsoft.Formula.Common.Rational a = (x as P_Root.RealCnst).Value;
            //Can be improved!
            if (a.IsInteger)
            {
                return a.ToString(0);
            }
            else
            {
                return a.ToString(100);
            }
        }

        private static void gen_BaseType(P_Root.BaseType t, StringBuilder sb)
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

        private static void gen_TupType(P_Root.TupType t, StringBuilder sb)
        {
            //Looks like singleton tuple TYPES do not need a comma in their DECLARATION.
            var x = t;
            sb.Append("(");
            while (x.tl.Symbol.ToString() != "NIL")
            {
                gen_type(x.hd as P_Root.TypeExpr, sb);
                sb.Append(", ");
                x = x.tl as P_Root.TupType;
            }
            gen_type(x.hd as P_Root.TypeExpr, sb);
            sb.Append(')');
        }

        private static void gen_NmdTupTypeField(P_Root.NmdTupTypeField f, StringBuilder sb)
        {
            gen_Qualifier(f.qual as P_Root.Qualifier, sb);
            sb.Append(" " + getName(f.name) + ": ");
            gen_type(f.type as P_Root.TypeExpr, sb);
        }

        private static void gen_NmdTupType(P_Root.NmdTupType t, StringBuilder sb)
        {
            //Looks like singleton named tuple TYPES do not need a comma in their DECLARATION.
            var x = t;
            sb.Append("(");
            while (x.tl.Symbol.ToString() != "NIL")
            {
                gen_NmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                sb.Append(", ");
                x = x.tl as P_Root.NmdTupType;
            }
            gen_NmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
            sb.Append(')');
        }

        private static void gen_Qualifier(P_Root.Qualifier q, StringBuilder sb)
        {
            if (q.Symbol.ToString() == "SWAP")
                sb.Append("swap ");
            else if (q.Symbol.ToString() == "XFER")
                sb.Append("xfer ");
            return;
        }

        private static void gen_SeqType(P_Root.SeqType t, StringBuilder sb)
        {
            sb.Append("seq[");
            gen_type(t.x as P_Root.TypeExpr, sb);
            sb.Append("]");
        }

        private static void gen_MapType(P_Root.MapType t, StringBuilder sb)
        {
            sb.Append("map[");
            gen_type(t.k as P_Root.TypeExpr, sb);
            sb.Append(", ");
            gen_type(t.v as P_Root.TypeExpr, sb);
            sb.Append("]");
        }

        private static void gen_type(P_Root.TypeExpr t, StringBuilder sb)
        {
            //t: any TypeExpr. This means we can check its derived type as we wish.
            if (t is P_Root.NameType)
            {
                sb.Append(getName(t));
            }
            else if (t is P_Root.BaseType)
            {
                gen_BaseType(t as P_Root.BaseType, sb);
            }
            else if (t is P_Root.SeqType)
            {
                gen_SeqType(t as P_Root.SeqType, sb);
            }
            else if (t is P_Root.TupType)
            {
                gen_TupType(t as P_Root.TupType, sb);
            }
            else if (t is P_Root.NmdTupType)
            {
                gen_NmdTupType(t as P_Root.NmdTupType, sb);
            }
            else if (t is P_Root.MapType)
            {
                gen_MapType(t as P_Root.MapType, sb);
            }
        }

        private static int gen_TypeDef(P_Root.TypeDef typeDef, StringBuilder sb)
        {
            sb.Append("type ");
            sb.Append(getName(typeDef.name) + " = ");
            gen_type(typeDef.type as P_Root.TypeExpr, sb);
            return 0;
        }

        private static void gen_Name(P_Root.Name e, StringBuilder sb)
        {
            sb.Append(getName(e.name));
        }

        private static void gen_New(P_Root.New e, StringBuilder sb)
        {
            sb.Append("new ");
            sb.Append(getName(e.name));
            sb.Append("(");
            gen_Expr(e.arg as P_Root.Expr, sb);
            sb.Append(")");
        }

        private static void gen_FunApp(P_Root.FunApp e, StringBuilder sb)
        {
            sb.Append(getName(e.name));
            sb.Append("(");
            gen_Expr(e.args as P_Root.Expr, sb);
            sb.Append(")");
        }

        private static void gen_NulApp(P_Root.NulApp e, StringBuilder sb)
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

        private static void gen_UnApp(P_Root.UnApp e, StringBuilder sb)
        {
            Console.WriteLine(e.op.Symbol.ToString() as String);
            switch (e.op.Symbol.ToString() as String)
            {
                case "NOT":
                    sb.Append("!");
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    break;
                case "NEG":
                    sb.Append("-");
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    break;
                case "KEYS":
                    sb.Append("keys(");
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(')');
                    break;
                case "VALUES":
                    sb.Append("values(");
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(')');
                    break;
                case "SIZEOF":
                    sb.Append("sizeof(");
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(')');
                    break;
            }
            return;
        }

        private static void gen_BinApp(P_Root.BinApp e, StringBuilder sb)
        {
            switch (e.op.Symbol.ToString())
            {
                case "ADD":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" + ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "SUB":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" - ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "MUL":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" * ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "INTDIV":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" / ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "AND":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" && ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "OR":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" || ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "EQ":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" == ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "NEQ":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" != ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "LT":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" < ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "LE":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" <= ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "GT":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" > ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "GE":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" >= ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "IDX":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append("[");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    sb.Append("]");
                    break;
                case "IN":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" in ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
            }
            return;
        }

        private static void gen_Field(P_Root.Field e, StringBuilder sb)
        {
            gen_Expr(e.arg as P_Root.Expr, sb);
            sb.Append(".");
            sb.Append(e.name.Symbol.ToString());
        }

        private static void gen_Default(P_Root.Default e, StringBuilder sb)
        {
            sb.Append("default(");
            gen_type(e.type as P_Root.TypeExpr, sb);
            sb.Append(")");
            return;
        }

        private static void gen_Cast(P_Root.Cast e, StringBuilder sb)
        {
            gen_Expr(e.arg as P_Root.Expr, sb);
            sb.Append(" as ");
            gen_type(e.type as P_Root.TypeExpr, sb);
            return;
        }

        private static int gen_Exprs(P_Root.Exprs e, StringBuilder sb)
        {
            var x = e;
            int i = 0;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                gen_Qualifier(x.qual as P_Root.Qualifier, sb);
                gen_Expr(x.head as P_Root.Expr, sb);
                sb.Append(", ");
                x = x.tail as P_Root.Exprs;
                i++;
            }
            gen_Qualifier(x.qual as P_Root.Qualifier, sb);
            gen_Expr(x.head as P_Root.Expr, sb);
            if (x.head.Symbol.ToString() != "NIL")
                i++;
            return i;
        }

        private static void gen_NamedExprs(P_Root.NamedExprs e, StringBuilder sb)
        {
            var x = e;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                sb.Append(getName(x.field) + " = ");
                gen_Expr(x.exp as P_Root.Expr, sb);
                sb.Append(", ");
                x = x.tail as P_Root.NamedExprs;
            }
            sb.Append(getName(x.field) + " = ");
            gen_Expr(x.exp as P_Root.Expr, sb);
        }

        private static void gen_Tuple(P_Root.Tuple e, StringBuilder sb)
        {
            //(Ugly?) Tuple generation logic. We need to put a comma at the end iff we have a singleton tuple
            //like (1,). We thus return the # of terms from gen_Exprs().
            sb.Append('(');
            if (gen_Exprs(e.body as P_Root.Exprs, sb) == 1)
                sb.Append(',');
            sb.Append(')');

        }

        private static void gen_NamedTuple(P_Root.NamedTuple e, StringBuilder sb)
        {
            sb.Append('(');
            gen_NamedExprs(e.body as P_Root.NamedExprs, sb);
            sb.Append(')');
        }

        private static void gen_Expr(P_Root.Expr e, StringBuilder sb)
        {
            if (e is P_Root.Name)
            {
                gen_Name((e as P_Root.Name), sb);
            }
            else if (e is P_Root.New)
            {
                gen_New((e as P_Root.New), sb);
            }
            else if (e is P_Root.FunApp)
            {
                gen_FunApp((e as P_Root.FunApp), sb);
            }
            else if (e is P_Root.NulApp)
            {
                gen_NulApp((e as P_Root.NulApp), sb);
            }
            else if (e is P_Root.UnApp)
            {
                gen_UnApp((e as P_Root.UnApp), sb);
            }
            else if (e is P_Root.BinApp)
            {
                gen_BinApp((e as P_Root.BinApp), sb);
            }
            else if (e is P_Root.Field)
            {
                gen_Field((e as P_Root.Field), sb);
            }
            else if (e is P_Root.Default)
            {
                gen_Default((e as P_Root.Default), sb);
            }
            else if (e is P_Root.Cast)
            {
                gen_Cast((e as P_Root.Cast), sb);
            }
            else if (e is P_Root.Tuple)
            {
                gen_Tuple((e as P_Root.Tuple), sb);
            }
            else if (e is P_Root.NamedTuple)
            {
                gen_NamedTuple((e as P_Root.NamedTuple), sb);
            }
            return;
        }

        private static void gen_NewStmt(P_Root.NewStmt s, StringBuilder sb)
        {
            sb.Append("new ");
            sb.Append(getName(s.name));
            sb.Append('(');
            gen_Expr(s.arg as P_Root.Expr, sb);
            sb.Append(')');
        }

        private static void gen_Raise(P_Root.Raise s, StringBuilder sb)
        {
            sb.Append("raise ");
            gen_Expr(s.ev as P_Root.Expr, sb);
            sb.Append(" ");
            gen_Expr(s.arg as P_Root.Expr, sb);
        }

        private static void gen_Send(P_Root.Send s, StringBuilder sb)
        {
            gen_Qualifier(s.qual as P_Root.Qualifier, sb);
            sb.Append("send ");
            gen_Expr(s.dest as P_Root.Expr, sb);
            sb.Append(", ");
            gen_Expr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                sb.Append(", ");
                gen_Expr(s.arg as P_Root.Expr, sb);
            }
            return;
        }

        private static void gen_Monitor(P_Root.Monitor s, StringBuilder sb)
        {
            sb.Append("monitor ");
            gen_Expr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                sb.Append(", ");
                gen_Expr(s.arg as P_Root.Expr, sb);
            }
        }

        private static void gen_FunStmt(P_Root.FunStmt s, StringBuilder sb)
        {
            sb.Append(getName(s.name));
            sb.Append('(');
            gen_Exprs(s.args as P_Root.Exprs, sb);
            sb.Append(")");
            return;
        }

        private static void gen_NulStmt(P_Root.NulStmt s, StringBuilder sb)
        {
            if (s.op.Symbol.ToString() == "POP")
                sb.Append("pop");
            else if (s.op.Symbol.ToString() == "SKIP")
                sb.Append("skip");
        }

        private static void gen_BinStmt(P_Root.BinStmt s, StringBuilder sb)
        {
            gen_Expr(s.arg1 as P_Root.Expr, sb);

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

            gen_Expr(s.arg2 as P_Root.Expr, sb);
        }

        private static void gen_Return(P_Root.Return s, StringBuilder sb)
        {
            sb.Append("return ");
            gen_Expr(s.expr as P_Root.Expr, sb);
        }

        private static void gen_While(P_Root.While s, StringBuilder sb)
        {
            sb.Append("while(");
            gen_Expr(s.cond as P_Root.Expr, sb);
            sb.Append(")\n{\n");
            gen_Stmt(s.body as P_Root.Stmt, sb);
            sb.Append("\n}\n");
            return;
        }

        private static void gen_Ite(P_Root.Ite s, StringBuilder sb)
        {
            sb.Append("if(");
            gen_Expr(s.cond as P_Root.Expr, sb);
            sb.Append(")\n{\n");
            gen_Stmt(s.@true as P_Root.Stmt, sb);
            if (s.@false != null)
            {
                sb.Append("\n}else ");
                gen_Stmt(s.@false as P_Root.Stmt, sb);
                sb.Append("}\n");
            }
            else
            {
                sb.Append("}\n");
            }
        }

        private static void gen_Seq(P_Root.Seq s, StringBuilder sb)
        {
            gen_Stmt(s.s1 as P_Root.Stmt, sb);
            gen_Stmt(s.s2 as P_Root.Stmt, sb);
        }

        //Come back and review.
        private static void gen_Cases(P_Root.Cases s, StringBuilder sb)
        {
            sb.Append("case " + getName(s.trig) + ": ");
            gen_AnonFunDecl(s.action as P_Root.AnonFunDecl, sb);
            if (s.cases.Symbol.ToString() != "NIL")
            {
                gen_Cases(s.cases as P_Root.Cases, sb);
            }
        }

        private static void gen_Receive(P_Root.Receive s, StringBuilder sb)
        {
            sb.Append("receive {");
            gen_Cases(s.cases as P_Root.Cases, sb);
            sb.Append("\n}\n");
        }

        private static void gen_Assert(P_Root.Assert s, StringBuilder sb)
        {
            sb.Append("assert (");
            gen_Expr(s.arg as P_Root.Expr, sb);
            sb.Append(")");
            if (s.msg.Symbol.ToString() != "NIL")
                sb.Append(", " + getName(s.msg));
        }

        private static void gen_Print(P_Root.Print s, StringBuilder sb)
        {
            sb.Append("print " + getName(s.msg));
        }

        private static void gen_Stmt(P_Root.Stmt s, StringBuilder sb)
        {
            if (s is P_Root.NewStmt)
            {
                gen_NewStmt(s as P_Root.NewStmt, sb);
            }
            else if (s is P_Root.Raise)
            {
                gen_Raise(s as P_Root.Raise, sb);
            }
            else if (s is P_Root.Send)
            {
                gen_Send(s as P_Root.Send, sb);
            }
            else if (s is P_Root.Monitor)
            {
                gen_Monitor(s as P_Root.Monitor, sb);
            }
            else if (s is P_Root.FunStmt)
            {
                gen_FunStmt(s as P_Root.FunStmt, sb);
            }
            else if (s is P_Root.NulStmt)
            {
                gen_NulStmt(s as P_Root.NulStmt, sb);
            }
            else if (s is P_Root.BinStmt)
            {
                gen_BinStmt(s as P_Root.BinStmt, sb);
            }
            else if (s is P_Root.Return)
            {
                gen_Return(s as P_Root.Return, sb);
            }
            else if (s is P_Root.While)
            {
                gen_While(s as P_Root.While, sb);
            }
            else if (s is P_Root.Ite)
            {
                gen_Ite(s as P_Root.Ite, sb);
            }
            else if (s is P_Root.Seq)
            {
                gen_Seq(s as P_Root.Seq, sb);
                return; //To avoid duplicate semicolons.
            }
            else if (s is P_Root.Receive)
            {
                gen_Receive(s as P_Root.Receive, sb);
            }
            else if (s is P_Root.Assert)
            {
                gen_Assert(s as P_Root.Assert, sb);
            }
            else if (s is P_Root.Print)
            {
                gen_Print(s as P_Root.Print, sb);
            }
            sb.Append(";\n");
            return;
        }

        private static void gen_EventDecl(P_Root.EventDecl d, StringBuilder sb)
        {
            sb.Append("event ");
            sb.Append(getName(d.name));
            if (d.card is P_Root.AssertMaxInstances)
            {
                sb.Append(" assert ");
                sb.Append((d.card as Microsoft.Pc.Domains.P_Root.RealCnst).Value.ToString());
            }
            else if (d.card is P_Root.AssumeMaxInstances)
            {
                sb.Append(" assume ");
                sb.Append((d.card as Microsoft.Pc.Domains.P_Root.RealCnst).Value.ToString());
            }

            if (d.type.Symbol.ToString() != "NIL") //Not NIL
            {
                sb.Append(" : ");
                //sb.Append((d.type as Microsoft.Pc.Domains.P_Root.TypeExpr).ToString());
                gen_type(d.type as P_Root.TypeExpr, sb);
            }
            return;
        }

        private static void gen_MachineDecl(P_Root.MachineDecl d, StringBuilder sb)
        {
            if (d.isMain.Symbol.ToString() == "TRUE")
                sb.Append("main ");
            if (d.kind.Symbol.ToString() == "MODEL")
                sb.Append("model ");
            else if (d.kind.Symbol.ToString() == "MONITOR")
            {
                sb.Append("spec ");
                sb.Append(getName(d.name));
                return;
            }
            else if (d.kind.Symbol.ToString() == "REAL")
                sb.Append("machine ");
            sb.Append(getName(d.name) + " ");
            sb.Append("\n");
            sb.Append("{\n");
            return;
        }

        private static void gen_ObservesDecl(P_Root.ObservesDecl d, StringBuilder sb)
        {
            gen_MachineDecl(d.monitor as P_Root.MachineDecl, sb);
            sb.Append(" monitors " + getName(d.ev) + "{\n");
            return;
        }

        private static void gen_VarDecl(P_Root.VarDecl d, StringBuilder sb)
        {
            sb.Append("var " + getName(d.name) + " : ");
            gen_type(d.type as P_Root.TypeExpr, sb);
        }

        private static void gen_QualifiedName(P_Root.QualifiedName n, StringBuilder sb)
        {
            sb.Append(getName(n.name) + " ");
            if (n.qualifier.Symbol.ToString() != "NIL")
                gen_QualifiedName(n.qualifier as P_Root.QualifiedName, sb);
        }

        private static void gen_StateDecl(P_Root.StateDecl state, StringBuilder sb)
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
            gen_QualifiedName(state.name as P_Root.QualifiedName, sb);
            sb.Append("{\n");
            sb.Append("entry");
            gen_AnonFunDecl(state.entryAction as P_Root.AnonFunDecl, sb);
            sb.Append("exit");
            gen_AnonFunDecl(state.exitFun as P_Root.AnonFunDecl, sb);

        }

        private static void gen_FuncDecl(P_Root.FunDecl d, StringBuilder sb)
        {
            if (d.kind.Symbol.ToString() == "MODEL")
            {
                sb.Append("model ");
            }
            sb.Append("fun " + getName(d.name));
            if (d.@params.Symbol.ToString() != "NIL")
            {
                gen_NmdTupType(d.@params as P_Root.NmdTupType, sb);
            }
            //sb.Append(") 7z "); //" 7z " is for a possible annotation.
            if (d.@return.Symbol.ToString() != "NIL")
            {
                sb.Append(" : ");
                gen_type(d.@return as P_Root.TypeExpr, sb);
            }
            sb.Append("{\n");
            if (d.locals.Symbol.ToString() != "NIL")
            {
                sb.Append("var ");
                gen_NmdTupType(d.locals as P_Root.NmdTupType, sb);
                sb.Append(";\n");
            }
            gen_Stmt(d.body as P_Root.Stmt, sb);
            sb.Append("\n}\n");
            return;
        }

        private static void gen_AnonFunDecl(P_Root.AnonFunDecl d, StringBuilder sb)
        {
            if (d.envVars.Symbol.ToString() != "NIL")
            {
                gen_NmdTupType(d.envVars as P_Root.NmdTupType, sb);
            }
            sb.Append("{\n");
            if (d.locals.Symbol.ToString() != "NIL")
            {
                sb.Append("var ");
                gen_NmdTupType(d.locals as P_Root.NmdTupType, sb);
                sb.Append(";\n");
            }
            gen_Stmt(d.body as P_Root.Stmt, sb);
            sb.Append("\n}\n");
            return;
        }

        private static void gen_Trig(ICSharpTerm t, StringBuilder sb)
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
                sb.Append(getName(t));
            }
        }

        private static void gen_TransDecl(P_Root.TransDecl t, StringBuilder sb)
        {
            sb.Append("on ");
            gen_Trig(t.trig, sb);
            if (t.action.Symbol.ToString() == "PUSH")
            {
                sb.Append(" push ");
                gen_QualifiedName(t.dst as P_Root.QualifiedName, sb);
                sb.Append(";\n");
                return;
            }
            else if (t.action is P_Root.AnonFunDecl)
            {
                sb.Append(" goto ");
                gen_QualifiedName(t.dst as P_Root.QualifiedName, sb);
                sb.Append(" with ");
                gen_AnonFunDecl(t.action as P_Root.AnonFunDecl, sb);
            }
            else
            {
                sb.Append(" goto ");
                gen_QualifiedName(t.dst as P_Root.QualifiedName, sb);
                sb.Append(" with ");
                sb.Append(getName(t.action));
            }
            return;
        }

        private static void gen_DoDecl(P_Root.DoDecl d, StringBuilder sb)
        {
            if (d.action.Symbol.ToString() == "DEFER")
            {
                sb.Append("defer ");
                gen_Trig(d.trig, sb);
            }
            else if (d.action.Symbol.ToString() == "IGNORE")
            {
                sb.Append("ignore ");
                gen_Trig(d.trig, sb);
            }
            else if (d.action is P_Root.AnonFunDecl)
            {
                sb.Append("on ");
                gen_Trig(d.trig, sb);
                sb.Append(" do ");
                gen_AnonFunDecl(d.action as P_Root.AnonFunDecl, sb);
            }
            else
            {
                sb.Append("on ");
                gen_Trig(d.trig, sb);
                sb.Append(" do ");
                sb.Append(getName(d.action));
            }
            return;
        }

        public void genIdentity(string inputFileName, TextWriter writer)
        {
            //Read the file and parse it. If it's good, go ahead and emit code.
            if (ReadFile(inputFileName))
            {
                gen_text(writer);
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

        public void gen_text(TextWriter writer)
        {
            foreach (var program in parsedPrograms)
            {
                //Go over the fields of class PProgram one by one and generate
                //the P code again. We do not really care about indentation.

                StringBuilder builder = new StringBuilder();

                //Write TypeDefs and Event Declarations first.
                foreach (var typedef in program.TypeDefs)
                {
                    gen_TypeDef(typedef, builder);
                    builder.Append(";");
                    writer.WriteLine(builder);
                    builder.Clear();
                }

                foreach (var event_ in program.Events)
                {
                    gen_EventDecl(event_, builder);
                    builder.Append(";");
                    writer.WriteLine(builder);
                    builder.Clear();
                }
                //Start generating code for machines.
                foreach (var machine in program.Machines)
                {
                    StringBuilder sb = new StringBuilder();
                    //Indent(sb);
                    level++;
                    gen_MachineDecl(machine, sb);
                    machineDeclToSB[machine] = sb;
                }

                foreach (var observer in program.Observes)
                {
                    StringBuilder sb = new StringBuilder();
                    level++;
                    gen_ObservesDecl(observer as P_Root.ObservesDecl, sb);
                    machineDeclToSB[observer.monitor as P_Root.MachineDecl] = sb;
                }
                //Bind the variable, function and state declarations to the relevant machine, 
                //and the transitions to the relevant state.
                foreach (var variable in program.Variables)
                {
                    //NO global variables.
                    StringBuilder sb = machineDeclToSB[variable.owner as P_Root.MachineDecl];
                    gen_VarDecl(variable, sb);
                    sb.Append(";\n");
                    //writer.WriteLine(sb.ToString());
                }

                foreach (var state in program.States)
                {
                    StringBuilder sb = new StringBuilder();
                    stateDeclToSB[state] = sb;
                    gen_StateDecl(state, sb);
                    //level++;
                }

                foreach (var function in program.Functions)
                {
                    if (function.owner.Symbol.ToString() == "NIL")
                    {
                        StringBuilder sb = new StringBuilder("static ");
                        gen_FuncDecl(function, sb);
                        writer.WriteLine(sb.ToString());
                    }
                    else
                    {
                        StringBuilder sb = machineDeclToSB[function.owner as P_Root.MachineDecl];
                        gen_FuncDecl(function, sb);
                    }
                }

                foreach (var transition in program.Transitions)
                {
                    StringBuilder sb = stateDeclToSB[transition.src as P_Root.StateDecl];
                    gen_TransDecl(transition, sb);
                }

                foreach (var do_ in program.Dos)
                {
                    StringBuilder sb = stateDeclToSB[do_.src as P_Root.StateDecl];
                    gen_DoDecl(do_, sb);
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
                    level--;
                    //Indent(sb)
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