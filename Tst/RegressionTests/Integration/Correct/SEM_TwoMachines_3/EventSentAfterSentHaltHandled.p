event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: any)
{
var _tmp1179: machine;


_tmp1179 = new PONG(null);

PING_pongId = _tmp1179;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1523839054()
{


;


}
fun PING_Ping_SendPing_entry21(PING_Ping_SendPing_entry21__payload_1: any)
{
var _tmp1180: bool;
var _tmp1181: bool;


PING_count = (PING_count + 1);

_tmp1180 = (PING_count == 1);

if(_tmp1180)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp1181 = (PING_count == 2);

if(_tmp1181)
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
fun PING_Ping_SendPing_exit0_rand_2121676486()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_896798392(PING_Ping_WaitPong_entry0_rand_896798392__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_770796808()
{


;


}
fun PING_Done_entry0_rand_1619128143(PING_Done_entry0_rand_1619128143__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1952221687()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_700525774(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_700525774__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_748987119(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_748987119__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1831206774(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1831206774__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry13(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1523839054();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry21(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_2121676486();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_896798392(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_770796808();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_1619128143(payload);
}
exit  {
PING_Done_exit0_rand_1952221687();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_1665085666(PONG_Pong_WaitPing_entry0_rand_1665085666__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_856659786()
{


;


}
fun PONG_Pong_SendPong_entry51(PONG_Pong_SendPong_entry51_payload: machine)
{


send PONG_Pong_SendPong_entry51_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1931341133()
{


;


}
fun PONG_Pong_Halt_entry0_rand_846091602(PONG_Pong_Halt_entry0_rand_846091602__payload_skip: any)
{


;


}
fun PONG_Pong_Halt_exit0_rand_1353464780()
{


;


}
fun PONG_Pong_SendPong_do_PingIgnored55(PONG_Pong_SendPong_do_PingIgnored55__payload_3: any)
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_972109024(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_972109024__payload_skip: any)
{


;


}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1426540026(PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1426540026__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1819132801(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1819132801__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_1665085666(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_856659786();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry51(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1931341133();
}
}
 state PONG_Pong_Halt
{entry (payload: any) {
PONG_Pong_Halt_entry0_rand_846091602(payload);
}
exit  {
PONG_Pong_Halt_exit0_rand_1353464780();
}
}
}

