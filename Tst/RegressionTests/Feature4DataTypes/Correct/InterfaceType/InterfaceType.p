//This regression tests the dynamic assertions associated with the interface type
// 1) Event being sent is in the interface set assocated with the target.

event e1;
event e2: I1;
event e3;
eventset es1 = {e1, e2};

interface I1(): es1;
main machine MyMachine
	receives;
	sends e2, e1;
{
	var x : I1;
	start state Init {
		defer e1, e2;
		entry {
			//x = new I1();
			send x, e1;
			send this, e2, x as I1;
		}
	}
}