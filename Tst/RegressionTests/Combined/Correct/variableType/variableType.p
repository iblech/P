event x;

test safety variableType TestModule;
implementation TestModule;

module TestModule
sends x
creates XRecv
{
	main machine TestMachine 
	{
		var x : int;
		var m : XRecv;
		start state Init {
			entry {
				x = x + 1;
				m = new XRecv();
			}
		}
		
		fun foo (x : event) {
			send m, x;
		}

	}


	machine XRecv 
	receives x
	{
		start state Init {
			entry {
				
			}
			on x do {};
		}

	}
}