#include "timer.p"

// PingPong.p 
event PING assert 1: machine; 
event PONG assert 1; 
event SUCCESS;

eventset Ping_Receives = { PONG };
type Client() = Ping_Receives;

main machine Client 
exports Client;
sends PING;
{
  var server: machine;
  start state Init { 
    entry { 
      server = new Server(); 
      raise SUCCESS; 
    } 
    on SUCCESS goto SendPing; 
  }
  state SendPing { 
    entry { 
      announce M_PING, this;
      send server, PING, this; 
      raise SUCCESS; 
    } 
    on SUCCESS goto WaitPong; 
  }
  state WaitPong { 
    on PONG goto SendPing; 
  }
}

eventset Server_Receives = { PING, TIMEOUT };
type Server() = Server_Receives;

machine Server 
exports Server;
sends PONG, START;
{ 
  var timer: machine;
  var client: machine;

  start state WaitPing {  
    entry { 
      timer = new Timer(this);
    }
    on PING goto Sleep; 
  }
  
  state Sleep { 
    entry (payload: machine) {       
      client =  payload;
      send timer, START, 100;
    } 
    on TIMEOUT goto SendPong;
  }

  state SendPong { 
    entry { 
      announce M_PONG, client;
      send client, PONG; 
      raise SUCCESS; 
    } 
    on SUCCESS goto WaitPing; 
  }
} 

event M_PING: machine;
event M_PONG: machine;

spec Safety observes M_PING, M_PONG { 
    var pending: map[machine, int];
    start state Init { 
        on M_PING do (payload: machine) { 
            if (!(payload in pending)) 
                pending[payload] = 0; 
            pending[payload] = pending[payload] + 1; 
            assert (pending[payload] <= 3); 
        }
        on M_PONG do (payload: machine) {
            assert (payload in pending); 
            assert (0 < pending[payload]); 
            pending[payload] = pending[payload] - 1;
        }
    }
} 

