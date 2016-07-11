event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: any)
{
var _tmp1172: machine;


_tmp1172 = new PONG(null);
;
PING_pongId = _tmp1172;
;
raise Success;


}
fun PING_Ping_Init_exit0_rand_74661737()
{


;


}
fun PING_Ping_SendPing_entry21(PING_Ping_SendPing_entry21__payload_1: any)
{
var _tmp1173: bool;
var _tmp1174: bool;


PING_count = (PING_count + 1);
;
_tmp1173 = (PING_count == 1);
;
if(_tmp1173)
{

send PING_pongId, Ping, this;
;
send PING_pongId, Ping, this;



}
else
{

;
;
;



}
;
_tmp1174 = (PING_count == 2);
;
if(_tmp1174)
{

send PING_pongId, halt;
;
send PING_pongId, PingIgnored;
;
send PING_pongId, halt;
;
send PING_pongId, PingIgnored;



}
else
{

;
;
;



}
;
raise Success;


}
fun PING_Ping_SendPing_exit0_rand_1419366031()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_847188009(PING_Ping_WaitPong_entry0_rand_847188009__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_92801411()
{


;


}
fun PING_Done_entry0_rand_1053993447(PING_Done_entry0_rand_1053993447__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_769893121()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1832179878(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_1832179878__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1985918191(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1985918191__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_708111222(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_708111222__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry13(payload);
}
exit  {
PING_Ping_Init_exit0_rand_74661737();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry21(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_1419366031();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_847188009(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_92801411();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_1053993447(payload);
}
exit  {
PING_Done_exit0_rand_769893121();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_581654284(PONG_Pong_WaitPing_entry0_rand_581654284__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1931205263()
{


;


}
fun PONG_Pong_SendPong_entry51(PONG_Pong_SendPong_entry51_payload: machine)
{


send PONG_Pong_SendPong_entry51_payload, Pong;
;
raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_2044048995()
{


;


}
fun PONG_Pong_Halt_entry0_rand_309241242(PONG_Pong_Halt_entry0_rand_309241242__payload_skip: any)
{


;


}
fun PONG_Pong_Halt_exit0_rand_1048012761()
{


;


}
fun PONG_Pong_SendPong_do_PingIgnored55(PONG_Pong_SendPong_do_PingIgnored55__payload_3: any)
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_802023598(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_802023598__payload_skip: any)
{


;


}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_58374263(PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_58374263__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1870357217(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1870357217__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_581654284(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1931205263();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry51(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_2044048995();
}
}
 state PONG_Pong_Halt
{entry (payload: any) {
PONG_Pong_Halt_entry0_rand_309241242(payload);
}
exit  {
PONG_Pong_Halt_exit0_rand_1048012761();
}
}
}

