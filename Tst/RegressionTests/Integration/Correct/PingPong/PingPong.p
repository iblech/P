event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_entry10(PING_Ping_Init_entry10__payload_0: any)
{
var _tmp1161: machine;


_tmp1161 = new PONG(null);
;
PING_pongId = _tmp1161;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_315947985()
{


;


}
fun PING_Ping_SendPing_entry18(PING_Ping_SendPing_entry18__payload_1: any)
{


send PING_pongId, Ping, this;
;
raise Success;


}
fun PING_Ping_SendPing_exit0_rand_690730841()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_133992746(PING_Ping_WaitPong_entry0_rand_133992746__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1507304007()
{


;


}
fun PING_Done_entry0_rand_105829711(PING_Done_entry0_rand_105829711__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1322648926()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_436033035(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_436033035__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_800733593(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_800733593__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_869880620(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_869880620__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry10(payload);
}
exit  {
PING_Ping_Init_exit0_rand_315947985();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry18(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_690730841();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_133992746(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1507304007();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_105829711(payload);
}
exit  {
PING_Done_exit0_rand_1322648926();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_766052998(PONG_Pong_WaitPing_entry0_rand_766052998__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_887393835()
{


;


}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


send PONG_Pong_SendPong_entry39_payload, Pong;
;
raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_2093286551()
{


;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1872887605(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1872887605__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1062345731(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1062345731__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_766052998(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_887393835();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_2093286551();
}
}
}

