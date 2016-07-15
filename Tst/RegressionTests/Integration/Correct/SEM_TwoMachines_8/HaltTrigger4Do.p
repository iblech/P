event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1999553205()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_978882603()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1566634819()
{


;

}
fun PING_Ping_Init_entry13()
{
var _tmp601: machine;


_tmp601 = new PONG(null);
PING_pongId = _tmp601;
raise Success;
}
fun PING_Ping_Init_exit0_rand_268637569()
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

}
else
{

;


}

_tmp603 = (PING_count == 2);
if(_tmp603)
{

send PING_pongId, halt;
send PING_pongId, PingIgnored;

}
else
{

;


}

raise Success;
}
fun PING_Ping_SendPing_exit0_rand_1228428152()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_360360352()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_487559448()
{


;

}
fun PING_Done_entry0_rand_2064040527()
{


;

}
fun PING_Done_exit0_rand_2130692536()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry13();
}
exit  {
PING_Ping_Init_exit0_rand_268637569();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1999553205();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry21();
}
exit  {
PING_Ping_SendPing_exit0_rand_1228428152();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_978882603();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_360360352();
}
exit  {
PING_Ping_WaitPong_exit0_rand_487559448();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1566634819();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_2064040527();
}
exit  {
PING_Done_exit0_rand_2130692536();
}
}
}

machine PONG
{

fun PONG_Pong_SendPong_do_PingIgnored56()
{


assert false;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_834643255()
{


;

}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1185084414()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1144639031()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_313613170()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_125471238()
{


;

}
fun PONG_Pong_SendPong_entry52(PONG_Pong_SendPong_entry52_payload: machine)
{


send PONG_Pong_SendPong_entry52_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1241102976()
{


;

}
fun PONG_Pong_Halt_entry0_rand_2123744148()
{


;

}
fun PONG_Pong_Halt_exit0_rand_347268855()
{


;

}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_313613170();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_125471238();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_834643255();
}

on halt goto PONG_Pong_Halt with   {
PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1185084414();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry52(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1241102976();
}
on PingIgnored do   {
PONG_Pong_SendPong_do_PingIgnored56();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1144639031();
}
}
 state PONG_Pong_Halt
{entry  {
PONG_Pong_Halt_entry0_rand_2123744148();
}
exit  {
PONG_Pong_Halt_exit0_rand_347268855();
}
ignore Ping;
ignore PingIgnored;}
}

