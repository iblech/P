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
var _tmp1169: machine;


_tmp1169 = new PONG(null);
;
PING_pongId = _tmp1169;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_1902037429()
{


;


}
fun PING_Ping_SendPing_entry22(PING_Ping_SendPing_entry22__payload_1: any)
{
var _tmp1170: bool;
var _tmp1171: bool;


PING_count = (PING_count + 1);
;
_tmp1170 = (PING_count == 1);
;
if(_tmp1170)
{

send PING_pongId, Ping, this;
;
send PING_pongId, Ping, this;



}
else
{

;
;
;



}
;
_tmp1171 = (PING_count == 2);
;
if(_tmp1171)
{

send PING_pongId, halt;
;
send PING_pongId, PingIgnored;
;
send PING_pongId, halt;
;
send PING_pongId, PingIgnored;



}
else
{

;
;
;



}
;
raise Success;


}
fun PING_Ping_SendPing_exit0_rand_359152693()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_574676339(PING_Ping_WaitPong_entry0_rand_574676339__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1589872111()
{


;


}
fun PING_Done_entry0_rand_2082872994(PING_Done_entry0_rand_2082872994__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1775154505()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1034396904(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1034396904__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1904468920(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1904468920__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_321706566(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_321706566__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry14(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1902037429();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry22(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_359152693();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_574676339(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1589872111();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_2082872994(payload);
}
exit  {
PING_Done_exit0_rand_1775154505();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_1683373135(PONG_Pong_WaitPing_entry0_rand_1683373135__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_211957008()
{


;


}
fun PONG_Pong_SendPong_entry53(PONG_Pong_SendPong_entry53_payload: machine)
{


send PONG_Pong_SendPong_entry53_payload, Pong;
;
raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_638230601()
{


;


}
fun PONG_Pong_WaitPing_do_PingIgnored48(PONG_Pong_WaitPing_do_PingIgnored48__payload_3: any)
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_176901320(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_176901320__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_787865815(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_787865815__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1683373135(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_211957008();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry53(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_638230601();
}
}
}

