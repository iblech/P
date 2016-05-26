//This regression tests the dynamic assertions associated with the interface type
// 1) Event being sent is in the interface set assocated with the target.

event e1;
event e2;
event e3;

main machine MyMachine
	receives e1, e2;
	sends e1;
{
	var x : machine;
	var y : event;
	start state Init {
		defer e1;
		entry {
			x = this;
			send x, e1;
			y = e2;
			send this, y;
		}
	}

}