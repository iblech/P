// P semantics test: two machines, monitor instantiation parameter
// This is validation test for MonitorInvocation.p
event E2 assert 1: bool;

main machine Real1 {
    var test: bool; 
	var ev2: event;
    start state Real1_Init {
        entry { 
			announce ev2, test;  //"null event" error in Zing
		}
	}
}
spec M observes E2 {
	start state x {
	}
}
