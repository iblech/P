event x;
event y;
event z;
event a;
type KK = int;
interface K1 a;
interface K2 y;

test safety t1 Mod1, Mod2, Driver;

module Mod1
sends x
creates K2
{
	machine M1
	receives a
	{
		var id: machine;
		var i : any;
		var y : int;
		start state S 
		{
			entry {
				i = 0;
				y = i as KK;
				id = new K2();
				send id as K2, x;
			}
		}
	}
	
	monitor Mon1 observes x 
	{
		start state S1
		{
			entry {
			
			}
			on x do { };
		}
	}
}


module Mod2
sends y
{
	machine M2
	receives y
	{
		start state S1
		{
			entry {
			
			}
			on x goto S2;
		}
		
		state S2 {
			entry {
				assert(false);
			}
		}
	}
}

driver module Driver
creates M1
{
	main machine TESTD
	{
		start state S1
		{
			entry {
				new M1();
			}
			
		}
	}
}
