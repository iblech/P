event Ping  assert 1: machine;
event Pong  assert 1;
event Success  assert 1;
event Ding  assert 1;
event Dong  assert 1;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_907013989(PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_907013989__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_667542829(PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_667542829__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1338175797(PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1338175797__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_start_entry13(PING_Ping_start_entry13__payload_0: null)
{
var Tmp647: machine;


;

Tmp647 = new PONG(this);
PING_pongId = Tmp647;
;

raise Success;
return;
}
fun PING_Ping_start_exit0_rand_2098766734(PING_Ping_start_exit0_rand_2098766734__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_ping1_entry21(PING_Ping_ping1_entry21__payload_1: null)
{


;

send PING_pongId, Ping, this;
;

raise Success;
return;
}
fun PING_Ping_ping1_exit0_rand_987488059(PING_Ping_ping1_exit0_rand_987488059__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_ding1_entry30(PING_Ping_ding1_entry30__payload_2: null)
{


;

send PING_pongId, Ding;
return;
}
fun PING_Ping_ding1_exit0_rand_1031063566(PING_Ping_ding1_exit0_rand_1031063566__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_ping2_entry0_rand_876377002(PING_Ping_ping2_entry0_rand_876377002__payload_3: null)
{


;

;

return;
}
fun PING_Ping_ping2_exit0_rand_2143658538(PING_Ping_ping2_exit0_rand_2143658538__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_start
{
entry (payload: null) {
PING_Ping_start_entry13(payload);
}exit {
PING_Ping_start_exit0_rand_2098766734(null);
}on Success goto PING_Ping_ping1 with (payload: null) {
PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_907013989(payload);
}}

 state PING_Ping_ping1
{
entry (payload: null) {
PING_Ping_ping1_entry21(payload);
}exit {
PING_Ping_ping1_exit0_rand_987488059(null);
}on Success push PING_Ping_ding1;
on Dong goto PING_Ping_ping2 with (payload: null) {
PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_667542829(payload);
}}

 state PING_Ping_ding1
{
entry (payload: null) {
PING_Ping_ding1_entry30(payload);
}exit {
PING_Ping_ding1_exit0_rand_1031063566(null);
}}

 state PING_Ping_ping2
{
entry (payload: null) {
PING_Ping_ping2_entry0_rand_876377002(payload);
}exit {
PING_Ping_ping2_exit0_rand_2143658538(null);
}on Pong goto PING_Ping_ping1 with (payload: null) {
PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1338175797(payload);
}}
}

machine PONG
{
var PONG_pingid: machine;

fun PONG__Init_on_Success_goto_PONG_Pong_start0_rand_40611709(PONG__Init_on_Success_goto_PONG_Pong_start0_rand_40611709__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_976279582(PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_976279582__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_1315706458(PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_1315706458__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_860378084(PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_860378084__payload_skip: any)
{


;

;

return;
}
fun PONG__Init_entry47(PONG__Init_entry47_payload: machine)
{


;

PONG_pingid = PONG__Init_entry47_payload;
;

raise Success;
return;
}
fun PONG__Init_exit0_rand_147136301(PONG__Init_exit0_rand_147136301__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_start_entry0_rand_472439404(PONG_Pong_start_entry0_rand_472439404__payload_4: null)
{


;

;

return;
}
fun PONG_Pong_start_exit0_rand_389433939(PONG_Pong_start_exit0_rand_389433939__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_dong1_entry0_rand_736936997(PONG_Pong_dong1_entry0_rand_736936997__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_dong1_exit0_rand_258494362(PONG_Pong_dong1_exit0_rand_258494362__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_dong2_entry63(PONG_Pong_dong2_entry63__payload_5: null)
{


;

send PONG_pingid, Dong;
;

raise Success;
return;
}
fun PONG_Pong_dong2_exit0_rand_911314131(PONG_Pong_dong2_exit0_rand_911314131__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_pong1_entry70(PONG_Pong_pong1_entry70__payload_6: null)
{


;

send PONG_pingid, Pong;
;

raise Success;
return;
}
fun PONG_Pong_pong1_exit0_rand_1825620285(PONG_Pong_pong1_exit0_rand_1825620285__payload_skip: any)
{


;

;

return;
}start 
 state PONG__Init
{
entry (payload: machine) {
PONG__Init_entry47(payload);
}exit {
PONG__Init_exit0_rand_147136301(null);
}on Success goto PONG_Pong_start with (payload: null) {
PONG__Init_on_Success_goto_PONG_Pong_start0_rand_40611709(payload);
}}

 state PONG_Pong_start
{
entry (payload: null) {
PONG_Pong_start_entry0_rand_472439404(payload);
}exit {
PONG_Pong_start_exit0_rand_389433939(null);
}on Ping push PONG_Pong_dong1;
on Success goto PONG_Pong_pong1 with (payload: null) {
PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_976279582(payload);
}}

 state PONG_Pong_dong1
{
entry (payload: any) {
PONG_Pong_dong1_entry0_rand_736936997(payload);
}exit {
PONG_Pong_dong1_exit0_rand_258494362(null);
}on Ding goto PONG_Pong_dong2 with (payload: null) {
PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_1315706458(payload);
}}

 state PONG_Pong_dong2
{
entry (payload: null) {
PONG_Pong_dong2_entry63(payload);
}exit {
PONG_Pong_dong2_exit0_rand_911314131(null);
}}

 state PONG_Pong_pong1
{
entry (payload: null) {
PONG_Pong_pong1_entry70(payload);
}exit {
PONG_Pong_pong1_exit0_rand_1825620285(null);
}on Success goto PONG_Pong_start with (payload: null) {
PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_860378084(payload);
}}
}

