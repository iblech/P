event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1715490313(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1715490313__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1910788257(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1910788257__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1871073336(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1871073336__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry10(PING_Ping_Init_entry10__payload_0: null)
{
var Tmp646: machine;


;

Tmp646 = new PONG(null);
PING_pongId = Tmp646;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_161937824(PING_Ping_Init_exit0_rand_161937824__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_entry18(PING_Ping_SendPing_entry18__payload_1: null)
{


;

send PING_pongId, Ping, this;
;

raise Success;
return;
}
fun PING_Ping_SendPing_exit0_rand_229766088(PING_Ping_SendPing_exit0_rand_229766088__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_2080054784(PING_Ping_WaitPong_entry0_rand_2080054784__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_1515817529(PING_Ping_WaitPong_exit0_rand_1515817529__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1492216416(PING_Done_entry0_rand_1492216416__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_620614951(PING_Done_exit0_rand_620614951__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry10(payload);
}exit {
PING_Ping_Init_exit0_rand_161937824(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1715490313(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry18(payload);
}exit {
PING_Ping_SendPing_exit0_rand_229766088(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1910788257(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_2080054784(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_1515817529(null);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1871073336(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1492216416(payload);
}exit {
PING_Done_exit0_rand_620614951(null);
}}
}

machine PONG
{

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_530510365(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_530510365__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_2014967610(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_2014967610__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_1703310935(PONG_Pong_WaitPing_entry0_rand_1703310935__payload_2: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_903112800(PONG_Pong_WaitPing_exit0_rand_903112800__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_entry39(PONG_Pong_SendPong_entry39_payload: machine)
{


;

send PONG_Pong_SendPong_entry39_payload, Pong;
;

raise Success;
return;
}
fun PONG_Pong_SendPong_exit0_rand_470773487(PONG_Pong_SendPong_exit0_rand_470773487__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_1703310935(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_903112800(null);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_530510365(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_470773487(null);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_2014967610(payload);
}}
}

