module MyModule
sends halt
{

	main machine Manager 
	{
		start state Init
		{
			entry
			{
				send this, halt;
			}
		}
	}
}

test HALT: MyModule;