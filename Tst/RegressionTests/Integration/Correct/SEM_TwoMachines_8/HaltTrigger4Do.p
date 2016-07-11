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
var _tmp1190: machine;


_tmp1190 = new PONG(null);

PING_pongId = _tmp1190;

raise Success;


}
fun PING_Ping_Init_exit0_rand_981255018()
{


;


}
fun PING_Ping_SendPing_entry21(PING_Ping_SendPing_entry21__payload_1: any)
{
var _tmp1191: bool;
var _tmp1192: bool;


PING_count = (PING_count + 1);

_tmp1191 = (PING_count == 1);

if(_tmp1191)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp1192 = (PING_count == 2);

if(_tmp1192)
{

send PING_pongId, halt;

send PING_pongId, PingIgnored;

send PING_pongId, halt;

send PING_pongId, PingIgnored;



}
else
{

;

;



}

raise Success;


}
fun PING_Ping_SendPing_exit0_rand_2096717952()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1997373219(PING_Ping_WaitPong_entry0_rand_1997373219__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_exit0_rand_1124973459()
{


;


}
fun PING_Done_entry0_rand_1754815098(PING_Done_entry0_rand_1754815098__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_1621108792()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_985774200(PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_985774200__payload_skip: any)
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1698600520(PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_1698600520__payload_skip: any)
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_394890649(PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_394890649__payload_skip: any)
{


;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry13(payload);
}
exit  {
PING_Ping_Init_exit0_rand_981255018();
}
}
 state PING_Ping_SendPing
{entry (payload: any) {
PING_Ping_SendPing_entry21(payload);
}
exit  {
PING_Ping_SendPing_exit0_rand_2096717952();
}
}
 state PING_Ping_WaitPong
{entry (payload: any) {
PING_Ping_WaitPong_entry0_rand_1997373219(payload);
}
exit  {
PING_Ping_WaitPong_exit0_rand_1124973459();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_1754815098(payload);
}
exit  {
PING_Done_exit0_rand_1621108792();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_692341917(PONG_Pong_WaitPing_entry0_rand_692341917__payload_2: any)
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1677224165()
{


;


}
fun PONG_Pong_SendPong_entry52(PONG_Pong_SendPong_entry52_payload: machine)
{


send PONG_Pong_SendPong_entry52_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1592250665()
{


;


}
fun PONG_Pong_Halt_entry0_rand_802179875(PONG_Pong_Halt_entry0_rand_802179875__payload_skip: any)
{


;


}
fun PONG_Pong_Halt_exit0_rand_276313960()
{


;


}
fun PONG_Pong_SendPong_do_PingIgnored56(PONG_Pong_SendPong_do_PingIgnored56__payload_3: any)
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1968535497(PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1968535497__payload_skip: any)
{


;


}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_561736599(PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_561736599__payload_skip: any)
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_302700811(PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_302700811__payload_skip: any)
{


;


}start  state PONG_Pong_WaitPing
{entry (payload: any) {
PONG_Pong_WaitPing_entry0_rand_692341917(payload);
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1677224165();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry52(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1592250665();
}
}
 state PONG_Pong_Halt
{entry (payload: any) {
PONG_Pong_Halt_entry0_rand_802179875(payload);
}
exit  {
PONG_Pong_Halt_exit0_rand_276313960();
}
}
}

