event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1397727222()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1310625239()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_895959040()
{


;

}
fun PING_Ping_Init_entry13()
{
var Tmp590: machine;


Tmp590 = new PONG(null);
PING_pongId = Tmp590;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1217403699()
{


;

}
fun PING_Ping_SendPing_entry21()
{
var Tmp591: bool;
var Tmp592: bool;


PING_count = (PING_count + 1);
Tmp591 = (PING_count == 1);
if(Tmp591)
{

send PING_pongId, Ping, this;

}
else
{

;


}

Tmp592 = (PING_count == 2);
if(Tmp592)
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
fun PING_Ping_SendPing_exit0_rand_2047419428()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_496776592()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_1125707078()
{


;

}
fun PING_Done_entry0_rand_1974870934()
{


;

}
fun PING_Done_exit0_rand_779322919()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry13();
}
exit  {
PING_Ping_Init_exit0_rand_1217403699();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1397727222();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry21();
}
exit  {
PING_Ping_SendPing_exit0_rand_2047419428();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1310625239();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_496776592();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1125707078();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_895959040();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_1974870934();
}
exit  {
PING_Done_exit0_rand_779322919();
}
}
}

machine PONG
{

fun PONG_Pong_SendPong_do_PingIgnored55()
{


assert false;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2109102832()
{


;

}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_468569747()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_902945192()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1331922344()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_352421167()
{


;

}
fun PONG_Pong_SendPong_entry51(PONG_Pong_SendPong_entry51_payload: machine)
{


send PONG_Pong_SendPong_entry51_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_2016250647()
{


;

}
fun PONG_Pong_Halt_entry0_rand_970119390()
{


;

}
fun PONG_Pong_Halt_exit0_rand_619806043()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_1331922344();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_352421167();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2109102832();
}

on halt goto PONG_Pong_Halt with   {
PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_468569747();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry51(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_2016250647();
}
on PingIgnored do   {
PONG_Pong_SendPong_do_PingIgnored55();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_902945192();
}
}

 state PONG_Pong_Halt
{
entry  {
PONG_Pong_Halt_entry0_rand_970119390();
}
exit  {
PONG_Pong_Halt_exit0_rand_619806043();
}
ignore Ping;
ignore PingIgnored;}
}

