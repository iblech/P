event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1826342087(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1826342087__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_241028654(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_241028654__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_692984716(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_692984716__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: null)
{
var Tmp657: machine;


;

Tmp657 = new PONG(null);
PING_pongId = Tmp657;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1120444684(PING_Ping_Init_exit0_rand_1120444684__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_entry21(PING_Ping_SendPing_entry21__payload_1: null)
{
var Tmp658: bool;
var Tmp659: bool;


;

PING_count = (PING_count + 1);
;

Tmp658 = (PING_count == 1);
if(Tmp658)
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

Tmp659 = (PING_count == 2);
if(Tmp659)
{

;

send PING_pongId, halt;
;

send PING_pongId, PingIgnored;

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
fun PING_Ping_SendPing_exit0_rand_844165498(PING_Ping_SendPing_exit0_rand_844165498__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_480080459(PING_Ping_WaitPong_entry0_rand_480080459__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_389644893(PING_Ping_WaitPong_exit0_rand_389644893__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1709679123(PING_Done_entry0_rand_1709679123__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_1150104254(PING_Done_exit0_rand_1150104254__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry13(payload);
}exit {
PING_Ping_Init_exit0_rand_1120444684(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1826342087(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry21(payload);
}exit {
PING_Ping_SendPing_exit0_rand_844165498(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_241028654(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_480080459(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_389644893(null);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_692984716(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1709679123(payload);
}exit {
PING_Done_exit0_rand_1150104254(null);
}}
}

machine PONG
{

fun PONG_Pong_SendPong_do_PingIgnored55(PONG_Pong_SendPong_do_PingIgnored55__payload_3: null)
{


;

assert false;
return;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_298055294(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_298055294__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1198772729(PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1198772729__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_869644871(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_869644871__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_1458935908(PONG_Pong_WaitPing_entry0_rand_1458935908__payload_2: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_1995736040(PONG_Pong_WaitPing_exit0_rand_1995736040__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_entry51(PONG_Pong_SendPong_entry51_payload: machine)
{


;

send PONG_Pong_SendPong_entry51_payload, Pong;
;

raise Success;
return;
}
fun PONG_Pong_SendPong_exit0_rand_499489139(PONG_Pong_SendPong_exit0_rand_499489139__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_Halt_entry0_rand_1653725138(PONG_Pong_Halt_entry0_rand_1653725138__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_Halt_exit0_rand_1213697089(PONG_Pong_Halt_exit0_rand_1213697089__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_1458935908(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_1995736040(null);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_298055294(payload);
}
on halt goto PONG_Pong_Halt with (payload: null) {
PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1198772729(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry51(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_499489139(null);
}on PingIgnored do (payload: null) {
PONG_Pong_SendPong_do_PingIgnored55(payload);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_869644871(payload);
}}

 state PONG_Pong_Halt
{
entry (payload: any) {
PONG_Pong_Halt_entry0_rand_1653725138(payload);
}exit {
PONG_Pong_Halt_exit0_rand_1213697089(null);
}ignore Ping;
ignore PingIgnored;}
}

