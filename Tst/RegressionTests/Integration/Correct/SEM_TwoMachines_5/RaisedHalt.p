event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PongIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count1: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_809699703(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_809699703__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1740780164(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1740780164__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_90830275(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_90830275__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry15(PING_Ping_Init_entry15__payload_0: null)
{
var Tmp660: machine;


;

Tmp660 = new PONG(null);
PING_pongId = Tmp660;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1080734092(PING_Ping_Init_exit0_rand_1080734092__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_entry23(PING_Ping_SendPing_entry23__payload_1: null)
{


;

send PING_pongId, Ping, this;
;

raise Success;
return;
}
fun PING_Ping_SendPing_exit0_rand_305701636(PING_Ping_SendPing_exit0_rand_305701636__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_127362346(PING_Ping_WaitPong_entry0_rand_127362346__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_1700733219(PING_Ping_WaitPong_exit0_rand_1700733219__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1614816782(PING_Done_entry0_rand_1614816782__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_2088428982(PING_Done_exit0_rand_2088428982__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry15(payload);
}exit {
PING_Ping_Init_exit0_rand_1080734092(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_809699703(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry23(payload);
}exit {
PING_Ping_SendPing_exit0_rand_305701636(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1740780164(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_127362346(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_1700733219(null);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_90830275(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1614816782(payload);
}exit {
PING_Done_exit0_rand_2088428982(null);
}}
}

machine PONG
{
var PONG_count2: int;

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1600743337(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1600743337__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_74907565(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_74907565__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_2009937850(PONG_Pong_WaitPing_entry0_rand_2009937850__payload_2: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_822808355(PONG_Pong_WaitPing_exit0_rand_822808355__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_entry45(PONG_Pong_SendPong_entry45_payload: machine)
{
var Tmp661: bool;
var Tmp662: bool;


;

PONG_count2 = (PONG_count2 + 1);
;

Tmp661 = (PONG_count2 == 1);
if(Tmp661)
{

;

send PONG_Pong_SendPong_entry45_payload, Pong;

}
else
{

;

;


}

;

Tmp662 = (PONG_count2 == 2);
if(Tmp662)
{

;

send PONG_Pong_SendPong_entry45_payload, Pong;
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
fun PONG_Pong_SendPong_exit0_rand_369890882(PONG_Pong_SendPong_exit0_rand_369890882__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_2009937850(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_822808355(null);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1600743337(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry45(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_369890882(null);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_74907565(payload);
}}
}

