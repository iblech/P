event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_WaitPong_do_PongIgnored35()
{


assert false;
}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_180096852()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1954090979()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_11816603()
{


;

}
fun PING_Ping_Init_entry12()
{
var _tmp596: machine;


_tmp596 = new PONG(null);
PING_pongId = _tmp596;
raise Success;
}
fun PING_Ping_Init_exit0_rand_635176804()
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

}
else
{

;


}

_tmp598 = (PING_count1 == 2);
if(_tmp598)
{

send PING_pongId, Ping, this;
raise halt;

}
else
{

;


}

raise Success;
}
fun PING_Ping_SendPing_exit0_rand_934509905()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_1620385850()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_192145759()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry12();
}
exit  {
PING_Ping_Init_exit0_rand_635176804();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_180096852();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry20();
}
exit  {
PING_Ping_SendPing_exit0_rand_934509905();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1954090979();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1620385850();
}
exit  {
PING_Ping_WaitPong_exit0_rand_192145759();
}
on PongIgnored do   {
PING_Ping_WaitPong_do_PongIgnored35();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_11816603();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1682070273()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_786062399()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1204645692()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_719797639()
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

}
else
{

;


}

_tmp600 = (PONG_count2 == 2);
if(_tmp600)
{

send PONG_Pong_SendPong_entry48_payload, PongIgnored;

}
else
{

;


}

raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_631745512()
{


;

}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_1204645692();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_719797639();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1682070273();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry48(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_631745512();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_786062399();
}
}
}

