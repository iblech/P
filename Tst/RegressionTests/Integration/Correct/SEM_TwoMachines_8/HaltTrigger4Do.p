event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1058827061()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_276381609()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_329171797()
{


;

}
fun PING_Ping_Init_entry13()
{
var Tmp601: machine;


Tmp601 = new PONG(null);
PING_pongId = Tmp601;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1723920778()
{


;

}
fun PING_Ping_SendPing_entry21()
{
var Tmp602: bool;
var Tmp603: bool;


PING_count = (PING_count + 1);
Tmp602 = (PING_count == 1);
if(Tmp602)
{

send PING_pongId, Ping, this;

}
else
{

;


}

Tmp603 = (PING_count == 2);
if(Tmp603)
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
fun PING_Ping_SendPing_exit0_rand_857905037()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_1075917695()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_98423047()
{


;

}
fun PING_Done_entry0_rand_1479805700()
{


;

}
fun PING_Done_exit0_rand_1518932381()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry13();
}
exit  {
PING_Ping_Init_exit0_rand_1723920778();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1058827061();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry21();
}
exit  {
PING_Ping_SendPing_exit0_rand_857905037();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_276381609();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_1075917695();
}
exit  {
PING_Ping_WaitPong_exit0_rand_98423047();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_329171797();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_1479805700();
}
exit  {
PING_Done_exit0_rand_1518932381();
}
}
}

machine PONG
{

fun PONG_Pong_SendPong_do_PingIgnored56()
{


assert false;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_442186496()
{


;

}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_79979436()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_956579921()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_2060595454()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_264365847()
{


;

}
fun PONG_Pong_SendPong_entry52(PONG_Pong_SendPong_entry52_payload: machine)
{


send PONG_Pong_SendPong_entry52_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1120474541()
{


;

}
fun PONG_Pong_Halt_entry0_rand_740782220()
{


;

}
fun PONG_Pong_Halt_exit0_rand_566433343()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_2060595454();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_264365847();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_442186496();
}

on halt goto PONG_Pong_Halt with   {
PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_79979436();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry52(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1120474541();
}
on PingIgnored do   {
PONG_Pong_SendPong_do_PingIgnored56();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_956579921();
}
}

 state PONG_Pong_Halt
{
entry  {
PONG_Pong_Halt_entry0_rand_740782220();
}
exit  {
PONG_Pong_Halt_exit0_rand_566433343();
}
ignore Ping;
ignore PingIgnored;}
}

