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
var _tmp1182: machine;


_tmp1182 = new PONG(null);

PING_pongId = _tmp1182;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1961906660()
{


;


}
fun PING_Ping_SendPing_entry23(PING_Ping_SendPing_entry23__payload_1: any)
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_2135586266()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1938712566(PING_Ping_WaitPong_entry0_rand_1938712566__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1160988339()
{


;


}
fun PING_Done_entry0_rand_1972722181(PING_Done_entry0_rand_1972722181__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1726785837()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_15688187(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_15688187__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_575577816(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_575577816__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_289464830(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_289464830__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry15(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1961906660();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry23(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_2135586266();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1938712566(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1160988339();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_1972722181(payload);
}
exit  {
PING_Done_exit0_rand_1726785837();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_entry0_rand_1075746542(PONG_Pong_WaitPing_entry0_rand_1075746542__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_209060209()
{


;


}
fun PONG_Pong_SendPong_entry45(PONG_Pong_SendPong_entry45_payload: machine)
{
var _tmp1183: bool;
var _tmp1184: bool;


PONG_count2 = (PONG_count2 + 1);

_tmp1183 = (PONG_count2 == 1);

if(_tmp1183)
{

send PONG_Pong_SendPong_entry45_payload, Pong;

send PONG_Pong_SendPong_entry45_payload, Pong;



}
else
{

;

;



}

_tmp1184 = (PONG_count2 == 2);

if(_tmp1184)
{

send PONG_Pong_SendPong_entry45_payload, Pong;

raise halt;

send PONG_Pong_SendPong_entry45_payload, Pong;

raise halt;



}
else
{

;

;



}

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1316427332()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2098193857(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2098193857__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1688831226(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1688831226__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1075746542(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_209060209();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry45(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1316427332();
}
}
}

