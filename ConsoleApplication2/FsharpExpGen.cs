using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.Text;

using Microsoft.Formula.API.Generators;
using System.IO;

using Microsoft.FSharp.Collections; 

namespace Microsoft.P2Boogie
{
    sealed class FSharpExpGen
    {
        private List<PProgram> parsedPrograms { get; set; }
        private Compiler compiler;

        //Data Structures Dealing with States
        private Dictionary<string, List<Syntax.DoDecl.T>>
            statesToDos = new Dictionary<string, List<Syntax.DoDecl.T>>();
        private Dictionary<string, List<Syntax.TransDecl.T>>
            statesToTransitions = new Dictionary<string, List<Syntax.TransDecl.T>>();


        //Data Structures Dealing with machines.
        private Dictionary<string, List<Syntax.StateDecl>> machineToStateList = new Dictionary<string, List<Syntax.StateDecl>>();
        private Dictionary<string, List<Syntax.FunDecl>> machineToFunList = new Dictionary<string, List<Syntax.FunDecl>>();
        private Dictionary<string, List<Syntax.VarDecl>> machineToVars = new Dictionary<string, List<Syntax.VarDecl>>();
        private Dictionary<string, List<Syntax.Expr.Event>> monitorToEventList = new Dictionary<string, List<Syntax.Expr.Event>>();

        //Data structures dealing with the program itself.
        private List<Syntax.FunDecl> staticFunctions = new List<Syntax.FunDecl>();
        private List<Syntax.MachineDecl> machines = new List<Syntax.MachineDecl>();
        private string mainMachine = null;

        private static string getString(ICSharpTerm x)
        {
            try
            {
                return (x as P_Root.StringCnst).Value;
            }
            catch (NullReferenceException e)
            {
                Console.WriteLine("The value passed cannot be converted to a String.");
                Console.WriteLine(e.StackTrace);
                return "";
            }
        }
        private static string getValue(ICSharpTerm x)
        {
            try
            {
                Formula.Common.Rational a = (x as P_Root.RealCnst).Value;
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
            catch (NullReferenceException e)
            {
                Console.WriteLine("The value passed cannot be converted to an Integer/Natural.");
                Console.WriteLine(e.StackTrace);
                return "";
            }
        }

        private string getID(P_Root.String @string)
        {
            return getString(@string);
        }

        private string getQualifiedName(P_Root.QualifiedName n)
        {
            string ret = "";
            if (n.qualifier.Symbol.ToString() != "NIL")
            {
                ret = getQualifiedName(n.qualifier as P_Root.QualifiedName);
                ret += "_";
            }
            ret += getID(n.name as P_Root.String);
            return ret;
        }

        public FSharpExpGen(CommandLineOptions options)
        {
            options.analyzeOnly = true;
            options.profile = true;
            compiler = new Compiler(options);
        }

        private Syntax.Type genBaseType(P_Root.BaseType t)
        {
            if (t._0.Symbol.ToString() == "INT")
            {
                return Syntax.Type.Int;
            }
            else if (t._0.Symbol.ToString() == "BOOL")
            {
                return Syntax.Type.Bool;
            }
            else if (t._0.Symbol.ToString() == "REAL")
            {
                return Syntax.Type.Machine;
            }
            else if (t._0.Symbol.ToString() == "ANY")
            {
                return Syntax.Type.Any;
            }
            else if (t._0.Symbol.ToString() == "EVENT")
            {
                return Syntax.Type.Any;
            }
            else if (t._0.Symbol.ToString() == "NULL")
            {
                return Syntax.Type.Null;
            }
            return null;
        }

        private Syntax.Type.Tuple genTupType(P_Root.TupType t)
        {
            var x = t;
            var lst = new List<Syntax.Type>();
            do
            {
                lst.Add(genTypeExpr(x.hd as P_Root.TypeExpr));
                x = x.tl as P_Root.TupType;
            } while (x.tl.Symbol.ToString() != "NIL");
            return Syntax.Type.NewTuple(ListModule.OfSeq(lst)) as Syntax.Type.Tuple;
        }

        private Tuple<string, Syntax.Type> genNmdTupTypeField(P_Root.NmdTupTypeField f)
        {
            //ToDo getQualifier(f.qual as P_Root.Qualifier);
            var s = getID(f.name as P_Root.String);
            var t = genTypeExpr(f.type as P_Root.TypeExpr);
            return new Tuple<string, Syntax.Type>(s, t);
        }

        private Syntax.Type.NamedTuple genNmdTupType(P_Root.NmdTupType t)
        {
            var lst = new List<Tuple<string, Syntax.Type>>();
            var x = t;
            do
            {
                lst.Add(genNmdTupTypeField(x.hd as P_Root.NmdTupTypeField));
                x = x.tl as P_Root.NmdTupType;
            }
            while (x.tl.Symbol.ToString() != "NIL");
            return Syntax.Type.NewNamedTuple(ListModule.OfSeq(lst)) as Syntax.Type.NamedTuple;
        }
        /*
        private void getQualifier(P_Root.Qualifier q)
        {
            if (q.Symbol.ToString() == "SWAP")
            {
                genSwap();
            }
            else if (q.Symbol.ToString() == "XFER")
            {
                genXfer();
            }
            return;
        }*/

        private Syntax.Type.Seq genSeqType(P_Root.SeqType t)
        {
            var x = genTypeExpr(t.x as P_Root.TypeExpr);
            return Syntax.Type.NewSeq(x) as Syntax.Type.Seq;   
        }

        private Syntax.Type.Map genMapType(P_Root.MapType t)
        {
            var k = genTypeExpr(t.k as P_Root.TypeExpr);
            var v = genTypeExpr(t.v as P_Root.TypeExpr);
            return Syntax.Type.NewMap(k, v) as Syntax.Type.Map;
        }
        /*
        private Syntax.Type.Name genNameType(P_Root.NameType t)
        {
            var name = getID(t.name as P_Root.String);
            return;
        }
        */
        private Syntax.Type genTypeExpr(P_Root.TypeExpr t)
        {
            //t: any TypeExpr. This means we can check its derived type as we wish.
            if (t is P_Root.NameType)
            {
                //genNameType(t as P_Root.NameType); TODO
                return null;
            }
            else if (t is P_Root.BaseType)
            {
                return genBaseType(t as P_Root.BaseType);
            }
            else if (t is P_Root.SeqType)
            {
               return genSeqType(t as P_Root.SeqType);
            }
            else if (t is P_Root.TupType)
            {
                return genTupType(t as P_Root.TupType);
            }
            else if (t is P_Root.NmdTupType)
            {
                return genNmdTupType(t as P_Root.NmdTupType);
            }
            else if (t is P_Root.MapType)
            {
                return genMapType(t as P_Root.MapType);
            }
            return null;
        }

        /* TODO
        private void genTypeDef(P_Root.TypeDef typeDef)
        {
            getID(typeDef.name as P_Root.String);
            if (typeDef.type.Symbol.ToString() != "NIL")
            {
                genTypeExpr(typeDef.type as P_Root.TypeExpr);
            }
        }*/

        private Syntax.Expr.Var genName(P_Root.Name e)
        {
            var n = getID(e.name as P_Root.String);
            return Syntax.Expr.NewVar(n) as Syntax.Expr.Var;
        }

        private Syntax.Expr.New genNewExpr(P_Root.New e)
        {
            var s = getID(e.name as P_Root.String);
            Syntax.Expr x = null;
            if (e.arg.Symbol.ToString() != "NIL")
            {
                x = genExpr(e.arg as P_Root.Expr);
            }
            return Syntax.Expr.NewNew(s, x) as Syntax.Expr.New;
        }

        private Syntax.Expr.Call genFunApp(P_Root.FunApp e)
        {
            var n = getID(e.name as P_Root.String);
            FSharpList<Syntax.Expr> args = null;
            if (e.args.Symbol.ToString() != "NIL")
            {
                args = genExprs(e.args as P_Root.Exprs);
            }
            return Syntax.Expr.NewCall(n, args) as Syntax.Expr.Call;
        }

        private Syntax.Expr genNulApp(P_Root.NulApp e)
        {
            if (e.op is P_Root.Integer)
            {
                var x = getValue(e.op as P_Root.Integer);
                int i;
                if (int.TryParse(x, out i))
                    return Syntax.Expr.NewConstInt(i);
                else
                    throw new InvalidOperationException("Invalid Int Value");
            }
            switch (e.op.Symbol.ToString())
            {
                case "TRUE":
                    return Syntax.Expr.NewConstBool(true);
                case "FALSE":
                    return Syntax.Expr.NewConstBool(true);
                case "THIS":
                    return Syntax.Expr.This;
                case "NONDET":
                    return Syntax.Expr.Nondet;
                //case "FAIRNONDET": ToDO
                    //return Syntax.Expr.FairNondet;
                //case "NULL": TODO
                    //return Syntax.Expr.Null;
                //case "HALT":
                    //return Syntax.Expr.Halt;
                default:
                    throw new InvalidOperationException("Error in NulApp Generation: got symbol " + e.op.Symbol.ToString());
            }
        }

        private Syntax.UnOp genUnOp(P_Root.IArgType_UnApp__0 op)
        {
            switch (op.Symbol.ToString())
            {
                case "NOT":
                    return Syntax.UnOp.Not;
                case "NEG":
                    return Syntax.UnOp.Neg;
                case "KEYS":
                    return Syntax.UnOp.Keys;
                case "VALUES":
                    return Syntax.UnOp.Values;
                case "SIZEOF":
                    return Syntax.UnOp.Sizeof;
                default:
                    throw new InvalidOperationException("Error in UnApp Generation: got symbol " + op.Symbol.ToString());
            }

        }

        private Syntax.BinOp genBinOp(P_Root.IArgType_BinApp__0 op)
        {
            switch (op.Symbol.ToString())
            {
                case "ADD":
                    return Syntax.BinOp.Add;
                case "SUB":
                    return Syntax.BinOp.Sub;
                case "MUL":
                    return Syntax.BinOp.Mul;
                case "INTDIV":
                    return Syntax.BinOp.Intdiv;
                case "AND":
                    return Syntax.BinOp.And;
                case "OR":
                    return Syntax.BinOp.Or;
                case "EQ":
                    return Syntax.BinOp.Eq;
                case "NEQ":
                    return Syntax.BinOp.Neq;
                case "LT":
                    return Syntax.BinOp.Lt;
                case "LE":
                    return Syntax.BinOp.Le;
                case "GT":
                    return Syntax.BinOp.Gt;
                case "GE":
                    return Syntax.BinOp.Ge;
                case "IDX": //A non-infix operator.
                    return Syntax.BinOp.Idx;
                case "IN":
                    return Syntax.BinOp.In;
                default:
                    throw new InvalidOperationException("Error in BinApp Generation: got symbol " + op.Symbol.ToString());
            }
        }

        private Syntax.Expr genFieldExpr(P_Root.Field e)
        {
            var arg = genExpr(e.arg as P_Root.Expr);
            if (e.name is P_Root.Natural)
            {
                var f = getValue(e.name as P_Root.Natural);
                int i;
                if (int.TryParse(f, out i))
                    return Syntax.Expr.NewDot(arg, i);
                else
                    throw new InvalidOperationException("Error in Field Exp Generation: got field" + f);
            }
            else if (e.name is P_Root.String)
            {
                var f = getString(e.name as P_Root.String);
                return Syntax.Expr.NewNamedDot(arg, f);
            }
            return null;
        }

        private Syntax.Expr.Default genDefaultExpr(P_Root.Default e)
        {
            var t = genTypeExpr(e.type as P_Root.TypeExpr);
            return Syntax.Expr.NewDefault(t) as Syntax.Expr.Default;
        }

        private Syntax.Expr.Cast genCastExpr(P_Root.Cast e)
        {
            var arg = genExpr(e.arg as P_Root.Expr);
            var t = genTypeExpr(e.type as P_Root.TypeExpr);
            return Syntax.Expr.NewCast(arg, t) as Syntax.Expr.Cast;
        }

        private FSharpList<Syntax.Expr> genExprs(P_Root.Exprs e)
        {
            var x = e;
            List<Syntax.Expr> lst = new List<Syntax.Expr>();
            do
            {
                //getQualifier(x.qual as P_Root.Qualifier); TODO
                lst.Add(genExpr(x.head as P_Root.Expr));
                x = x.tail as P_Root.Exprs;
            }
            while (x.tail.Symbol.ToString() != "NIL");
            return ListModule.OfSeq(lst);
        }

        private FSharpList<Tuple<string, Syntax.Expr>> genNamedExprs(P_Root.NamedExprs e)
        {
            var x = e;
            List<Tuple<string, Syntax.Expr>> lst = new List<Tuple<string, Syntax.Expr>>();
            do
            {
                var f = getID(x.field as P_Root.String);
                var exp = genExpr(x.exp as P_Root.Expr);
                var t = new Tuple<string, Syntax.Expr>(f, exp);
                lst.Add(t);
                x = x.tail as P_Root.NamedExprs;
            } while (x.tail.Symbol.ToString() != "NIL");
            return ListModule.OfSeq(lst);
        }

        private Syntax.Expr.Tuple genTupleExpr(P_Root.Tuple e)
        {
            var x = genExprs(e.body as P_Root.Exprs);
            return Syntax.Expr.NewTuple(x) as Syntax.Expr.Tuple;
        }

        private Syntax.Expr.NamedTuple genNamedTupleExpr(P_Root.NamedTuple e)
        {
            var x = genNamedExprs(e.body as P_Root.NamedExprs);
            return Syntax.Expr.NewNamedTuple(x) as Syntax.Expr.NamedTuple;
        }

        private Syntax.Expr.Un genUnApp(P_Root.UnApp u)
        {
            var op = genUnOp(u.op as P_Root.IArgType_UnApp__0);
            var arg = genExpr(u.arg1 as P_Root.Expr);
            return Syntax.Expr.NewUn(op, arg) as Syntax.Expr.Un;
        }

        private Syntax.Expr.Bin genBinApp(P_Root.BinApp b)
        {
            var op = genBinOp(b.op as P_Root.IArgType_BinApp__0);
            var arg1 = genExpr(b.arg1 as P_Root.Expr);
            var arg2 = genExpr(b.arg2 as P_Root.Expr);
            return Syntax.Expr.NewBin(op, arg1, arg2) as Syntax.Expr.Bin;
        }


        private Syntax.Expr genExpr(P_Root.Expr e)
        {
            if (e is P_Root.Name)
            {
                return genName((e as P_Root.Name));
            }
            else if (e is P_Root.New)
            {
                return genNewExpr((e as P_Root.New));
            }
            else if (e is P_Root.FunApp)
            {
                return genFunApp((e as P_Root.FunApp));
            }
            else if (e is P_Root.NulApp)
            {
                return genNulApp((e as P_Root.NulApp));
            }
            else if (e is P_Root.UnApp)
            {
                return genUnApp((e as P_Root.UnApp));
            }
            else if (e is P_Root.BinApp)
            {
                return genBinApp((e as P_Root.BinApp));
            }
            else if (e is P_Root.Field)
            {
                return genFieldExpr((e as P_Root.Field));
            }
            else if (e is P_Root.Default)
            {
                return genDefaultExpr((e as P_Root.Default));
            }
            else if (e is P_Root.Cast)
            {
                return genCastExpr((e as P_Root.Cast));
            }
            else if (e is P_Root.Tuple)
            {
                return genTupleExpr((e as P_Root.Tuple));
            }
            else if (e is P_Root.NamedTuple)
            {
                return genNamedTupleExpr((e as P_Root.NamedTuple));
            }
            return null;
        }

        private Syntax.Stmt.NewStmt genNewStmt(P_Root.NewStmt s)
        {
            var n = getID(s.name as P_Root.String);
            Syntax.Expr arg = null;
            if (s.arg.Symbol.ToString() != "NIL")
            {
                arg = genExpr(s.arg as P_Root.Expr);
            }
            return Syntax.Stmt.NewNewStmt(n, arg) as Syntax.Stmt.NewStmt;
        }

        private Syntax.Stmt.Raise genRaiseStmt(P_Root.Raise s)
        {   
            var ev = genExpr(s.ev as P_Root.Expr);
            Syntax.Expr arg = null;
            if (s.arg.Symbol.ToString() != "NIL")
            {    
                arg = genExpr(s.arg as P_Root.Expr);
            }
            return Syntax.Stmt.NewRaise(ev, arg) as Syntax.Stmt.Raise;
        }

        private Syntax.Stmt.Send genSendStmt(P_Root.Send s)
        {
            //getQualifier(s.qual as P_Root.Qualifier); TODO
            var dst = genExpr(s.dest as P_Root.Expr);
            var ev = genExpr(s.ev as P_Root.Expr);
            Syntax.Expr arg = null;
            if (s.arg.Symbol.ToString() != "NIL")
            {
                arg = genExpr(s.arg as P_Root.Expr);
            }
            return Syntax.Stmt.NewSend(dst, ev, arg) as Syntax.Stmt.Send;
        }

        private Syntax.Stmt.Monitor genMonitorStmt(P_Root.Monitor s)
        {
            var ev = genExpr(s.ev as P_Root.Expr);
            Syntax.Expr arg = null;
            if (s.arg.Symbol.ToString() != "NIL")
            {
                arg = genExpr(s.arg as P_Root.Expr);
            }
            return Syntax.Stmt.NewMonitor(ev, arg) as Syntax.Stmt.Monitor;
        }

        //aout to be taken care of.
        private Syntax.Stmt.FunStmt genFunStmt(P_Root.FunStmt s)
        {
            var n = getID(s.name as P_Root.String);
            FSharpList<Syntax.Expr> args = null;
            FSharp.Core.FSharpOption<string> aout = null;
            if (s.args.Symbol.ToString() != "NIL")
            {
                args = genExprs(s.args as P_Root.Exprs);
            }
            if(s.aout.Symbol.ToString() != "NIL")
            {
                var a = (s.aout as P_Root.Name).name as P_Root.String;
                aout = new FSharp.Core.FSharpOption<string>(getID(a));
            }
            return Syntax.Stmt.NewFunStmt(n, args, aout) as Syntax.Stmt.FunStmt;
        }
        private Syntax.Stmt genNulStmt(P_Root.NulStmt s)
        {
            if (s.op.Symbol.ToString() == "POP")
                return Syntax.Stmt.Pop;
            else if (s.op.Symbol.ToString() == "SKIP")
                return Syntax.Stmt.Skip;
            return null;
        }

        private Syntax.Stmt genBinStmt(P_Root.BinStmt s)
        {
            var arg1 = genLVal(s.arg1 as P_Root.Expr);

            if (s.op.Symbol.ToString() == "REMOVE")
            {
                var arg2 = genExpr(s.arg2 as P_Root.Expr);
                return Syntax.Stmt.NewRemove(arg1, arg2);
            }
            else if (s.op.Symbol.ToString() == "ASSIGN")
            {
                var arg2 = genExpr(s.arg2 as P_Root.Expr);
                return Syntax.Stmt.NewAssign(arg1, arg2);
            }
            else if (s.op.Symbol.ToString() == "INSERT")
            {
                if(s.arg2 is P_Root.Tuple)
                {
                    //ToDo
                }
                else
                {
                    throw new InvalidOperationException("Bad insert op!");
                }
            }
            return null;
        }

        private Syntax.Lval genLVal(P_Root.Expr e)
        {
            if (e is P_Root.Name)
            {
                var x = e as P_Root.Name;
                var n = getID(x.name as P_Root.String);
                return Syntax.Lval.NewVar(n);
            }
            else if (e is P_Root.Field)
            {
                var x = e as P_Root.Field;
                var arg = genLVal(x.arg as P_Root.Expr);
                if (x.name is P_Root.Natural)
                {
                    var f = getValue(x.name as P_Root.Natural);
                    int i;
                    if (int.TryParse(f, out i))
                        return Syntax.Lval.NewDot(arg, i);
                    else
                        throw new InvalidOperationException("Error in Field Exp Generation: got field" + f);
                }
                else if (x.name is P_Root.String)
                {
                    var f = getString(x.name as P_Root.String);
                    return Syntax.Lval.NewNamedDot(arg, f);
                }
                return null;
            }
            else if(e is P_Root.BinApp && 
                (e as P_Root.BinApp).op.Symbol.ToString() == "IDX")
            {
                var x = e as P_Root.BinApp;
                var arg1 = genLVal(x.arg1 as P_Root.Expr);
                var arg2 = genExpr(x.arg2 as P_Root.Expr);
                return Syntax.Lval.NewIndex(arg1, arg2);
            }
            return null;
        }

        private Syntax.Stmt.Return genReturnStmt(P_Root.Return s)
        {
            Syntax.Expr e = null;
            if (s.expr.Symbol.ToString() != "NIL")
            {
                e = genExpr(s.expr as P_Root.Expr);
            }
            return Syntax.Stmt.NewReturn(e) as Syntax.Stmt.Return;
        }

        private Syntax.Stmt.While genWhileStmt(P_Root.While s)
        {
            var c = genExpr(s.cond as P_Root.Expr);
            var st = genStmt(s.body as P_Root.Stmt);
            return Syntax.Stmt.NewWhile(c, st) as Syntax.Stmt.While;
        }

        private Syntax.Stmt.Ite genIteStmt(P_Root.Ite s)
        {
            var c = genExpr(s.cond as P_Root.Expr);
            var t = genStmt(s.@true as P_Root.Stmt);
            var f = genStmt(s.@false as P_Root.Stmt);
            return Syntax.Stmt.NewIte(c, t, f) as Syntax.Stmt.Ite;
        }

        private Syntax.Stmt.SeqStmt genSeqStmt(P_Root.Seq s)
        {
            var lst = new List<Syntax.Stmt>();
            var x = s;
            do
            {
                lst.Add(genStmt(x.s1 as P_Root.Stmt));    
                x = (x.s2 as P_Root.Seq);
            }
            while (x.s2.Symbol.ToString() != "SKIP");
            return Syntax.Stmt.NewSeqStmt(ListModule.OfSeq(lst)) 
                as Syntax.Stmt.SeqStmt;
        }
        /* ToDo
        private Syntax.Stmt.Cases genCases(P_Root.Cases s)
        {
            getString(s.trig);
            genAnonFunDecl(s.action as P_Root.AnonFunDecl);
            if (s.cases.Symbol.ToString() != "NIL")
            {
                genCases(s.cases as P_Root.Cases);
            }
        }

        private Syntax.Stmt.Receive genReceiveStmt(P_Root.Receive s)
        {
            genCases(s.cases as P_Root.Cases);
        }
        */
        private Syntax.Stmt.Assert genAssertStmt(P_Root.Assert s)
        {
            //ToDo MESSAGE to be taken care of!
            var arg = genExpr(s.arg as P_Root.Expr);
            string msg = null; 
            if (s.msg.Symbol.ToString() != "NIL")
            {
                msg = getString(s.msg);
            }
            return Syntax.Stmt.NewAssert(arg) as Syntax.Stmt.Assert;
        }

        /* private Syntax.Stmt.Print genPrintStmt(P_Root.Print s) TODO
        {
            var str = getString(s.msg);
            return Syntax.Stmt.NewPrint(str) as Syntax.Stmt.Print;
        }
        */

        private Syntax.Stmt genStmt(P_Root.Stmt s)
        {
            if (s is P_Root.NewStmt)
            {
                return genNewStmt(s as P_Root.NewStmt);
            }
            else if (s is P_Root.Raise)
            {
                return genRaiseStmt(s as P_Root.Raise);
            }
            else if (s is P_Root.Send)
            {
                return genSendStmt(s as P_Root.Send);
            }
            else if (s is P_Root.Monitor)
            {
                return genMonitorStmt(s as P_Root.Monitor);
            }
            else if (s is P_Root.FunStmt)
            {
                return genFunStmt(s as P_Root.FunStmt);
            }
            else if (s is P_Root.NulStmt)
            {
                return genNulStmt(s as P_Root.NulStmt);
            }
            else if (s is P_Root.BinStmt)
            {
                return genBinStmt(s as P_Root.BinStmt);
            }
            else if (s is P_Root.Return)
            {
                return genReturnStmt(s as P_Root.Return);
            }
            else if (s is P_Root.While)
            {
                return genWhileStmt(s as P_Root.While);
            }
            else if (s is P_Root.Ite)
            {
                return genIteStmt(s as P_Root.Ite);
            }
            else if (s is P_Root.Seq)
            {
                return genSeqStmt(s as P_Root.Seq);
            }
            else if (s is P_Root.Receive)
            {
                //return genReceiveStmt(s as P_Root.Receive);
            }
            else if (s is P_Root.Assert)
            {
                return genAssertStmt(s as P_Root.Assert);
            }
            else if (s is P_Root.Print)
            {
                //return genPrintStmt(s as P_Root.Print); ToDo
            }
            return null;
        }
        /*ToDo
        private void genQueueConstraint(P_Root.QueueConstraint c)
        {
            int i;
            if (c is P_Root.AssertMaxInstances)
            {
                var x = c as P_Root.AssertMaxInstances;
                var s = getValue(x.bound);
                if(int.TryParse(s, out i))
                    
            }
            else if (c is P_Root.AssumeMaxInstances)
            {
                var x = c as P_Root.AssumeMaxInstances;
                getValue(x.bound);
                if(int.TryParse(s, out i))
                    
            }
        }
        
        //TODO 
        private void genEventDecl(P_Root.EventDecl d)
        {
            getString(d.name);
            if (d.type.Symbol.ToString() != "NIL") //Not NIL
            {
                genTypeExpr(d.type as P_Root.TypeExpr);
            }
        }
        */

        private Syntax.MachineDecl genMachineDecl(P_Root.MachineDecl d)
        {
            bool is_monitor = false;
            string name = getString(d.name);
            FSharpList<Syntax.StateDecl> states = 
                ListModule.OfSeq(machineToStateList[name]);
            FSharpList<Syntax.Expr.Event> monitored_events = null;
            //ToDo Monitors
            FSharpList<Syntax.FunDecl> functions =
                ListModule.OfSeq(machineToFunList[name]);
            if (d.isMain.Symbol.ToString() == "TRUE")
                mainMachine = name;
            if (d.kind.Symbol.ToString() == "MODEL")
                ; //TODO ADD CODE.
            else if (d.kind.Symbol.ToString() == "MONITOR")
            {
                is_monitor = true;
                monitored_events = 
                    ListModule.OfSeq(monitorToEventList[name]);
            }
            else if (d.kind.Symbol.ToString() == "REAL")
                ; //ToDo Add Code.

            string start_state = getQualifiedName(d.start as P_Root.QualifiedName);
            return null;
        }

        private void genObservesDecl(P_Root.ObservesDecl d)
        {
            var ev = Syntax.Expr.NewEvent(getID(d.ev as P_Root.String)) 
                as Syntax.Expr.Event;
            var n = (d.monitor as P_Root.MachineDecl).name;
            string mName = getID(n as P_Root.String);
            monitorToEventList[mName].Add(ev);
            return;
        }

        private Syntax.VarDecl genVarDecl(P_Root.VarDecl d)
        {
            var n = getID(d.name as P_Root.String);
            var t = genTypeExpr(d.type as P_Root.TypeExpr);
            return new Syntax.VarDecl(n, t);
        }



        private void genStateDecl(P_Root.StateDecl state)
        {
            string excitation = state.temperature.Symbol.ToString();
            var name = getQualifiedName(state.name as P_Root.QualifiedName);
            var entryAction = genAnonFunDecl(state.entryAction as P_Root.AnonFunDecl);
            var exitAction  = genAnonFunDecl(state.exitFun as P_Root.AnonFunDecl);
        }

        private void genFuncDecl(P_Root.FunDecl d)
        {
            //Function is static.
            if (d.owner.Symbol.ToString() == "NIL")
            {
            }

            if (d.kind.Symbol.ToString() == "MODEL")
            {
            }
            getID(d.name as P_Root.String);
            if (d.@params.Symbol.ToString() != "NIL")
            {
                genNmdTupType(d.@params as P_Root.NmdTupType);
            }
            if (d.@return.Symbol.ToString() != "NIL")
            {
                genTypeExpr(d.@return as P_Root.TypeExpr);
            }
            if (d.locals.Symbol.ToString() != "NIL")
            {
                //Need to regen?
                genNmdTupType(d.locals as P_Root.NmdTupType);
            }
            genStmt(d.body as P_Root.Stmt);
            return;
        }

        private void genAnonFunDecl(P_Root.AnonFunDecl d)
        {
            /*if (d.envVars.Symbol.ToString() != "NIL")
            {
                genNmdTupType(d.envVars as P_Root.NmdTupType);
            }*/
            if (d.locals.Symbol.ToString() != "NIL")
            {
                genNmdTupType(d.locals as P_Root.NmdTupType);
            }
            genStmt(d.body as P_Root.Stmt);
            return;
        }

        private void genTrig(ICSharpTerm t)
        {
            if (t.Symbol.ToString() == "NULL")
            {
            }
            else if (t.Symbol.ToString() == "HALT")
            {
            }
            else
            {
                getID(t as P_Root.String);
            }
        }

        private void genTransDecl(P_Root.TransDecl t)
        {
            genTrig(t.trig);
            if (t.action.Symbol.ToString() == "PUSH")
            {
                getQualifiedName(t.dst as P_Root.QualifiedName);
                return;
            }
            else if (t.action is P_Root.AnonFunDecl)
            {
                getQualifiedName(t.dst as P_Root.QualifiedName);
                genAnonFunDecl(t.action as P_Root.AnonFunDecl);
            }
            else
            {
                getQualifiedName(t.dst as P_Root.QualifiedName);
                getID(t.action as P_Root.String);
            }
            return;
        }

        private void genDoDecl(P_Root.DoDecl d)
        {
            if (d.action.Symbol.ToString() == "DEFER")
            {
                genTrig(d.trig);
            }
            else if (d.action.Symbol.ToString() == "IGNORE")
            {
                genTrig(d.trig);
            }
            else if (d.action is P_Root.AnonFunDecl)
            {
                genTrig(d.trig);
                genAnonFunDecl(d.action as P_Root.AnonFunDecl);
            }
            else
            {
                genTrig(d.trig);
                getID(d.action as P_Root.String);
            }
            return;
        }
        private void genAnnotatable(P_Root.Annotatable a)
        {
            if (a is P_Root.EventDecl)
            {
                //genEventDecl(a as P_Root.EventDecl);
            }
            else if (a is P_Root.MachineDecl)
            {
                genMachineDecl(a as P_Root.MachineDecl);
            }
            else if (a is P_Root.VarDecl)
            {
                genVarDecl(a as P_Root.VarDecl);
            }
            else if (a is P_Root.FunDecl)
            {
                genFuncDecl(a as P_Root.FunDecl);
            }
            else if (a is P_Root.StateDecl)
            {
                genStateDecl(a as P_Root.StateDecl);
            }
            else if (a is P_Root.TransDecl)
            {
                genTransDecl(a as P_Root.TransDecl);
            }
            else if (a is P_Root.DoDecl)
            {
                genDoDecl(a as P_Root.DoDecl);
            }
        }

        private void genAnnotation(P_Root.Annotation a)
        {
            genAnnotatable(a.ant as P_Root.Annotatable);
            //ToDo Assertion Generation Logic.
        }

        public void genFSExprs()
        {
            foreach (var program in parsedPrograms)
            {
                /*
                //Write TypeDefs and Event Declarations first.
                foreach (var typedef in program.TypeDefs)
                {

                }

                foreach (var event_ in program.Events)
                {

                }
                */
                //Start generating code for machines.
                foreach (var machine in program.Machines)
                {

                }

                foreach (var observer in program.Observes)
                {

                }
                //Bind the variable, function and state declarations to the relevant machine
                //and the transitions to the relevant state.
                foreach (var variable in program.Variables)
                {

                }
                foreach (var state in program.States)
                {
                    genStateDecl(state);
                    Console.WriteLine();
                }

                foreach (var function in program.Functions)
                {
                    genFuncDecl(function);
                    Console.WriteLine();
                }

    /*                foreach (var transition in program.Transitions)
                {

                }

                foreach (var do_ in program.Dos)
                {

                }
    */
            }
        }

    }
}