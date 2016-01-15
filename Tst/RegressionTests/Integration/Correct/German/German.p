//Event declaration
event unit assert 1;
event req_share assert 3 : ClientMachine;
event req_excl assert 3 : ClientMachine;
event need_invalidate assert 1;
event invalidate_ack assert 3;
event grant assert 1;
event ask_share assume 1;
event ask_excl assume 1;
event invalidate assert 1;
event grant_excl assert 1;
event grant_share assert 1;
event normal assert 1;
event wait assert 1;
event invalidate_sharers assert 1 : int;
event sharer_id assert 3 : ClientMachine;

module Host
sends invalidate, grant_excl, grant_share, ask_share, ask_excl
creates ClientMachine
{
	machine CPUMachine
	{
		var cache : (machine, machine, machine);

		start state init {
			entry (payload: (machine, machine, machine)) {
				cache = payload;
				raise unit;
			}
			on unit goto makeReq;
		}
		
		state makeReq {
			entry {
				if ($)
				{
					if ($)
							  send cache.0, ask_share;
					else
							  send cache.0, ask_excl;
				}
				else if ($)
				{
					if ($)
							  send cache.1, ask_share;
					else 
							  send cache.1, ask_excl;
				}
				else
				{
					if ($)
					{
						send cache.2, ask_share;
					}
					else
					{
						send cache.2, ask_excl;
					}
				}
				raise unit;
			}
			on unit goto makeReq;
		}
	}
	
	//Host machine 
	main machine HostMachine 
	receives req_excl, req_share
	{
		var curr_client : machine;
		var clients : (machine, machine, machine);
		var curr_cpu : machine;
		var sharer_list : seq[machine];
		var is_curr_req_excl : bool;
		var is_excl_granted : bool;
		var i, s :int;
		var temp: machine;
		start state init {
			entry {
				
				temp = new ClientMachine(this, false);
				clients.0 = temp;
				temp = new ClientMachine(this, false);
				clients.1 = temp;
				temp = new ClientMachine(this, false);
				clients.2 = temp;
				curr_client = null;
				curr_cpu = new CPUMachine(clients);
				assert(sizeof(sharer_list) == 0);
				raise unit;
			}
			on unit goto receiveState;
		}
		
		state receiveState {
			defer invalidate_ack;
			entry {}
			
			on req_share goto ShareRequest;
			on req_excl goto ExclRequest;		
		}
		
		state ShareRequest {
			entry (payload: ClientMachine) {
				curr_client = payload;
				is_curr_req_excl = false;
				raise unit;
			}
			
			on unit goto ProcessReq;	
		}
		
		state ExclRequest {
			entry (payload: ClientMachine) {
					curr_client = payload;
				is_curr_req_excl = true;
				raise unit;
			}
			
			on unit goto ProcessReq;
		}
		
		state ProcessReq {
			entry {
				if (is_curr_req_excl || is_excl_granted)
				{
					// need to invalidate before giving access
					raise need_invalidate;
				}
				else
					raise grant;
			}
			on need_invalidate goto inv;
			on grant goto grantAccess;
		}
		
		state inv {
			defer req_share, req_excl;
			entry {
				i = 0;
				s = sizeof(sharer_list);
				if (s == 0)
					raise grant;
				while (i < s)
				{
					send sharer_list[i], invalidate;
					i = i + 1;
				}
			}
			on invalidate_ack do rec_ack;
			on grant goto grantAccess;
		}
		
		fun rec_ack() {
			sharer_list -= 0;
			s = sizeof(sharer_list);
			if (s == 0)
				raise grant;
		}
		
		state grantAccess {
			entry {
				if (is_curr_req_excl)
				{
					is_excl_granted = true;
					send curr_client, grant_excl;
				}
				else
				{
					send curr_client, grant_share;
				}
				sharer_list += (0, curr_client);
				raise unit;
			}
			on unit goto receiveState;
		}
	}
}

module Client
sends req_share, req_excl, invalidate_ack
{
	//Client Machine
	machine ClientMachine
	receives ask_share, ask_excl, invalidate, grant_excl, grant_share
	{
		var host : HostMachine;
		var pending : bool;
		start state init {
			entry (payload: (HostMachine,bool)) {
					host = payload.0; 
					pending = payload.1;
				raise unit;
			}
			on unit goto invalid;
		}

		state invalid {
			entry { 
				
			}
			on ask_share goto asked_share;
			on ask_excl goto asked_excl;
			on invalidate goto invalidating;
			on grant_excl goto exclusive;
			on grant_share goto sharing;
		}
		
		state asked_share {
			entry{
				send host, req_share, this;
				pending = true;
				raise unit;
			}
			on unit goto invalid_wait;
		}
		
		state asked_excl {
			entry {
				send host, req_excl, this;
				pending = true;
				raise unit;
			}
			on unit goto invalid_wait;
		}
		
		state invalid_wait {
			defer ask_share, ask_excl;
			on invalidate goto invalidating;
			on grant_excl goto exclusive;
			on grant_share goto sharing;
		}
		
		state asked_ex2 {
			entry {
				send host, req_excl, this;
				pending = true;
				raise unit;
			}
			on unit goto sharing_wait;
		}
		
		state sharing {
			entry {
				pending = false;
			}
			on invalidate goto invalidating;
			on grant_share goto sharing;
			on grant_excl goto exclusive;
			on ask_share goto sharing;
			on ask_excl goto asked_ex2;
		}
		
		state sharing_wait {
			defer ask_share, ask_excl;
			entry {}
			on invalidate goto invalidating;
			on grant_share goto sharing_wait;
			on grant_excl goto exclusive;
			
		}
		
		state exclusive {
			ignore ask_share, ask_excl;
			entry {
				pending = false;
			}
			on invalidate goto invalidating;
			on grant_share goto sharing;
			on grant_excl goto exclusive;
		}
		
		state invalidating {
			entry {
				send host, invalidate_ack;
				if (pending)
				{
					raise wait;
				}
				else
					raise normal;
			}
			on wait goto invalid_wait;
			on normal goto invalid;
		}
	}
}

implementation Client, Host; 


