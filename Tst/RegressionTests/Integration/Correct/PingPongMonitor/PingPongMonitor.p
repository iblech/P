event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_713306385()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1266363972()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1057885503()
{


;

}
fun PING_Ping_Init_entry10()
{
var _tmp581: machine;


_tmp581 = new PONG(null);
PING_pongId = _tmp581;
raise Success;
}
fun PING_Ping_Init_exit0_rand_529445421()
{


;

}
fun PING_Ping_SendPing_entry18()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_SendPing_exit0_rand_522204705()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_339732693()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_422857133()
{


;

}
fun PING_Done_entry0_rand_219122530()
{


;

}
fun PING_Done_exit0_rand_643665882()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry10();
}
exit  {
PING_Ping_Init_exit0_rand_529445421();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_713306385();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry18();
}
exit  {
PING_Ping_SendPing_exit0_rand_522204705();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1266363972();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_339732693();
}
exit  {
PING_Ping_WaitPong_exit0_rand_422857133();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1057885503();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_219122530();
}
exit  {
PING_Done_exit0_rand_643665882();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_771737173()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_302229346()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1200226245()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_840104453()
{


;

}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_67047990()
{


;

}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_1200226245();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_840104453();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_771737173();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_67047990();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_302229346();
}
}
}

