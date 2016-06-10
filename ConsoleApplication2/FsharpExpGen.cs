using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.Formula.API.Generators;
using Microsoft.Formula.API;

namespace Microsoft.P2Boogie
{
    sealed class FSharpExpGen : PVisitor
    {
        private Compiler compiler;


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

    }
}