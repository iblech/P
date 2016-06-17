using Microsoft.Pc;
using System;
using System.IO;


namespace Microsoft.P2Boogie
{
    class P2Boogie
    {
        public static int Main(string[] args)

        {
            string inputFileName = null;
            CommandLineOptions options = new CommandLineOptions();
            if (args.Length == 0)
            {
                goto error;
            }

            for (int i = 0; i < args.Length; i++)
            {
                string arg = args[i];
                string colonArg = null;
                if (arg.StartsWith("/"))
                {
                    var colonIndex = arg.IndexOf(':');
                    if (colonIndex >= 0)
                    {
                        arg = args[i].Substring(0, colonIndex);
                        colonArg = args[i].Substring(colonIndex + 1);
                    }

                    switch (arg)
                    {
                        case "/profile":
                            if (colonArg != null)
                                goto error;
                            options.profile = true;
                            break;

                        case "/outputDir":
                            if (colonArg == null)
                            {
                                Console.WriteLine("Must supply path for output directory");
                                goto error;
                            }
                            if (!Directory.Exists(colonArg))
                            {
                                Console.WriteLine("Output directory {0} does not exist", colonArg);
                                goto error;
                            }
                            options.outputDir = colonArg;
                            break;

                        case "/outputFileName":
                            if (colonArg == null)
                            {
                                Console.WriteLine("Must supply name for output files");
                                goto error;
                            }
                            options.outputFileName = colonArg;
                            break;

                        case "/doNotErase":
                            if (colonArg != null)
                                goto error;
                            options.erase = false;
                            break;

                        case "/noSourceInfo":
                            if (colonArg != null)
                                goto error;
                            options.noSourceInfo = true;
                            break;
                        default:
                            goto error;
                    }
                }
                else
                {
                    if (inputFileName == null)
                    {
                        inputFileName = arg;
                    }
                    else
                    {
                        goto error;
                    }
                }
            }
            if (inputFileName.Length > 2 && inputFileName.EndsWith(".p"))
            {
                var fsExpGen = new FSharpExpGen(options);
                if (options.outputFileName != null)
                {
                    using (StreamWriter writer = new StreamWriter(options.outputFileName))
                    {
                        fsExpGen.genFSExp(inputFileName, writer);
                    }
                }
                else
                {
                    fsExpGen.genFSExp(inputFileName, Console.Out);
                }
                return 0;
            }
            else
            {
                Console.WriteLine("Illegal input file name");
            }
        error:
            {
                Console.WriteLine("USAGE: ConsoleApplication2.exe file.p [options]");
                Console.WriteLine("/outputDir:path");
                Console.WriteLine("/outputFileName:name");
                Console.WriteLine("/profile");
                Console.WriteLine("/noSourceInfo");
                return 0;
            }
        }
    }
}
