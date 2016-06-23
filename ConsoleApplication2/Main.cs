using Microsoft.Pc;
using System;
using System.Collections.Generic;
using System.IO;
using Microsoft.P2Boogie;

namespace Microsoft.P_FS_Boogie
{
    class Program
    {
        public static void Main(string[] args)
        {
            CommandLineOptions options = new CommandLineOptions();
            FSharpExpGen fsExpGen = new FSharpExpGen(options);
            string line = null;
            using (var sr = new StreamReader(args[0]))
            {
                Syntax.ProgramDecl prog = null;
                while ((line = sr.ReadLine()) != null)
                {
                    Console.WriteLine("*****************************************************************************");
                    Console.WriteLine(line);
                    Console.WriteLine("*****************************************************************************");
                    using (var sw = new StreamWriter(line))
                    {
                        prog = fsExpGen.genFSExpression(line + ".txt");
                        Helper.print_prog(prog, sw);
                    }
                }
            }
        }
    }
}