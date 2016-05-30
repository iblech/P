using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Microsoft.Pc.Domains.P_Root;

namespace Microsoft.Identity
{
    class IdentityGen
    {
        private List<PProgram> parsedPrograms;
        private TextWriter writer;


        public IdentityGen(string inputFileName, TextWriter writer)
        {
            this.writer = writer;
        }

        private int gen_TypeDef(P_Root.TypeDef typeDef, TextWriter writer)
        {
            StringBuilder sb = new StringBuilder("");
            if(typeDef.GetType() == typeof(NameType))
            {

            }


            writer.WriteLine(sb.ToString());

            return 0;
        }

        private int gen_EventDecl(P_Root.EventDecl event_, TextWriter writer)
        {
            StringBuilder sb = new StringBuilder("event ");
            sb.Append((event_.name as P_Root.StringCnst).Value);
            if (event_.card.GetType() == typeof (AssertMaxInstances))
            {
                sb.Append(" assert ");
                sb.Append((event_.card as RealCnst).Value.ToString());
            }
            else if (event_.card.GetType() == typeof(AssumeMaxInstances))
            {
                sb.Append(" assume ");
                sb.Append((event_.card as RealCnst).Value.ToString());
            }

            if (event_.type != MkUserCnst(P_Root.UserCnstKind.NIL)) //Not NIL
            
            {
                sb.Append(" : ");
                sb.Append((event_.type as TypeDef).ToString());
            }

            sb.Append(";");
            writer.WriteLine(sb.ToString());
            return 0;
        }

        private StringBuilder gen_MachineDecl(P_Root.MachineDecl machine)
        {
            StringBuilder sb = new StringBuilder("");
            if (machine.isMain == P_Root.MkUserCnst(P_Root.UserCnstKind.TRUE))
                sb.Append("main ");
            if (machine.kind == P_Root.MkUserCnst(P_Root.UserCnstKind.MODEL))
                sb.Append("model ");
            else if (machine.kind == P_Root.MkUserCnst(P_Root.UserCnstKind.MONITOR))
                sb.Append("spec ");
            //TODO add ObservesDecl.
            else if (machine.kind == P_Root.MkUserCnst(P_Root.UserCnstKind.REAL))
                sb.Append("machine ");
            sb.Append((machine.name as P_Root.StringCnst).Value + " ");

            sb.Append("\n{\n");
            //writer.WriteLine(sb.ToString());
            return sb;
        }
        public int gen_identity()
        {
            Dictionary<string, StringBuilder> machineDeclToSB = new Dictionary<string, StringBuilder>();
            foreach (var program in parsedPrograms)
            {
                //Go over the fields of class PProgram one by one and generate
                //the P code again. We do not really care about indentation.

                foreach (var typedef in program.TypeDefs)
                {
                    //TODO implement
                    var temp = gen_TypeDef(typedef, writer);
                    if (temp != 0)
                        return -1;
                }

                foreach (var event_ in program.Events)
                {
                    var temp = gen_EventDecl(event_, writer);
                    if (temp != 0)
                        return -1;
                }

                foreach(var machine in program.Machines)
                {
                    var sb = gen_MachineDecl(machine);
                    //DEBUG - remove
                    Console.WriteLine("/** "+ (machine.name as P_Root.StringCnst).Value + " **\\\n");
                    machineDeclToSB[(machine.name as P_Root.StringCnst).Value] = sb;
                }

                foreach(var state in program.States)
                {
                   
                }

                foreach(var variable in program.Variables)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var transition in program.Transitions)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var function in program.Functions)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var anonfunction in program.AnonFunctions)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var do_ in program.Dos)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var annotation in program.Annotations)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var observe in program.Observes)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var fileinfo in program.FileInfos)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }

                foreach(var lineinfo in program.LineInfos)
                {
                    StringBuilder sb = new StringBuilder("");

                    writer.WriteLine(sb.ToString());
                }
            }
            return 0;
        }
    }
}