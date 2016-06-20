using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.Text;

using Microsoft.Formula.API.Generators;
using System.IO;

namespace Microsoft.P2Boogie
{
    sealed class FSharpExpGen
    {
        private List<PProgram> parsedPrograms { get; set; }
        private Compiler compiler;

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
                //Bind the variable, function and state declarations to the relevant machine, 
                //and the transitions to the relevant state.
                foreach (var variable in program.Variables)
                {

                }
                */
                foreach (var state in program.States)
                {
                    StringBuilder sb = new StringBuilder();
                    genStateDecl(state);
                    Console.WriteLine(sb);
                }

                foreach (var function in program.Functions)
                {
                    StringBuilder sb = new StringBuilder();
                    genFuncDecl(function);
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