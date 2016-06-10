namespace Microsoft.Pc
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    using Domains;
    using Microsoft.Formula.API.Generators;

    public class PProgram
    {
        public List<P_Root.TypeDef> TypeDefs
        {
            get;
            private set;
        }

        public List<P_Root.EventDecl> Events
        {
            get;
            private set;
        }

        public List<P_Root.MachineDecl> Machines
        {
            get;
            private set;
        }
        
        public List<P_Root.StateDecl> States
        {
            get;
            private set;
        }

        public List<P_Root.VarDecl> Variables
        {
            get;
            private set;
        }

        public List<P_Root.TransDecl> Transitions
        {
            get;
            private set;
        }

        public List<P_Root.FunDecl> Functions
        {
            get;
            private set;
        }

        public List<P_Root.AnonFunDecl> AnonFunctions
        {
            get;
            private set;
        }

        public List<P_Root.DoDecl> Dos
        {
            get;
            private set;
        }

        public List<P_Root.Annotation> Annotations
        {
            get;
            private set;
        }

        public List<P_Root.ObservesDecl> Observes
        {
            get;
            private set;
        }

        public List<P_Root.InterfaceTypeDecl> InterfaceTypeDecl
        {
            get;
            private set;
        }

        public List<P_Root.EventSetDecl> EventSetDecl
        {
            get;
            private set;
        }

        public List<P_Root.MachineReceivesDecl> MachineReceivesDecl
        {
            get;
            private set;
        }

        public List<P_Root.ModulePrivateEvents> ModulePrivateEventsDecl
        {
            get;
            private set;
        }

        public List<P_Root.ModuleAllEventsPrivate> ModuleAllEventsPrivate
        {
            get;
            private set;
        }

        public List<P_Root.MachineSendsDecl> MachineSendsDecl
        {
            get;
            private set;
        }
            
        public List<P_Root.MachineExportsDecl> MachineExportsDecl
        {
            get;
            private set;
        }

        public List<P_Root.ModuleDecl> ModuleDecl
        {
            get;
            private set;
        }

        public List<P_Root.ModuleDef> ModuleDef
        {
            get;
            private set;
        }

        public List<P_Root.ImplementationDecl> ImplementationDecl
        {
            get;
            private set;
        }

        public List<P_Root.RefinementDecl> RefinementDecl
        {
            get;
            private set;
        }

        public List<P_Root.TestDecl> TestDecl
        {
            get;
            private set;
        }

        public List<P_Root.MachineSendsAllEvents> MachineSendsAllEvents
        {
            get;
            private set;
        }

        public List<P_Root.FileInfo> FileInfos
        {
            get;
            private set;
        }

        public List<P_Root.LineInfo> LineInfos
        {
            get;
            private set;
        }

        public IEnumerable<ICSharpTerm> Terms
        {
            get
            {
                foreach (var td in TypeDefs)
                {
                    yield return td;
                }
                
                foreach (var ed in Events)
                {
                    yield return ed;
                }

                foreach (var md in Machines)
                {
                    yield return md;
                }

                foreach (var mod in ModuleDecl)
                {
                    yield return mod;
                }

                foreach (var mn in ModuleDef)
                {
                    yield return mn;
                }

                foreach (var imp in ImplementationDecl)
                {
                    yield return imp;
                }

                foreach (var refT in RefinementDecl)
                {
                    yield return refT;
                }

                foreach (var test in RefinementDecl)
                {
                    yield return test;
                }

                foreach (var s in States)
                {
                    yield return s;
                }

                foreach (var vd in Variables)
                {
                    yield return vd;
                }

                foreach (var td in Transitions)
                {
                    yield return td;
                }

                foreach (var fd in Functions)
                {
                    yield return fd;
                }

                foreach (var afd in AnonFunctions)
                {
                    yield return afd;
                }

                foreach (var di in Dos)
                {
                    yield return di;
                }

                foreach (var ann in Annotations)
                {
                    yield return ann;
                }

                foreach (var obs in Observes)
                {
                    yield return obs;
                }

                foreach (var ev in EventSetDecl)
                {
                    yield return ev;
                }

                foreach (var inter in InterfaceTypeDecl)
                {
                    yield return inter;
                }

                foreach (var mRec in MachineReceivesDecl)
                {
                    yield return mRec;
                }

                foreach (var mpri in ModuleAllEventsPrivate)
                {
                    yield return mpri;
                }

                foreach (var send in MachineSendsDecl)
                {
                    yield return send;
                }

                foreach (var send in MachineSendsAllEvents)
                {
                    yield return send;
                }

                foreach (var pri in ModulePrivateEventsDecl)
                {
                    yield return pri;
                }

                foreach (var ex in MachineExportsDecl)
                {
                    yield return ex;
                }

                foreach (var info in FileInfos)
                {
                    yield return info;
                }

                foreach (var info in LineInfos)
                {
                    yield return info;
                }
            }
        }

        public PProgram()
        {
            TypeDefs = new List<P_Root.TypeDef>();
            Events = new List<P_Root.EventDecl>();
            Machines = new List<P_Root.MachineDecl>();
            States = new List<P_Root.StateDecl>();
            Variables = new List<P_Root.VarDecl>();
            Transitions = new List<P_Root.TransDecl>();
            Functions = new List<P_Root.FunDecl>();
            AnonFunctions = new List<P_Root.AnonFunDecl>();
            Dos = new List<P_Root.DoDecl>();
            Annotations = new List<P_Root.Annotation>();
            Observes = new List<P_Root.ObservesDecl>();
            InterfaceTypeDecl = new List<P_Root.InterfaceTypeDecl>();
            EventSetDecl = new List<P_Root.EventSetDecl>();
            MachineReceivesDecl = new List<P_Root.MachineReceivesDecl>();
            MachineExportsDecl = new List<P_Root.MachineExportsDecl>();
            MachineSendsDecl = new List<P_Root.MachineSendsDecl>();
            ModuleDecl = new List<P_Root.ModuleDecl>();
            ModuleDef = new List<P_Root.ModuleDef>();
            MachineSendsAllEvents = new List<P_Root.MachineSendsAllEvents>();
            ModulePrivateEventsDecl = new List<P_Root.ModulePrivateEvents>();
            ModuleAllEventsPrivate = new List<P_Root.ModuleAllEventsPrivate>();
            ImplementationDecl = new List<P_Root.ImplementationDecl>();
            TestDecl = new List<P_Root.TestDecl>();
            RefinementDecl = new List<P_Root.RefinementDecl>();
            FileInfos = new List<P_Root.FileInfo>();
            LineInfos = new List<P_Root.LineInfo>();
        }
    }
}
