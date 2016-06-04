using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Pc.Domains.P_Root;

using Microsoft.Formula.API.Generators;
using Microsoft.Formula.API.ProgramName;

namespace Microsoft.Identity
{

    class IdentityGen
    {
        private List<PProgram> parsedPrograms;
        private Dictionary<P_Root.MachineDecl, StringBuilder> machineDeclToSB = new Dictionary<P_Root.MachineDecl, StringBuilder>();


        //TODO Finish
        public IdentityGen() { }

        private static string getName(ICSharpTerm x)
        {
            return (x as P_Root.StringCnst).Value;
        }
        private static void gen_BaseType(P_Root.BaseType t, StringBuilder sb)
        {
            if(t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.INT))
            {
                sb.Append("int");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.BOOL))
            {
                sb.Append("bool");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.REAL))
            {
                sb.Append("machine");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.ANY))
            {
                sb.Append("any");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.EVENT))
            {
                sb.Append("event");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.NULL))
            {
                sb.Append("null");
            }
            return;
        }

        //Can't we have empty tuples?
        private static void gen_TupType(P_Root.TupType t, StringBuilder sb)
        {
            var x = t;
            sb.Append("(");
            while (x.tl != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
            {
                gen_type(x.hd as P_Root.IArgType_TypeDef__1, sb);
                sb.Append(", ");
                x = x.tl as P_Root.TupType;
            }
            gen_type(x.hd as P_Root.IArgType_TypeDef__1, sb);
            sb.Append(')');
        }

        private static void gen_NmdTupTypeField(P_Root.NmdTupTypeField f, StringBuilder sb)
        {
            gen_Qualifier(f.qual as P_Root.Qualifier, sb);
            sb.Append(" " + getName(f.name) + ": ");
            gen_type(f.type as P_Root.IArgType_TypeDef__1, sb);
        }

        private static void gen_NmdTupType(P_Root.NmdTupType t, StringBuilder sb)
        {
            var x = t;
            sb.Append("(");
            while(x.tl != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
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
            if (q == P_Root.MkUserCnst(P_Root.UserCnstKind.SWAP))
                sb.Append("swap ");
            else if (q == P_Root.MkUserCnst(P_Root.UserCnstKind.XFER))
                sb.Append("xfer ");
            return;
        }

        private static void gen_SeqType(P_Root.SeqType t, StringBuilder sb)
        {
            sb.Append("seq[");
            gen_type(t.x as P_Root.IArgType_TypeDef__1, sb);
            sb.Append("]");
        }

        private static void gen_MapType(P_Root.MapType t, StringBuilder sb)
        {
            sb.Append("map[");
            gen_type(t.k, sb);
            sb.Append(", ");
            gen_type(t.v, sb);
            sb.Append("]");
        }
        private static void gen_type(ICSharpTerm t, StringBuilder sb)
        {
            //t: any TypeExpr. This means we can check its derived type as we wish.
            if(t == typeof(P_Root.NameType)) 
            {
                sb.Append(getName(t));
            }
            else if(t == typeof(P_Root.BaseType))
            {
                gen_BaseType(t as P_Root.BaseType, sb);
            }
            else if(t == typeof(P_Root.SeqType))
            {
                gen_SeqType(t as P_Root.SeqType, sb);
            }
            else if(t == typeof(P_Root.TupType))
            {
                gen_TupType(t as P_Root.TupType, sb);
            }
            else if (t == typeof(P_Root.NmdTupType))
            {
                gen_NmdTupType(t as P_Root.NmdTupType, sb);
            }
            else if (t == typeof(P_Root.MapType))
            {
                gen_MapType(t as P_Root.MapType, sb);
            }
        }

        private static int gen_TypeDef(P_Root.TypeDef typeDef, StringBuilder sb)
        {
            sb.Append("type ");
            sb.Append(getName(typeDef.name)+" = ");
            gen_type(typeDef.type, sb);
            return 0;
        }

        private static void gen_Name(P_Root.Name e, StringBuilder sb)
        {
            sb.Append(getName(e));
        }
        private static void gen_New(P_Root.New e, StringBuilder sb)
        {
            sb.Append("new ");
            sb.Append(getName(e));
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
            switch(e.op.Symbol as String)
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
                default: //Actually must be error. However, not sure how to get an integer constant value out of this.
                    sb.Append(e.op as P_Root.Natural); //Fix this as well.
                    break;
            }
        }

        private static void gen_UnApp(P_Root.UnApp e, StringBuilder sb)
        {
            Console.WriteLine(e.op.Symbol as String);
            switch (e.op.Symbol as String)
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
            switch (e.op.Symbol as String)
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
                    sb.Append(" & ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "OR":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" | ");
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
                case "IDX": //****************REVIEW//****************
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" + ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "IN":
                    gen_Expr(e.arg1 as P_Root.Expr, sb);
                    sb.Append(" in ");
                    gen_Expr(e.arg2 as P_Root.Expr, sb);
                    break;
            }
            return;
        }

        //Heavily screwed up. Need some help!
        private static void gen_Field(P_Root.Field e, StringBuilder sb)
        {
            //DEBUG
            gen_Expr(e.arg as P_Root.Expr, sb);
            sb.Append(".");
            if (e.name == P_Root.MkUserCnst(P_Root.TypeCnstKind.String))
            {
                Console.WriteLine((e.name as P_Root.StringCnst).Value);
                sb.Append((e.name as P_Root.StringCnst).Value);
            }
            else if (e.name == P_Root.MkUserCnst(P_Root.TypeCnstKind.Natural))
            {
                sb.Append(((e.name as P_Root.Natural).Symbol).ToString());
            }
        }

        private static void gen_Default(P_Root.Default e, StringBuilder sb)
        {
            sb.Append("default(");
            gen_type(e.type, sb);
            sb.Append(")");
            return;
        }

        private static void gen_Cast(P_Root.Cast e, StringBuilder sb)
        {
            gen_Expr(e.arg as P_Root.Expr, sb);
            sb.Append(" as ");
            gen_type(e.type, sb);
            return;
        }

        private static int gen_Exprs(P_Root.Exprs e, StringBuilder sb)
        {
            var x = e;
            int i = 0;
            while (x.tail != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
            {
                gen_Qualifier(x.qual as P_Root.Qualifier, sb);
                gen_Expr(x.head as P_Root.Expr, sb);
                sb.Append(", ");
                x = x.tail as P_Root.Exprs;
                i++;
            }
            gen_Qualifier(x.qual as P_Root.Qualifier, sb);
            gen_Expr(x.head as P_Root.Expr, sb);
            if(x.head !=  P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))   
                i++;
            return i;
        }

        private static void gen_NamedExprs(P_Root.NamedExprs e, StringBuilder sb)
        {
            var x = e;
            while (x.tail != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
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
            if (e == P_Root.MkUserCnst(P_Root.UserCnstKind.NIL)) { } //Do Nothing.
            else if (e.GetType() == typeof(P_Root.Name))
            {
                gen_Name((e as P_Root.Name), sb);
            }
            else if (e == typeof(P_Root.New))
            {
                gen_New((e as P_Root.New), sb);
            }
            else if (e == typeof(P_Root.FunApp))
            {
                gen_FunApp((e as P_Root.FunApp), sb);
            }
            else if (e == typeof(P_Root.NulApp))
            {
                gen_NulApp((e as P_Root.NulApp), sb);
            }
            else if (e == typeof(P_Root.UnApp))
            {
                gen_UnApp((e as P_Root.UnApp), sb);
            }
            else if (e == typeof(P_Root.BinApp))
            {
                gen_BinApp((e as P_Root.BinApp), sb);
            }
            else if (e == typeof(P_Root.Field))
            {
                gen_Field((e as P_Root.Field), sb);
            }
            else if (e == typeof(P_Root.Default))
            {
                gen_Default((e as P_Root.Default), sb);
            }
            else if (e == typeof(P_Root.Cast))
            {
                gen_Cast((e as P_Root.Cast), sb);
            }
            else if (e == typeof(P_Root.Tuple))
            {
                gen_Tuple((e as P_Root.Tuple), sb);
            }
            else if (e == typeof(P_Root.NamedTuple))
            {
                gen_NamedTuple((e as P_Root.NamedTuple), sb);
            }
            return;
        }

        private static void gen_NewStmt(P_Root.NewStmt s, StringBuilder sb)
        {
            //TODO look at info
            sb.Append("new ");
            sb.Append(getName(s.name));
           // if(s.arg == typeof(P_Root.NamedTuple) || s.arg == typeof(P_Root.Tuple))
            //{
              //  gen_Expr(s.arg as P_Root.Expr, sb);
            //}else{
            sb.Append('(');
            gen_Expr(s.arg as P_Root.Expr, sb);
            sb.Append(')');
            //}
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
            sb.Append(", "); 
            gen_Expr(s.arg as P_Root.Expr, sb);
            return;
        }

        private static void gen_Monitor(P_Root.Monitor s, StringBuilder sb)
        {
            sb.Append("monitor ");
            gen_Expr(s.ev as P_Root.Expr, sb);
            sb.Append(", ");
            gen_Expr(s.arg as P_Root.Expr, sb);
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
            if (s.op == P_Root.MkUserCnst(P_Root.UserCnstKind.POP))
                sb.Append("pop");
            else if (s.op == P_Root.MkUserCnst(P_Root.UserCnstKind.SKIP))
                sb.Append("skip");
        }

        private static void gen_BinStmt(P_Root.BinStmt s, StringBuilder sb)
        {
            gen_Expr(s.arg1 as P_Root.Expr, sb);
            
            if (s.op == P_Root.MkUserCnst(P_Root.UserCnstKind.REMOVE))
            {
                sb.Append(" -= ");
            }else if(s.op == P_Root.MkUserCnst(P_Root.UserCnstKind.ASSIGN))
            {
                sb.Append(" = ");
            }
            else if (s.op == P_Root.MkUserCnst(P_Root.UserCnstKind.INSERT))
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
            if (s.cases != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
            {
                gen_Cases(s.cases as P_Root.Cases, sb);
            }
        }

        private static void gen_Receive(P_Root.Receive s,  StringBuilder sb)
        {
            sb.Append("receive {");
            gen_Cases(s.cases as P_Root.Cases, sb);
            sb.Append("\n}\n");
        }

        private static void gen_Assert(P_Root.Assert s, StringBuilder sb)
        {
            sb.Append("assert ");
            gen_Expr(s.arg as P_Root.Expr, sb);
            if (s.msg != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
                sb.Append(", " + getName(s.msg));
            sb.Append(";");
        }

        private static void gen_Print(P_Root.Print s, StringBuilder sb)
        {
            sb.Append("print " + getName(s.msg));
        }

        private static void gen_Stmt(P_Root.Stmt s, StringBuilder sb)
        {
            if (s == P_Root.MkUserCnst(P_Root.UserCnstKind.NIL)) { } //Do nothing.
            else if (s.GetType() == typeof(P_Root.NewStmt))
            {
                gen_NewStmt(s as P_Root.NewStmt, sb);
            }
            else if (s.GetType() == typeof(P_Root.Raise))
            {
                gen_Raise(s as P_Root.Raise, sb);
            }
            else if (s.GetType() == typeof(P_Root.Send))
            {
                gen_Send(s as P_Root.Send, sb);
            }
            else if (s.GetType() == typeof(P_Root.Monitor))
            {
                gen_Monitor(s as P_Root.Monitor, sb);
            }
            else if (s.GetType() == typeof(P_Root.FunStmt))
            {
                gen_FunStmt(s as P_Root.FunStmt, sb);
            }
            else if (s.GetType() == typeof(P_Root.NulStmt))
            {
                gen_NulStmt(s as P_Root.NulStmt, sb);
            }
            else if (s.GetType() == typeof(P_Root.BinStmt))
            {
                gen_BinStmt(s as P_Root.BinStmt, sb);
            }
            else if (s.GetType() == typeof(P_Root.Return))
            {
                gen_Return(s as P_Root.Return, sb);
            }
            else if (s.GetType() == typeof(P_Root.While))
            {
                gen_While(s as P_Root.While, sb);
            }
            else if (s.GetType() == typeof(P_Root.Ite))
            {
                gen_Ite(s as P_Root.Ite, sb);
            }
            else if (s.GetType() == typeof(P_Root.Seq))
            {
                gen_Seq(s as P_Root.Seq, sb);
            }
            else if (s.GetType() == typeof(P_Root.Receive))
            {
                gen_Receive(s as P_Root.Receive, sb);
            }
            else if (s.GetType() == typeof(P_Root.Assert))
            {
                gen_Assert(s as P_Root.Assert, sb);
            }
            else if (s.GetType() == typeof(P_Root.Print))
            {
                gen_Print(s as P_Root.Print, sb);
            }
            sb.Append(";\n");
            return;
        }

        private static void gen_AnonFunDecl(P_Root.AnonFunDecl d, StringBuilder sb)
        {
            return;
        }
    
        private static void gen_EventDecl(P_Root.EventDecl d, StringBuilder sb)
        {
            sb.Append("event ");
            sb.Append(getName(d.name));
            if (d.card.GetType() == typeof (P_Root.AssertMaxInstances))
            {
                sb.Append(" assert ");
                sb.Append((d.card as Microsoft.Pc.Domains.P_Root.RealCnst).Value.ToString());
            }
            else if (d.card.GetType() == typeof(Microsoft.Pc.Domains.P_Root.AssumeMaxInstances))
            {
                sb.Append(" assume ");
                sb.Append((d.card as Microsoft.Pc.Domains.P_Root.RealCnst).Value.ToString());
            }

            if (d.type != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL)) //Not NIL
            
            {
                sb.Append(" : ");
                sb.Append((d.type as Microsoft.Pc.Domains.P_Root.TypeDef).ToString());
            }

            sb.Append(";");
            return;
        }

        private static void gen_MachineDecl(P_Root.MachineDecl d, StringBuilder sb)
        {
            if (d.isMain == P_Root.MkUserCnst(P_Root.UserCnstKind.TRUE))
                sb.Append("main ");
            if (d.kind == P_Root.MkUserCnst(P_Root.UserCnstKind.MODEL))
                sb.Append("model ");
            else if (d.kind == P_Root.MkUserCnst(P_Root.UserCnstKind.MONITOR))
            {
                sb.Append("spec ");
                sb.Append(getName(d.name));
                return;
            }
            //TODO add ObservesDecl.
            else if (d.kind == P_Root.MkUserCnst(P_Root.UserCnstKind.REAL))
                sb.Append("machine ");
            sb.Append(getName(d.name) + " ");
            sb.Append("\n{\n");
            //writer.WriteLine(sb.ToString());
            return;
        }

        private static void gen_ObservesDecl(P_Root.ObservesDecl d, StringBuilder sb)
        {
            gen_MachineDecl(d.monitor as P_Root.MachineDecl, sb);
            sb.Append(" monitors " + getName(d.ev));
            return;
        }

        private static void gen_VarDecl(P_Root.VarDecl d, StringBuilder sb)
        {
            sb.Append("var " + getName(d.name) + " : ");
            gen_type(d.type as P_Root.TypeExpr, sb);
        }

        private static void gen_StateDecl(P_Root.StateDecl state, StringBuilder sb)
        {
            return;
        }

        public bool  gen_identity(TextWriter writer)
        {
            var InputProgramNames = new HashSet<Microsoft.Formula.API.ProgramName>();
            var flags = new List<Flag>();
            RootFileName = Path.GetFullPath(Path.Combine(Environment.CurrentDirectory, inputFileName));
            try
            {
                RootProgramName = new ProgramName(RootFileName);
            }
            catch (Exception e)
            {
                flags.Add(
                    new Flag(
                        SeverityKind.Error,
                        default(Span),
                        Constants.BadFile.ToString(string.Format("{0} : {1}", inputFileName, e.Message)),
                        Constants.BadFile.Code));
                return false;
            }

            HashSet<string> crntEventNames = new HashSet<string>();
            HashSet<string> crntMachineNames = new HashSet<string>();

            InstallResult uninstallResult;
            var uninstallDidStart = CompilerEnv.Uninstall(SeenFileNames.Values, out uninstallResult);
            // Contract.Assert(uninstallDidStart && uninstallResult.Succeeded);

            SeenFileNames = new Dictionary<string, ProgramName>(StringComparer.OrdinalIgnoreCase);
            Dictionary<string, PProgram> parsedPrograms = new Dictionary<string, PProgram>(StringComparer.OrdinalIgnoreCase);
            Queue<string> parserWorkQueue = new Queue<string>();
            SeenFileNames[RootFileName] = RootProgramName;
            InputProgramNames.Add(RootProgramName);
            parserWorkQueue.Enqueue(RootFileName);
            while (parserWorkQueue.Count > 0)
            {
                PProgram prog;
                List<string> includedFileNames;
                List<Flag> parserFlags;
                string currFileName = parserWorkQueue.Dequeue();
                var parser = new Parser.Parser();
                var result = parser.ParseFile(SeenFileNames[currFileName], Options, crntEventNames, crntMachineNames, out parserFlags, out prog, out includedFileNames);
                flags.AddRange(parserFlags);
                if (!result)
                {
                    return false;
                }

                parsedPrograms.Add(currFileName, prog);

                string currDirectoryName = Path.GetDirectoryName(Path.GetFullPath(currFileName));
                foreach (var fileName in includedFileNames)
                {
                    string fullFileName = Path.GetFullPath(Path.Combine(currDirectoryName, fileName));
                    ProgramName programName;
                    if (SeenFileNames.ContainsKey(fullFileName)) continue;
                    try
                    {
                        programName = new ProgramName(fullFileName);
                    }
                    catch (Exception e)
                    {
                        flags.Add(
                            new Flag(
                                SeverityKind.Error,
                                default(Span),
                                Constants.BadFile.ToString(string.Format("{0} : {1}", fullFileName, e.Message)),
                                Constants.BadFile.Code));
                        return false;
                    }
                    SeenFileNames[fullFileName] = programName;
                    InputProgramNames.Add(programName);
                    parserWorkQueue.Enqueue(fullFileName);
                }
            }


            return true;
        }

        public void gen_text(TextWriter writer)
        {
            foreach (var program in parsedPrograms)
            {
                //Go over the fields of class PProgram one by one and generate
                //the P code again. We do not really care about indentation.

                foreach (var typedef in program.TypeDefs)
                {
                    StringBuilder sb = new StringBuilder();
                    gen_TypeDef(typedef, sb);
                    writer.WriteLine(sb);
                }
                
                foreach (var event_ in program.Events)
                {
                    StringBuilder sb = new StringBuilder();
                    gen_EventDecl(event_, sb);
                    writer.WriteLine(sb);
                }

                foreach(var machine in program.Machines)
                {
                    StringBuilder sb = new StringBuilder();
                    gen_MachineDecl(machine, sb);
                    machineDeclToSB[machine] = sb;
                    //DEBUG - remove
                    Console.WriteLine("//** "+ getName(machine.name) + " **\\\\\n");
                }

                foreach(var state in program.States)
                {
                    StringBuilder sb = machineDeclToSB[state.owner as P_Root.MachineDecl];
                    gen_StateDecl(state, sb);
                }

                foreach(var variable in program.Variables)
                {

                    //writer.WriteLine(sb.ToString());
                }

                foreach(var transition in program.Transitions)
                {
                    StringBuilder sb = null;
                }

                foreach(var function in program.Functions)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var anonfunction in program.AnonFunctions)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var do_ in program.Dos)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var annotation in program.Annotations)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var observe in program.Observes)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                //Write the machine declarations to the TextWriter.
                foreach(var machine in program.Machines)
                {
                    writer.WriteLine(machineDeclToSB[machine]);
                    writer.WriteLine("\n}");
                }



/*              foreach(var fileinfo in program.FileInfos)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var lineinfo in program.LineInfos)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }
 */
            }
        }
    }
}