using System;
using System.Collections.Generic;

using Microsoft.P2Boogie;
using Microsoft.FSharp.Collections;

namespace Microsoft.P_FS_Boogie
{
    class SymbolTable
    {
        private Stack<Tuple<string, Dictionary<string, Syntax.Type>>> tbls =
            new Stack<Tuple<string, Dictionary<string, Syntax.Type>>>();
        private Dictionary<string, Dictionary<string, Syntax.Type>> machinesToVars =
            new Dictionary<string, Dictionary<string, Syntax.Type>>();
        private Dictionary<string, HashSet<string>> machinesToFuns =
            new Dictionary<string, HashSet<string>>();

        public string currentM { get; set; }
        public string currentF { get { if (tbls.Count > 0) return tbls.Peek().Item1; else return null; } }
        public bool InsideStaticFn { get; set; } = false;
        //public Syntax.Expr.NamedTuple tupExpr { get; private set; }
        //public Syntax.Type.NamedTuple tupType { get; private set; }

        public void NewScope(string name)
        {
            tbls.Push(new Tuple<string, Dictionary<string, Syntax.Type>>(name, new Dictionary<string, Syntax.Type>()));
        }

        public void ExitScope()
        {
            tbls.Pop();
        }

        public void Clear()
        {
            tbls.Clear();
            machinesToVars.Clear();
            machinesToFuns.Clear();
            currentM = null;
            InsideStaticFn = false;
        }

        public string GetVarName(string x)
        {
            foreach (var tbl in tbls)
            {
                if (!InsideStaticFn && tbl.Item2.ContainsKey(x))
                    return tbl.Item1 + "_" + x;
            }

            if (!InsideStaticFn && machinesToVars[currentM].ContainsKey(x))
                return currentM + "_" + x;

            foreach (var tbl in tbls)
            {
                if (InsideStaticFn && tbl.Item2.ContainsKey(x))
                    return tbl.Item1 + "_" + x;
            }
            //throw new KeyNotFoundException("No such variable as " + x + " in scope!");
            return x; //Needed for expressions in global scope, like events.
        }

        public string GetFunName(string f)
        {
            if(!InsideStaticFn && machinesToFuns[currentM].Contains(f))
                return currentM + '_' + f;
            return f;
        }

        public string GetOwner(string s)
        {
            foreach (var tbl in tbls)
            {
                if (tbl.Item2.ContainsKey(s))
                    return tbl.Item1;
            }

            if (!InsideStaticFn && machinesToVars[currentM].ContainsKey(s))
                return currentM;
            return null;
        }

        public Tuple<Syntax.Type.NamedTuple, Syntax.Expr.NamedTuple> TuplifyAllLocals()
        {
            var typLst = new List<Tuple<string, Syntax.Type>>();
            foreach(var tbl in tbls)
            {
                foreach(var v in tbl.Item2)
                {
                    var name = tbl.Item1 + '_' + v.Key;
                    typLst.Add(new Tuple<string, Syntax.Type>(name, v.Value));
                }
            }

            var expLst = new List<Tuple<string, Syntax.Expr>>();
            foreach(var v in typLst)
            {
                expLst.Add(new Tuple<string, Syntax.Expr>(v.Item1, 
                    Syntax.Expr.NewVar(v.Item1)));
            }

            var tupType = Syntax.Type.NewNamedTuple(ListModule.OfSeq(typLst)) 
                as Syntax.Type.NamedTuple;
            var tupExpr = Syntax.Expr.NewNamedTuple(ListModule.OfSeq(expLst)) 
                as Syntax.Expr.NamedTuple;
            return new Tuple<Syntax.Type.NamedTuple, Syntax.Expr.NamedTuple>(tupType, tupExpr);
        }

        public void AddMachine(string m)
        {
            if (!machinesToVars.ContainsKey(m))
                machinesToVars[m] = new Dictionary<string, Syntax.Type>();
            else
                throw new Exception("Machine " + m + "already exists!");

            if (!machinesToFuns.ContainsKey(m))
                machinesToFuns[m] = new HashSet<string>();
            else
                throw new Exception("Machine " + m + "already exists!");
        }

        public void AddMachVar(string m, string v, Syntax.Type t)
        {
            if (!machinesToVars.ContainsKey(m))
                throw new Exception("No such machine as " + m);
            machinesToVars[m].Add(v, t);
        }

        public void AddMachFun(string m, string f)
        {
            if (!machinesToFuns.ContainsKey(m))
                throw new Exception("No such machine as " + m);
            machinesToFuns[m].Add(f);
        }

        public void AddVar(string v, Syntax.Type t)
        {
            var tbl = tbls.Peek();
            tbl.Item2.Add(v, t);
        }
    }
}
