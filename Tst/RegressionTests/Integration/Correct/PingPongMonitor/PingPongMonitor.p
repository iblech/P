event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1047911161()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1342950425()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_788562396()
{


;

}
fun PING_Ping_Init_entry10()
{
var Tmp581: machine;


Tmp581 = new PONG(null);
PING_pongId = Tmp581;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1083309884()
{


;

}
fun PING_Ping_SendPing_entry18()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_SendPing_exit0_rand_2026737042()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_329331681()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_1676245244()
{


;

}
fun PING_Done_entry0_rand_1879863829()
{


;

}
fun PING_Done_exit0_rand_1557456532()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry10();
}
exit  {
PING_Ping_Init_exit0_rand_1083309884();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1047911161();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry18();
}
exit  {
PING_Ping_SendPing_exit0_rand_2026737042();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1342950425();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_329331681();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1676245244();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_788562396();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_1879863829();
}
exit  {
PING_Done_exit0_rand_1557456532();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1769519768()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1441979283()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_169680578()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_433303908()
{


;

}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1956286761()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_169680578();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_433303908();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1769519768();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1956286761();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1441979283();
}
}
}

