event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_WaitPong_do_PongIgnored35(PING_Ping_WaitPong_do_PongIgnored35__payload_2: null)
{


;

assert false;
return;
}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_298341552(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_298341552__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1103324331(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1103324331__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2045064361(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2045064361__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry12(PING_Ping_Init_entry12__payload_0: null)
{
var Tmp663: machine;


;

Tmp663 = new PONG(null);
PING_pongId = Tmp663;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1108632294(PING_Ping_Init_exit0_rand_1108632294__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_entry20(PING_Ping_SendPing_entry20__payload_1: null)
{
var Tmp664: bool;
var Tmp665: bool;


;

PING_count1 = (PING_count1 + 1);
;

Tmp664 = (PING_count1 == 1);
if(Tmp664)
{

;

send PING_pongId, Ping, this;

}
else
{

;

;


}

;

Tmp665 = (PING_count1 == 2);
if(Tmp665)
{

;

send PING_pongId, Ping, this;
;

raise halt;

}
else
{

;

;


}

;

raise Success;
return;
}
fun PING_Ping_SendPing_exit0_rand_1720737425(PING_Ping_SendPing_exit0_rand_1720737425__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_963512441(PING_Ping_WaitPong_entry0_rand_963512441__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_1035165460(PING_Ping_WaitPong_exit0_rand_1035165460__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry12(payload);
}exit {
PING_Ping_Init_exit0_rand_1108632294(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_298341552(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry20(payload);
}exit {
PING_Ping_SendPing_exit0_rand_1720737425(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1103324331(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_963512441(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_1035165460(null);
}on PongIgnored do (payload: null) {
PING_Ping_WaitPong_do_PongIgnored35(payload);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_2045064361(payload);
}}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1244441758(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1244441758__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_598981116(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_598981116__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_570176161(PONG_Pong_WaitPing_entry0_rand_570176161__payload_3: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_2082198681(PONG_Pong_WaitPing_exit0_rand_2082198681__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_entry48(PONG_Pong_SendPong_entry48_payload: machine)
{
var Tmp666: bool;
var Tmp667: bool;


;

PONG_count2 = (PONG_count2 + 1);
;

Tmp666 = (PONG_count2 == 1);
if(Tmp666)
{

;

send PONG_Pong_SendPong_entry48_payload, Pong;

}
else
{

;

;


}

;

Tmp667 = (PONG_count2 == 2);
if(Tmp667)
{

;

send PONG_Pong_SendPong_entry48_payload, PongIgnored;

}
else
{

;

;


}

;

raise Success;
return;
}
fun PONG_Pong_SendPong_exit0_rand_753641595(PONG_Pong_SendPong_exit0_rand_753641595__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_570176161(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_2082198681(null);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1244441758(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry48(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_753641595(null);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_598981116(payload);
}}
}

