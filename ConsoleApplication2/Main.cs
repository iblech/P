using Microsoft.Pc;
using System;
using System.IO;
using Microsoft.P2Boogie;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

namespace Microsoft.P_FS_Boogie
{
    class Program
    {
        public static void Main(string[] args)
        {
            CommandLineOptions options = new CommandLineOptions();
            FSharpExpGen fsExpGen = new FSharpExpGen(options);
            string line = null;
            using (var sr = new StreamReader(@"C:\Users\t-suchav\Desktop\Crt.txt"))
            try
            {
                Syntax.ProgramDecl prog = null;
                while ((line = sr.ReadLine()) != null)
                {
                    Console.WriteLine("*****************************************************************************");
                    Console.WriteLine(line);
                    Console.WriteLine("*****************************************************************************");
                    //using (var sw = new StreamWriter(line))
                    {
                        prog = fsExpGen.genFSExpression(line + ".txt");
                        //Helper.print_prog(prog, sw);
                        Save(prog, line + ".dat");
                    }
                }
            }
            catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
            }
        }

        static void Save(Syntax.ProgramDecl prog, string fileName)
        {
            Stream stream = null;
            try
            {
                IFormatter formatter = new BinaryFormatter();
                stream = new FileStream(fileName, FileMode.Create, FileAccess.Write, FileShare.None);
                formatter.Serialize(stream, prog);
            }
            catch
            {
                // do nothing, just ignore any possible errors
            }
            finally
            {
                if (null != stream)
                    stream.Close();
            }
        }
    }
}