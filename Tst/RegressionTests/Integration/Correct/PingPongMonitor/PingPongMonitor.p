event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_entry10(PING_Ping_Init_entry10__payload_0: any)
{
var _tmp1170: machine;


_tmp1170 = new PONG(null);

PING_pongId = _tmp1170;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1960959324()
{


;


}
fun PING_Ping_SendPing_entry18(PING_Ping_SendPing_entry18__payload_1: any)
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_527986498()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_652268275(PING_Ping_WaitPong_entry0_rand_652268275__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1759628342()
{


;


}
fun PING_Done_entry0_rand_1548090612(PING_Done_entry0_rand_1548090612__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1406648810()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1454226412(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1454226412__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1021311985(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1021311985__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_260863126(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_260863126__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry10(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1960959324();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry18(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_527986498();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_652268275(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1759628342();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_1548090612(payload);
}
exit  {
PING_Done_exit0_rand_1406648810();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_230961980(PONG_Pong_WaitPing_entry0_rand_230961980__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_759475555()
{


;


}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1042904263()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1299583529(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1299583529__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_948021257(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_948021257__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_230961980(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_759475555();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1042904263();
}
}
}

