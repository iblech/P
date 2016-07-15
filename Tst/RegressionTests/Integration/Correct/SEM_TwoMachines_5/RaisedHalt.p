event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1436516475()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1520976158()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1653419971()
{


;

}
fun PING_Ping_Init_entry15()
{
var _tmp593: machine;


_tmp593 = new PONG(null);
PING_pongId = _tmp593;
raise Success;
}
fun PING_Ping_Init_exit0_rand_850728362()
{


;

}
fun PING_Ping_SendPing_entry23()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_SendPing_exit0_rand_303718930()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_1955306207()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_1604102499()
{


;

}
fun PING_Done_entry0_rand_987525344()
{


;

}
fun PING_Done_exit0_rand_228812096()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry15();
}
exit  {
PING_Ping_Init_exit0_rand_850728362();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1436516475();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry23();
}
exit  {
PING_Ping_SendPing_exit0_rand_303718930();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1520976158();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1955306207();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1604102499();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1653419971();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_987525344();
}
exit  {
PING_Done_exit0_rand_228812096();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_132317777()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1759680612()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1630652228()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_1318859424()
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

}
else
{

;


}

_tmp595 = (PONG_count2 == 2);
if(_tmp595)
{

send PONG_Pong_SendPong_entry45_payload, Pong;
raise halt;

}
else
{

;


}

raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_417654810()
{


;

}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_1630652228();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1318859424();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_132317777();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry45(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_417654810();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1759680612();
}
}
}

