event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_entry14(PING_Ping_Init_entry14__payload_0: any)
{
var _tmp1176: machine;


_tmp1176 = new PONG(null);

PING_pongId = _tmp1176;

raise Success;


}
fun PING_Ping_Init_exit0_rand_598640003()
{


;


}
fun PING_Ping_SendPing_entry22(PING_Ping_SendPing_entry22__payload_1: any)
{
var _tmp1177: bool;
var _tmp1178: bool;


PING_count = (PING_count + 1);

_tmp1177 = (PING_count == 1);

if(_tmp1177)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp1178 = (PING_count == 2);

if(_tmp1178)
{

send PING_pongId, halt;

send PING_pongId, PingIgnored;

send PING_pongId, halt;

send PING_pongId, PingIgnored;



}
else
{

;

;



}

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_1722852078()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1827346620(PING_Ping_WaitPong_entry0_rand_1827346620__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1302699085()
{


;


}
fun PING_Done_entry0_rand_550415346(PING_Done_entry0_rand_550415346__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1873960578()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1348873319(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1348873319__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1406673678(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1406673678__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_790282494(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_790282494__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry14(payload);
}
exit  {
PING_Ping_Init_exit0_rand_598640003();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry22(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_1722852078();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1827346620(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1302699085();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_550415346(payload);
}
exit  {
PING_Done_exit0_rand_1873960578();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_1438538225(PONG_Pong_WaitPing_entry0_rand_1438538225__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_445734169()
{


;


}
fun PONG_Pong_SendPong_entry53(PONG_Pong_SendPong_entry53_payload: machine)
{


send PONG_Pong_SendPong_entry53_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_2118881943()
{


;


}
fun PONG_Pong_WaitPing_do_PingIgnored48(PONG_Pong_WaitPing_do_PingIgnored48__payload_3: any)
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_67542879(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_67542879__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_2146762539(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_2146762539__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1438538225(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_445734169();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry53(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_2118881943();
}
}
}

