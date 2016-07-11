event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_entry10(PING_Ping_Init_entry10__payload_0: any)
{
var _tmp1168: machine;


_tmp1168 = new PONG(null);

PING_pongId = _tmp1168;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1798848331()
{


;


}
fun PING_Ping_SendPing_entry18(PING_Ping_SendPing_entry18__payload_1: any)
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_1399953360()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1716162915(PING_Ping_WaitPong_entry0_rand_1716162915__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_658809446()
{


;


}
fun PING_Done_entry0_rand_1473975832(PING_Done_entry0_rand_1473975832__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_253657610()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1991635895(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1991635895__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_2115696549(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_2115696549__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_528812072(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_528812072__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry10(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1798848331();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry18(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_1399953360();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1716162915(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_658809446();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_1473975832(payload);
}
exit  {
PING_Done_exit0_rand_253657610();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_1364710674(PONG_Pong_WaitPing_entry0_rand_1364710674__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1269789081()
{


;


}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1863914156()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1220149355(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1220149355__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1318268992(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1318268992__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1364710674(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1269789081();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1863914156();
}
}
}

