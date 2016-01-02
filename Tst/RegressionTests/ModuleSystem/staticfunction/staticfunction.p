event x : K1;
event y;
event z;
event a;
interface K1 x, y;
interface K2 a, z;

test safety staticfunction Mod1, Mod2;
implementation Mod1, Mod2;

module Mod1
creates M2
{
	main machine M1
	receives x, y
	{
		start state S 
		{
			entry {
				Mod2::SFUN();
			}
			
		}
	}
}

module Mod2 
{
	public fun SFUN()
	{
		new M2();
	}
	
	machine M2
	receives a, z
	{
		start state S 
		{
			entry {
				assert(false);
			}
		}
	}
}