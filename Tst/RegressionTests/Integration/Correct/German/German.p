event halt;
event null;
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

raise grant;



}
else
{

;

;



}


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
fun Host_init_exit0_rand_1867533991()
{


;


}
fun Host_receiveState_entry0_rand_391762014()
{


;


}
fun Host_receiveState_exit0_rand_1344935710()
{


;


}
fun Host_ShareRequest_entry55(Host_ShareRequest_entry55_payload: machine)
{


Host_curr_client = Host_ShareRequest_entry55_payload;

Host_is_curr_req_excl = false;

raise unit;


}
fun Host_ShareRequest_exit0_rand_1018965524()
{


;


}
fun Host_ExclRequest_entry65(Host_ExclRequest_entry65_payload: machine)
{


Host_curr_client = Host_ExclRequest_entry65_payload;

Host_is_curr_req_excl = true;

raise unit;


}
fun Host_ExclRequest_exit0_rand_858480423()
{


;


}
fun Host_ProcessReq_entry75()
{


if((Host_is_curr_req_excl || Host_is_excl_granted))
{

raise need_invalidate;

raise need_invalidate;



}
else
{

raise grant;

raise grant;



}


}
fun Host_ProcessReq_exit0_rand_1211590250()
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

raise grant;



}
else
{

;

;



}

while((Host_i < Host_s))
{

_tmp400 = Host_sharer_list[Host_i];

send _tmp400, invalidate;

Host_i = (Host_i + 1);

send Host_sharer_list[Host_i], invalidate;

Host_i = (Host_i + 1);



}


}
fun Host_inv_exit0_rand_254387498()
{


;


}
fun Host_grantAccess_entry113()
{


if(Host_is_curr_req_excl)
{

Host_is_excl_granted = true;

send Host_curr_client, grant_excl;

Host_is_excl_granted = true;

send Host_curr_client, grant_excl;



}
else
{

send Host_curr_client, grant_share;

send Host_curr_client, grant_share;



}

Host_sharer_list += (0, Host_curr_client);

raise unit;


}
fun Host_grantAccess_exit0_rand_557944214()
{


;


}
fun Host_init_on_unit_goto_Host_receiveState0_rand_899612167()
{


;


}
fun Host_receiveState_on_req_share_goto_Host_ShareRequest0_rand_963107127()
{


;


}
fun Host_receiveState_on_req_excl_goto_Host_ExclRequest0_rand_1663375983()
{


;


}
fun Host_ShareRequest_on_unit_goto_Host_ProcessReq0_rand_277584238()
{


;


}
fun Host_ExclRequest_on_unit_goto_Host_ProcessReq0_rand_156372641()
{


;


}
fun Host_ProcessReq_on_need_invalidate_goto_Host_inv0_rand_559121369()
{


;


}
fun Host_ProcessReq_on_grant_goto_Host_grantAccess0_rand_1363701144()
{


;


}
fun Host_inv_on_grant_goto_Host_grantAccess0_rand_1300868531()
{


;


}
fun Host_grantAccess_on_unit_goto_Host_receiveState0_rand_1242747149()
{


;


}start  state Host_init
{entry  {
Host_init_entry31();
}
exit  {
Host_init_exit0_rand_1867533991();
}
}
 state Host_receiveState
{entry  {
Host_receiveState_entry0_rand_391762014();
}
exit  {
Host_receiveState_exit0_rand_1344935710();
}
}
 state Host_ShareRequest
{entry (payload: machine) {
Host_ShareRequest_entry55(payload);
}
exit  {
Host_ShareRequest_exit0_rand_1018965524();
}
}
 state Host_ExclRequest
{entry (payload: machine) {
Host_ExclRequest_entry65(payload);
}
exit  {
Host_ExclRequest_exit0_rand_858480423();
}
}
 state Host_ProcessReq
{entry  {
Host_ProcessReq_entry75();
}
exit  {
Host_ProcessReq_exit0_rand_1211590250();
}
}
 state Host_inv
{entry  {
Host_inv_entry90();
}
exit  {
Host_inv_exit0_rand_254387498();
}
}
 state Host_grantAccess
{entry  {
Host_grantAccess_entry113();
}
exit  {
Host_grantAccess_exit0_rand_557944214();
}
}
}

machine Client
{
var Client_host: machine;
var Client_pending: bool;

fun Client_init_entry135(Client_init_entry135_payload: (machine, bool))
{


Client_host = Client_init_entry135_payload.0;

Client_pending = Client_init_entry135_payload.1;

raise unit;


}
fun Client_init_exit0_rand_1788904502()
{


;


}
fun Client_invalid_entry0_rand_570589011()
{


;


}
fun Client_invalid_exit0_rand_27066240()
{


;


}
fun Client_asked_share_entry155()
{


send Client_host, req_share, this;

Client_pending = true;

raise unit;


}
fun Client_asked_share_exit0_rand_662257278()
{


;


}
fun Client_asked_excl_entry164()
{


send Client_host, req_excl, this;

Client_pending = true;

raise unit;


}
fun Client_asked_excl_exit0_rand_1280258625()
{


;


}
fun Client_invalid_wait_entry0_rand_1482093050()
{


;


}
fun Client_invalid_wait_exit0_rand_1934449046()
{


;


}
fun Client_asked_ex2_entry180()
{


send Client_host, req_excl, this;

Client_pending = true;

raise unit;


}
fun Client_asked_ex2_exit0_rand_218668796()
{


;


}
fun Client_sharing_entry189()
{


Client_pending = false;


}
fun Client_sharing_exit0_rand_1057264711()
{


;


}
fun Client_sharing_wait_entry0_rand_287121461()
{


;


}
fun Client_sharing_wait_exit0_rand_1842425534()
{


;


}
fun Client_exclusive_entry210()
{


Client_pending = false;


}
fun Client_exclusive_exit0_rand_334617632()
{


;


}
fun Client_invalidating_entry219()
{


send Client_host, invalidate_ack;

if(Client_pending)
{

raise wait;

raise wait;



}
else
{

raise normal;

raise normal;



}


}
fun Client_invalidating_exit0_rand_2147066704()
{


;


}
fun Client_init_on_unit_goto_Client_invalid0_rand_930509426()
{


;


}
fun Client_invalid_on_ask_share_goto_Client_asked_share0_rand_708789353()
{


;


}
fun Client_invalid_on_ask_excl_goto_Client_asked_excl0_rand_187278698()
{


;


}
fun Client_invalid_on_invalidate_goto_Client_invalidating0_rand_1363507016()
{


;


}
fun Client_invalid_on_grant_excl_goto_Client_exclusive0_rand_170090429()
{


;


}
fun Client_invalid_on_grant_share_goto_Client_sharing0_rand_506035684()
{


;


}
fun Client_asked_share_on_unit_goto_Client_invalid_wait0_rand_1153461468()
{


;


}
fun Client_asked_excl_on_unit_goto_Client_invalid_wait0_rand_1240678056()
{


;


}
fun Client_invalid_wait_on_invalidate_goto_Client_invalidating0_rand_1479619270()
{


;


}
fun Client_invalid_wait_on_grant_excl_goto_Client_exclusive0_rand_1142103880()
{


;


}
fun Client_invalid_wait_on_grant_share_goto_Client_sharing0_rand_433837994()
{


;


}
fun Client_asked_ex2_on_unit_goto_Client_sharing_wait0_rand_190033729()
{


;


}
fun Client_sharing_on_invalidate_goto_Client_invalidating0_rand_93634533()
{


;


}
fun Client_sharing_on_grant_share_goto_Client_sharing0_rand_87299935()
{


;


}
fun Client_sharing_on_grant_excl_goto_Client_exclusive0_rand_1177807054()
{


;


}
fun Client_sharing_on_ask_share_goto_Client_sharing0_rand_1438617471()
{


;


}
fun Client_sharing_on_ask_excl_goto_Client_asked_ex20_rand_269435911()
{


;


}
fun Client_sharing_wait_on_invalidate_goto_Client_invalidating0_rand_1873977339()
{


;


}
fun Client_sharing_wait_on_grant_share_goto_Client_sharing_wait0_rand_984427187()
{


;


}
fun Client_sharing_wait_on_grant_excl_goto_Client_exclusive0_rand_453585279()
{


;


}
fun Client_exclusive_on_invalidate_goto_Client_invalidating0_rand_2059142387()
{


;


}
fun Client_exclusive_on_grant_share_goto_Client_sharing0_rand_1549968378()
{


;


}
fun Client_exclusive_on_grant_excl_goto_Client_exclusive0_rand_1532531541()
{


;


}
fun Client_invalidating_on_wait_goto_Client_invalid_wait0_rand_1525747881()
{


;


}
fun Client_invalidating_on_normal_goto_Client_invalid0_rand_1101872329()
{


;


}start  state Client_init
{entry (payload: (machine, bool)) {
Client_init_entry135(payload);
}
exit  {
Client_init_exit0_rand_1788904502();
}
}
 state Client_invalid
{entry  {
Client_invalid_entry0_rand_570589011();
}
exit  {
Client_invalid_exit0_rand_27066240();
}
}
 state Client_asked_share
{entry  {
Client_asked_share_entry155();
}
exit  {
Client_asked_share_exit0_rand_662257278();
}
}
 state Client_asked_excl
{entry  {
Client_asked_excl_entry164();
}
exit  {
Client_asked_excl_exit0_rand_1280258625();
}
}
 state Client_invalid_wait
{entry  {
Client_invalid_wait_entry0_rand_1482093050();
}
exit  {
Client_invalid_wait_exit0_rand_1934449046();
}
}
 state Client_asked_ex2
{entry  {
Client_asked_ex2_entry180();
}
exit  {
Client_asked_ex2_exit0_rand_218668796();
}
}
 state Client_sharing
{entry  {
Client_sharing_entry189();
}
exit  {
Client_sharing_exit0_rand_1057264711();
}
}
 state Client_sharing_wait
{entry  {
Client_sharing_wait_entry0_rand_287121461();
}
exit  {
Client_sharing_wait_exit0_rand_1842425534();
}
}
 state Client_exclusive
{entry  {
Client_exclusive_entry210();
}
exit  {
Client_exclusive_exit0_rand_334617632();
}
}
 state Client_invalidating
{entry  {
Client_invalidating_entry219();
}
exit  {
Client_invalidating_exit0_rand_2147066704();
}
}
}

model CPU
{
var CPU_cache: (machine, machine, machine);

fun CPU_init_entry239(CPU_init_entry239_payload: (machine, machine, machine))
{


CPU_cache = CPU_init_entry239_payload;

raise unit;


}
fun CPU_init_exit0_rand_341786110()
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

send CPU_cache.0, ask_share;



}
else
{

send CPU_cache.0, ask_excl;

send CPU_cache.0, ask_excl;



}

if($)
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

send CPU_cache.1, ask_share;



}
else
{

send CPU_cache.1, ask_excl;

send CPU_cache.1, ask_excl;



}

if($)
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

send CPU_cache.2, ask_share;



}
else
{

send CPU_cache.2, ask_excl;

send CPU_cache.2, ask_excl;



}

if($)
{
send CPU_cache.2, ask_share;

}
else
{
send CPU_cache.2, ask_excl;

}



}

if($)
{
if($)
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
if($)
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
fun CPU_makeReq_exit0_rand_1437373332()
{


;


}
fun CPU_init_on_unit_goto_CPU_makeReq0_rand_445323543()
{


;


}
fun CPU_makeReq_on_unit_goto_CPU_makeReq0_rand_55858397()
{


;


}start  state CPU_init
{entry (payload: (machine, machine, machine)) {
CPU_init_entry239(payload);
}
exit  {
CPU_init_exit0_rand_341786110();
}
}
 state CPU_makeReq
{entry  {
CPU_makeReq_entry247();
}
exit  {
CPU_makeReq_exit0_rand_1437373332();
}
}
}

