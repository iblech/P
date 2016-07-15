event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_WaitPong_do_PongIgnored35()
{


assert false;
}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2127300565()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_792457724()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2115005308()
{


;

}
fun PING_Ping_Init_entry12()
{
var Tmp596: machine;


Tmp596 = new PONG(null);
PING_pongId = Tmp596;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1750446738()
{


;

}
fun PING_Ping_SendPing_entry20()
{
var Tmp597: bool;
var Tmp598: bool;


PING_count1 = (PING_count1 + 1);
Tmp597 = (PING_count1 == 1);
if(Tmp597)
{

send PING_pongId, Ping, this;

}
else
{

;


}

Tmp598 = (PING_count1 == 2);
if(Tmp598)
{

send PING_pongId, Ping, this;
raise halt;

}
else
{

;


}

raise Success;
}
fun PING_Ping_SendPing_exit0_rand_1589893316()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_2071963577()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_489741628()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry12();
}
exit  {
PING_Ping_Init_exit0_rand_1750446738();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2127300565();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry20();
}
exit  {
PING_Ping_SendPing_exit0_rand_1589893316();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_792457724();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_2071963577();
}
exit  {
PING_Ping_WaitPong_exit0_rand_489741628();
}
on PongIgnored do   {
PING_Ping_WaitPong_do_PongIgnored35();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2115005308();
}
}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_805007063()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1034766866()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_1476619237()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_430033234()
{


;

}
fun PONG_Pong_SendPong_entry48(PONG_Pong_SendPong_entry48_payload: machine)
{
var Tmp599: bool;
var Tmp600: bool;


PONG_count2 = (PONG_count2 + 1);
Tmp599 = (PONG_count2 == 1);
if(Tmp599)
{

send PONG_Pong_SendPong_entry48_payload, Pong;

}
else
{

;


}

Tmp600 = (PONG_count2 == 2);
if(Tmp600)
{

send PONG_Pong_SendPong_entry48_payload, PongIgnored;

}
else
{

;


}

raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1608070923()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_1476619237();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_430033234();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_805007063();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry48(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1608070923();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1034766866();
}
}
}

