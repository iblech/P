event halt;
event null;
event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_entry14()
{
var _tmp587: machine;


_tmp587 = new PONG(null);

PING_pongId = _tmp587;

raise Success;


}
fun PING_Ping_Init_exit0_rand_972274449()
{


;


}
fun PING_Ping_SendPing_entry22()
{
var _tmp588: bool;
var _tmp589: bool;


PING_count = (PING_count + 1);

_tmp588 = (PING_count == 1);

if(_tmp588)
{

send PING_pongId, Ping, this;

send PING_pongId, Ping, this;



}
else
{

;

;



}

_tmp589 = (PING_count == 2);

if(_tmp589)
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
fun PING_Ping_SendPing_exit0_rand_1688555460()
{


;


}
fun PING_Ping_WaitPong_entry0_rand_1988853890()
{


;


}
fun PING_Ping_WaitPong_exit0_rand_560054975()
{


;


}
fun PING_Done_entry0_rand_344086540()
{


;


}
fun PING_Done_exit0_rand_431515857()
{


;


}
fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_696829210()
{


;


}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_578351373()
{


;


}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1282998256()
{


;


}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry14();
}
exit  {
PING_Ping_Init_exit0_rand_972274449();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry22();
}
exit  {
PING_Ping_SendPing_exit0_rand_1688555460();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_1988853890();
}
exit  {
PING_Ping_WaitPong_exit0_rand_560054975();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_344086540();
}
exit  {
PING_Done_exit0_rand_431515857();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_entry0_rand_1790257882()
{


;


}
fun PONG_Pong_WaitPing_exit0_rand_1820399202()
{


;


}
fun PONG_Pong_SendPong_entry53(PONG_Pong_SendPong_entry53_payload: machine)
{


send PONG_Pong_SendPong_entry53_payload, Pong;

raise Success;


}
fun PONG_Pong_SendPong_exit0_rand_1196649657()
{


;


}
fun PONG_Pong_WaitPing_do_PingIgnored48()
{


assert false;


}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_712778800()
{


;


}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1765198874()
{


;


}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_1790257882();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1820399202();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry53(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1196649657();
}
}
}

