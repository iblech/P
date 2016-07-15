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
var Tmp390: bool;


Host_sharer_list -= 0;
Host_s = sizeof(Host_sharer_list);
Tmp390 = (Host_s == 0);
if(Tmp390)
{

raise grant;

}
else
{

;


}

}
fun Host_init_on_unit_goto_Host_receiveState0_rand_61085727()
{


;

}
fun Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_148841802()
{


;

}
fun Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_486879945()
{


;

}
fun Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_98927392()
{


;

}
fun Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1839406248()
{


;

}
fun Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_167590355()
{


;

}
fun Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_1663703788()
{


;

}
fun Host_inv_on_grant_goto_Host_grantAccess0_rand_1247503703()
{


;

}
fun Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1172052015()
{


;

}
fun Host_init_entry31()
{
var Tmp391: (machine, bool);
var Tmp392: machine;
var Tmp393: (machine, bool);
var Tmp394: machine;
var Tmp395: (machine, bool);
var Tmp396: machine;
var Tmp397: machine;
var Tmp398: bool;


Tmp391 = (this, false);
Tmp392 = new Client(Tmp391);
Host_temp = Tmp392;
Host_clients.0 = Host_temp;
Tmp393 = (this, false);
Tmp394 = new Client(Tmp393);
Host_temp = Tmp394;
Host_clients.1 = Host_temp;
Tmp395 = (this, false);
Tmp396 = new Client(Tmp395);
Host_temp = Tmp396;
Host_clients.2 = Host_temp;
Host_curr_client = null;
Tmp397 = new CPU(Host_clients);
Host_curr_cpu = Tmp397;
Tmp398 = (sizeof(Host_sharer_list) == 0);
assert Tmp398;
raise unit;
}
fun Host_init_exit0_rand_978308093()
{


;

}
fun Host_receiveState_entry0_rand_363353431()
{


;

}
fun Host_receiveState_exit0_rand_30193902()
{


;

}
fun Host_ShareRequest_entry55(Host_ShareRequest_entry55_payload: machine)
{


Host_curr_client = Host_ShareRequest_entry55_payload;
Host_is_curr_req_excl = false;
raise unit;
}
fun Host_ShareRequest_exit0_rand_1940062901()
{


;

}
fun Host_ExclRequest_entry65(Host_ExclRequest_entry65_payload: machine)
{


Host_curr_client = Host_ExclRequest_entry65_payload;
Host_is_curr_req_excl = true;
raise unit;
}
fun Host_ExclRequest_exit0_rand_831256180()
{


;

}
fun Host_ProcessReq_entry75()
{


if((Host_is_curr_req_excl || Host_is_excl_granted))
{

raise need_invalidate;

}
else
{

raise grant;

}

}
fun Host_ProcessReq_exit0_rand_1768377537()
{


;

}
fun Host_inv_entry90()
{
var Tmp399: bool;
var Tmp400: machine;


Host_i = 0;
Host_s = sizeof(Host_sharer_list);
Tmp399 = (Host_s == 0);
if(Tmp399)
{

raise grant;

}
else
{

;


}

while((Host_i < Host_s))
{

Tmp400 = Host_sharer_list[Host_i];
send Tmp400, invalidate;
Host_i = (Host_i + 1);

}

}
fun Host_inv_exit0_rand_432589763()
{


;

}
fun Host_grantAccess_entry113()
{


if(Host_is_curr_req_excl)
{

Host_is_excl_granted = true;
send Host_curr_client, grant_excl;

}
else
{

send Host_curr_client, grant_share;

}

Host_sharer_list += (0, Host_curr_client);
raise unit;
}
fun Host_grantAccess_exit0_rand_438128314()
{


;

}start 
 state Host_init
{
entry  {
Host_init_entry31();
}
exit  {
Host_init_exit0_rand_978308093();
}
on unit goto Host_receiveState with   {
Host_init_on_unit_goto_Host_receiveState0_rand_61085727();
}
}

 state Host_receiveState
{
entry  {
Host_receiveState_entry0_rand_363353431();
}
exit  {
Host_receiveState_exit0_rand_30193902();
}
defer invalidate_ack;on req_share goto Host_ShareRequest with  (payload: machine) {
Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_148841802();
}

on req_excl goto Host_ExclRequest with  (payload: machine) {
Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_486879945();
}
}

 state Host_ShareRequest
{
entry (payload: machine) {
Host_ShareRequest_entry55(payload);
}
exit  {
Host_ShareRequest_exit0_rand_1940062901();
}
on unit goto Host_ProcessReq with   {
Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_98927392();
}
}

 state Host_ExclRequest
{
entry (payload: machine) {
Host_ExclRequest_entry65(payload);
}
exit  {
Host_ExclRequest_exit0_rand_831256180();
}
on unit goto Host_ProcessReq with   {
Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1839406248();
}
}

 state Host_ProcessReq
{
entry  {
Host_ProcessReq_entry75();
}
exit  {
Host_ProcessReq_exit0_rand_1768377537();
}
on need_invalidate goto Host_inv with   {
Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_167590355();
}

on grant goto Host_grantAccess with   {
Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_1663703788();
}
}

 state Host_inv
{
entry  {
Host_inv_entry90();
}
exit  {
Host_inv_exit0_rand_432589763();
}
defer req_share;
defer req_excl;
on invalidate_ack do   {
Host_rec_ack();
}
on grant goto Host_grantAccess with   {
Host_inv_on_grant_goto_Host_grantAccess0_rand_1247503703();
}
}

 state Host_grantAccess
{
entry  {
Host_grantAccess_entry113();
}
exit  {
Host_grantAccess_exit0_rand_438128314();
}
on unit goto Host_receiveState with   {
Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1172052015();
}
}
}

machine Client
{
var Client_host: machine;
var Client_pending: bool;

fun Client_init_on_unit_goto_Client_invalid0_rand_1024945071()
{


;

}
fun Client_invalid_on_ask_share_goto_Client_asked_share0_rand_1167915071()
{


;

}
fun Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_1368338095()
{


;

}
fun Client_invalid_on_invalidate_goto_Client_invalidating0_rand_215985502()
{


;

}
fun Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_1780494518()
{


;

}
fun Client_invalid_on_grant_share_goto_Client_sharing0_rand_818374730()
{


;

}
fun Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_323897508()
{


;

}
fun Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_179603172()
{


;

}
fun Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_535311036()
{


;

}
fun Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_886572376()
{


;

}
fun Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_1015834788()
{


;

}
fun Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_39661452()
{


;

}
fun Client_sharing_on_invalidate_goto_Client_invalidating0_rand_1209670801()
{


;

}
fun Client_sharing_on_grant_share_goto_Client_sharing0_rand_753031159()
{


;

}
fun Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_897116398()
{


;

}
fun Client_sharing_on_ask_share_goto_Client_sharing0_rand_1227852667()
{


;

}
fun Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_856981028()
{


;

}
fun Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_991972149()
{


;

}
fun Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_652218369()
{


;

}
fun Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_1245101598()
{


;

}
fun Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_154968940()
{


;

}
fun Client_exclusive_on_grant_share_goto_Client_sharing0_rand_35353192()
{


;

}
fun Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_221427896()
{


;

}
fun Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_516274314()
{


;

}
fun Client_invalidating_on_normal_goto_Client_invalid0_rand_1484052225()
{


;

}
fun Client_init_entry135(Client_init_entry135_payload: (machine, bool))
{


Client_host = Client_init_entry135_payload.0;
Client_pending = Client_init_entry135_payload.1;
raise unit;
}
fun Client_init_exit0_rand_1679576491()
{


;

}
fun Client_invalid_entry0_rand_1065607787()
{


;

}
fun Client_invalid_exit0_rand_376561324()
{


;

}
fun Client_asked_share_entry155()
{


send Client_host, req_share, this;
Client_pending = true;
raise unit;
}
fun Client_asked_share_exit0_rand_1804016979()
{


;

}
fun Client_asked_excl_entry164()
{


send Client_host, req_excl, this;
Client_pending = true;
raise unit;
}
fun Client_asked_excl_exit0_rand_498753635()
{


;

}
fun Client_invalid_wait_entry0_rand_524722336()
{


;

}
fun Client_invalid_wait_exit0_rand_559662444()
{


;

}
fun Client_asked_ex2_entry180()
{


send Client_host, req_excl, this;
Client_pending = true;
raise unit;
}
fun Client_asked_ex2_exit0_rand_1844913860()
{


;

}
fun Client_sharing_entry189()
{


Client_pending = false;
}
fun Client_sharing_exit0_rand_1991211848()
{


;

}
fun Client_sharing_wait_entry0_rand_106955843()
{


;

}
fun Client_sharing_wait_exit0_rand_1720645147()
{


;

}
fun Client_exclusive_entry210()
{


Client_pending = false;
}
fun Client_exclusive_exit0_rand_998898573()
{


;

}
fun Client_invalidating_entry219()
{


send Client_host, invalidate_ack;
if(Client_pending)
{

raise wait;

}
else
{

raise normal;

}

}
fun Client_invalidating_exit0_rand_1543294290()
{


;

}start 
 state Client_init
{
entry (payload: (machine, bool)) {
Client_init_entry135(payload);
}
exit  {
Client_init_exit0_rand_1679576491();
}
on unit goto Client_invalid with   {
Client_init_on_unit_goto_Client_invalid0_rand_1024945071();
}
}

 state Client_invalid
{
entry  {
Client_invalid_entry0_rand_1065607787();
}
exit  {
Client_invalid_exit0_rand_376561324();
}
on ask_share goto Client_asked_share with   {
Client_invalid_on_ask_share_goto_Client_asked_share0_rand_1167915071();
}

on ask_excl goto Client_asked_excl with   {
Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_1368338095();
}

on invalidate goto Client_invalidating with   {
Client_invalid_on_invalidate_goto_Client_invalidating0_rand_215985502();
}

on grant_excl goto Client_exclusive with   {
Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_1780494518();
}

on grant_share goto Client_sharing with   {
Client_invalid_on_grant_share_goto_Client_sharing0_rand_818374730();
}
}

 state Client_asked_share
{
entry  {
Client_asked_share_entry155();
}
exit  {
Client_asked_share_exit0_rand_1804016979();
}
on unit goto Client_invalid_wait with   {
Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_323897508();
}
}

 state Client_asked_excl
{
entry  {
Client_asked_excl_entry164();
}
exit  {
Client_asked_excl_exit0_rand_498753635();
}
on unit goto Client_invalid_wait with   {
Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_179603172();
}
}

 state Client_invalid_wait
{
entry  {
Client_invalid_wait_entry0_rand_524722336();
}
exit  {
Client_invalid_wait_exit0_rand_559662444();
}
defer ask_share;
defer ask_excl;on invalidate goto Client_invalidating with   {
Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_535311036();
}

on grant_excl goto Client_exclusive with   {
Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_886572376();
}

on grant_share goto Client_sharing with   {
Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_1015834788();
}
}

 state Client_asked_ex2
{
entry  {
Client_asked_ex2_entry180();
}
exit  {
Client_asked_ex2_exit0_rand_1844913860();
}
on unit goto Client_sharing_wait with   {
Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_39661452();
}
}

 state Client_sharing
{
entry  {
Client_sharing_entry189();
}
exit  {
Client_sharing_exit0_rand_1991211848();
}
on invalidate goto Client_invalidating with   {
Client_sharing_on_invalidate_goto_Client_invalidating0_rand_1209670801();
}

on grant_share goto Client_sharing with   {
Client_sharing_on_grant_share_goto_Client_sharing0_rand_753031159();
}

on grant_excl goto Client_exclusive with   {
Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_897116398();
}

on ask_share goto Client_sharing with   {
Client_sharing_on_ask_share_goto_Client_sharing0_rand_1227852667();
}

on ask_excl goto Client_asked_ex2 with   {
Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_856981028();
}
}

 state Client_sharing_wait
{
entry  {
Client_sharing_wait_entry0_rand_106955843();
}
exit  {
Client_sharing_wait_exit0_rand_1720645147();
}
defer ask_share;
defer ask_excl;on invalidate goto Client_invalidating with   {
Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_991972149();
}

on grant_share goto Client_sharing_wait with   {
Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_652218369();
}

on grant_excl goto Client_exclusive with   {
Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_1245101598();
}
}

 state Client_exclusive
{
entry  {
Client_exclusive_entry210();
}
exit  {
Client_exclusive_exit0_rand_998898573();
}
ignore ask_share;
ignore ask_excl;on invalidate goto Client_invalidating with   {
Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_154968940();
}

on grant_share goto Client_sharing with   {
Client_exclusive_on_grant_share_goto_Client_sharing0_rand_35353192();
}

on grant_excl goto Client_exclusive with   {
Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_221427896();
}
}

 state Client_invalidating
{
entry  {
Client_invalidating_entry219();
}
exit  {
Client_invalidating_exit0_rand_1543294290();
}
on wait goto Client_invalid_wait with   {
Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_516274314();
}

on normal goto Client_invalid with   {
Client_invalidating_on_normal_goto_Client_invalid0_rand_1484052225();
}
}
}

model CPU
{
var CPU_cache: (machine, machine, machine);

fun CPU_init_on_unit_goto_CPU_makeReq0_rand_798406031()
{


;

}
fun CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_213263475()
{


;

}
fun CPU_init_entry239(CPU_init_entry239_payload: (machine, machine, machine))
{


CPU_cache = CPU_init_entry239_payload;
raise unit;
}
fun CPU_init_exit0_rand_1737247194()
{


;

}
fun CPU_makeReq_entry247()
{
var Tmp401: bool;
var Tmp402: bool;
var Tmp403: bool;
var Tmp404: bool;
var Tmp405: bool;


Tmp401 = $;
if(Tmp401)
{

Tmp402 = $;
if(Tmp402)
{

send CPU_cache.0, ask_share;

}
else
{

send CPU_cache.0, ask_excl;

}


}
else
{

Tmp403 = $;
if(Tmp403)
{

Tmp404 = $;
if(Tmp404)
{

send CPU_cache.1, ask_share;

}
else
{

send CPU_cache.1, ask_excl;

}


}
else
{

Tmp405 = $;
if(Tmp405)
{

send CPU_cache.2, ask_share;

}
else
{

send CPU_cache.2, ask_excl;

}


}


}

raise unit;
}
fun CPU_makeReq_exit0_rand_1018558372()
{


;

}start 
 state CPU_init
{
entry (payload: (machine, machine, machine)) {
CPU_init_entry239(payload);
}
exit  {
CPU_init_exit0_rand_1737247194();
}
on unit goto CPU_makeReq with   {
CPU_init_on_unit_goto_CPU_makeReq0_rand_798406031();
}
}

 state CPU_makeReq
{
entry  {
CPU_makeReq_entry247();
}
exit  {
CPU_makeReq_exit0_rand_1018558372();
}
on unit goto CPU_makeReq with   {
CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_213263475();
}
}
}

