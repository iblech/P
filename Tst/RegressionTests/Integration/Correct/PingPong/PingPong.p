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
var _tmp579: machine;


_tmp579 = new PONG(null);

PING_pongId = _tmp579;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1015646804()
{


;


}
fun PING_Ping_SendPing_entry18()
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_1464222572()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_468752904()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1674373128()
{


;


}
fun PING_Done_entry0_rand_1170093440()
{


;


}
fun PING_Done_exit0_rand_295653244()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1597427596()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_361443812()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_73756614()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry10();
}
exit  {
PING_Ping_Init_exit0_rand_1015646804();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry18();
}
exit  {
PING_Ping_SendPing_exit0_rand_1464222572();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_468752904();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1674373128();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_1170093440();
}
exit  {
PING_Done_exit0_rand_295653244();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_515562966()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_245382530()
{


;


}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_829234492()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_668804515()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_101448089()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_515562966();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_245382530();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_829234492();
}
}
}

