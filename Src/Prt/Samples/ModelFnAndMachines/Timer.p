// events from client to timer
event START: int;
// events from timer to client
event TIMEOUT: machine;

// local event for control transfer within timer
eventset TimerRec = { START };
type Timer(machine) = TimerRec;

event UNIT; 
model Timer 
exports Timer;
sends TIMEOUT;
{
  var client: machine;
  start state Init {
    entry (arg: machine){
      client = arg;
      raise UNIT;  // goto handler of UNIT
    }
    on UNIT goto WaitForReq;
  }

  state WaitForReq { 
    on START do { send client, TIMEOUT, this; }
  }

}
