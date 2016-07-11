event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_Init_entry12(PING_Ping_Init_entry12__payload_0: any)
{
var _tmp1185: machine;


_tmp1185 = new PONG(null);

PING_pongId = _tmp1185;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1102178545()
{


;


}
fun PING_Ping_SendPing_entry20(PING_Ping_SendPing_entry20__payload_1: any)
{
var _tmp1186: bool;
var _tmp1187: bool;


PING_count1 = (PING_count1 + 1);

_tmp1186 = (PING_count1 == 1);

if(_tmp1186)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp1187 = (PING_count1 == 2);

if(_tmp1187)
{

send PING_pongId, Ping, this;

raise halt;

send PING_pongId, Ping, this;

raise halt;



}
else
{

;

;



}

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_46226675()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_795046139(PING_Ping_WaitPong_entry0_rand_795046139__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1365297397()
{


;


}
fun PING_Ping_WaitPong_do_PongIgnored35(PING_Ping_WaitPong_do_PongIgnored35__payload_2: any)
{


assert false;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_527408168(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_527408168__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_735145839(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_735145839__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1343437337(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1343437337__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry12(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1102178545();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry20(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_46226675();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_795046139(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1365297397();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_entry0_rand_599599863(PONG_Pong_WaitPing_entry0_rand_599599863__payload_3: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1968443482()
{


;


}
fun PONG_Pong_SendPong_entry48(PONG_Pong_SendPong_entry48_payload: machine)
{
var _tmp1188: bool;
var _tmp1189: bool;


PONG_count2 = (PONG_count2 + 1);

_tmp1188 = (PONG_count2 == 1);

if(_tmp1188)
{

send PONG_Pong_SendPong_entry48_payload, Pong;

send PONG_Pong_SendPong_entry48_payload, Pong;



}
else
{

;

;



}

_tmp1189 = (PONG_count2 == 2);

if(_tmp1189)
{

send PONG_Pong_SendPong_entry48_payload, PongIgnored;

send PONG_Pong_SendPong_entry48_payload, PongIgnored;



}
else
{

;

;



}

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_884976438()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1889463864(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1889463864__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1938994592(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1938994592__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_599599863(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1968443482();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry48(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_884976438();
}
}
}

