event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_778880532(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_778880532__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1233722054(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1233722054__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1856784467(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1856784467__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_Init_entry14(PING_Ping_Init_entry14__payload_0: null)
{
var Tmp654: machine;


;

Tmp654 = new PONG(null);
PING_pongId = Tmp654;
;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1542597647(PING_Ping_Init_exit0_rand_1542597647__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_SendPing_entry22(PING_Ping_SendPing_entry22__payload_1: null)
{
var Tmp655: bool;
var Tmp656: bool;


;

PING_count = (PING_count + 1);
;

Tmp655 = (PING_count == 1);
if(Tmp655)
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

Tmp656 = (PING_count == 2);
if(Tmp656)
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
fun PING_Ping_SendPing_exit0_rand_135461398(PING_Ping_SendPing_exit0_rand_135461398__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_entry0_rand_1475527567(PING_Ping_WaitPong_entry0_rand_1475527567__payload_skip: any)
{


;

;

return;
}
fun PING_Ping_WaitPong_exit0_rand_30317296(PING_Ping_WaitPong_exit0_rand_30317296__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1103089195(PING_Done_entry0_rand_1103089195__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_151778356(PING_Done_exit0_rand_151778356__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry14(payload);
}exit {
PING_Ping_Init_exit0_rand_1542597647(null);
}on Success goto PING_Ping_SendPing with (payload: null) {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_778880532(payload);
}}

 state PING_Ping_SendPing
{
entry (payload: null) {
PING_Ping_SendPing_entry22(payload);
}exit {
PING_Ping_SendPing_exit0_rand_135461398(null);
}on Success goto PING_Ping_WaitPong with (payload: null) {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1233722054(payload);
}}

 state PING_Ping_WaitPong
{
entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1475527567(payload);
}exit {
PING_Ping_WaitPong_exit0_rand_30317296(null);
}on Pong goto PING_Ping_SendPing with (payload: null) {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1856784467(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1103089195(payload);
}exit {
PING_Done_exit0_rand_151778356(null);
}}
}

machine PONG
{

fun PONG_Pong_WaitPing_do_PingIgnored48(PONG_Pong_WaitPing_do_PingIgnored48__payload_3: null)
{


;

assert false;
return;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2025174297(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2025174297__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1718240898(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1718240898__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_WaitPing_entry0_rand_1965083257(PONG_Pong_WaitPing_entry0_rand_1965083257__payload_2: null)
{


;

;

return;
}
fun PONG_Pong_WaitPing_exit0_rand_1226410611(PONG_Pong_WaitPing_exit0_rand_1226410611__payload_skip: any)
{


;

;

return;
}
fun PONG_Pong_SendPong_entry53(PONG_Pong_SendPong_entry53_payload: machine)
{


;

send PONG_Pong_SendPong_entry53_payload, Pong;
;

raise Success;
return;
}
fun PONG_Pong_SendPong_exit0_rand_1866626512(PONG_Pong_SendPong_exit0_rand_1866626512__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Pong_WaitPing
{
entry (payload: null) {
PONG_Pong_WaitPing_entry0_rand_1965083257(payload);
}exit {
PONG_Pong_WaitPing_exit0_rand_1226410611(null);
}on PingIgnored do (payload: null) {
PONG_Pong_WaitPing_do_PingIgnored48(payload);
}on Ping goto PONG_Pong_SendPong with (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_2025174297(payload);
}}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry53(payload);
}exit {
PONG_Pong_SendPong_exit0_rand_1866626512(null);
}on Success goto PONG_Pong_WaitPing with (payload: null) {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1718240898(payload);
}}
}

