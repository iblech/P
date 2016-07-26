event Ping  assert 1: machine;
event Pong  assert 1;
event Success;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1332355549(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1332355549__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1075659487(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1075659487__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_771552591(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_771552591__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry10(PING_Ping_Init_entry10__payload_0: null)
{
var Tmp648: machine;


;

Tmp648 = new PONG(null);
PING_pongId = Tmp648;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1498106848(PING_Ping_Init_exit0_rand_1498106848__payload_skip: any)
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
fun PING_Ping_SendPing_exit0_rand_1781451120(PING_Ping_SendPing_exit0_rand_1781451120__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_232140222(PING_Ping_WaitPong_entry0_rand_232140222__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_1308629619(PING_Ping_WaitPong_exit0_rand_1308629619__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_790034912(PING_Done_entry0_rand_790034912__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_183392286(PING_Done_exit0_rand_183392286__payload_skip: any)
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
PING_Ping_Init_exit0_rand_1498106848(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1332355549(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry18(payload);
}exit {
PING_Ping_SendPing_exit0_rand_1781451120(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1075659487(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_232140222(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_1308629619(null);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_771552591(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_790034912(payload);
}exit {
PING_Done_exit0_rand_183392286(null);
}}
}

machine PONG
{

fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1339498909(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1339498909__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1307858501(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1307858501__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_1845603244(PONG_Pong_WaitPing_entry0_rand_1845603244__payload_2: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_1095847219(PONG_Pong_WaitPing_exit0_rand_1095847219__payload_skip: any)
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
fun PONG_Pong_SendPong_exit0_rand_1750278180(PONG_Pong_SendPong_exit0_rand_1750278180__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_1845603244(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_1095847219(null);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1339498909(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry39(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_1750278180(null);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1307858501(payload);
}}
}

spec M monitors Ping, Pong 
{

fun M_ExpectPing_on_Ping_goto_M_ExpectPong0_rand_1085006161(M_ExpectPing_on_Ping_goto_M_ExpectPong0_rand_1085006161__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_on_Pong_goto_M_ExpectPing0_rand_824501226(M_ExpectPong_on_Pong_goto_M_ExpectPing0_rand_824501226__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPing_entry0_rand_1416472902(M_ExpectPing_entry0_rand_1416472902__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPing_exit0_rand_2040255146(M_ExpectPing_exit0_rand_2040255146__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_entry0_rand_1925897550(M_ExpectPong_entry0_rand_1925897550__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_exit0_rand_521669238(M_ExpectPong_exit0_rand_521669238__payload_skip: any)
{


;

;

return;
}start 
cold state M_ExpectPing
{
entry (payload: any) {
M_ExpectPing_entry0_rand_1416472902(payload);
}exit {
M_ExpectPing_exit0_rand_2040255146(null);
}on Ping goto M_ExpectPong with (payload: machine) {
M_ExpectPing_on_Ping_goto_M_ExpectPong0_rand_1085006161(payload);
}}

hot state M_ExpectPong
{
entry (payload: any) {
M_ExpectPong_entry0_rand_1925897550(payload);
}exit {
M_ExpectPong_exit0_rand_521669238(null);
}on Pong goto M_ExpectPing with (payload: null) {
M_ExpectPong_on_Pong_goto_M_ExpectPing0_rand_824501226(payload);
}}
}

