using Microsoft.Pc;
using Microsoft.Pc.Domains;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Pc.Domains.P_Root;
using Microsoft.Formula.API.Generators;


namespace Microsoft.Identity
{

    class IdentityGen
    {
        private List<PProgram> parsedPrograms;
        private TextWriter writer;

        //TODO Finish
        public IdentityGen(string inputFileName, TextWriter writer)
        {
            this.writer = writer;
        }
    
        private static string getName(ICSharpTerm x)
        {
            return (x as P_Root.StringCnst).Value;
        }
        private static void gen_BaseType(P_Root.BaseType t, StringBuilder sb)
        {
            if(t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.INT))
            {
                sb.Append("int");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.BOOL))
            {
                sb.Append("bool");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.REAL))
            {
                sb.Append("machine");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.ANY))
            {
                sb.Append("any");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.EVENT))
            {
                sb.Append("event");
            }
            else if (t._0 == P_Root.MkUserCnst(P_Root.UserCnstKind.NULL))
            {
                sb.Append("null");
            }
            return;
        }

        private static void gen_TupType(P_Root.TupType t, StringBuilder sb)
        {
            sb.Append("(");
            while (t.hd != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
            {
                gen_type(t.hd as P_Root.IArgType_TypeDef__1, sb);
                sb.Append(", ");
                t = t.tl as P_Root.TupType;
            }
            sb.Length -= 2;
            sb.Append(')');
        }

        private static void gen_NmbTupTypeField(P_Root.NmdTupTypeField f, StringBuilder sb)
        {
            gen_Qualifier(f.qual as P_Root.Qualifier, sb);
            sb.Append(" " + getName(f.name) + ": ");
            gen_type(f.type as P_Root.IArgType_TypeDef__1, sb);
        }

        private static void gen_NmdTupType(P_Root.NmdTupType t, StringBuilder sb)
        {
            sb.Append("(");
            while(t.hd != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL))
            {
                gen_NmbTupTypeField(t.hd as P_Root.NmdTupTypeField, sb);
                sb.Append(", ");
                t = t.tl as P_Root.NmdTupType;
            }
            sb.Length -= 2;
            sb.Append(')');
        }

        private static void gen_Qualifier(P_Root.Qualifier q, StringBuilder sb)
        {
            if (q == P_Root.MkUserCnst(P_Root.UserCnstKind.SWAP))
                sb.Append("swap ");
            else if (q == P_Root.MkUserCnst(P_Root.UserCnstKind.XFER))
                sb.Append("xfer ");
            return;
        }

        private static void gen_SeqType(P_Root.SeqType t, StringBuilder sb)
        {
            sb.Append("seq[");
            gen_type(t.x as P_Root.IArgType_TypeDef__1, sb);
            sb.Append("]");
        }

        private static void gen_MapType(P_Root.MapType t, StringBuilder sb)
        {
            sb.Append("map[");
            gen_type(t.k, sb);
            sb.Append(", ");
            gen_type(t.v, sb);
            sb.Append("]");
        }
       private static void gen_type(ICSharpTerm t, StringBuilder sb)
        {
            //t: any TypeExpr. This means we can check its derived type as we wish.
            if(t == typeof(P_Root.NameType)) 
            {
                sb.Append(getName(t));
            }
            else if(t == typeof(P_Root.BaseType))
            {
                gen_BaseType(t as P_Root.BaseType, sb);
            }
            else if(t == typeof(P_Root.SeqType))
            {
                gen_SeqType(t as P_Root.SeqType, sb);
            }
            else if(t == typeof(P_Root.TupType))
            {
                gen_TupType(t as P_Root.TupType, sb);
            }
            else if (t == typeof(P_Root.NmdTupType))
            {
                gen_NmdTupType(t as P_Root.NmdTupType, sb);
            }
            else if (t == typeof(P_Root.MapType))
            {
                gen_MapType(t as P_Root.MapType, sb);
            }
        }

        private int gen_TypeDef(P_Root.TypeDef typeDef, TextWriter writer)
        {
            StringBuilder sb = new StringBuilder("type ");
            sb.Append(getName(typeDef.type)+" = ");
            gen_type(typeDef.type, sb);
            writer.WriteLine(sb.ToString());

            return 0;
        }

        private int gen_EventDecl(P_Root.EventDecl event_, TextWriter writer)
        {
            StringBuilder sb = new StringBuilder("event ");
            sb.Append(getName(event_.name));
            if (event_.card.GetType() == typeof (P_Root.AssertMaxInstances))
            {
                sb.Append(" assert ");
                sb.Append((event_.card as Microsoft.Pc.Domains.P_Root.RealCnst).Value.ToString());
            }
            else if (event_.card.GetType() == typeof(Microsoft.Pc.Domains.P_Root.AssumeMaxInstances))
            {
                sb.Append(" assume ");
                sb.Append((event_.card as Microsoft.Pc.Domains.P_Root.RealCnst).Value.ToString());
            }

            if (event_.type != P_Root.MkUserCnst(P_Root.UserCnstKind.NIL)) //Not NIL
            
            {
                sb.Append(" : ");
                sb.Append((event_.type as Microsoft.Pc.Domains.P_Root.TypeDef).ToString());
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
            sb.Append(getName(machine.name) + " ");

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
                    Console.WriteLine("//** "+ getName(machine.name) + " **\\\\\n");
                    machineDeclToSB[getName(machine.name)] = sb;
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