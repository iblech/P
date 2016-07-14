event halt;
event null;
event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_Init_entry15()
{
var _tmp593: machine;


_tmp593 = new PONG(null);

PING_pongId = _tmp593;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1070057120()
{


;


}
fun PING_Ping_SendPing_entry23()
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_1730267508()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1725354688()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1466027545()
{


;


}
fun PING_Done_entry0_rand_1442940395()
{


;


}
fun PING_Done_exit0_rand_623001120()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_754351760()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1205914312()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1223197537()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry15();
}
exit  {
PING_Ping_Init_exit0_rand_1070057120();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry23();
}
exit  {
PING_Ping_SendPing_exit0_rand_1730267508();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1725354688();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1466027545();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_1442940395();
}
exit  {
PING_Done_exit0_rand_623001120();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_entry0_rand_407488768()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_641571256()
{


;


}
fun PONG_Pong_SendPong_entry45(PONG_Pong_SendPong_entry45_payload: machine)
{
var _tmp594: bool;
var _tmp595: bool;


PONG_count2 = (PONG_count2 + 1);

_tmp594 = (PONG_count2 == 1);

if(_tmp594)
{

send PONG_Pong_SendPong_entry45_payload, Pong;

send PONG_Pong_SendPong_entry45_payload, Pong;



}
else
{

;

;



}

_tmp595 = (PONG_count2 == 2);

if(_tmp595)
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
fun PONG_Pong_SendPong_exit0_rand_951307898()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1011292216()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_451200151()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_407488768();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_641571256();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry45(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_951307898();
}
}
}

