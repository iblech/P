event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_Init_entry15(PING_Ping_Init_entry15__payload_0: any)
{
var _tmp1175: machine;


_tmp1175 = new PONG(null);
;
PING_pongId = _tmp1175;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_1954898281()
{


;


}
fun PING_Ping_SendPing_entry23(PING_Ping_SendPing_entry23__payload_1: any)
{


send PING_pongId, Ping, this;
;
raise Success;


}
fun PING_Ping_SendPing_exit0_rand_268756523()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_260950940(PING_Ping_WaitPong_entry0_rand_260950940__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_933771438()
{


;


}
fun PING_Done_entry0_rand_361886379(PING_Done_entry0_rand_361886379__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_843718319()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1685766381(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1685766381__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_720936349(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_720936349__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2104970394(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2104970394__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry15(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1954898281();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry23(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_268756523();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_260950940(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_933771438();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_361886379(payload);
}
exit  {
PING_Done_exit0_rand_843718319();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_entry0_rand_1643510073(PONG_Pong_WaitPing_entry0_rand_1643510073__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1276349698()
{


;


}
fun PONG_Pong_SendPong_entry45(PONG_Pong_SendPong_entry45_payload: machine)
{
var _tmp1176: bool;
var _tmp1177: bool;


PONG_count2 = (PONG_count2 + 1);
;
_tmp1176 = (PONG_count2 == 1);
;
if(_tmp1176)
{

send PONG_Pong_SendPong_entry45_payload, Pong;
;
send PONG_Pong_SendPong_entry45_payload, Pong;



}
else
{

;
;
;



}
;
_tmp1177 = (PONG_count2 == 2);
;
if(_tmp1177)
{

send PONG_Pong_SendPong_entry45_payload, Pong;
;
raise halt;
;
send PONG_Pong_SendPong_entry45_payload, Pong;
;
raise halt;



}
else
{

;
;
;



}
;
raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1258448417()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_217189062(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_217189062__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1612410504(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1612410504__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1643510073(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1276349698();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry45(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1258448417();
}
}
}

