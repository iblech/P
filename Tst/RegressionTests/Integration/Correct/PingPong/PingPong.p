event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1665236046()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_395434901()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1759267398()
{


;

}
fun PING_Ping_Init_entry10()
{
var _tmp579: machine;


_tmp579 = new PONG(null);
PING_pongId = _tmp579;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1646721405()
{


;

}
fun PING_Ping_SendPing_entry18()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_SendPing_exit0_rand_873769630()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_1225176576()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_1033474013()
{


;

}
fun PING_Done_entry0_rand_1447330540()
{


;

}
fun PING_Done_exit0_rand_1050509175()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry10();
}
exit  {
PING_Ping_Init_exit0_rand_1646721405();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1665236046();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry18();
}
exit  {
PING_Ping_SendPing_exit0_rand_873769630();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_395434901();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1225176576();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1033474013();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1759267398();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_1447330540();
}
exit  {
PING_Done_exit0_rand_1050509175();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1588423703()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1719896197()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_680138519()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_362699565()
{


;

}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1127415931()
{


;

}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_680138519();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_362699565();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1588423703();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1127415931();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1719896197();
}
}
}

