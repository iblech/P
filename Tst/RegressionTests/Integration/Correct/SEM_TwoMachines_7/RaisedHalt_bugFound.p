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

fun PING_Ping_Init_entry12()
{
var _tmp596: machine;


_tmp596 = new PONG(null);

PING_pongId = _tmp596;

raise Success;


}
fun PING_Ping_Init_exit0_rand_970176293()
{


;


}
fun PING_Ping_SendPing_entry20()
{
var _tmp597: bool;
var _tmp598: bool;


PING_count1 = (PING_count1 + 1);

_tmp597 = (PING_count1 == 1);

if(_tmp597)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp598 = (PING_count1 == 2);

if(_tmp598)
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
fun PING_Ping_SendPing_exit0_rand_1843841731()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_783434385()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1851758991()
{


;


}
fun PING_Ping_WaitPong_do_PongIgnored35()
{


assert false;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_206239476()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_294782()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_745257318()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry12();
}
exit  {
PING_Ping_Init_exit0_rand_970176293();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry20();
}
exit  {
PING_Ping_SendPing_exit0_rand_1843841731();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_783434385();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1851758991();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_entry0_rand_1358167314()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_398562303()
{


;


}
fun PONG_Pong_SendPong_entry48(PONG_Pong_SendPong_entry48_payload: machine)
{
var _tmp599: bool;
var _tmp600: bool;


PONG_count2 = (PONG_count2 + 1);

_tmp599 = (PONG_count2 == 1);

if(_tmp599)
{

send PONG_Pong_SendPong_entry48_payload, Pong;

send PONG_Pong_SendPong_entry48_payload, Pong;



}
else
{

;

;



}

_tmp600 = (PONG_count2 == 2);

if(_tmp600)
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
fun PONG_Pong_SendPong_exit0_rand_951197499()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1748159541()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1263375571()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_1358167314();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_398562303();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry48(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_951197499();
}
}
}

