event unit;
event init:(ProcessMachine, ProcessMachine);
event myCount:int;
event Req;
event Resp;

implementation Process, Scheduler;
test safety boundedasync Process, Scheduler;

module Scheduler
sends Resp, init
creates ProcessMachine
{
	main model SchedulerMachine 
	receives Req
	{
		var p1:ProcessMachine;
		var p2:ProcessMachine;
		var p3:ProcessMachine;
		var count:int;
		start state inits {
			
			entry {
				p1 = new ProcessMachine(this);
				p2 = new ProcessMachine(this);
				p3 = new ProcessMachine(this);
				send p1, init, (p3, p2);
				send p2, init, (p3, p1);
				send p3, init, (p1, p2);
				count = 0;
				raise unit;
				
			}
			on unit goto Sync;
		}
		fun CountReq() {
			count = count + 1;
			if(count == 3)
			{
				count = 0;
				raise Resp;
			}
		}
		state Sync {
			on Req do CountReq;
			exit
			{
				send p1, Resp;
				send p2, Resp;
				send p3, Resp;
			}
			on Resp goto Sync;
		}
	}
}

module Process
sends Req, myCount
{
	machine ProcessMachine 
	receives Resp, myCount, init
	{
		var count:int;
		var parent:SchedulerMachine;
		var other1:ProcessMachine;
		var other2:ProcessMachine;
		
			start state _init {
				entry (payload: SchedulerMachine) { 
					  parent = payload; 
					  raise unit;
				}
				on unit goto inits;
			}

		state inits {
			entry {
				count = 0;
			}
			on myCount goto inits;
			on init do (payload: (machine, machine)) {
				other1 = payload.0 as ProcessMachine;
				other2 = payload.1 as ProcessMachine;
				send parent, Req;
			};
			on Resp goto SendCount;
		}
		
		fun ConfirmThatInSync(payload: int) {
			assert(count <= payload && count >= payload - 1);
		}
		state SendCount {
			entry {
				count = count + 1;
				send other1, myCount, count;
				send other2, myCount, count;
				send parent, Req;
				if(count > 10)
				{
					raise unit;
				}
			}
			on unit goto done;
			on Resp goto SendCount;
			on myCount do (payload: int) { ConfirmThatInSync(payload); };
		}
		state done {
		ignore Resp, myCount;
		}
	}
}