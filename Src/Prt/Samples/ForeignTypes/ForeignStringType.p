type StringType;

event sendback : (TestMachine, any);
event getback : any;

main machine TestMachine
receives getback;
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

machine ForwardingMachine 
receives sendback;
sends getback;
{
	start state Init {
		on sendback do (payload : (machine, any))
		{
			send payload.0, getback, payload.1;
		}
	}
}
