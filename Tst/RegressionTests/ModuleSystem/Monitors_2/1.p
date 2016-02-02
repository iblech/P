event x;
event y : M1;

test t1: Mod1, Mod2 satisfies Mon1;

module Mod1
sends y
creates M2
{
	main machine M1
	receives x
	{
		var id: machine;
		start state S 
		{
			entry {
				id = new M2();
				send id as M2, y, this;
			}
			ignore x;
		}
	}
	
	monitor Mon1 observes x, y
	{
		var i : int;
		start state S1
		{
			entry {
				i = 0;
			}
			on y do { i = i + 1; };
			on x do { assert(i == 0); };
		}
	}
}


module Mod2
sends x
{
	machine M2
	receives y
	{
		start state S1
		{
			on y do (payload: machine) { send payload as M1, x; };
		}
	}
}
