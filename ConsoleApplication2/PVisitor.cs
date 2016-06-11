using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.Formula.API.Generators;

namespace Microsoft.P2Boogie
{
    abstract class PVisitor
    {
        //ToDo VisitNatural() VisitInteger()s
        protected List<PProgram> parsedPrograms { get; set; }

        private static string getString(ICSharpTerm x)
        {
            return (x as P_Root.StringCnst).Value;
        }

        private static void visitSkip(StringBuilder sb)
        {
            return;
        }

        private static void visitWhile(StringBuilder sb)
        {
            return;
        }
        private static void visitIf(StringBuilder sb)
        {
            return;
        }
        private static void visitElse(StringBuilder sb)
        {
            return;
        }
        private static void visitReturn(StringBuilder sb)
        {
            return;
        }
        private static void visitNew(StringBuilder sb)
        {
            return;
        }
        private static void visitThis(StringBuilder sb)
        {
            return;
        }
        private static void visitNull(StringBuilder sb)
        {
            return;
        }
        private static void visitPop(StringBuilder sb)
        {
            return;
        }
        private static void visitTrue(StringBuilder sb)
        {
            return;
        }
        private static void visitFalse(StringBuilder sb)
        {
            return;
        }
        private static void visitSwap(StringBuilder sb)
        {
            return;
        }
        private static void visitXfer(StringBuilder sb)
        {
            return;
        }
        private static void visitSizeof(StringBuilder sb)
        {
            return;
        }
        private static void visitKeys(StringBuilder sb)
        {
            return;
        }
        private static void visitValues(StringBuilder sb)
        {
            return;
        }
        private static void visitAssert(StringBuilder sb)
        {
            return;
        }
        private static void visitPrint(StringBuilder sb)
        {
            return;
        }
        private static void visitSend(StringBuilder sb)
        {
            return;
        }
        private static void visitMonitor(StringBuilder sb)
        {
            return;
        }
        /*private static void visitSpec(StringBuilder sb)
        {
            return;
        }*/
        private static void visitMonitors(StringBuilder sb)
        {
            return;
        }
        private static void visitRaise(StringBuilder sb)
        {
            return;
        }
        private static void visitHalt(StringBuilder sb)
        {
            return;
        }
        private static void visitIntType(StringBuilder sb)
        {
            return;
        }
        private static void visitBoolType(StringBuilder sb)
        {
            return;
        }
        private static void visitAnyType(StringBuilder sb)
        {
            return;
        }
        private static void visitSeqType(StringBuilder sb)
        {
            return;
        }
        private static void visitMapType(StringBuilder sb)
        {
            return;
        }
        private static void visitType(StringBuilder sb)
        {
            return;
        }
        private static void visitMain(StringBuilder sb)
        {
            return;
        }
        private static void visitEvent(StringBuilder sb)
        {
            return;
        }
        private static void visitMachine(StringBuilder sb)
        {
            return;
        }
        private static void visitAssume(StringBuilder sb)
        {
            return;
        }
        private static void visitDefault(StringBuilder sb)
        {
            return;
        }
        private static void visitVarDecl(StringBuilder sb)
        {
            return;
        }
        private static void visitStart(StringBuilder sb)
        {
            return;
        }
        private static void visitHot(StringBuilder sb)
        {
            return;
        }
        private static void visitCold(StringBuilder sb)
        {
            return;
        }
        private static void visitModel(StringBuilder sb)
        {
            return;
        }
        private static void visitState(StringBuilder sb)
        {
            return;
        }
        private static void visitGroup(StringBuilder sb)
        {
            return;
        }
        private static void visitStatic(StringBuilder sb)
        {
            return;
        }
        private static void visitEntryBlock(StringBuilder sb)
        {
            return;
        }
        private static void visitExitBlock(StringBuilder sb)
        {
            return;
        }
        private static void visitDefer(StringBuilder sb)
        {
            return;
        }
        private static void visitIgnore(StringBuilder sb)
        {
            return;
        }
        private static void visitGoto(StringBuilder sb)
        {
            return;
        }
        private static void visitPush(StringBuilder sb)
        {
            return;
        }
        private static void visitReceive(StringBuilder sb)
        {
            return;
        }
        private static void visitCase(StringBuilder sb)
        {
            return;
        }
        private static void visitIn(StringBuilder sb)
        {
            return;
        }

        private static void visitComma(StringBuilder sb)
        {
            return;
        }
        
        private static void visitEq(StringBuilder sb)
        {
            return;
        }
        private static void visitAssign(StringBuilder sb)
        {
            return;
        }
        private static void visitInsert(StringBuilder sb)
        {
            return;
        }
        private static void visitRemove(StringBuilder sb)
        {
            return;
        }
        private static void visitNe(StringBuilder sb)
        {
            return;
        }
        private static void visitLe(StringBuilder sb)
        {
            return;
        }
        private static void visitGe(StringBuilder sb)
        {
            return;
        }
        private static void visitLt(StringBuilder sb)
        {
            return;
        }
        private static void visitGt(StringBuilder sb)
        {
            return;
        }
        private static void visitAdd(StringBuilder sb)
        {
            return;
        }
        private static void visitSub(StringBuilder sb)
        {
            return;
        }
        private static void visitMul(StringBuilder sb)
        {
            return;
        }
        private static void visitIntDiv(StringBuilder sb)
        {
            return;
        }
        private static void visitNot(StringBuilder sb)
        {
            return;
        }
        private static void visitAnd(StringBuilder sb)
        {
            return;
        }
        private static void visitOr(StringBuilder sb)
        {
            return;
        }
        private static void visitNonDet(StringBuilder sb)
        {
            return;
        }
        private static void visitFairNonDet(StringBuilder sb)
        {
            return;
        }
        private static void visitBeginBlock(StringBuilder sb)
        {
            return;
        }
        private static void visitEndBlock(StringBuilder sb)
        {
            return;
        }
        private static void visitLBracket(StringBuilder sb)
        {
            return;
        }
        private static void visitRBracket(StringBuilder sb)
        {
            return;
        }
        private static void visitLParen(StringBuilder sb)
        {
            return;
        }
        private static void visitRParen(StringBuilder sb)
        {
            return;
        }

        private static void visitBaseType(P_Root.BaseType t, StringBuilder sb)
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

        private static void visitTupType(P_Root.TupType t, StringBuilder sb)
        {
            var x = t;
            visitLParen(sb);
            while (x.tl.Symbol.ToString() != "NIL")
            {
                visitTypeExpr(x.hd as P_Root.TypeExpr, sb);
                visitComma(sb);
                x = x.tl as P_Root.TupType;
            }
            visitTypeExpr(x.hd as P_Root.TypeExpr, sb);
            visitRParen(sb);
        }

        private static void visitNmdTupTypeField(P_Root.NmdTupTypeField f, StringBuilder sb)
        {
            visitQualifier(f.qual as P_Root.Qualifier, sb);
            //TODO visit name
            visitTypeExpr(f.type as P_Root.TypeExpr, sb);
        }

        private static void visitNmdTupType(P_Root.NmdTupType t, StringBuilder sb)
        {
            var x = t;
            visitLParen(sb);
            while (x.tl.Symbol.ToString() != "NIL")
            {
                visitNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
                visitComma(sb);
                x = x.tl as P_Root.NmdTupType;
            }
            visitNmdTupTypeField(x.hd as P_Root.NmdTupTypeField, sb);
            visitRParen(sb);
        }

        private static void visitQualifier(P_Root.Qualifier q, StringBuilder sb)
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

        private static void visitSeqType(P_Root.SeqType t, StringBuilder sb)
        {
            visitSeqType(sb);
            visitLBracket(sb);
            visitTypeExpr(t.x as P_Root.TypeExpr, sb);
            visitRBracket(sb);
        }

        private static void visitMapType(P_Root.MapType t, StringBuilder sb)
        {
            visitMapType(sb);
            visitLBracket(sb);
            visitTypeExpr(t.k as P_Root.TypeExpr, sb);
            visitComma(sb);
            visitTypeExpr(t.v as P_Root.TypeExpr, sb);
            visitRBracket(sb);
        }

        private static void visitNameType(P_Root.NameType t, StringBuilder sb)
        {
            return;
        }

        private static void visitTypeExpr(P_Root.TypeExpr t, StringBuilder sb)
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

        private static void visitTypeDef(P_Root.TypeDef typeDef, StringBuilder sb)
        {
            visitType(sb);
            //ToDo name
            visitAssign(sb);
            if (typeDef.type.Symbol.ToString() != "NIL")
            {
                visitTypeExpr(typeDef.type as P_Root.TypeExpr, sb);
            }

        }

        private static void visitName(P_Root.Name e, StringBuilder sb)
        {
            //ToDo name
            return;
        }

        private static void visitNewExpr(P_Root.New e, StringBuilder sb)
        {
            visitNew(sb);
            //ToDo name.
            visitLParen(sb);
            if (e.arg.Symbol.ToString() != "NIL")
            {
                visitExpr(e.arg as P_Root.Expr, sb);
            }
            visitRParen(sb);
        }

        private static void visitFunApp(P_Root.FunApp e, StringBuilder sb)
        {
            //ToDo Name
            visitLParen(sb);
            if (e.args.Symbol.ToString() != "NIL")
            {
                visitExpr(e.args as P_Root.Expr, sb);
            }
            visitRParen(sb);
            return;
        }

        private static void visitNulApp(P_Root.NulApp e, StringBuilder sb)
        {
            if (e.op is P_Root.Integer)
            {
                //ToDo Integer.
                return;
            }
            switch (e.op.Symbol.ToString() as String)
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


        private static void visitUnApp(P_Root.UnApp e, StringBuilder sb)
        {
            switch (e.op.Symbol.ToString() as String)
            {
                case "NOT":
                    visitNot(sb);
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    break;
                case "NEG":
                    visitNot(sb);
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    break;
                case "KEYS":
                    visitKeys(sb);
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    break;
                case "VALUES":
                    visitValues(sb);
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    break;
                case "SIZEOF":
                    visitSizeof(sb);
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    break;
            }
            return;
        }

        private static void visitBinApp(P_Root.BinApp e, StringBuilder sb)
        {
            switch (e.op.Symbol.ToString())
            {
                case "ADD":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitAdd(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "SUB":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitSub(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "MUL":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitMul(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "INTDIV":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitIntDiv(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "AND":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitAnd(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "OR":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitOr(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "EQ":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitEq(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "NEQ":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitNe(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "LT":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitLt(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "LE":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitLe(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "GT":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitGt(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "GE":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitGe(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
                case "IDX": //A non-infix operator.
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitLBracket(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    visitRBracket(sb);
                    break;
                case "IN":
                    visitExpr(e.arg1 as P_Root.Expr, sb);
                    visitIn(sb);
                    visitExpr(e.arg2 as P_Root.Expr, sb);
                    break;
            }
            return;
        }

        private static void visitFieldExpr(P_Root.Field e, StringBuilder sb)
        {
            visitExpr(e.arg as P_Root.Expr, sb);
            //ToDo Name.
            if (e.name is P_Root.Integer)
            {

            }
            else if (e.name is P_Root.Natural)
            {

            }
        }

        private static void visitDefaultExpr(P_Root.Default e, StringBuilder sb)
        {
            visitDefault(sb);
            visitLParen(sb);
            visitTypeExpr(e.type as P_Root.TypeExpr, sb);
            visitRParen(sb);
            return;
        }

        private static void visitCastExpr(P_Root.Cast e, StringBuilder sb)
        {
            visitExpr(e.arg as P_Root.Expr, sb);
            visitTypeExpr(e.type as P_Root.TypeExpr, sb);
            return;
        }

        private static int visitExprs(P_Root.Exprs e, StringBuilder sb)
        {
            var x = e;
            int i = 0;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                visitQualifier(x.qual as P_Root.Qualifier, sb);
                visitExpr(x.head as P_Root.Expr, sb);
                visitComma(sb);
                x = x.tail as P_Root.Exprs;
                i++;
            }
            visitQualifier(x.qual as P_Root.Qualifier, sb);
            visitExpr(x.head as P_Root.Expr, sb);
            if (x.head.Symbol.ToString() != "NIL")
                i++;
            return i;
        }

        private static void visitNamedExprs(P_Root.NamedExprs e, StringBuilder sb)
        {
            var x = e;
            while (x.tail.Symbol.ToString() != "NIL")
            {
                //ToDo name
                visitAssign(sb);
                visitExpr(x.exp as P_Root.Expr, sb);
                visitComma(sb);
                x = x.tail as P_Root.NamedExprs;
            }
            //ToDo field name
            visitAssign(sb);
            visitExpr(x.exp as P_Root.Expr, sb);
        }

        private static void visitTupleExpr(P_Root.Tuple e, StringBuilder sb)
        {
            //(Ugly?) Tuple generation logic. We need to put a comma at the end iff we have a singleton tuple
            //like (1,). We thus return the # of terms from visitExprs().
            visitLParen(sb);
            if (visitExprs(e.body as P_Root.Exprs, sb) == 1)
                visitComma(sb);
            visitRParen(sb);

        }

        private static void visitNamedTupleExpr(P_Root.NamedTuple e, StringBuilder sb)
        {
            visitLParen(sb);
            visitNamedExprs(e.body as P_Root.NamedExprs, sb);
            visitRParen(sb);
        }

        private static void visitExpr(P_Root.Expr e, StringBuilder sb)
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

        private static void visitNewStmt(P_Root.NewStmt s, StringBuilder sb)
        {
            visitNew(sb);
            //ToDo name
            visitLParen(sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitExpr(s.arg as P_Root.Expr, sb);
            }
            visitRParen(sb);
        }

        private static void visitRaiseStmt(P_Root.Raise s, StringBuilder sb)
        {
            visitRaise(sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitExpr(s.arg as P_Root.Expr, sb);
            }
            visitExpr(s.arg as P_Root.Expr, sb);
        }

        private static void visitSendStmt(P_Root.Send s, StringBuilder sb)
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

        private static void visitMonitorStmt(P_Root.Monitor s, StringBuilder sb)
        {
            visitMonitor(sb);
            visitExpr(s.ev as P_Root.Expr, sb);
            if (s.arg.Symbol.ToString() != "NIL")
            {
                visitComma(sb);
                visitExpr(s.arg as P_Root.Expr, sb);
            }
        }

        private static void visitFunStmt(P_Root.FunStmt s, StringBuilder sb)
        {
            //ToDo name.
            visitLParen(sb);
            if (s.args.Symbol.ToString() != "NIL")
            {
                visitExprs(s.args as P_Root.Exprs, sb);
            }
            visitRParen(sb);
            //ToDo aout.
            return;
        }

        private static void visitNulStmt(P_Root.NulStmt s, StringBuilder sb)
        {
            if (s.op.Symbol.ToString() == "POP")
                visitPop(sb);
            else if (s.op.Symbol.ToString() == "SKIP")
                visitSkip(sb);
        }

        private static void visitBinStmt(P_Root.BinStmt s, StringBuilder sb)
        {
            visitExpr(s.arg1 as P_Root.Expr, sb);

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

            visitExpr(s.arg2 as P_Root.Expr, sb);
        }

        private static void visitReturnStmt(P_Root.Return s, StringBuilder sb)
        {
            visitReturn(sb);
            if (s.expr.Symbol.ToString() != "NIL")
            {
                visitExpr(s.expr as P_Root.Expr, sb);
            }
        }

        private static void visitWhileStmt(P_Root.While s, StringBuilder sb)
        {
            visitWhile(sb);
            visitLParen(sb);
            visitBeginBlock(sb);
            visitExpr(s.cond as P_Root.Expr, sb);
            visitRParen(sb);
            visitEndBlock(sb);
            visitStmt(s.body as P_Root.Stmt, sb);
            return;
        }

        private static void visitIteStmt(P_Root.Ite s, StringBuilder sb)
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

        private static void visitSeqStmt(P_Root.Seq s, StringBuilder sb)
        {
            visitStmt(s.s1 as P_Root.Stmt, sb);
            visitStmt(s.s2 as P_Root.Stmt, sb);
        }

        //Come back and review.
        private static void visitCases(P_Root.Cases s, StringBuilder sb)
        {
            visitCase(sb);
            //ToDo name
            visitAnonFunDecl(s.action as P_Root.AnonFunDecl, sb);
            if (s.cases.Symbol.ToString() != "NIL")
            {
                visitCases(s.cases as P_Root.Cases, sb);
            }
        }

        private static void visitReceiveStmt(P_Root.Receive s, StringBuilder sb)
        {
            visitReceive(sb);
            visitBeginBlock(sb);
            visitCases(s.cases as P_Root.Cases, sb);
            visitEndBlock(sb);
        }

        private static void visitAssertStmt(P_Root.Assert s, StringBuilder sb)
        {
            visitAssert(sb);
            visitLParen(sb);
            visitExpr(s.arg as P_Root.Expr, sb);
            visitRParen(sb);
            if (s.msg.Symbol.ToString() != "NIL")
            {
                visitComma(sb);
                //ToDo name.
            }
        }

        private static void visitPrintStmt(P_Root.Print s, StringBuilder sb)
        {
            visitPrint(sb);
            //ToDo name.
        }

        private static void visitStmt(P_Root.Stmt s, StringBuilder sb)
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

        private static void visitQueueConstraint(P_Root.QueueConstraint c, StringBuilder sb)
        {
            if (c is P_Root.AssertMaxInstances)
            {
                visitAssert(sb);
                //ToDo Natural
            }
            else if (c is P_Root.AssumeMaxInstances)
            {
                visitAssume(sb);
                //ToDo Natural
            }
            //Note: Can also be NIL. Do nothing then.
        }

        private static void visitEventDecl(P_Root.EventDecl d, StringBuilder sb)
        {
            visitEvent(sb);
            //ToDo Name
            if (d.type.Symbol.ToString() != "NIL") //Not NIL
            {
                visitTypeExpr(d.type as P_Root.TypeExpr, sb);
            }
            return;
        }

        private static void visitMachineDecl(P_Root.MachineDecl d, StringBuilder sb)
        {
            if (d.isMain.Symbol.ToString() == "TRUE")
                visitMain(sb);
            if (d.kind.Symbol.ToString() == "MODEL")
                visitModel(sb);
            else if (d.kind.Symbol.ToString() == "MONITOR")
            {
                visitMonitors(sb);
                //ToDo name.
                return;
            }
            else if (d.kind.Symbol.ToString() == "REAL")
                visitMachine(sb);
            //ToDo name.
            visitBeginBlock(sb);
            return;
        }

        private static void visitObservesDecl(P_Root.ObservesDecl d, StringBuilder sb)
        {
            visitMachineDecl(d.monitor as P_Root.MachineDecl, sb);
            visitMonitors(sb);
            //ToDo name
            visitBeginBlock(sb);
            return;
        }

        private static void visitVarDecl(P_Root.VarDecl d, StringBuilder sb)
        {
            visitVarDecl(sb);
            //ToDo name.
            visitTypeExpr(d.type as P_Root.TypeExpr, sb);
        }

        private static void visitQualifiedName(P_Root.QualifiedName n, StringBuilder sb)
        {
            //ToDO name
            if (n.qualifier.Symbol.ToString() != "NIL")
                visitQualifiedName(n.qualifier as P_Root.QualifiedName, sb);
        }

        private static void visitStateDecl(P_Root.StateDecl state, StringBuilder sb)
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

        private static void visitFuncDecl(P_Root.FunDecl d, StringBuilder sb)
        {
            //Function is static.
            if (d.owner.Symbol.ToString() != "NIL")
            {
                visitStatic(sb);
            }

            if (d.kind.Symbol.ToString() == "MODEL")
            {
                visitModel(sb);
            }
            //ToDo name
            if (d.@params.Symbol.ToString() != "NIL")
            {
                visitNmdTupType(d.@params as P_Root.NmdTupType, sb);
            }
            //sb.Append(") 7z "); //" 7z " is for a possible annotation.
            if (d.@return.Symbol.ToString() != "NIL")
            {
                visitTypeExpr(d.@return as P_Root.TypeExpr, sb);
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

        private static void visitAnonFunDecl(P_Root.AnonFunDecl d, StringBuilder sb)
        {
            if (d.envVars.Symbol.ToString() != "NIL")
            {
                visitNmdTupType(d.envVars as P_Root.NmdTupType, sb);
            }
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

        private static void visitTrig(ICSharpTerm t, StringBuilder sb)
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
                //ToDo name.
            }
        }

        private static void visitTransDecl(P_Root.TransDecl t, StringBuilder sb)
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
                //ToDo name.
            }
            return;
        }

        private static void visitDoDecl(P_Root.DoDecl d, StringBuilder sb)
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
                //ToDo name.
            }
            return;
        }
    }
}

/***************************************TODO*****************************************
 *                                                                                  *
 *      Fix AnonFunctions and Annotations. The former do not seem to appear freely  *
 *      in the program; the latter do not have SEMANTIC significance.               *
 *                                                                                  *
 ************************************************************************************/