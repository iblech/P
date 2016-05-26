//This regression tests the dynamic assertions associated with the interface type
// 1) Event being sent is in the interface set assocated with the target.

event e1;
event e2: MyMachine;
event e3;

eventset es = {e1, e2, e3};
eventset es1 = {e1};
type MyMachine() = es;
type MyMachine1() = es1;

main machine MyMachine
	exports MyMachine;
	sends e2, e1;
{
	var x : machine;
	start state Init {
		defer e1;
		entry {
			x = this;
			send x, e1;
			send this, e2, x as MyMachine1;
		}
	}

}