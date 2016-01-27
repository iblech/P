event eA;
event eB;
event eC;
event eD;

module M1
sends eA, eB, eC
creates M2Machine, M3Machine
{
	main machine M1Machine
	{
		var m2V : machine;
		var m3V : machine;
	
		start state Init {
			entry (payload: machine) {
				m2V = new M2Machine();
				m3V = new M3Machine(m2V);
				send m2V as M2Machine, eA;
				send m2V as M2Machine, eB;
				send m2V as M2Machine, eC;
				send m3V as M3Machine, eD;
			}
		}
	}
}

module M2
{
	machine M2Machine
	receives eA, eB, eC
	{
		start state Init {
			on eA, eB, eC, eD do {};
		}
	}
}

module M3
sends eB, eC, eD
{
	machine M3Machine
	receives eD
	{
		var m2V : M2Machine;
		start state Init {
			entry (payload: machine){
				m2V = payload as M2Machine;
				send m2V as M2Machine, eD;
				send m2V as M2Machine, eB;
				send m2V as M2Machine, eC; 
			}
			on eD do { assert(false); };
		}
	}
}

test hide_1: hide eA, eB in (M1, M2), M3;