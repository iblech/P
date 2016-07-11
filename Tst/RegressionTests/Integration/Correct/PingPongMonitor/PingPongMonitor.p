event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_entry10(PING_Ping_Init_entry10__payload_0: any)
{
var _tmp1163: machine;


_tmp1163 = new PONG(null);
;
PING_pongId = _tmp1163;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_2115902332()
{


;


}
fun PING_Ping_SendPing_entry18(PING_Ping_SendPing_entry18__payload_1: any)
{


send PING_pongId, Ping, this;
;
raise Success;


}
fun PING_Ping_SendPing_exit0_rand_740639165()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1584617787(PING_Ping_WaitPong_entry0_rand_1584617787__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_688325220()
{


;


}
fun PING_Done_entry0_rand_721039072(PING_Done_entry0_rand_721039072__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1418394658()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1221655869(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1221655869__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_932893357(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_932893357__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_595717348(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_595717348__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry10(payload);
}
exit  {
PING_Ping_Init_exit0_rand_2115902332();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry18(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_740639165();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1584617787(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_688325220();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_721039072(payload);
}
exit  {
PING_Done_exit0_rand_1418394658();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_1085898537(PONG_Pong_WaitPing_entry0_rand_1085898537__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1211739045()
{


;


}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;
;
raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_886119275()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1251585966(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1251585966__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1369395777(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1369395777__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1085898537(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1211739045();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_886119275();
}
}
}

