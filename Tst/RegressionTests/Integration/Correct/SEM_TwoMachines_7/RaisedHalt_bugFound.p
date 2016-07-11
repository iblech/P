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
var _tmp1178: machine;


_tmp1178 = new PONG(null);
;
PING_pongId = _tmp1178;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_510541135()
{


;


}
fun PING_Ping_SendPing_entry20(PING_Ping_SendPing_entry20__payload_1: any)
{
var _tmp1179: bool;
var _tmp1180: bool;


PING_count1 = (PING_count1 + 1);
;
_tmp1179 = (PING_count1 == 1);
;
if(_tmp1179)
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
_tmp1180 = (PING_count1 == 2);
;
if(_tmp1180)
{

send PING_pongId, Ping, this;
;
raise halt;
;
send PING_pongId, Ping, this;
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
fun PING_Ping_SendPing_exit0_rand_969066100()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_633422618(PING_Ping_WaitPong_entry0_rand_633422618__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1774624104()
{


;


}
fun PING_Ping_WaitPong_do_PongIgnored35(PING_Ping_WaitPong_do_PongIgnored35__payload_2: any)
{


assert false;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1254494251(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1254494251__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1849473168(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1849473168__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_742012563(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_742012563__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry12(payload);
}
exit  {
PING_Ping_Init_exit0_rand_510541135();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry20(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_969066100();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_633422618(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1774624104();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_entry0_rand_150170045(PONG_Pong_WaitPing_entry0_rand_150170045__payload_3: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1404424367()
{


;


}
fun PONG_Pong_SendPong_entry48(PONG_Pong_SendPong_entry48_payload: machine)
{
var _tmp1181: bool;
var _tmp1182: bool;


PONG_count2 = (PONG_count2 + 1);
;
_tmp1181 = (PONG_count2 == 1);
;
if(_tmp1181)
{

send PONG_Pong_SendPong_entry48_payload, Pong;
;
send PONG_Pong_SendPong_entry48_payload, Pong;



}
else
{

;
;
;



}
;
_tmp1182 = (PONG_count2 == 2);
;
if(_tmp1182)
{

send PONG_Pong_SendPong_entry48_payload, PongIgnored;
;
send PONG_Pong_SendPong_entry48_payload, PongIgnored;



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
fun PONG_Pong_SendPong_exit0_rand_19808735()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2118315813(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2118315813__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_462587345(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_462587345__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_150170045(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1404424367();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry48(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_19808735();
}
}
}

