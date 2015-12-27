event x : K1;
event y;
event z;
event a;
interface K1 x, y;
interface K2 a, z;

test safety testcase_1 Mod1, Mod2;
implementation Mod1, Mod2;

driver module Mod1
creates K2
{
	main machine M1
	receives x, y
	{
		start state S 
		{
			entry {
				new K2();
				Mod2.SFUN();
			}
			
		}
	}
}

module Mod2 {
	static fun SFUN()
	{
		
	}
	
	machine M2
	receives a, z
	{
		start state S 
		{
			entry {
				
			}
		}
	}
}