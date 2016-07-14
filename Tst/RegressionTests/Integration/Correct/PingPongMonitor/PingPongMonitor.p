event halt;
event null;
event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_entry10()
{
var _tmp581: machine;


_tmp581 = new PONG(null);

PING_pongId = _tmp581;

raise Success;


}
fun PING_Ping_Init_exit0_rand_90453142()
{


;


}
fun PING_Ping_SendPing_entry18()
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_965933480()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1316937876()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_290818347()
{


;


}
fun PING_Done_entry0_rand_984012208()
{


;


}
fun PING_Done_exit0_rand_464371363()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_397125995()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_878829867()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_272363547()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry10();
}
exit  {
PING_Ping_Init_exit0_rand_90453142();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry18();
}
exit  {
PING_Ping_SendPing_exit0_rand_965933480();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1316937876();
}
exit  {
PING_Ping_WaitPong_exit0_rand_290818347();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_984012208();
}
exit  {
PING_Done_exit0_rand_464371363();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_967543743()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_985657796()
{


;


}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1382823755()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1708121426()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1029551524()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_967543743();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_985657796();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1382823755();
}
}
}

