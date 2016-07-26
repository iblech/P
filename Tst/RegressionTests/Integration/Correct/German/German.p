event unit  assert 1;
event req_share  assert 3: machine;
event req_excl  assert 3: machine;
event need_invalidate  assert 1;
event invalidate_ack  assert 3;
event grant  assert 1;
event ask_share  assume 1;
event ask_excl  assume 1;
event invalidate  assert 1;
event grant_excl  assert 1;
event grant_share  assert 1;
event normal  assert 1;
event wait  assert 1;
event invalidate_sharers  assert 1: int;
event sharer_id  assert 3: machine;

main machine Host
{
var Host_curr_client: machine;
var Host_clients: (machine, machine, machine);
var Host_curr_cpu: machine;
var Host_sharer_list: seq[machine];
var Host_is_curr_req_excl: bool;
var Host_is_excl_granted: bool;
var Host_s: int;
var Host_i: int;
var Host_temp: machine;

fun Host_rec_ack()
{
var Tmp435: bool;


;

Host_sharer_list -= 0;
;

Host_s = sizeof(Host_sharer_list);
;

Tmp435 = (Host_s == 0);
if(Tmp435)
{

;

raise grant;

}
else
{

;

;


}

}
fun Host_inv_do_invalidate_ack(payload: null)
{


Host_rec_ack();
}
fun Host_init_on_unit_goto_Host_receiveState0_rand_1111087116(Host_init_on_unit_goto_Host_receiveState0_rand_1111087116__payload_skip: any)
{


;

;

return;
}
fun Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_1368268326(Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_1368268326__payload_skip: any)
{


;

;

return;
}
fun Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_1466611162(Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_1466611162__payload_skip: any)
{


;

;

return;
}
fun Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_1177956768(Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_1177956768__payload_skip: any)
{


;

;

return;
}
fun Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1025789331(Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1025789331__payload_skip: any)
{


;

;

return;
}
fun Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_1319989864(Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_1319989864__payload_skip: any)
{


;

;

return;
}
fun Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_949653833(Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_949653833__payload_skip: any)
{


;

;

return;
}
fun Host_inv_on_grant_goto_Host_grantAccess0_rand_732816014(Host_inv_on_grant_goto_Host_grantAccess0_rand_732816014__payload_skip: any)
{


;

;

return;
}
fun Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1331963890(Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1331963890__payload_skip: any)
{


;

;

return;
}
fun Host_init_entry31(Host_init_entry31__payload_0: null)
{
var Tmp436: (machine, bool);
var Tmp437: machine;
var Tmp438: (machine, bool);
var Tmp439: machine;
var Tmp440: (machine, bool);
var Tmp441: machine;
var Tmp442: machine;
var Tmp443: bool;


;

Tmp436 = (this, false);
Tmp437 = new Client(Tmp436);
Host_temp = Tmp437;
;

Host_clients.0 = Host_temp;
;

Tmp438 = (this, false);
Tmp439 = new Client(Tmp438);
Host_temp = Tmp439;
;

Host_clients.1 = Host_temp;
;

Tmp440 = (this, false);
Tmp441 = new Client(Tmp440);
Host_temp = Tmp441;
;

Host_clients.2 = Host_temp;
;

Host_curr_client = null;
;

Tmp442 = new CPU(Host_clients);
Host_curr_cpu = Tmp442;
;

Tmp443 = (sizeof(Host_sharer_list) == 0);
assert Tmp443;
;

raise unit;
return;
}
fun Host_init_exit0_rand_1471669115(Host_init_exit0_rand_1471669115__payload_skip: any)
{


;

;

return;
}
fun Host_receiveState_entry0_rand_1736478266(Host_receiveState_entry0_rand_1736478266__payload_1: null)
{


;

;

return;
}
fun Host_receiveState_exit0_rand_830204800(Host_receiveState_exit0_rand_830204800__payload_skip: any)
{


;

;

return;
}
fun Host_ShareRequest_entry55(Host_ShareRequest_entry55_payload: machine)
{


;

Host_curr_client = Host_ShareRequest_entry55_payload;
;

Host_is_curr_req_excl = false;
;

raise unit;
return;
}
fun Host_ShareRequest_exit0_rand_1923654886(Host_ShareRequest_exit0_rand_1923654886__payload_skip: any)
{


;

;

return;
}
fun Host_ExclRequest_entry65(Host_ExclRequest_entry65_payload: machine)
{


;

Host_curr_client = Host_ExclRequest_entry65_payload;
;

Host_is_curr_req_excl = true;
;

raise unit;
return;
}
fun Host_ExclRequest_exit0_rand_1544881564(Host_ExclRequest_exit0_rand_1544881564__payload_skip: any)
{


;

;

return;
}
fun Host_ProcessReq_entry75(Host_ProcessReq_entry75__payload_2: null)
{


;

if((Host_is_curr_req_excl || Host_is_excl_granted))
{

;

raise need_invalidate;

}
else
{

;

raise grant;

}

return;
}
fun Host_ProcessReq_exit0_rand_798958306(Host_ProcessReq_exit0_rand_798958306__payload_skip: any)
{


;

;

return;
}
fun Host_inv_entry90(Host_inv_entry90__payload_3: null)
{
var Tmp444: bool;
var Tmp445: machine;


;

Host_i = 0;
;

Host_s = sizeof(Host_sharer_list);
;

Tmp444 = (Host_s == 0);
if(Tmp444)
{

;

raise grant;

}
else
{

;

;


}

;

while((Host_i < Host_s))
{

;

Tmp445 = Host_sharer_list[Host_i];
send Tmp445, invalidate;
;

Host_i = (Host_i + 1);

}

return;
}
fun Host_inv_exit0_rand_535653865(Host_inv_exit0_rand_535653865__payload_skip: any)
{


;

;

return;
}
fun Host_grantAccess_entry113(Host_grantAccess_entry113__payload_4: null)
{


;

if(Host_is_curr_req_excl)
{

;

Host_is_excl_granted = true;
;

send Host_curr_client, grant_excl;

}
else
{

;

send Host_curr_client, grant_share;

}

;

Host_sharer_list += (0, Host_curr_client);
;

raise unit;
return;
}
fun Host_grantAccess_exit0_rand_1189089865(Host_grantAccess_exit0_rand_1189089865__payload_skip: any)
{


;

;

return;
}start 
 state Host_init
{
entry (payload: null) {
Host_init_entry31(payload);
}exit {
Host_init_exit0_rand_1471669115(null);
}on unit goto Host_receiveState with (payload: null) {
Host_init_on_unit_goto_Host_receiveState0_rand_1111087116(payload);
}}

 state Host_receiveState
{
entry (payload: null) {
Host_receiveState_entry0_rand_1736478266(payload);
}exit {
Host_receiveState_exit0_rand_830204800(null);
}defer invalidate_ack;on req_share goto Host_ShareRequest with (payload: machine) {
Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_1368268326(payload);
}
on req_excl goto Host_ExclRequest with (payload: machine) {
Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_1466611162(payload);
}}

 state Host_ShareRequest
{
entry (payload: machine) {
Host_ShareRequest_entry55(payload);
}exit {
Host_ShareRequest_exit0_rand_1923654886(null);
}on unit goto Host_ProcessReq with (payload: null) {
Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_1177956768(payload);
}}

 state Host_ExclRequest
{
entry (payload: machine) {
Host_ExclRequest_entry65(payload);
}exit {
Host_ExclRequest_exit0_rand_1544881564(null);
}on unit goto Host_ProcessReq with (payload: null) {
Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1025789331(payload);
}}

 state Host_ProcessReq
{
entry (payload: null) {
Host_ProcessReq_entry75(payload);
}exit {
Host_ProcessReq_exit0_rand_798958306(null);
}on need_invalidate goto Host_inv with (payload: null) {
Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_1319989864(payload);
}
on grant goto Host_grantAccess with (payload: null) {
Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_949653833(payload);
}}

 state Host_inv
{
entry (payload: null) {
Host_inv_entry90(payload);
}exit {
Host_inv_exit0_rand_535653865(null);
}defer req_share;
defer req_excl;
on invalidate_ack do (payload: null) {
Host_inv_do_invalidate_ack(payload);
}on grant goto Host_grantAccess with (payload: null) {
Host_inv_on_grant_goto_Host_grantAccess0_rand_732816014(payload);
}}

 state Host_grantAccess
{
entry (payload: null) {
Host_grantAccess_entry113(payload);
}exit {
Host_grantAccess_exit0_rand_1189089865(null);
}on unit goto Host_receiveState with (payload: null) {
Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1331963890(payload);
}}
}

machine Client
{
var Client_host: machine;
var Client_pending: bool;

fun Client_init_on_unit_goto_Client_invalid0_rand_469667409(Client_init_on_unit_goto_Client_invalid0_rand_469667409__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_on_ask_share_goto_Client_asked_share0_rand_2098715229(Client_invalid_on_ask_share_goto_Client_asked_share0_rand_2098715229__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_263172626(Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_263172626__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_on_invalidate_goto_Client_invalidating0_rand_464595419(Client_invalid_on_invalidate_goto_Client_invalidating0_rand_464595419__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_146920831(Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_146920831__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_on_grant_share_goto_Client_sharing0_rand_1717873616(Client_invalid_on_grant_share_goto_Client_sharing0_rand_1717873616__payload_skip: any)
{


;

;

return;
}
fun Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_1360041859(Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_1360041859__payload_skip: any)
{


;

;

return;
}
fun Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_621488594(Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_621488594__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_898541804(Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_898541804__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_1437130575(Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_1437130575__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_285575536(Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_285575536__payload_skip: any)
{


;

;

return;
}
fun Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_1037784014(Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_1037784014__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_on_invalidate_goto_Client_invalidating0_rand_941360738(Client_sharing_on_invalidate_goto_Client_invalidating0_rand_941360738__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_on_grant_share_goto_Client_sharing0_rand_296291883(Client_sharing_on_grant_share_goto_Client_sharing0_rand_296291883__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_1575364250(Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_1575364250__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_on_ask_share_goto_Client_sharing0_rand_260969480(Client_sharing_on_ask_share_goto_Client_sharing0_rand_260969480__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_2146864563(Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_2146864563__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_1793331612(Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_1793331612__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_1402837669(Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_1402837669__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_2136431350(Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_2136431350__payload_skip: any)
{


;

;

return;
}
fun Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_1370922704(Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_1370922704__payload_skip: any)
{


;

;

return;
}
fun Client_exclusive_on_grant_share_goto_Client_sharing0_rand_1607619850(Client_exclusive_on_grant_share_goto_Client_sharing0_rand_1607619850__payload_skip: any)
{


;

;

return;
}
fun Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_216646101(Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_216646101__payload_skip: any)
{


;

;

return;
}
fun Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_92264397(Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_92264397__payload_skip: any)
{


;

;

return;
}
fun Client_invalidating_on_normal_goto_Client_invalid0_rand_401771955(Client_invalidating_on_normal_goto_Client_invalid0_rand_401771955__payload_skip: any)
{


;

;

return;
}
fun Client_init_entry135(Client_init_entry135_payload: (machine, bool))
{


;

Client_host = Client_init_entry135_payload.0;
;

Client_pending = Client_init_entry135_payload.1;
;

raise unit;
return;
}
fun Client_init_exit0_rand_807182177(Client_init_exit0_rand_807182177__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_entry0_rand_355301293(Client_invalid_entry0_rand_355301293__payload_5: null)
{


;

;

return;
}
fun Client_invalid_exit0_rand_244074745(Client_invalid_exit0_rand_244074745__payload_skip: any)
{


;

;

return;
}
fun Client_asked_share_entry155(Client_asked_share_entry155__payload_6: null)
{


;

send Client_host, req_share, this;
;

Client_pending = true;
;

raise unit;
return;
}
fun Client_asked_share_exit0_rand_1638316697(Client_asked_share_exit0_rand_1638316697__payload_skip: any)
{


;

;

return;
}
fun Client_asked_excl_entry164(Client_asked_excl_entry164__payload_7: null)
{


;

send Client_host, req_excl, this;
;

Client_pending = true;
;

raise unit;
return;
}
fun Client_asked_excl_exit0_rand_473203457(Client_asked_excl_exit0_rand_473203457__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_wait_entry0_rand_783597185(Client_invalid_wait_entry0_rand_783597185__payload_skip: any)
{


;

;

return;
}
fun Client_invalid_wait_exit0_rand_118441021(Client_invalid_wait_exit0_rand_118441021__payload_skip: any)
{


;

;

return;
}
fun Client_asked_ex2_entry180(Client_asked_ex2_entry180__payload_8: null)
{


;

send Client_host, req_excl, this;
;

Client_pending = true;
;

raise unit;
return;
}
fun Client_asked_ex2_exit0_rand_514647742(Client_asked_ex2_exit0_rand_514647742__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_entry189(Client_sharing_entry189__payload_9: null)
{


;

Client_pending = false;
return;
}
fun Client_sharing_exit0_rand_1024772097(Client_sharing_exit0_rand_1024772097__payload_skip: any)
{


;

;

return;
}
fun Client_sharing_wait_entry0_rand_564733829(Client_sharing_wait_entry0_rand_564733829__payload_10: null)
{


;

;

return;
}
fun Client_sharing_wait_exit0_rand_268207308(Client_sharing_wait_exit0_rand_268207308__payload_skip: any)
{


;

;

return;
}
fun Client_exclusive_entry210(Client_exclusive_entry210__payload_11: null)
{


;

Client_pending = false;
return;
}
fun Client_exclusive_exit0_rand_169726378(Client_exclusive_exit0_rand_169726378__payload_skip: any)
{


;

;

return;
}
fun Client_invalidating_entry219(Client_invalidating_entry219__payload_12: null)
{


;

send Client_host, invalidate_ack;
;

if(Client_pending)
{

;

raise wait;

}
else
{

;

raise normal;

}

return;
}
fun Client_invalidating_exit0_rand_1071976443(Client_invalidating_exit0_rand_1071976443__payload_skip: any)
{


;

;

return;
}start 
 state Client_init
{
entry (payload: (machine, bool)) {
Client_init_entry135(payload);
}exit {
Client_init_exit0_rand_807182177(null);
}on unit goto Client_invalid with (payload: null) {
Client_init_on_unit_goto_Client_invalid0_rand_469667409(payload);
}}

 state Client_invalid
{
entry (payload: null) {
Client_invalid_entry0_rand_355301293(payload);
}exit {
Client_invalid_exit0_rand_244074745(null);
}on ask_share goto Client_asked_share with (payload: null) {
Client_invalid_on_ask_share_goto_Client_asked_share0_rand_2098715229(payload);
}
on ask_excl goto Client_asked_excl with (payload: null) {
Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_263172626(payload);
}
on invalidate goto Client_invalidating with (payload: null) {
Client_invalid_on_invalidate_goto_Client_invalidating0_rand_464595419(payload);
}
on grant_excl goto Client_exclusive with (payload: null) {
Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_146920831(payload);
}
on grant_share goto Client_sharing with (payload: null) {
Client_invalid_on_grant_share_goto_Client_sharing0_rand_1717873616(payload);
}}

 state Client_asked_share
{
entry (payload: null) {
Client_asked_share_entry155(payload);
}exit {
Client_asked_share_exit0_rand_1638316697(null);
}on unit goto Client_invalid_wait with (payload: null) {
Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_1360041859(payload);
}}

 state Client_asked_excl
{
entry (payload: null) {
Client_asked_excl_entry164(payload);
}exit {
Client_asked_excl_exit0_rand_473203457(null);
}on unit goto Client_invalid_wait with (payload: null) {
Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_621488594(payload);
}}

 state Client_invalid_wait
{
entry (payload: any) {
Client_invalid_wait_entry0_rand_783597185(payload);
}exit {
Client_invalid_wait_exit0_rand_118441021(null);
}defer ask_share;
defer ask_excl;on invalidate goto Client_invalidating with (payload: null) {
Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_898541804(payload);
}
on grant_excl goto Client_exclusive with (payload: null) {
Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_1437130575(payload);
}
on grant_share goto Client_sharing with (payload: null) {
Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_285575536(payload);
}}

 state Client_asked_ex2
{
entry (payload: null) {
Client_asked_ex2_entry180(payload);
}exit {
Client_asked_ex2_exit0_rand_514647742(null);
}on unit goto Client_sharing_wait with (payload: null) {
Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_1037784014(payload);
}}

 state Client_sharing
{
entry (payload: null) {
Client_sharing_entry189(payload);
}exit {
Client_sharing_exit0_rand_1024772097(null);
}on invalidate goto Client_invalidating with (payload: null) {
Client_sharing_on_invalidate_goto_Client_invalidating0_rand_941360738(payload);
}
on grant_share goto Client_sharing with (payload: null) {
Client_sharing_on_grant_share_goto_Client_sharing0_rand_296291883(payload);
}
on grant_excl goto Client_exclusive with (payload: null) {
Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_1575364250(payload);
}
on ask_share goto Client_sharing with (payload: null) {
Client_sharing_on_ask_share_goto_Client_sharing0_rand_260969480(payload);
}
on ask_excl goto Client_asked_ex2 with (payload: null) {
Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_2146864563(payload);
}}

 state Client_sharing_wait
{
entry (payload: null) {
Client_sharing_wait_entry0_rand_564733829(payload);
}exit {
Client_sharing_wait_exit0_rand_268207308(null);
}defer ask_share;
defer ask_excl;on invalidate goto Client_invalidating with (payload: null) {
Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_1793331612(payload);
}
on grant_share goto Client_sharing_wait with (payload: null) {
Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_1402837669(payload);
}
on grant_excl goto Client_exclusive with (payload: null) {
Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_2136431350(payload);
}}

 state Client_exclusive
{
entry (payload: null) {
Client_exclusive_entry210(payload);
}exit {
Client_exclusive_exit0_rand_169726378(null);
}ignore ask_share;
ignore ask_excl;on invalidate goto Client_invalidating with (payload: null) {
Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_1370922704(payload);
}
on grant_share goto Client_sharing with (payload: null) {
Client_exclusive_on_grant_share_goto_Client_sharing0_rand_1607619850(payload);
}
on grant_excl goto Client_exclusive with (payload: null) {
Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_216646101(payload);
}}

 state Client_invalidating
{
entry (payload: null) {
Client_invalidating_entry219(payload);
}exit {
Client_invalidating_exit0_rand_1071976443(null);
}on wait goto Client_invalid_wait with (payload: null) {
Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_92264397(payload);
}
on normal goto Client_invalid with (payload: null) {
Client_invalidating_on_normal_goto_Client_invalid0_rand_401771955(payload);
}}
}

machine CPU
{
var CPU_cache: (machine, machine, machine);

fun CPU_init_on_unit_goto_CPU_makeReq0_rand_1202889369(CPU_init_on_unit_goto_CPU_makeReq0_rand_1202889369__payload_skip: any)
{


;

;

return;
}
fun CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_1201167383(CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_1201167383__payload_skip: any)
{


;

;

return;
}
fun CPU_init_entry239(CPU_init_entry239_payload: (machine, machine, machine))
{


;

CPU_cache = CPU_init_entry239_payload;
;

raise unit;
return;
}
fun CPU_init_exit0_rand_2038730559(CPU_init_exit0_rand_2038730559__payload_skip: any)
{


;

;

return;
}
fun CPU_makeReq_entry247(CPU_makeReq_entry247__payload_13: null)
{
var Tmp446: bool;
var Tmp447: bool;
var Tmp448: bool;
var Tmp449: bool;
var Tmp450: bool;


;

Tmp446 = $;
if(Tmp446)
{

;

Tmp447 = $;
if(Tmp447)
{

;

send CPU_cache.0, ask_share;

}
else
{

;

send CPU_cache.0, ask_excl;

}


}
else
{

;

Tmp448 = $;
if(Tmp448)
{

;

Tmp449 = $;
if(Tmp449)
{

;

send CPU_cache.1, ask_share;

}
else
{

;

send CPU_cache.1, ask_excl;

}


}
else
{

;

Tmp450 = $;
if(Tmp450)
{

;

send CPU_cache.2, ask_share;

}
else
{

;

send CPU_cache.2, ask_excl;

}


}


}

;

raise unit;
return;
}
fun CPU_makeReq_exit0_rand_916987288(CPU_makeReq_exit0_rand_916987288__payload_skip: any)
{


;

;

return;
}start 
 state CPU_init
{
entry (payload: (machine, machine, machine)) {
CPU_init_entry239(payload);
}exit {
CPU_init_exit0_rand_2038730559(null);
}on unit goto CPU_makeReq with (payload: null) {
CPU_init_on_unit_goto_CPU_makeReq0_rand_1202889369(payload);
}}

 state CPU_makeReq
{
entry (payload: null) {
CPU_makeReq_entry247(payload);
}exit {
CPU_makeReq_exit0_rand_916987288(null);
}on unit goto CPU_makeReq with (payload: null) {
CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_1201167383(payload);
}}
}

