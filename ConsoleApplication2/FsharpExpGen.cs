using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.Text;

using Microsoft.Formula.API.Generators;
using System.IO;

namespace Microsoft.P2Boogie
{
    sealed class FSharpExpGen : PVisitor
    {
        private Compiler compiler;

        public FSharpExpGen(CommandLineOptions options)
        {
            options.analyzeOnly = true;
            options.profile = true;
            compiler = new Compiler(options);
        }

        protected override void visitSkip(StringBuilder sb)
        {
            sb.Append("null");
        }
        protected override void visitWhile(StringBuilder sb)
        {
            sb.Append("While");
        }
        protected override void visitIf(StringBuilder sb)
        {
            sb.Append("Ite(");
        }
        protected override void visitElse(StringBuilder sb)
        {

        } 
        protected override void visitReturn(StringBuilder sb)
        {
            sb.Append("Return");
        }
        protected override void visitNew(StringBuilder sb)
        {
            sb.Append("New");
        }
        protected override void visitThis(StringBuilder sb)
        {
            sb.Append("This");
        }
        protected override void visitNull(StringBuilder sb)
        {
            sb.Append("Event.Null");
        }
        protected override void visitPop(StringBuilder sb) { }
        protected override void visitTrue(StringBuilder sb)
        {
            sb.Append("ConstBool.true");
        }
        protected override void visitFalse(StringBuilder sb)
        {
            sb.Append("ConstBool.false");
        }
        protected override void visitSwap(StringBuilder sb) { }
        protected override void visitXfer(StringBuilder sb) { }
        protected override void visitSizeof(StringBuilder sb)
        {
            sb.Append("Sizeof");
        }
        protected override void visitKeys(StringBuilder sb)
        {
            sb.Append("Keys");
        }
        protected override void visitValues(StringBuilder sb)
        {
            sb.Append("Values");
        }
        protected override void visitAssert(StringBuilder sb)
        {
            sb.Append("Assert");
        }
        protected override void visitPrint(StringBuilder sb)
        {
            sb.Append("Print");
        }
        protected override void visitSend(StringBuilder sb)
        {
            sb.Append("Send");
        }
        protected override void visitMonitor(StringBuilder sb)
        {
            sb.Append("Monitor");
        }
        protected override void visitMonitors(StringBuilder sb) { }
        protected override void visitRaise(StringBuilder sb)
        {
            sb.Append("Raise");
        }
        protected override void visitHalt(StringBuilder sb)
        {
            sb.Append("Event.Halt");
        }
        protected override void visitIntType(StringBuilder sb)
        {
            sb.Append("Int");
        }
        protected override void visitBoolType(StringBuilder sb)
        {
            sb.Append("Bool");
        }
        protected override void visitAnyType(StringBuilder sb)
        {
            sb.Append("Any");
        }
        protected override void visitSeqType(StringBuilder sb)
        {
            sb.Append("Seq");
        }
        protected override void visitMapType(StringBuilder sb)
        {
            sb.Append("Map");
        }
        protected override void visitType(StringBuilder sb) { }
        protected override void visitMain(StringBuilder sb) { }
        protected override void visitEvent(StringBuilder sb) { }
        protected override void visitMachine(StringBuilder sb) { }
        protected override void visitAssume(StringBuilder sb)
        {
            sb.Append("Assume");
        }
        protected override void visitDefault(StringBuilder sb)
        {
            sb.Append("Default");
        }

        protected override void visitVarDecl(StringBuilder sb) { }
        protected override void visitStart(StringBuilder sb) { }
        protected override void visitHot(StringBuilder sb) { }
        protected override void visitCold(StringBuilder sb) { }
        protected override void visitModel(StringBuilder sb) { }
        protected override void visitState(StringBuilder sb) { }
        protected override void visitGroup(StringBuilder sb) { }
        protected override void visitStatic(StringBuilder sb) { }
        protected override void visitEntryBlock(StringBuilder sb)
        {
            //DEBUG; REMOVE
           sb.Append("--------ENTRY---------");
        }
        protected override void visitExitBlock(StringBuilder sb)
        {
            //DEBUG; REMOVE
            sb.Append("--------EXIT---------");
        }
        protected override void visitDefer(StringBuilder sb)
        {

        }
        protected override void visitIgnore(StringBuilder sb) { }
        protected override void visitGoto(StringBuilder sb) { }
        protected override void visitPush(StringBuilder sb) { }
        protected override void visitReceive(StringBuilder sb)
        {
            sb.Append("Recieve");
        }
        protected override void visitCase(StringBuilder sb)
        {
            sb.Append("Case");
        }
        protected override void visitIn(StringBuilder sb)
        {
            sb.Append("In");
        }
        protected override void visitComma(StringBuilder sb) { }
        protected override void visitEq(StringBuilder sb)
        {
            sb.Append("Eq");
        }
        protected override void visitAssign(StringBuilder sb)
        {
            sb.Append("Assign");
        }
        protected override void visitInsert(StringBuilder sb)
        {
            sb.Append("Insert");
        }
        protected override void visitRemove(StringBuilder sb)
        {
            sb.Append("Remove");
        }
        protected override void visitNe(StringBuilder sb)
        {
                sb.Append("Ne");
        }
        protected override void visitLe(StringBuilder sb)
        {
                sb.Append("Le");
        }
        protected override void visitGe(StringBuilder sb)
        {
                sb.Append("Ge");
        }
        protected override void visitLt(StringBuilder sb)
        {
                sb.Append("Lt");
        }
        protected override void visitGt(StringBuilder sb)
        {
                sb.Append("Gt");
        }
        protected override void visitAdd(StringBuilder sb)
        {
            sb.Append("Add");
        }
        protected override void visitSub(StringBuilder sb)
        {
            sb.Append("Sub");
        }
        protected override void visitMul(StringBuilder sb)
        {
            sb.Append("Mul");
        }
        protected override void visitIntDiv(StringBuilder sb)
        {
            sb.Append("IntDiv");
        }

        protected override void visitNot(StringBuilder sb)
        {
            sb.Append("Not");
        }
        protected override void visitAnd(StringBuilder sb)
        {
            sb.Append("And");
        }
        protected override void visitOr(StringBuilder sb)
        {
            sb.Append("Or");
        }
        protected override void visitNonDet(StringBuilder sb)
        {
            sb.Append("Nondet");
        }
        protected override void visitFairNonDet(StringBuilder sb)
        {
            sb.Append("FairNonDet");
        }
        protected override void visitBeginBlock(StringBuilder sb) { }
        protected override void visitEndBlock(StringBuilder sb) { }
        protected override void visitLBracket(StringBuilder sb) { }
        protected override void visitRBracket(StringBuilder sb) { }
        protected override void visitLParen(StringBuilder sb)
        {
            sb.Append("(");
        }
        protected override void visitRParen(StringBuilder sb)
        {
            sb.Append(")");
        }
        protected override void visitNmdTupSep(StringBuilder sb)
        {
            sb.Append("; ");
        }
        protected override void visitBeginNmdTupExpr(StringBuilder sb)
        {
            sb.Append("[");
        }
        protected override void visitEndNmdTupExpr(StringBuilder sb)
        {
            sb.Append("]");
        }
        protected override void visitTupSep(StringBuilder sb)
        {
            sb.Append("; ");
        }
        protected override void visitBeginTup(StringBuilder sb)
        {
            sb.Append("[");
        }
        protected override void visitEndTup(StringBuilder sb)
        {
            sb.Append("]");
        }
        protected override void visitFieldOp(StringBuilder sb) { }
        protected override void visitEndSeq(StringBuilder sb) { }
        protected override void visitBeginSeq(StringBuilder sb) { }
        protected override void visitEndMap(StringBuilder sb) { }
        protected override void visitMapSepTypes(StringBuilder sb) { }
        protected override void visitbeginMap(StringBuilder sb) { }
        protected override void visitIndexing(StringBuilder sb) { }

        protected override void visitCastOp(StringBuilder sb)
        {
            sb.Append("Cast");
        }

        protected override void visitExprSep(StringBuilder sb)
        {
            sb.Append(", ");
        }

        protected override void visitNmdExprSep(StringBuilder sb)
        {
            sb.Append(", ");
        }
        protected override void visitFunAppClose(StringBuilder sb) { }
        protected override void visitFunAppOpen(StringBuilder sb) { }
        protected override void visitSepStmt(StringBuilder sb)
        {
            sb.Append(", ");
        }
        protected override void visitNil(StringBuilder sb) { }

        protected override void visitConstInt(StringBuilder sb)
        {
            sb.Append("ConstInt");
        }

        protected override void visitFunApp(StringBuilder sb)
        {
            sb.Append(", ");
        }

        protected override void visitID(P_Root.String @string, StringBuilder sb)
        {
            string s = @string.Symbol.ToString();
            sb.Append(s);
        }

        protected override void visitName(P_Root.Name e, StringBuilder sb)
        {
            sb.Append("Var");
            visitLParen(sb);
            sb.Append('"');
            visitID(e.name as P_Root.String, sb);
            sb.Append('"');
            visitRParen(sb);
        }

        protected override void visitFieldExpr(P_Root.Field e, StringBuilder sb)
        {
            sb.Append("Dot");
            visitLParen(sb);
            visitExpr(e.arg as P_Root.Expr, sb);
            sb.Append(", ");
            sb.Append(getValue(e.name));
            visitRParen(sb);
        }

        protected override void visitBinApp(P_Root.BinApp e, StringBuilder sb)
        {
            //Everything is Prefix.
            sb.Append("BinOp.");
            visitBinOp(e.op, sb);
            sb.Append("(");
            visitExpr(e.arg1 as P_Root.Expr, sb);
            sb.Append(", ");
            visitExpr(e.arg2 as P_Root.Expr, sb);
            sb.Append(")");
        }

        protected override void visitUnApp(P_Root.UnApp e, StringBuilder sb)
        {
            sb.Append("UnOp.");
            visitUnOp(e.op, sb);
            sb.Append("(");
            visitExpr(e.arg1 as P_Root.Expr, sb);
            sb.Append(")");
        }

        protected override void visitExpr(P_Root.Expr e, StringBuilder sb)
        {
            sb.Append("Expr.");
            base.visitExpr(e, sb);
        }

        private void visitLVal(P_Root.Expr e, StringBuilder sb)
        {
            sb.Append("LVal.");
            if (e is P_Root.Name)
            {
                var x = e as P_Root.Name;
                visitName(x, sb);
            }
            else if (e is P_Root.Field)
            {
                var x = e as P_Root.Field;
                sb.Append("Dot(");
                visitLVal(x.arg as P_Root.Expr, sb);
                sb.Append(", ");
                if (x.name is P_Root.RealCnst)
                {
                    sb.Append(getValue(x.name));
                }
                else
                {
                    sb.Append(getString(x.name));
                }
                sb.Append(")");
            }
            else if (e is P_Root.BinApp && e.Symbol.ToString() == "IDX")
            {
                var x = e as P_Root.BinApp;
                sb.Append("Index(");
                visitLVal(x.arg1 as P_Root.Expr, sb);
                sb.Append(", ");
                visitExpr(x.arg2 as P_Root.Expr, sb);
                sb.Append(")");
            }
            else
            {
                throw new InvalidOperationException("Expression is not an LValue!");
            }
        }

        protected override void visitBinStmt(P_Root.BinStmt s, StringBuilder sb)
        {
            switch (s.op.Symbol.ToString())
            {
                case "REMOVE":
                    visitRemove(sb);
                    sb.Append("(");
                    visitLVal(s.arg1 as P_Root.Expr, sb);
                    sb.Append(", ");
                    visitExpr(s.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "ASSIGN":
                    visitAssign(sb);
                    sb.Append("(");
                    visitLVal(s.arg1 as P_Root.Expr, sb);
                    sb.Append(", ");
                    visitExpr(s.arg2 as P_Root.Expr, sb);
                    sb.Append(")");
                    break;
                case "INSERT":
                    visitInsert(sb);
                    sb.Append("(");
                    visitLVal(s.arg1 as P_Root.Expr, sb);
                    sb.Append(", ");
                    if (s.arg2 is P_Root.Tuple)
                    {
                        var x = (s.arg2 as P_Root.Tuple).body as P_Root.Exprs;
                        visitExpr(x.head as P_Root.Expr, sb);
                        sb.Append(", ");
                        x = x.tail as P_Root.Exprs;
                        visitExpr(x.head as P_Root.Expr, sb);
                        if (x.tail.Symbol.ToString() != "NIL")
                        {
                            throw new InvalidOperationException("Insert must have a <k,v> tuple of length 2 as second argument");
                        }
                    }
                    else
                    {
                        throw new InvalidOperationException("Insert must have a <k,v> tuple as second argument");
                    }
                    sb.Append(")");
                    break;
                default:
                    break;
            }
        }

        protected override void visitSeqStmt(P_Root.Seq s, StringBuilder sb)
        {
            sb.Append("Seq");
            visitLParen(sb);
            base.visitSeqStmt(s, sb);
            visitRParen(sb);
        }

        protected override void visitStmt(P_Root.Stmt s, StringBuilder sb)
        {
            sb.Append("Stmt.");
            base.visitStmt(s, sb);
            //Ugly?
            if (s is P_Root.Ite || s is P_Root.While) //Maybe more?
            {
                sb.Append(")");
            }
            sb.Append('\n');
        }

        private bool ReadFile(string inputFileName)
        {
            List<Formula.API.Flag> flags;
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

        public void genFSExp(string inputFileName, TextWriter writer)
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

        public void gentext(TextWriter writer)
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
                //Bind the variable, function and state declarations to the relevant machine, 
                //and the transitions to the relevant state.
                foreach (var variable in program.Variables)
                {

                }
                */
                foreach (var state in program.States)
                {
                    StringBuilder sb = new StringBuilder();
                    visitStateDecl(state, sb);
                    Console.WriteLine(sb);
                }

                foreach (var function in program.Functions)
                {
                    StringBuilder sb = new StringBuilder();
                    visitFuncDecl(function, sb);
                    Console.WriteLine(sb);
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