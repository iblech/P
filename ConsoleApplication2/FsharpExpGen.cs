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

        private string genID(P_Root.String @string)
        {
            return getString(@string);
        }

        public FSharpExpGen(CommandLineOptions options)
        {
            options.analyzeOnly = true;
            options.profile = true;
            compiler = new Compiler(options);
        }

        private Syntax.Expr.New genNewExpr(P_Root.New e)
        {
            return null;
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
            //ToDo genQualifier(f.qual as P_Root.Qualifier);
            var s = genID(f.name as P_Root.String);
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
        private void genQualifier(P_Root.Qualifier q)
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

        private void genSeqType(P_Root.SeqType t)
        {
            genSeqType();
            
            genTypeExpr(t.x as P_Root.TypeExpr);
            
        }

        private void genMapType(P_Root.MapType t)
        {
            genMapType();
            
            genTypeExpr(t.k as P_Root.TypeExpr);
            genSepExpr();
            genTypeExpr(t.v as P_Root.TypeExpr);
            
        }

        private void genNameType(P_Root.NameType t)
        {
            genID(t.name as P_Root.String);
            return;
        }

        private Syntax.Type genTypeExpr(P_Root.TypeExpr t)
        {
            //t: any TypeExpr. This means we can check its derived type as we wish.
            if (t is P_Root.NameType)
            {
                genNameType(t as P_Root.NameType);
            }
            else if (t is P_Root.BaseType)
            {
                genBaseType(t as P_Root.BaseType);
            }
            else if (t is P_Root.SeqType)
            {
                genSeqType(t as P_Root.SeqType);
            }
            else if (t is P_Root.TupType)
            {
                genTupType(t as P_Root.TupType);
            }
            else if (t is P_Root.NmdTupType)
            {
                genNmdTupType(t as P_Root.NmdTupType);
            }
            else if (t is P_Root.MapType)
            {
                genMapType(t as P_Root.MapType);
            }
            return null;
        }

        private void genTypeDef(P_Root.TypeDef typeDef)
        {
            genType();
            genID(typeDef.name as P_Root.String);
            if (typeDef.type.Symbol.ToString() != "NIL")
            {
                genSepTypeDef();
                genTypeExpr(typeDef.type as P_Root.TypeExpr);
            }
        }
        private void genName(P_Root.Name e)
        {
            genID(e.name as P_Root.String);
            return;
        }

        private void genNewExpr(P_Root.New e)
        {
            genNew();
            .Append(getString(e.name));
            
            if (e.arg.Symbol.ToString() != "NIL")
            {
                genExpr(e.arg as P_Root.Expr);
            }
            
        }

        private void genFunApp(P_Root.FunApp e)
        {
            genID(e.name as P_Root.String);
            
            if (e.args.Symbol.ToString() != "NIL")
            {
                genExpr(e.args as P_Root.Expr);
            }
            
            return;
        }

        private void genNulApp(P_Root.NulApp e)
        {
            if (e.op is P_Root.Integer)
            {
                var x = e.op as P_Root.Integer;
                genConstInt();
                
                .Append(getValue(x));
                
                return;
            }
            switch (e.op.Symbol.ToString())
            {
                case "TRUE":
                    genTrue();
                    break;
                case "FALSE":
                    genFalse();
                    break;
                case "THIS":
                    genThis();
                    break;
                case "NONDET":
                    genNonDet();
                    break;
                case "FAIRNONDET":
                    genFairNonDet();
                    break;
                case "NULL":
                    genNull();
                    break;
                case "HALT":
                    genHalt();
                    break;
                default:
                    Console.WriteLine("Error in NulApp Generation: got symbol " + e.op.Symbol.ToString());
                    break;
            }
        }


        //To prevent issues with infixprefix and postfix expressions.
        private void genUnOp(P_Root.IArgType_UnApp__0 op)
        {
            switch (op.Symbol.ToString())
            {
                case "NOT":
                    genNot();
                    break;
                case "NEG":
                    genNot();
                    break;
                case "KEYS":
                    genKeys();
                    break;
                case "VALUES":
                    genValues();
                    break;
                case "SIZEOF":
                    genSizeof();
                    break;
            }
            return;
        }

        private void genBinOp(P_Root.IArgType_BinApp__0 op)
        {
            switch (op.Symbol.ToString())
            {
                case "ADD":
                    genAdd();
                    break;
                case "SUB":
                    genSub();
                    break;
                case "MUL":
                    genMul();
                    break;
                case "INTDIV":
                    genIntDiv();
                    break;
                case "AND":
                    genAnd();
                    break;
                case "OR":
                    genOr();
                    break;
                case "EQ":
                    genEq();
                    break;
                case "NEQ":
                    genNe();
                    break;
                case "LT":
                    genLt();
                    break;
                case "LE":
                    genLe();
                    break;
                case "GT":
                    genGt();
                    break;
                case "GE":
                    genGe();
                    break;
                case "IDX": //A non-infix operator.
                    genIndexing();
                    break;
                case "IN":
                    genIn();
                    break;
            }
            return;
        }

        private void genFieldExpr(P_Root.Field e)
        {
            genExpr(e.arg as P_Root.Expr);
            genFieldOp();
            if (e.name is P_Root.Natural)
            {
                .Append(getValue(e.name as P_Root.Natural));
            }
            else if (e.name is P_Root.String)
            {
                .Append(getString(e.name as P_Root.String));
            }
        }

        private void genDefaultExpr(P_Root.Default e)
        {
            genDefault();
            
            genTypeExpr(e.type as P_Root.TypeExpr);
            
            return;
        }

        private void genCastExpr(P_Root.Cast e)
        {
            genCast();
            genExpr(e.arg as P_Root.Expr);
            genCastOp();
            genTypeExpr(e.type as P_Root.TypeExpr);
            return;
        }

        private int genExprs(P_Root.Exprs e)
        {
            var x = e;
            int i = 0;
            genExprs();
            
            do
            {
                genQualifier(x.qual as P_Root.Qualifier);
                genExpr(x.head as P_Root.Expr);
                genSepExpr();
                x = x.tail as P_Root.Exprs;
                i++;
            }
            while (x.tail.Symbol.ToString() != "NIL");
            
            if (x.head.Symbol.ToString() != "NIL")
                i++;
            return i;
        }

        private void genNamedExprs(P_Root.NamedExprs e)
        {
            genNamedExprs();
            var x = e;
            do
            {
                genID(x.field as P_Root.String);
                genEquals();
                genExpr(x.exp as P_Root.Expr);
                genSepExpr();
                x = x.tail as P_Root.NamedExprs;
            } while (x.tail.Symbol.ToString() != "NIL");
        }
        private abstract void genEquals(StringBuilder );
        private abstract void genNamedExprs(StringBuilder );

        private void genTupleExpr(P_Root.Tuple e)
        {
            //(Ugly?) Tuple generation logic. We need to put a comma at the end iff we have a singleton tuple
            //like (1,). We thus return the # of terms from genExprs().
            genTuple();
            
            var x = genExprs(e.body as P_Root.Exprs);
            if (x == 1)
                genSepExpr();
            
        }

        private void genNamedTupleExpr(P_Root.NamedTuple e)
        {
            genNmdTuple();
            
            genNamedExprs(e.body as P_Root.NamedExprs);
            
        }

        private void genExpr(P_Root.Expr e)
        {
            if (e is P_Root.Name)
            {
                genName((e as P_Root.Name));
            }
            else if (e is P_Root.New)
            {
                genNewExpr((e as P_Root.New));
            }
            else if (e is P_Root.FunApp)
            {
                genFunApp((e as P_Root.FunApp));
            }
            else if (e is P_Root.NulApp)
            {
                genNulApp((e as P_Root.NulApp));
            }
            else if (e is P_Root.UnApp)
            {
                genUnApp((e as P_Root.UnApp));
            }
            else if (e is P_Root.BinApp)
            {
                genBinApp((e as P_Root.BinApp));
            }
            else if (e is P_Root.Field)
            {
                genFieldExpr((e as P_Root.Field));
            }
            else if (e is P_Root.Default)
            {
                genDefaultExpr((e as P_Root.Default));
            }
            else if (e is P_Root.Cast)
            {
                genCastExpr((e as P_Root.Cast));
            }
            else if (e is P_Root.Tuple)
            {
                genTupleExpr((e as P_Root.Tuple));
            }
            else if (e is P_Root.NamedTuple)
            {
                genNamedTupleExpr((e as P_Root.NamedTuple));
            }
            return;
        }

        private void genNewStmt(P_Root.NewStmt s)
        {
            genNew();
            genID(s.name as P_Root.String);
            
            if (s.arg.Symbol.ToString() != "NIL")
            {
                genExpr(s.arg as P_Root.Expr);
            }
            else
            {
                genNil();
            }
            
        }

        private void genRaiseStmt(P_Root.Raise s)
        {
            genRaise();
            
            genExpr(s.ev as P_Root.Expr);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                
                genExpr(s.arg as P_Root.Expr);
            }
            else
            {
                genNil();
            }
            
            
        }

        private void genSendStmt(P_Root.Send s)
        {
            genQualifier(s.qual as P_Root.Qualifier);
            genSend();
            
            genExpr(s.dest as P_Root.Expr);
            
            genExpr(s.ev as P_Root.Expr);
            
            if (s.arg.Symbol.ToString() != "NIL")
            {
                genExpr(s.arg as P_Root.Expr);
            }
            else
            {
                genNil();
            }
            return;
        }

        private void genMonitorStmt(P_Root.Monitor s)
        {
            genMonitor();
            
            genExpr(s.ev as P_Root.Expr);
            
            if (s.arg.Symbol.ToString() != "NIL")
            {
                genExpr(s.arg as P_Root.Expr);
            }
            else
            {
                genNil();
            }
            
            
        }

        //aout to be taken care of.
        private void genFunStmt(P_Root.FunStmt s)
        {
            genFunStmt();
            genID(s.name as P_Root.String);
            if (s.args.Symbol.ToString() != "NIL")
            {
                genExprs(s.args as P_Root.Exprs);
            }
            return;
        }
        private abstract void genFunStmt(StringBuilder );
        private abstract void genFunApp(StringBuilder );

        private void genNulStmt(P_Root.NulStmt s)
        {
            if (s.op.Symbol.ToString() == "POP")
                genPop();
            else if (s.op.Symbol.ToString() == "SKIP")
                genSkip();
        }

        private void genBinStmtOp(P_Root.BinStmt s)
        {
            if (s.op.Symbol.ToString() == "REMOVE")
            {
                genRemove();
            }
            else if (s.op.Symbol.ToString() == "ASSIGN")
            {
                genAssign();
            }
            else if (s.op.Symbol.ToString() == "INSERT")
            {
                genInsert();
            }
        }
        private abstract void genBinStmt(P_Root.BinStmt s);
        private void genReturnStmt(P_Root.Return s)
        {
            genReturn();
            if (s.expr.Symbol.ToString() != "NIL")
            {
                
                genExpr(s.expr as P_Root.Expr);
                
            }
            else
            {
                genNil();
            }
        }

        private void genWhileStmt(P_Root.While s)
        {
            genWhile();
            
            
            genExpr(s.cond as P_Root.Expr);
            
            
            genStmt(s.body as P_Root.Stmt);
            
            return;
        }

        private void genIteStmt(P_Root.Ite s)
        {
            genIf();
            
            
            genExpr(s.cond as P_Root.Expr);
            
            
            genStmt(s.@true as P_Root.Stmt);
            if (s.@false.Symbol.ToString() != "SKIP")
            {
                genElse();
                genStmt(s.@false as P_Root.Stmt);
            }
            else
            {
                genSkip();
            }
            
        }

        private void genSeqStmt(P_Root.Seq s)
        {
            
            
            var x = s;
            do
            {
                genStmt(x.s1 as P_Root.Stmt);
                
                x = (x.s2 as P_Root.Seq);
            }
            while (x.s2.Symbol.ToString() != "SKIP");
            
            
        }

        private abstract void genEndSeqStmt(StringBuilder );
        private abstract void genSepSeqStmt(StringBuilder );
        private abstract void genBeginSeqStmt(StringBuilder );

        private void genCases(P_Root.Cases s)
        {
            genCase();
            .Append(getString(s.trig));
            genAnonFunDecl(s.action as P_Root.AnonFunDecl);
            if (s.cases.Symbol.ToString() != "NIL")
            {
                genCases(s.cases as P_Root.Cases);
            }
            else
            {
                genNil();
            }
        }

        private void genReceiveStmt(P_Root.Receive s)
        {
            genReceive();
            genBeginBlock();
            genCases(s.cases as P_Root.Cases);
            genEndBlock();
        }

        private abstract void genEndBlock(StringBuilder );
        private abstract void genBeginBlock(StringBuilder );
        private void genAssertStmt(P_Root.Assert s)
        {
            genAssert();
            
            genExpr(s.arg as P_Root.Expr);
            
            if (s.msg.Symbol.ToString() != "NIL")
            {
                genSepExpr();
                .Append(getString(s.msg));
            }
            else
            {
                genNil();
            }
        }

        private void genPrintStmt(P_Root.Print s)
        {
            genPrint();
            
            .Append(getString(s.msg));
        }

        private void genStmt(P_Root.Stmt s)
        {
            if (s is P_Root.NewStmt)
            {
                genNewStmt(s as P_Root.NewStmt);
            }
            else if (s is P_Root.Raise)
            {
                genRaiseStmt(s as P_Root.Raise);
            }
            else if (s is P_Root.Send)
            {
                genSendStmt(s as P_Root.Send);
            }
            else if (s is P_Root.Monitor)
            {
                genMonitorStmt(s as P_Root.Monitor);
            }
            else if (s is P_Root.FunStmt)
            {
                genFunStmt(s as P_Root.FunStmt);
            }
            else if (s is P_Root.NulStmt)
            {
                genNulStmt(s as P_Root.NulStmt);
            }
            else if (s is P_Root.BinStmt)
            {
                genBinStmt(s as P_Root.BinStmt);
            }
            else if (s is P_Root.Return)
            {
                genReturnStmt(s as P_Root.Return);
            }
            else if (s is P_Root.While)
            {
                genWhileStmt(s as P_Root.While);
            }
            else if (s is P_Root.Ite)
            {
                genIteStmt(s as P_Root.Ite);
            }
            else if (s is P_Root.Seq)
            {
                genSeqStmt(s as P_Root.Seq);
            }
            else if (s is P_Root.Receive)
            {
                genReceiveStmt(s as P_Root.Receive);
            }
            else if (s is P_Root.Assert)
            {
                genAssertStmt(s as P_Root.Assert);
            }
            else if (s is P_Root.Print)
            {
                genPrintStmt(s as P_Root.Print);
            }
            return;
        }

        private void genQueueConstraint(P_Root.QueueConstraint c)
        {
            if (c is P_Root.AssertMaxInstances)
            {
                var x = c as P_Root.AssertMaxInstances;
                genAssert();
                .Append(getValue(x.bound));
            }
            else if (c is P_Root.AssumeMaxInstances)
            {
                var x = c as P_Root.AssumeMaxInstances;
                genAssume();
                .Append(getValue(x.bound));
            }
            else //Is Nil.
            {
                genNil();
            }
        }

        private void genEventDecl(P_Root.EventDecl d)
        {
            genEvent();
            .Append(getString(d.name));
            if (d.type.Symbol.ToString() != "NIL") //Not NIL
            {
                genTypeExpr(d.type as P_Root.TypeExpr);
            }
            else
            {
                genNil();
            }
            return;
        }

        private void genMachineDecl(P_Root.MachineDecl d)
        {
            if (d.isMain.Symbol.ToString() == "TRUE")
                genMain();
            if (d.kind.Symbol.ToString() == "MODEL")
                genModel();
            else if (d.kind.Symbol.ToString() == "MONITOR")
            {
                genMonitors();
                return;
            }
            else if (d.kind.Symbol.ToString() == "REAL")
                genMachine();
            genID(d.name as P_Root.String);
            genBeginBlock();
            return;
        }

        private void genObservesDecl(P_Root.ObservesDecl d)
        {
            genMachineDecl(d.monitor as P_Root.MachineDecl);
            genMonitors();
            genID(d.ev as P_Root.String);
            genBeginBlock();
            return;
        }

        private void genVarDecl(P_Root.VarDecl d)
        {
            genVarDecl();
            genID(d.name as P_Root.String);
            genTypeExpr(d.type as P_Root.TypeExpr);
        }

        private void genQualifiedName(P_Root.QualifiedName n)
        {
            if (n.qualifier.Symbol.ToString() != "NIL")
            {
                genQualifiedName(n.qualifier as P_Root.QualifiedName);
                genSepQName();
            }
            genID(n.name as P_Root.String);
        }

        prot abstract void genSepQName(StringBuilder );

        private void genStateDecl(P_Root.StateDecl state)
        {
            if (state.temperature.Symbol.ToString() == "HOT")
            {
                genHot();
            }
            else if (state.temperature.Symbol.ToString() == "COLD")
            {
                genCold();
            }
            genState();
            genQualifiedName(state.name as P_Root.QualifiedName);
            genEntryBlock();
            genAnonFunDecl(state.entryAction as P_Root.AnonFunDecl);
            genExitBlock();
            genAnonFunDecl(state.exitFun as P_Root.AnonFunDecl);
        }

        private void genFuncDecl(P_Root.FunDecl d)
        {
            //Function is static.
            if (d.owner.Symbol.ToString() == "NIL")
            {
                genStatic();
            }

            if (d.kind.Symbol.ToString() == "MODEL")
            {
                genModel();
            }
            genID(d.name as P_Root.String);
            if (d.@params.Symbol.ToString() != "NIL")
            {
                genNmdTupType(d.@params as P_Root.NmdTupType);
            }
            if (d.@return.Symbol.ToString() != "NIL")
            {
                genTypeExpr(d.@return as P_Root.TypeExpr);
            }
            else
            {
                genNil();
            }
            genBeginBlock();
            if (d.locals.Symbol.ToString() != "NIL")
            {
                genVarDecl();
                //Need to regen?
                genNmdTupType(d.locals as P_Root.NmdTupType);
            }
            genStmt(d.body as P_Root.Stmt);
            genEndBlock();
            return;
        }

        private void genAnonFunDecl(P_Root.AnonFunDecl d)
        {
            /*if (d.envVars.Symbol.ToString() != "NIL")
            {
                genNmdTupType(d.envVars as P_Root.NmdTupType);
            }*/
            //DEBUG
            Console.WriteLine("\n\n");
            genBeginBlock();
            if (d.locals.Symbol.ToString() != "NIL")
            {
                genVarDecl();
                genNmdTupType(d.locals as P_Root.NmdTupType);
            }
            genStmt(d.body as P_Root.Stmt);
            genEndBlock();
            return;
        }

        private void genTrig(ICSharpTerm t)
        {
            if (t.Symbol.ToString() == "NULL")
            {
                genNull();
            }
            else if (t.Symbol.ToString() == "HALT")
            {
                genHalt();
            }
            else
            {
                genID(t as P_Root.String);
            }
        }

        private void genTransDecl(P_Root.TransDecl t)
        {
            genTrig(t.trig);
            if (t.action.Symbol.ToString() == "PUSH")
            {
                genPush();
                genQualifiedName(t.dst as P_Root.QualifiedName);
                return;
            }
            else if (t.action is P_Root.AnonFunDecl)
            {
                genGoto();
                genQualifiedName(t.dst as P_Root.QualifiedName);
                genAnonFunDecl(t.action as P_Root.AnonFunDecl);
            }
            else
            {
                genGoto();
                genQualifiedName(t.dst as P_Root.QualifiedName);
                genID(t.action as P_Root.String);
            }
            return;
        }

        private void genDoDecl(P_Root.DoDecl d)
        {
            if (d.action.Symbol.ToString() == "DEFER")
            {
                genDefer();
                genTrig(d.trig);
            }
            else if (d.action.Symbol.ToString() == "IGNORE")
            {
                genIgnore();
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
                genID(d.action as P_Root.String);
            }
            return;
        }
        private void genAnnotatable(P_Root.Annotatable a)
        {
            if (a is P_Root.EventDecl)
            {
                genEventDecl(a as P_Root.EventDecl);
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
            else if (a.Symbol.ToString() == "NIL")
            {
                genNil();
            }
        }

        private void genAnnotation(P_Root.Annotation a)
        {
            genAnnotatable(a.ant as P_Root.Annotatable);
            //ToDo Assertion Generation Logic.
        }

        public void genExprs()
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
                //Start generating code for machines.
                foreach (var machine in program.Machines)
                {

                }

                foreach (var observer in program.Observes)
                {

                }
                //Bind the variablefunction and state declarations to the relevant machine
                //and the transitions to the relevant state.
                foreach (var variable in program.Variables)
                {

                }
                */
                foreach (var state in program.States)
                {
                    StringBuilder  = new StringBuilder();
                    genStateDecl(state);
                    Console.WriteLine();
                }

                foreach (var function in program.Functions)
                {
                    StringBuilder  = new StringBuilder();
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