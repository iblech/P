event halt;
event null;
event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_entry13()
{
var _tmp590: machine;


_tmp590 = new PONG(null);

PING_pongId = _tmp590;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1837213814()
{


;


}
fun PING_Ping_SendPing_entry21()
{
var _tmp591: bool;
var _tmp592: bool;


PING_count = (PING_count + 1);

_tmp591 = (PING_count == 1);

if(_tmp591)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp592 = (PING_count == 2);

if(_tmp592)
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
fun PING_Ping_SendPing_exit0_rand_847903792()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1717351425()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1422018113()
{


;


}
fun PING_Done_entry0_rand_961640193()
{


;


}
fun PING_Done_exit0_rand_1382854837()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1909823189()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1560200708()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1792454746()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry13();
}
exit  {
PING_Ping_Init_exit0_rand_1837213814();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry21();
}
exit  {
PING_Ping_SendPing_exit0_rand_847903792();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1717351425();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1422018113();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_961640193();
}
exit  {
PING_Done_exit0_rand_1382854837();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_993809517()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1371598555()
{


;


}
fun PONG_Pong_SendPong_entry51(PONG_Pong_SendPong_entry51_payload: machine)
{


send PONG_Pong_SendPong_entry51_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_425179889()
{


;


}
fun PONG_Pong_Halt_entry0_rand_299171673()
{


;


}
fun PONG_Pong_Halt_exit0_rand_1777391014()
{


;


}
fun PONG_Pong_SendPong_do_PingIgnored55()
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1865924582()
{


;


}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1343847721()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1298679086()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_993809517();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1371598555();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry51(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_425179889();
}
}
 state PONG_Pong_Halt
{entry  {
PONG_Pong_Halt_entry0_rand_299171673();
}
exit  {
PONG_Pong_Halt_exit0_rand_1777391014();
}
}
}

