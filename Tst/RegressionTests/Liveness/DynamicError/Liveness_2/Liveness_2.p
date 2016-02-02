// Liveness test: simplest sample demonstrating liveness error found
// This is non-terminating program

event UserEvent;
event Done;
event Waiting;
event Computing;

module TestModule
sends UserEvent, Done
{
	main machine EventHandler
	receives UserEvent, Done
	{
	       start state WaitForUser
	       {
	            entry {
					monitor Waiting;
					send this, UserEvent;
					}
	            on UserEvent goto HandleEvent;
	       }
	  
	       state HandleEvent
	       {
	            entry { 
					monitor Computing;
					send this, Done;
					}			
	            on Done goto HandleEvent;  //staying in HandleEvent forever
	       }
	}

	monitor WatchDog observes Computing, Waiting
	{
	      start cold state CanGetUserInput
	      {
	             on Waiting goto CanGetUserInput;
	             on Computing goto CannotGetUserInput;
	      } 
		  hot state CannotGetUserInput
	      {
             on Waiting goto CanGetUserInput;
             on Computing goto CannotGetUserInput;
	      }
	}
}
