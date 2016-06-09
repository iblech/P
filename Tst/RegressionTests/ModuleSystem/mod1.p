module X = M1;
module X1 = M1, M1, X;

module M1 {
	main model MainMachine 
	receives;
	{
	    start state Init
	    {
	    }
	}
}

