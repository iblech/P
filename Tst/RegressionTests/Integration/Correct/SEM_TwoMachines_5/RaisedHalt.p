event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_654861484()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_2097747252()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_242023107()
{


;

}
fun PING_Ping_Init_entry15()
{
var Tmp593: machine;


Tmp593 = new PONG(null);
PING_pongId = Tmp593;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1046259392()
{


;

}
fun PING_Ping_SendPing_entry23()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_SendPing_exit0_rand_1922968146()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_1368320612()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_2049620051()
{


;

}
fun PING_Done_entry0_rand_1447463226()
{


;

}
fun PING_Done_exit0_rand_732109611()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry15();
}
exit  {
PING_Ping_Init_exit0_rand_1046259392();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_654861484();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry23();
}
exit  {
PING_Ping_SendPing_exit0_rand_1922968146();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_2097747252();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_1368320612();
}
exit  {
PING_Ping_WaitPong_exit0_rand_2049620051();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_242023107();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_1447463226();
}
exit  {
PING_Done_exit0_rand_732109611();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1439550753()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1484615415()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1770607704()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_1103076475()
{


;

}
fun PONG_Pong_SendPong_entry45(PONG_Pong_SendPong_entry45_payload: machine)
{
var Tmp594: bool;
var Tmp595: bool;


PONG_count2 = (PONG_count2 + 1);
Tmp594 = (PONG_count2 == 1);
if(Tmp594)
{

send PONG_Pong_SendPong_entry45_payload, Pong;

}
else
{

;


}

Tmp595 = (PONG_count2 == 2);
if(Tmp595)
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
fun PONG_Pong_SendPong_exit0_rand_225507582()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_1770607704();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1103076475();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1439550753();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry45(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_225507582();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1484615415();
}
}
}

