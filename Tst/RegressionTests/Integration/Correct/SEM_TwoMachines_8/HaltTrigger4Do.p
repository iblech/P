event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: any)
{
var _tmp1183: machine;


_tmp1183 = new PONG(null);
;
PING_pongId = _tmp1183;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_265435097()
{


;


}
fun PING_Ping_SendPing_entry21(PING_Ping_SendPing_entry21__payload_1: any)
{
var _tmp1184: bool;
var _tmp1185: bool;


PING_count = (PING_count + 1);
;
_tmp1184 = (PING_count == 1);
;
if(_tmp1184)
{

send PING_pongId, Ping, this;
;
send PING_pongId, Ping, this;



}
else
{

;
;
;



}
;
_tmp1185 = (PING_count == 2);
;
if(_tmp1185)
{

send PING_pongId, halt;
;
send PING_pongId, PingIgnored;
;
send PING_pongId, halt;
;
send PING_pongId, PingIgnored;



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
fun PING_Ping_SendPing_exit0_rand_541859350()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_250693116(PING_Ping_WaitPong_entry0_rand_250693116__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1936719961()
{


;


}
fun PING_Done_entry0_rand_975261913(PING_Done_entry0_rand_975261913__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1557417057()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2001578024(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2001578024__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1860259005(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1860259005__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_575647712(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_575647712__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry13(payload);
}
exit  {
PING_Ping_Init_exit0_rand_265435097();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry21(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_541859350();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_250693116(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1936719961();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_975261913(payload);
}
exit  {
PING_Done_exit0_rand_1557417057();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_579856338(PONG_Pong_WaitPing_entry0_rand_579856338__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1311523334()
{


;


}
fun PONG_Pong_SendPong_entry52(PONG_Pong_SendPong_entry52_payload: machine)
{


send PONG_Pong_SendPong_entry52_payload, Pong;
;
raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_2097054286()
{


;


}
fun PONG_Pong_Halt_entry0_rand_52950043(PONG_Pong_Halt_entry0_rand_52950043__payload_skip: any)
{


;


}
fun PONG_Pong_Halt_exit0_rand_2063434027()
{


;


}
fun PONG_Pong_SendPong_do_PingIgnored56(PONG_Pong_SendPong_do_PingIgnored56__payload_3: any)
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1351161583(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1351161583__payload_skip: any)
{


;


}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_963935360(PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_963935360__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1943028677(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1943028677__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_579856338(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1311523334();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry52(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_2097054286();
}
}
 state PONG_Pong_Halt
{entry (payload: any) {
PONG_Pong_Halt_entry0_rand_52950043(payload);
}
exit  {
PONG_Pong_Halt_exit0_rand_2063434027();
}
}
}

