event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2028012194()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1173915873()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_399585374()
{


;

}
fun PING_Ping_Init_entry10()
{
var Tmp579: machine;


Tmp579 = new PONG(null);
PING_pongId = Tmp579;
raise Success;
}
fun PING_Ping_Init_exit0_rand_2107143400()
{


;

}
fun PING_Ping_SendPing_entry18()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_SendPing_exit0_rand_107136872()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_1737068685()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_840072408()
{


;

}
fun PING_Done_entry0_rand_892022379()
{


;

}
fun PING_Done_exit0_rand_2015598042()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry10();
}
exit  {
PING_Ping_Init_exit0_rand_2107143400();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2028012194();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry18();
}
exit  {
PING_Ping_SendPing_exit0_rand_107136872();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1173915873();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_1737068685();
}
exit  {
PING_Ping_WaitPong_exit0_rand_840072408();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_399585374();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_892022379();
}
exit  {
PING_Done_exit0_rand_2015598042();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_887444368()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_971560684()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1501545977()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_631206693()
{


;

}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1391637077()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_1501545977();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_631206693();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_887444368();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1391637077();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_971560684();
}
}
}

