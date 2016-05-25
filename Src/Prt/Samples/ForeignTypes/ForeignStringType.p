type StringType;

event sendback : (TestMachine, any);
event getback : any;

eventset TestMachineRev = { getback };
type TestMachine() = TestMachineRev;

main machine TestMachine
exports TestMachine;
sends sendback;
{
	var someStringV : StringType;
	var fMachine: machine;
	start state Init {

		entry {
			fMachine = new ForwardingMachine();
			someStringV = GetPassword();
			send fMachine, sendback, (this, someStringV);
			receive {
				case getback: (payload: any) {
					assert((payload as StringType) == someStringV);
				}
			}
		}
	}

	model fun GetPassword() : StringType
	{
		return default(StringType);
	}

}

eventset ForwardingMachineRev = { sendback };
type ForwardingMachine() = ForwardingMachineRev;

machine ForwardingMachine 
exports ForwardingMachine;
sends getback;
{
	start state Init {
		on sendback do (payload : (machine, any))
		{
			send payload.0, getback, payload.1;
		}
	}
}
