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
var _tmp601: machine;


_tmp601 = new PONG(null);

PING_pongId = _tmp601;

raise Success;


}
fun PING_Ping_Init_exit0_rand_1689682217()
{


;


}
fun PING_Ping_SendPing_entry21()
{
var _tmp602: bool;
var _tmp603: bool;


PING_count = (PING_count + 1);

_tmp602 = (PING_count == 1);

if(_tmp602)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp603 = (PING_count == 2);

if(_tmp603)
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
fun PING_Ping_SendPing_exit0_rand_930147608()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_581746998()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1018798796()
{


;


}
fun PING_Done_entry0_rand_2145286783()
{


;


}
fun PING_Done_exit0_rand_2101958267()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_299171329()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_394273419()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_224902672()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry13();
}
exit  {
PING_Ping_Init_exit0_rand_1689682217();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry21();
}
exit  {
PING_Ping_SendPing_exit0_rand_930147608();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_581746998();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1018798796();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_2145286783();
}
exit  {
PING_Done_exit0_rand_2101958267();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_2000285583()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1545633771()
{


;


}
fun PONG_Pong_SendPong_entry52(PONG_Pong_SendPong_entry52_payload: machine)
{


send PONG_Pong_SendPong_entry52_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1655777900()
{


;


}
fun PONG_Pong_Halt_entry0_rand_1700214395()
{


;


}
fun PONG_Pong_Halt_exit0_rand_1134907759()
{


;


}
fun PONG_Pong_SendPong_do_PingIgnored56()
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1309862657()
{


;


}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_780446857()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_10332295()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_2000285583();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1545633771();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry52(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1655777900();
}
}
 state PONG_Pong_Halt
{entry  {
PONG_Pong_Halt_entry0_rand_1700214395();
}
exit  {
PONG_Pong_Halt_exit0_rand_1134907759();
}
}
}

