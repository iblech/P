using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.Text;

using Microsoft.Formula.API.Generators;

namespace Microsoft.P2Boogie
{
    abstract class PVisitor
    {
        protected List<PProgram> parsedPrograms { get; set; }

        protected static string getString(ICSharpTerm x)
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

        protected static string getValue(ICSharpTerm x)
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

        protected abstract void visitSkip(StringBuilder sb);
        protected abstract void visitWhile(StringBuilder sb);
        protected abstract void visitIf(StringBuilder sb);
        protected abstract void visitElse(StringBuilder sb);
        protected abstract void visitReturn(StringBuilder sb);
        protected abstract void visitNew(StringBuilder sb);
        protected abstract void visitThis(StringBuilder sb);
        protected abstract void visitNull(StringBuilder sb);
        protected abstract void visitPop(StringBuilder sb);
        protected abstract void visitTrue(StringBuilder sb);
        protected abstract void visitFalse(StringBuilder sb);
        protected abstract void visitSwap(StringBuilder sb);
        protected abstract void visitXfer(StringBuilder sb);
        protected abstract void visitSizeof(StringBuilder sb);
        protected abstract void visitKeys(StringBuilder sb);
        protected abstract void visitValues(StringBuilder sb);
        protected abstract void visitAssert(StringBuilder sb);
        protected abstract void visitPrint(StringBuilder sb);
        protected abstract void visitSend(StringBuilder sb);
        protected abstract void visitMonitor(StringBuilder sb);
        protected abstract void visitMonitors(StringBuilder sb);
        protected abstract void visitRaise(StringBuilder sb);
        protected abstract void visitHalt(StringBuilder sb);
        protected abstract void visitIntType(StringBuilder sb);
        protected abstract void visitBoolType(StringBuilder sb);
        protected abstract void visitAnyType(StringBuilder sb);
        protected abstract void visitSeqType(StringBuilder sb);
        protected abstract void visitMapType(StringBuilder sb);
        protected abstract void visitType(StringBuilder sb);
        protected abstract void visitMain(StringBuilder sb);
        protected abstract void visitEvent(StringBuilder sb);
        protected abstract void visitMachine(StringBuilder sb);
        protected abstract void visitAssume(StringBuilder sb);
        protected abstract void visitDefault(StringBuilder sb);
        protected abstract void visitVarDecl(StringBuilder sb);
        protected abstract void visitStart(StringBuilder sb);
        protected abstract void visitHot(StringBuilder sb);
        protected abstract void visitCold(StringBuilder sb);
        protected abstract void visitModel(StringBuilder sb);
        protected abstract void visitState(StringBuilder sb);
        protected abstract void visitGroup(StringBuilder sb);
        protected abstract void visitStatic(StringBuilder sb);
        protected abstract void visitEntryBlock(StringBuilder sb);
        protected abstract void visitExitBlock(StringBuilder sb);
        protected abstract void visitDefer(StringBuilder sb);
        protected abstract void visitIgnore(StringBuilder sb);
        protected abstract void visitGoto(StringBuilder sb);
        protected abstract void visitPush(StringBuilder sb);
        protected abstract void visitReceive(StringBuilder sb);
        protected abstract void visitCase(StringBuilder sb);
        protected abstract void visitIn(StringBuilder sb);
        protected abstract void visitComma(StringBuilder sb);
        protected abstract void visitEq(StringBuilder sb);
        protected abstract void visitAssign(StringBuilder sb);
        protected abstract void visitInsert(StringBuilder sb);
        protected abstract void visitRemove(StringBuilder sb);
        protected abstract void visitNe(StringBuilder sb);
        protected abstract void visitLe(StringBuilder sb);
        protected abstract void visitGe(StringBuilder sb);
        protected abstract void visitLt(StringBuilder sb);
        protected abstract void visitGt(StringBuilder sb);
        protected abstract void visitAdd(StringBuilder sb);
        protected abstract void visitSub(StringBuilder sb);
        protected abstract void visitMul(StringBuilder sb);
        protected abstract void visitIntDiv(StringBuilder sb);
        protected abstract void visitNot(StringBuilder sb);
        protected abstract void visitAnd(StringBuilder sb);
        protected abstract void visitOr(StringBuilder sb);
        protected abstract void visitNonDet(StringBuilder sb);
        protected abstract void visitFairNonDet(StringBuilder sb);
        protected abstract void visitBeginBlock(StringBuilder sb);
        protected abstract void visitEndBlock(StringBuilder sb);
        protected abstract void visitLBracket(StringBuilder sb);
        protected abstract void visitRBracket(StringBuilder sb);
        protected abstract void visitLParen(StringBuilder sb);
        protected abstract void visitRParen(StringBuilder sb);
        protected abstract void visitNmdTupSep(StringBuilder sb);
        protected abstract void visitBeginNmdTupExpr(StringBuilder sb);
        protected abstract void visitEndNmdTupExpr(StringBuilder sb);
        protected abstract void visitEndTup(StringBuilder sb);
        protected abstract void visitBeginTup(StringBuilder sb);
        protected abstract void visitFieldOp(StringBuilder sb);
        protected abstract void visitEndSeq(StringBuilder sb);
        protected abstract void visitBeginSeq(StringBuilder sb);
        protected abstract void visitEndMap(StringBuilder sb);
        protected abstract void visitMapSepTypes(StringBuilder sb);
        protected abstract void visitbeginMap(StringBuilder sb);
        protected abstract void visitIndexing(StringBuilder sb);
        protected abstract void visitCastOp(StringBuilder sb);
        protected abstract void visitExprSep(StringBuilder sb);
        protected abstract void visitNmdExprSep(StringBuilder sb);
        protected abstract void visitFunAppClose(StringBuilder sb);
        protected abstract void visitFunAppOpen(StringBuilder sb);
        protected abstract void visitSepStmt(StringBuilder sb);
        protected abstract void visitNil(StringBuilder sb);
        protected abstract void visitTupSep(StringBuilder sb);
        protected abstract void visitConstInt(StringBuilder sb);

        protected abstract void visitID(P_Root.String @string, StringBuilder sb);
        protected abstract void visitUnApp(P_Root.UnApp e, StringBuilder sb);
        protected abstract void visitBinApp(P_Root.BinApp e, StringBuilder sb);

        protected virtual void visitBaseType(P_Root.BaseType t, StringBuilder sb)
        {
            if (t._0.Symbol.ToString() == "INT")
            {
                visitIntType(sb);
            }
            else if (t._0.Symbol.ToString() == "BOOL")
            {
                visitBoolType(sb);
            }
            else if (t._0.Symbol.ToString() == "REAL")
            {
                visitMachine(sb);
            }
            else if (t._0.Symbol.ToString() == "ANY")
            {
                visitAnyType(sb);
            }
            else if (t._0.Symbol.ToString() == "EVENT")
            {
                visitEvent(sb);
            }
            else if (t._0.Symbol.ToString() == "NULL")
            {
                visitNull(sb);
            }
        }

        protected virtual void visitTupType(P_Root.TupType t, StringBuilder sb)
        {
            var x = t;
            visitBeginTup(sb);
            while (x.tl.Symbol.ToString() != "NIL")
            {
                visitTypeExpr(x.hd as P_Root.TypeExpr, sb);
                visitTupSep(sb);
                x = x.tl as P_Root.TupType;
            }
            visitTypeExpr(x.hd as P_Root.TypeExpr, sb);
            visitEndTup(sb);
        }

        protected virtual void visitNmdTupTypeField(P_Root.NmdTupTypeField f, StringBuilder sb)
        {
            visitQualifier(f.qual as P_Root.Qualifier, sb);
            visitID(f.name as P_Root.String, sb);
            visitTypeExpr(f.type as P_Root.TypeExpr, sb);
        }

        protected virtual void visitNmdTupType(P_Root.NmdTupType t, StringBuilder sb)
        {
            var x = t;
            while (x.tl.Symbol.ToString() != "NIL")
            {
                visitNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                visitNmdTupSep(sb);
                x = x.tl as P_Root.NmdTupType;
            }
            visitNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
        }

        protected virtual void visitQualifier(P_Root.Qualifier q, StringBuilder sb)
        {
            if (q.Symbol.ToString() == "SWAP")
            {
                visitSwap(sb);
            }
            else if (q.Symbol.ToString() == "XFER")
            {
                visitXfer(sb);
            }
            return;
        }

        protected virtual void visitSeqType(P_Root.SeqType t, StringBuilder sb)
        {
            visitSeqType(sb);
            visitBeginSeq(sb);
            visitTypeExpr(t.x as P_Root.TypeExpr, sb);
            visitEndSeq(sb);
        }

        protected virtual void visitMapType(P_Root.MapType t, StringBuilder sb)
        {
            visitMapType(sb);
            visitbeginMap(sb);
            visitTypeExpr(t.k as P_Root.TypeExpr, sb);
            visitMapSepTypes(sb);
            visitTypeExpr(t.v as P_Root.TypeExpr, sb);
            visitEndMap(sb);
        }
        
        protected virtual void visitNameType(P_Root.NameType t, StringBuilder sb)
        {
            sb.Append(getString(t.name));
            return;
        }

        protected virtual void visitTypeExpr(P_Root.TypeExpr t, StringBuilder sb)
        {
            //t: any TypeExpr. This means we can check its derived type as we wish.
            if (t is P_Root.NameType)
            {
                visitNameType(t as P_Root.NameType, sb);
            }
            else if (t is P_Root.BaseType)
            {
                visitBaseType(t as P_Root.BaseType, sb);
            }
            else if (t is P_Root.SeqType)
            {
                visitSeqType(t as P_Root.SeqType, sb);
            }
            else if (t is P_Root.TupType)
            {
                visitTupType(t as P_Root.TupType, sb);
            }
            else if (t is P_Root.NmdTupType)
            {
                visitNmdTupType(t as P_Root.NmdTupType, sb);
            }
            else if (t is P_Root.MapType)
            {
                visitMapType(t as P_Root.MapType, sb);
            }
        }

        protected virtual void visitTypeDef(P_Root.TypeDef typeDef, StringBuilder sb)
        {
            visitType(sb);
            sb.Append(getString(typeDef.name));
            visitAssign(sb);
            if (typeDef.type.Symbol.ToString() != "NIL")
            {
                visitTypeExpr(typeDef.type as P_Root.TypeExpr, sb);
            }

        }

        protected virtual void visitName(P_Root.Name e, StringBuilder sb)
        {
            sb.Append(getString(e.name));
            return;
        }

        protected virtual void visitNewExpr(P_Root.New e, StringBuilder sb)
        {
            visitNew(sb);
            sb.Append(getString(e.name));
            visitLParen(sb);
            if (e.arg.Symbol.ToString() != "NIL")
            {
                visitExpr(e.arg as P_Root.Expr, sb);
            }
            visitRParen(sb);
        }

        protected virtual void visitFunApp(P_Root.FunApp e, StringBuilder sb)
        {
            visitID(e.name as P_Root.String, sb);
            visitLParen(sb);
            if (e.args.Symbol.ToString() != "NIL")
            {
                visitExpr(e.args as P_Root.Expr, sb);
            }
            visitRParen(sb);
            return;
        }

        protected virtual void visitNulApp(P_Root.NulApp e, StringBuilder sb)
        {
            if (e.op is P_Root.Integer)
            {
                var x = e.op as P_Root.Integer;
                visitConstInt(sb);
                visitLParen(sb);
                sb.Append(getValue(x));
                visitRParen(sb);
                return;
            }
            switch (e.op.Symbol.ToString())
            {
                case "TRUE":
                    visitTrue(sb);
                    break;
                case "FALSE":
                    visitFalse(sb);
                    break;
                case "THIS":
                    visitThis(sb);
                    break;
                case "NONDET":
                    visitNonDet(sb);
                    break;
                case "FAIRNONDET":
                    visitFairNonDet(sb);
                    break;
                case "NULL":
                    visitNull(sb);
                    break;
                case "HALT":
                    visitHalt(sb);
                    break;
                default:
                    Console.WriteLine("Error!");
                    break;
            }
        }


        protected virtual void visitUnOp(P_Root.IArgType_UnApp__0 op, StringBuilder sb)
        {
            switch(op.Symbol.ToString())
            {
                case "NOT":
                    visitNot(sb);
                    break;
                case "NEG":
                    visitNot(sb);
                    break;
                case "KEYS":
                    visitKeys(sb);
                    break;
                case "VALUES":
                    visitValues(sb);
                    break;
                case "SIZEOF":
                    visitSizeof(sb);
                    break;
            }
            return;
        }

        //To prevent issues with infix, prefix and postfix expressions.

        protected virtual void visitBinOp(P_Root.IArgType_BinApp__0 op, StringBuilder sb)
        {
            switch (op.Symbol.ToString())
            {
                case "ADD":
                    visitAdd(sb);
                    break;
                case "SUB":
                    visitSub(sb);
                    break;
                case "MUL":
                    visitMul(sb);
                    break;
                case "INTDIV":
                    visitIntDiv(sb);
                    break;
                case "AND":
                    visitAnd(sb);
                    break;
                case "OR":
                    visitOr(sb);
                    break;
                case "EQ":
                    visitEq(sb);
                    break;
                case "NEQ":
                    visitNe(sb);
                    break;
                case "LT":
                    visitLt(sb);
                    break;
                case "LE":
                    visitLe(sb);
                    break;
                case "GT":
                    visitGt(sb);
                    break;
                case "GE":
                    visitGe(sb);
                    break;
                case "IDX": //A non-infix operator.
                    visitIndexing(sb);
                    break;
                case "IN":
                    visitIn(sb);
                    break;
            }
            return;
        }

        protected virtual void visitFieldExpr(P_Root.Field e, StringBuilder sb)
        {
            visitExpr(e.arg as P_Root.Expr, sb);
            visitFieldOp(sb);
            sb.Append(getValue(e.name));
        }

        protected virtual void visitDefaultExpr(P_Root.Default e, StringBuilder sb)
        {
            visitDefault(sb);
            visitLParen(sb);
            visitTypeExpr(e.type as P_Root.TypeExpr, sb);
            visitRParen(sb);
            return;
        }

        protected virtual void visitCastExpr(P_Root.Cast e, StringBuilder sb)
        {
            visitExpr(e.arg as P_Root.Expr, sb);
            visitCastOp(sb);
            visitTypeExpr(e.type as P_Root.TypeExpr, sb);
            return;
        }

        protected virtual int visitExprs(P_Root.Exprs e, StringBuilder sb)
        {
            var x = e;
            int i = 0;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                visitQualifier(x.qual as P_Root.Qualifier, sb);
                visitExpr(x.head as P_Root.Expr, sb);
                visitExprSep(sb);
                x = x.tail as P_Root.Exprs;
                i++;
            }
            visitQualifier(x.qual as P_Root.Qualifier, sb);
            visitExpr(x.head as P_Root.Expr, sb);
            if (x.head.Symbol.ToString() != "NIL")
                i++;
            return i;
        }

        protected virtual void visitNamedExprs(P_Root.NamedExprs e, StringBuilder sb)
        {
            var x = e;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                sb.Append(getString(x.field));
                visitAssign(sb);
                visitExpr(x.exp as P_Root.Expr, sb);
                visitNmdExprSep(sb);
                x = x.tail as P_Root.NamedExprs;
            }
            sb.Append(getString(x.field));
            visitAssign(sb);
            visitExpr(x.exp as P_Root.Expr, sb);
        }

        protected virtual void visitTupleExpr(P_Root.Tuple e, StringBuilder sb)
        {
            //(Ugly?) Tuple generation logic. We need to put a comma at the end iff we have a singleton tuple
            //like (1,). We thus return the # of terms from visitExprs().
            visitBeginTup(sb);
            if (visitExprs(e.body as P_Root.Exprs, sb) == 1)
                visitTupSep(sb);
            visitEndTup(sb);
        }

        protected virtual void visitNamedTupleExpr(P_Root.NamedTuple e, StringBuilder sb)
        {
            visitBeginNmdTupExpr(sb);
            visitNamedExprs(e.body as P_Root.NamedExprs, sb);
            visitEndNmdTupExpr(sb);
        }

        protected virtual void visitExpr(P_Root.Expr e, StringBuilder sb)
        {
            if (e is P_Root.Name)
            {
                visitName((e as P_Root.Name), sb);
            }
            else if (e is P_Root.New)
            {
                visitNewExpr((e as P_Root.New), sb);
            }
            else if (e is P_Root.FunApp)
            {
                visitFunApp((e as P_Root.FunApp), sb);
            }
            else if (e is P_Root.NulApp)
            {
                visitNulApp((e as P_Root.NulApp), sb);
            }
            else if (e is P_Root.UnApp)
            {
                visitUnApp((e as P_Root.UnApp), sb);
            }
            else if (e is P_Root.BinApp)
            {
                visitBinApp((e as P_Root.BinApp), sb);
            }
            else if (e is P_Root.Field)
            {
                visitFieldExpr((e as P_Root.Field), sb);
            }
            else if (e is P_Root.Default)
            {
                visitDefaultExpr((e as P_Root.Default), sb);
            }
            else if (e is P_Root.Cast)
            {
                visitCastExpr((e as P_Root.Cast), sb);
            }
            else if (e is P_Root.Tuple)
            {
                visitTupleExpr((e as P_Root.Tuple), sb);
            }
            else if (e is P_Root.NamedTuple)
            {
                visitNamedTupleExpr((e as P_Root.NamedTuple), sb);
            }
            return;
        }

        protected virtual void visitNewStmt(P_Root.NewStmt s, StringBuilder sb)
        {
            visitNew(sb);
            sb.Append(getString(s.name));
            visitLParen(sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitExpr(s.arg as P_Root.Expr, sb);
            }
            visitRParen(sb);
        }

        protected virtual void visitRaiseStmt(P_Root.Raise s, StringBuilder sb)
        {
            visitRaise(sb);
            visitExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitComma(sb);
                visitExpr(s.arg as P_Root.Expr, sb);
            }
        }

        protected virtual void visitSendStmt(P_Root.Send s, StringBuilder sb)
        {
            visitQualifier(s.qual as P_Root.Qualifier, sb);
            visitSend(sb);
            visitExpr(s.dest as P_Root.Expr, sb);
            visitComma(sb);
            visitExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitComma(sb);
                visitExpr(s.arg as P_Root.Expr, sb);
            }
            return;
        }

        protected virtual void visitMonitorStmt(P_Root.Monitor s, StringBuilder sb)
        {
            visitMonitor(sb);
            visitExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitComma(sb);
                visitExpr(s.arg as P_Root.Expr, sb);
            }
        }

        protected virtual void visitFunStmt(P_Root.FunStmt s, StringBuilder sb)
        {
            visitFunApp(sb);
            sb.Append(getString(s.name));
            visitFunAppOpen(sb);
            if (s.args.Symbol.ToString() != "NIL")
            {
                visitExprs(s.args as P_Root.Exprs, sb);
            }
            visitFunAppClose(sb);
            //aout to be taken care of.
            return;
        }

        protected abstract void visitFunApp(StringBuilder sb);

        protected virtual void visitNulStmt(P_Root.NulStmt s, StringBuilder sb)
        {
            if (s.op.Symbol.ToString() == "POP")
                visitPop(sb);
            else if (s.op.Symbol.ToString() == "SKIP")
                visitSkip(sb);
        }
        
        protected virtual void visitBinStmt(P_Root.BinStmt s, StringBuilder sb)
        { 
            if (s.op.Symbol.ToString() == "REMOVE")
            {
                visitRemove(sb);
            }
            else if (s.op.Symbol.ToString() == "ASSIGN")
            {
                visitAssign(sb);
            }
            else if (s.op.Symbol.ToString() == "INSERT")
            {
                visitInsert(sb);
            }
            visitExpr(s.arg1 as P_Root.Expr, sb);
            visitExpr(s.arg2 as P_Root.Expr, sb);
        }

        protected virtual void visitReturnStmt(P_Root.Return s, StringBuilder sb)
        {
            visitReturn(sb);
            if (s.expr.Symbol.ToString() != "NIL")
            {
                visitExpr(s.expr as P_Root.Expr, sb);
            }
            else
            {
                visitNil(sb);
            }
        }

        protected virtual void visitWhileStmt(P_Root.While s, StringBuilder sb)
        {
            visitWhile(sb);
            visitLParen(sb);
            visitExpr(s.cond as P_Root.Expr, sb);
            visitRParen(sb);
            visitBeginBlock(sb);
            visitStmt(s.body as P_Root.Stmt, sb);
            visitEndBlock(sb);
            return;
        }

        protected virtual void visitIteStmt(P_Root.Ite s, StringBuilder sb)
        {
            visitIf(sb);
            visitLParen(sb);
            visitExpr(s.cond as P_Root.Expr, sb);
            visitRParen(sb);
            visitBeginBlock(sb);
            visitStmt(s.@true as P_Root.Stmt, sb);
            visitEndBlock(sb);
            if (s.@false != null)
            {
                visitElse(sb);
                visitBeginBlock(sb);
                visitStmt(s.@false as P_Root.Stmt, sb);
                visitEndBlock(sb);
            }
        }

        protected virtual void visitSeqStmt(P_Root.Seq s, StringBuilder sb)
        {
            visitStmt(s.s1 as P_Root.Stmt, sb);
            visitSepStmt(sb);
            visitStmt(s.s2 as P_Root.Stmt, sb);
        }

        protected virtual void visitCases(P_Root.Cases s, StringBuilder sb)
        {
            visitCase(sb);
            sb.Append(getString(s.trig));
            visitAnonFunDecl(s.action as P_Root.AnonFunDecl, sb);
            if (s.cases.Symbol.ToString() != "NIL")
            {
                visitCases(s.cases as P_Root.Cases, sb);
            }
            else
            {
                visitNil(sb);
            }
        }

        protected virtual void visitReceiveStmt(P_Root.Receive s, StringBuilder sb)
        {
            visitReceive(sb);
            visitBeginBlock(sb);
            visitCases(s.cases as P_Root.Cases, sb);
            visitEndBlock(sb);
        }

        protected virtual void visitAssertStmt(P_Root.Assert s, StringBuilder sb)
        {
            visitAssert(sb);
            visitLParen(sb);
            visitExpr(s.arg as P_Root.Expr, sb);
            visitRParen(sb);
            if (s.msg.Symbol.ToString() != "NIL")
            {
                visitComma(sb);
                sb.Append(getString(s.msg));
            }
            else
            {
                visitNil(sb);
            }
        }

        protected virtual void visitPrintStmt(P_Root.Print s, StringBuilder sb)
        {
            visitPrint(sb);
            sb.Append(getString(s.msg));
        }

        protected virtual void visitStmt(P_Root.Stmt s, StringBuilder sb)
        {
            if (s is P_Root.NewStmt)
            {
                visitNewStmt(s as P_Root.NewStmt, sb);
            }
            else if (s is P_Root.Raise)
            {
                visitRaiseStmt(s as P_Root.Raise, sb);
            }
            else if (s is P_Root.Send)
            {
                visitSendStmt(s as P_Root.Send, sb);
            }
            else if (s is P_Root.Monitor)
            {
                visitMonitorStmt(s as P_Root.Monitor, sb);
            }
            else if (s is P_Root.FunStmt)
            {
                visitFunStmt(s as P_Root.FunStmt, sb);
            }
            else if (s is P_Root.NulStmt)
            {
                visitNulStmt(s as P_Root.NulStmt, sb);
            }
            else if (s is P_Root.BinStmt)
            {
                visitBinStmt(s as P_Root.BinStmt, sb);
            }
            else if (s is P_Root.Return)
            {
                visitReturnStmt(s as P_Root.Return, sb);
            }
            else if (s is P_Root.While)
            {
                visitWhileStmt(s as P_Root.While, sb);
            }
            else if (s is P_Root.Ite)
            {
                visitIteStmt(s as P_Root.Ite, sb);
            }
            else if (s is P_Root.Seq)
            {
                visitSeqStmt(s as P_Root.Seq, sb);
            }
            else if (s is P_Root.Receive)
            {
                visitReceiveStmt(s as P_Root.Receive, sb);
            }
            else if (s is P_Root.Assert)
            {
                visitAssertStmt(s as P_Root.Assert, sb);
            }
            else if (s is P_Root.Print)
            {
                visitPrintStmt(s as P_Root.Print, sb);
            }
            return;
        }

        protected virtual void visitQueueConstraint(P_Root.QueueConstraint c, StringBuilder sb)
        {
            if (c is P_Root.AssertMaxInstances)
            {
                var x = c as P_Root.AssertMaxInstances;
                visitAssert(sb);
                sb.Append(getValue(x.bound));
            }
            else if (c is P_Root.AssumeMaxInstances)
            {
                var x = c as P_Root.AssumeMaxInstances;
                visitAssume(sb);
                sb.Append(getValue(x.bound));
            }
            else //Is Nil.
            {
                visitNil(sb);
            }
        }

        protected virtual void visitEventDecl(P_Root.EventDecl d, StringBuilder sb)
        {
            visitEvent(sb);
            sb.Append(getString(d.name));
            if (d.type.Symbol.ToString() != "NIL") //Not NIL
            {
                visitTypeExpr(d.type as P_Root.TypeExpr, sb);
            }
            else
            {
                visitNil(sb);
            }
            return;
        }

        protected virtual void visitMachineDecl(P_Root.MachineDecl d, StringBuilder sb)
        {
            if (d.isMain.Symbol.ToString() == "TRUE")
                visitMain(sb);
            if (d.kind.Symbol.ToString() == "MODEL")
                visitModel(sb);
            else if (d.kind.Symbol.ToString() == "MONITOR")
            {
                visitMonitors(sb);
                return;
            }
            else if (d.kind.Symbol.ToString() == "REAL")
                visitMachine(sb);
            visitID(d.name as P_Root.String, sb);
            visitBeginBlock(sb);
            return;
        }

        protected virtual void visitObservesDecl(P_Root.ObservesDecl d, StringBuilder sb)
        {
            visitMachineDecl(d.monitor as P_Root.MachineDecl, sb);
            visitMonitors(sb);
            visitID(d.ev as P_Root.String, sb);
            visitBeginBlock(sb);
            return;
        }

        protected virtual void visitVarDecl(P_Root.VarDecl d, StringBuilder sb)
        {
            visitVarDecl(sb);
            visitID(d.name as P_Root.String, sb);
            visitTypeExpr(d.type as P_Root.TypeExpr, sb);
        }

        protected virtual void visitQualifiedName(P_Root.QualifiedName n, StringBuilder sb)
        {
            if (n.qualifier.Symbol.ToString() != "NIL")
            {
                visitQualifiedName(n.qualifier as P_Root.QualifiedName, sb);
                visitSepQName(sb);
            }
            visitID(n.name as P_Root.String, sb);
        }

        internal abstract void visitSepQName(StringBuilder sb);

        protected virtual void visitStateDecl(P_Root.StateDecl state, StringBuilder sb)
        {
            if (state.temperature.Symbol.ToString() == "HOT")
            {
                visitHot(sb);
            }
            else if (state.temperature.Symbol.ToString() == "COLD")
            {
                visitCold(sb);
            }
            visitState(sb);
            visitQualifiedName(state.name as P_Root.QualifiedName, sb);
            visitBeginBlock(sb);
            visitEntryBlock(sb);
            visitAnonFunDecl(state.entryAction as P_Root.AnonFunDecl, sb);
            visitExitBlock(sb);
            visitAnonFunDecl(state.exitFun as P_Root.AnonFunDecl, sb);
        }

        protected virtual void visitFuncDecl(P_Root.FunDecl d, StringBuilder sb)
        {
            //Function is static.
            if (d.owner.Symbol.ToString() == "NIL")
            {
                visitStatic(sb);
            }

            if (d.kind.Symbol.ToString() == "MODEL")
            {
                visitModel(sb);
            }
            visitID(d.name as P_Root.String, sb);
            if (d.@params.Symbol.ToString() != "NIL")
            {
                visitNmdTupType(d.@params as P_Root.NmdTupType, sb);
            }
            if (d.@return.Symbol.ToString() != "NIL")
            {
                visitTypeExpr(d.@return as P_Root.TypeExpr, sb);
            }
            else
            {
                visitNil(sb);
            }
            visitBeginBlock(sb);
            if (d.locals.Symbol.ToString() != "NIL")
            {
                visitVarDecl(sb);
                //Need to revisit?
                visitNmdTupType(d.locals as P_Root.NmdTupType, sb);
            }
            visitStmt(d.body as P_Root.Stmt, sb);
            visitEndBlock(sb);
            return;
        }

        protected virtual void visitAnonFunDecl(P_Root.AnonFunDecl d, StringBuilder sb)
        {
            /*if (d.envVars.Symbol.ToString() != "NIL")
            {
                visitNmdTupType(d.envVars as P_Root.NmdTupType, sb);
            }*/
            //DEBUG
            Console.WriteLine("\n\n");
            visitBeginBlock(sb);
            if (d.locals.Symbol.ToString() != "NIL")
            {
                visitVarDecl(sb);
                visitNmdTupType(d.locals as P_Root.NmdTupType, sb);
            }
            visitStmt(d.body as P_Root.Stmt, sb);
            visitEndBlock(sb);
            return;
        }

        protected virtual void visitTrig(ICSharpTerm t, StringBuilder sb)
        {
            if (t.Symbol.ToString() == "NULL")
            {
                visitNull(sb);
            }
            else if (t.Symbol.ToString() == "HALT")
            {
                visitHalt(sb);
            }
            else
            {
                visitID(t as P_Root.String, sb);
            }
        }

        protected virtual void visitTransDecl(P_Root.TransDecl t, StringBuilder sb)
        {
            visitTrig(t.trig, sb);
            if (t.action.Symbol.ToString() == "PUSH")
            {
                visitPush(sb);
                visitQualifiedName(t.dst as P_Root.QualifiedName, sb);
                return;
            }
            else if (t.action is P_Root.AnonFunDecl)
            {
                visitGoto(sb);
                visitQualifiedName(t.dst as P_Root.QualifiedName, sb);
                visitAnonFunDecl(t.action as P_Root.AnonFunDecl, sb);
            }
            else
            {
                visitGoto(sb);
                visitQualifiedName(t.dst as P_Root.QualifiedName, sb);
                visitID(t.action as P_Root.String, sb);
            }
            return;
        }

        protected virtual void visitDoDecl(P_Root.DoDecl d, StringBuilder sb)
        {
            if (d.action.Symbol.ToString() == "DEFER")
            {
                visitDefer(sb);
                visitTrig(d.trig, sb);
            }
            else if (d.action.Symbol.ToString() == "IGNORE")
            {
                visitIgnore(sb);
                visitTrig(d.trig, sb);
            }
            else if (d.action is P_Root.AnonFunDecl)
            {
                visitTrig(d.trig, sb);
                visitAnonFunDecl(d.action as P_Root.AnonFunDecl, sb);
            }
            else
            {
                visitTrig(d.trig, sb);
                visitID(d.action as P_Root.String, sb);
            }
            return;
        }
        protected void visitAnnotatable(P_Root.Annotatable a, StringBuilder sb)
        {
            if (a is P_Root.EventDecl)
            {
                visitEventDecl(a as P_Root.EventDecl, sb);
            }
            else if (a is P_Root.MachineDecl)
            {
                visitMachineDecl(a as P_Root.MachineDecl, sb);
            }
            else if (a is P_Root.VarDecl)
            {
                visitVarDecl(a as P_Root.VarDecl, sb);
            }
            else if (a is P_Root.FunDecl)
            {
                visitFuncDecl(a as P_Root.FunDecl, sb);
            }
            else if (a is P_Root.StateDecl)
            {
                visitStateDecl(a as P_Root.StateDecl, sb);
            }
            else if (a is P_Root.TransDecl)
            {
                visitTransDecl(a as P_Root.TransDecl, sb);
            }
            else if (a is P_Root.DoDecl)
            {
                visitDoDecl(a as P_Root.DoDecl, sb);
            }
            else if (a.Symbol.ToString() == "NIL")
            {
                visitNil(sb);
            }
        }

        protected void visitAnnotation(P_Root.Annotation a, StringBuilder sb)
        {
            visitAnnotatable(a.ant as P_Root.Annotatable, sb);
            //ToDo Assertion Generation Logic.
        }
    }
}