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
var _tmp390: bool;


Host_sharer_list -= 0;
Host_s = sizeof(Host_sharer_list);
_tmp390 = (Host_s == 0);
if(_tmp390)
{

raise grant;

}
else
{

;


}

}
fun Host_init_on_unit_goto_Host_receiveState0_rand_1616974068()
{


;

}
fun Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_162117812()
{


;

}
fun Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_1011256231()
{


;

}
fun Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_1602271329()
{


;

}
fun Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1391080343()
{


;

}
fun Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_664232982()
{


;

}
fun Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_1935393492()
{


;

}
fun Host_inv_on_grant_goto_Host_grantAccess0_rand_1820890962()
{


;

}
fun Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1049257051()
{


;

}
fun Host_init_entry31()
{
var _tmp391: (machine, bool);
var _tmp392: machine;
var _tmp393: (machine, bool);
var _tmp394: machine;
var _tmp395: (machine, bool);
var _tmp396: machine;
var _tmp397: machine;
var _tmp398: bool;


_tmp391 = (this, false);
_tmp392 = new Client(_tmp391);
Host_temp = _tmp392;
Host_clients.0 = Host_temp;
_tmp393 = (this, false);
_tmp394 = new Client(_tmp393);
Host_temp = _tmp394;
Host_clients.1 = Host_temp;
_tmp395 = (this, false);
_tmp396 = new Client(_tmp395);
Host_temp = _tmp396;
Host_clients.2 = Host_temp;
Host_curr_client = null;
_tmp397 = new CPU(Host_clients);
Host_curr_cpu = _tmp397;
_tmp398 = (sizeof(Host_sharer_list) == 0);
assert _tmp398;
raise unit;
}
fun Host_init_exit0_rand_305778871()
{


;

}
fun Host_receiveState_entry0_rand_1953259798()
{


;

}
fun Host_receiveState_exit0_rand_2133077716()
{


;

}
fun Host_ShareRequest_entry55(Host_ShareRequest_entry55_payload: machine)
{


Host_curr_client = Host_ShareRequest_entry55_payload;
Host_is_curr_req_excl = false;
raise unit;
}
fun Host_ShareRequest_exit0_rand_241356917()
{


;

}
fun Host_ExclRequest_entry65(Host_ExclRequest_entry65_payload: machine)
{


Host_curr_client = Host_ExclRequest_entry65_payload;
Host_is_curr_req_excl = true;
raise unit;
}
fun Host_ExclRequest_exit0_rand_1346243834()
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
fun Host_ProcessReq_exit0_rand_2145552217()
{


;

}
fun Host_inv_entry90()
{
var _tmp399: bool;
var _tmp400: machine;


Host_i = 0;
Host_s = sizeof(Host_sharer_list);
_tmp399 = (Host_s == 0);
if(_tmp399)
{

raise grant;

}
else
{

;


}

while((Host_i < Host_s))
{

_tmp400 = Host_sharer_list[Host_i];
send _tmp400, invalidate;
Host_i = (Host_i + 1);

}

}
fun Host_inv_exit0_rand_104184951()
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
fun Host_grantAccess_exit0_rand_408543979()
{


;

}start  state Host_init
{entry  {
Host_init_entry31();
}
exit  {
Host_init_exit0_rand_305778871();
}
on unit goto Host_receiveState with   {
Host_init_on_unit_goto_Host_receiveState0_rand_1616974068();
}
}
 state Host_receiveState
{entry  {
Host_receiveState_entry0_rand_1953259798();
}
exit  {
Host_receiveState_exit0_rand_2133077716();
}
defer invalidate_ack;on req_share goto Host_ShareRequest with  (payload: machine) {
Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_162117812();
}

on req_excl goto Host_ExclRequest with  (payload: machine) {
Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_1011256231();
}
}
 state Host_ShareRequest
{entry (payload: machine) {
Host_ShareRequest_entry55(payload);
}
exit  {
Host_ShareRequest_exit0_rand_241356917();
}
on unit goto Host_ProcessReq with   {
Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_1602271329();
}
}
 state Host_ExclRequest
{entry (payload: machine) {
Host_ExclRequest_entry65(payload);
}
exit  {
Host_ExclRequest_exit0_rand_1346243834();
}
on unit goto Host_ProcessReq with   {
Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_1391080343();
}
}
 state Host_ProcessReq
{entry  {
Host_ProcessReq_entry75();
}
exit  {
Host_ProcessReq_exit0_rand_2145552217();
}
on need_invalidate goto Host_inv with   {
Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_664232982();
}

on grant goto Host_grantAccess with   {
Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_1935393492();
}
}
 state Host_inv
{entry  {
Host_inv_entry90();
}
exit  {
Host_inv_exit0_rand_104184951();
}
defer req_share;
defer req_excl;
on invalidate_ack do   {
Host_rec_ack();
}
on grant goto Host_grantAccess with   {
Host_inv_on_grant_goto_Host_grantAccess0_rand_1820890962();
}
}
 state Host_grantAccess
{entry  {
Host_grantAccess_entry113();
}
exit  {
Host_grantAccess_exit0_rand_408543979();
}
on unit goto Host_receiveState with   {
Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1049257051();
}
}
}

machine Client
{
var Client_host: machine;
var Client_pending: bool;

fun Client_init_on_unit_goto_Client_invalid0_rand_22829034()
{


;

}
fun Client_invalid_on_ask_share_goto_Client_asked_share0_rand_404762779()
{


;

}
fun Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_1962029124()
{


;

}
fun Client_invalid_on_invalidate_goto_Client_invalidating0_rand_2033187759()
{


;

}
fun Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_745182605()
{


;

}
fun Client_invalid_on_grant_share_goto_Client_sharing0_rand_993376653()
{


;

}
fun Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_746718254()
{


;

}
fun Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_1890099035()
{


;

}
fun Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_1491869798()
{


;

}
fun Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_2003690853()
{


;

}
fun Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_1861401233()
{


;

}
fun Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_642702741()
{


;

}
fun Client_sharing_on_invalidate_goto_Client_invalidating0_rand_1770953732()
{


;

}
fun Client_sharing_on_grant_share_goto_Client_sharing0_rand_840822848()
{


;

}
fun Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_1963415785()
{


;

}
fun Client_sharing_on_ask_share_goto_Client_sharing0_rand_1261192598()
{


;

}
fun Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_1149070044()
{


;

}
fun Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_658948372()
{


;

}
fun Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_1213184486()
{


;

}
fun Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_805401211()
{


;

}
fun Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_44338439()
{


;

}
fun Client_exclusive_on_grant_share_goto_Client_sharing0_rand_19352437()
{


;

}
fun Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_2136583668()
{


;

}
fun Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_1125696776()
{


;

}
fun Client_invalidating_on_normal_goto_Client_invalid0_rand_67205167()
{


;

}
fun Client_init_entry135(Client_init_entry135_payload: (machine, bool))
{


Client_host = Client_init_entry135_payload.0;
Client_pending = Client_init_entry135_payload.1;
raise unit;
}
fun Client_init_exit0_rand_644099995()
{


;

}
fun Client_invalid_entry0_rand_837777840()
{


;

}
fun Client_invalid_exit0_rand_1386673535()
{


;

}
fun Client_asked_share_entry155()
{


send Client_host, req_share, this;
Client_pending = true;
raise unit;
}
fun Client_asked_share_exit0_rand_1887261522()
{


;

}
fun Client_asked_excl_entry164()
{


send Client_host, req_excl, this;
Client_pending = true;
raise unit;
}
fun Client_asked_excl_exit0_rand_529151110()
{


;

}
fun Client_invalid_wait_entry0_rand_1741420934()
{


;

}
fun Client_invalid_wait_exit0_rand_400108100()
{


;

}
fun Client_asked_ex2_entry180()
{


send Client_host, req_excl, this;
Client_pending = true;
raise unit;
}
fun Client_asked_ex2_exit0_rand_973272435()
{


;

}
fun Client_sharing_entry189()
{


Client_pending = false;
}
fun Client_sharing_exit0_rand_622528249()
{


;

}
fun Client_sharing_wait_entry0_rand_1802539765()
{


;

}
fun Client_sharing_wait_exit0_rand_598476362()
{


;

}
fun Client_exclusive_entry210()
{


Client_pending = false;
}
fun Client_exclusive_exit0_rand_1993503983()
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
fun Client_invalidating_exit0_rand_1468778611()
{


;

}start  state Client_init
{entry (payload: (machine, bool)) {
Client_init_entry135(payload);
}
exit  {
Client_init_exit0_rand_644099995();
}
on unit goto Client_invalid with   {
Client_init_on_unit_goto_Client_invalid0_rand_22829034();
}
}
 state Client_invalid
{entry  {
Client_invalid_entry0_rand_837777840();
}
exit  {
Client_invalid_exit0_rand_1386673535();
}
on ask_share goto Client_asked_share with   {
Client_invalid_on_ask_share_goto_Client_asked_share0_rand_404762779();
}

on ask_excl goto Client_asked_excl with   {
Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_1962029124();
}

on invalidate goto Client_invalidating with   {
Client_invalid_on_invalidate_goto_Client_invalidating0_rand_2033187759();
}

on grant_excl goto Client_exclusive with   {
Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_745182605();
}

on grant_share goto Client_sharing with   {
Client_invalid_on_grant_share_goto_Client_sharing0_rand_993376653();
}
}
 state Client_asked_share
{entry  {
Client_asked_share_entry155();
}
exit  {
Client_asked_share_exit0_rand_1887261522();
}
on unit goto Client_invalid_wait with   {
Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_746718254();
}
}
 state Client_asked_excl
{entry  {
Client_asked_excl_entry164();
}
exit  {
Client_asked_excl_exit0_rand_529151110();
}
on unit goto Client_invalid_wait with   {
Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_1890099035();
}
}
 state Client_invalid_wait
{entry  {
Client_invalid_wait_entry0_rand_1741420934();
}
exit  {
Client_invalid_wait_exit0_rand_400108100();
}
defer ask_share;
defer ask_excl;on invalidate goto Client_invalidating with   {
Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_1491869798();
}

on grant_excl goto Client_exclusive with   {
Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_2003690853();
}

on grant_share goto Client_sharing with   {
Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_1861401233();
}
}
 state Client_asked_ex2
{entry  {
Client_asked_ex2_entry180();
}
exit  {
Client_asked_ex2_exit0_rand_973272435();
}
on unit goto Client_sharing_wait with   {
Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_642702741();
}
}
 state Client_sharing
{entry  {
Client_sharing_entry189();
}
exit  {
Client_sharing_exit0_rand_622528249();
}
on invalidate goto Client_invalidating with   {
Client_sharing_on_invalidate_goto_Client_invalidating0_rand_1770953732();
}

on grant_share goto Client_sharing with   {
Client_sharing_on_grant_share_goto_Client_sharing0_rand_840822848();
}

on grant_excl goto Client_exclusive with   {
Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_1963415785();
}

on ask_share goto Client_sharing with   {
Client_sharing_on_ask_share_goto_Client_sharing0_rand_1261192598();
}

on ask_excl goto Client_asked_ex2 with   {
Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_1149070044();
}
}
 state Client_sharing_wait
{entry  {
Client_sharing_wait_entry0_rand_1802539765();
}
exit  {
Client_sharing_wait_exit0_rand_598476362();
}
defer ask_share;
defer ask_excl;on invalidate goto Client_invalidating with   {
Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_658948372();
}

on grant_share goto Client_sharing_wait with   {
Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_1213184486();
}

on grant_excl goto Client_exclusive with   {
Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_805401211();
}
}
 state Client_exclusive
{entry  {
Client_exclusive_entry210();
}
exit  {
Client_exclusive_exit0_rand_1993503983();
}
ignore ask_share;
ignore ask_excl;on invalidate goto Client_invalidating with   {
Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_44338439();
}

on grant_share goto Client_sharing with   {
Client_exclusive_on_grant_share_goto_Client_sharing0_rand_19352437();
}

on grant_excl goto Client_exclusive with   {
Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_2136583668();
}
}
 state Client_invalidating
{entry  {
Client_invalidating_entry219();
}
exit  {
Client_invalidating_exit0_rand_1468778611();
}
on wait goto Client_invalid_wait with   {
Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_1125696776();
}

on normal goto Client_invalid with   {
Client_invalidating_on_normal_goto_Client_invalid0_rand_67205167();
}
}
}

model CPU
{
var CPU_cache: (machine, machine, machine);

fun CPU_init_on_unit_goto_CPU_makeReq0_rand_350622592()
{


;

}
fun CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_1690526007()
{


;

}
fun CPU_init_entry239(CPU_init_entry239_payload: (machine, machine, machine))
{


CPU_cache = CPU_init_entry239_payload;
raise unit;
}
fun CPU_init_exit0_rand_1195324093()
{


;

}
fun CPU_makeReq_entry247()
{
var _tmp401: bool;
var _tmp402: bool;
var _tmp403: bool;
var _tmp404: bool;
var _tmp405: bool;


_tmp401 = $;
if(_tmp401)
{

_tmp402 = $;
if(_tmp402)
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

_tmp403 = $;
if(_tmp403)
{

_tmp404 = $;
if(_tmp404)
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

_tmp405 = $;
if(_tmp405)
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
fun CPU_makeReq_exit0_rand_341078731()
{


;

}start  state CPU_init
{entry (payload: (machine, machine, machine)) {
CPU_init_entry239(payload);
}
exit  {
CPU_init_exit0_rand_1195324093();
}
on unit goto CPU_makeReq with   {
CPU_init_on_unit_goto_CPU_makeReq0_rand_350622592();
}
}
 state CPU_makeReq
{entry  {
CPU_makeReq_entry247();
}
exit  {
CPU_makeReq_exit0_rand_341078731();
}
on unit goto CPU_makeReq with   {
CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_1690526007();
}
}
}

