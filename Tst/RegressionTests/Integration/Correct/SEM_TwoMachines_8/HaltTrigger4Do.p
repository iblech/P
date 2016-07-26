event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1467139574(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1467139574__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_315495174(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_315495174__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_568136644(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_568136644__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: null)
{
var Tmp668: machine;


;

Tmp668 = new PONG(null);
PING_pongId = Tmp668;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_524075805(PING_Ping_Init_exit0_rand_524075805__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_entry21(PING_Ping_SendPing_entry21__payload_1: null)
{
var Tmp669: bool;
var Tmp670: bool;


;

PING_count = (PING_count + 1);
;

Tmp669 = (PING_count == 1);
if(Tmp669)
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

Tmp670 = (PING_count == 2);
if(Tmp670)
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
fun PING_Ping_SendPing_exit0_rand_2036875753(PING_Ping_SendPing_exit0_rand_2036875753__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_1489562300(PING_Ping_WaitPong_entry0_rand_1489562300__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_224303093(PING_Ping_WaitPong_exit0_rand_224303093__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1135580336(PING_Done_entry0_rand_1135580336__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_265883175(PING_Done_exit0_rand_265883175__payload_skip: any)
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
PING_Ping_Init_exit0_rand_524075805(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1467139574(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry21(payload);
}exit {
PING_Ping_SendPing_exit0_rand_2036875753(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_315495174(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1489562300(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_224303093(null);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_568136644(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1135580336(payload);
}exit {
PING_Done_exit0_rand_265883175(null);
}}
}

machine PONG
{

fun PONG_Pong_SendPong_do_PingIgnored56(PONG_Pong_SendPong_do_PingIgnored56__payload_3: null)
{


;

assert false;
return;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_83661739(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_83661739__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_287209005(PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_287209005__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_976038428(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_976038428__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_1751434522(PONG_Pong_WaitPing_entry0_rand_1751434522__payload_2: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_1307778209(PONG_Pong_WaitPing_exit0_rand_1307778209__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_entry52(PONG_Pong_SendPong_entry52_payload: machine)
{


;

send PONG_Pong_SendPong_entry52_payload, Pong;
;

raise Success;
return;
}
fun PONG_Pong_SendPong_exit0_rand_387283080(PONG_Pong_SendPong_exit0_rand_387283080__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_Halt_entry0_rand_170692948(PONG_Pong_Halt_entry0_rand_170692948__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_Halt_exit0_rand_1645523157(PONG_Pong_Halt_exit0_rand_1645523157__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_1751434522(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_1307778209(null);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_83661739(payload);
}
on halt goto PONG_Pong_Halt with (payload: null) {
PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_287209005(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry52(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_387283080(null);
}on PingIgnored do (payload: null) {
PONG_Pong_SendPong_do_PingIgnored56(payload);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_976038428(payload);
}}

 state PONG_Pong_Halt
{
entry (payload: any) {
PONG_Pong_Halt_entry0_rand_170692948(payload);
}exit {
PONG_Pong_Halt_exit0_rand_1645523157(null);
}ignore Ping;
ignore PingIgnored;}
}

