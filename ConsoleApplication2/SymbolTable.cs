using System.Collections.Generic;

namespace Microsoft.P_FS_Boogie
{
    class SymbolTable
    {
        private Dictionary<string, string> tbl = new Dictionary<string, string>();
        private Dictionary<string, HashSet<string>> machineToVarsFuns = new Dictionary<string, HashSet<string>>();
        private string currentM { get; set; }
        private bool in_global_scope { get; set; } = false;

        public bool is_static_fn(string fName)
        {
            return !(machineToVarsFuns[currentM].Contains(fName));
        }
        public void NewScope()
        {
            tbl.Clear();
        }

        public string get_owner(string s)
        {
            string ret;
            if (tbl.TryGetValue(s, out ret))
                return ret;
            else if (!in_global_scope && machineToVarsFuns[currentM].Contains(s))
                return currentM;
            return null;
        }

        public void add_machVar(string m, string v)
        {
            if (!machineToVarsFuns.ContainsKey(m))
                machineToVarsFuns[m] = new HashSet<string>();
            machineToVarsFuns[m].Add(v);
        }

        public void add_var(string v, string owner)
        {
            tbl[v] = owner;
        }

        public string get_name(string x)
        {
            string n;
            if (!in_global_scope && tbl.TryGetValue(x, out n))
                return currentM + "_" + n + "_" + x;
            else if (!in_global_scope && machineToVarsFuns[currentM].Contains(x))
                return currentM + "_" + x;
            else if (in_global_scope && tbl.TryGetValue(x, out n))
                return n + "_" + x;
            return x;           
        }
    }
}
