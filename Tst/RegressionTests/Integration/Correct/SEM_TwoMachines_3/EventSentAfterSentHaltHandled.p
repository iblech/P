event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2073293782()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_976199600()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1544821906()
{


;

}
fun PING_Ping_Init_entry13()
{
var _tmp590: machine;


_tmp590 = new PONG(null);
PING_pongId = _tmp590;
raise Success;
}
fun PING_Ping_Init_exit0_rand_347303487()
{


;

}
fun PING_Ping_SendPing_entry21()
{
var _tmp591: bool;
var _tmp592: bool;


PING_count = (PING_count + 1);
_tmp591 = (PING_count == 1);
if(_tmp591)
{

send PING_pongId, Ping, this;

}
else
{

;


}

_tmp592 = (PING_count == 2);
if(_tmp592)
{

send PING_pongId, halt;
send PING_pongId, PingIgnored;

}
else
{

;


}

raise Success;
}
fun PING_Ping_SendPing_exit0_rand_2067105404()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_58286869()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_1974131148()
{


;

}
fun PING_Done_entry0_rand_1387086819()
{


;

}
fun PING_Done_exit0_rand_1112758961()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry13();
}
exit  {
PING_Ping_Init_exit0_rand_347303487();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_2073293782();
}
}
 state PING_Ping_SendPing
{entry  {
PING_Ping_SendPing_entry21();
}
exit  {
PING_Ping_SendPing_exit0_rand_2067105404();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_976199600();
}
}
 state PING_Ping_WaitPong
{entry  {
PING_Ping_WaitPong_entry0_rand_58286869();
}
exit  {
PING_Ping_WaitPong_exit0_rand_1974131148();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_1544821906();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_1387086819();
}
exit  {
PING_Done_exit0_rand_1112758961();
}
}
}

machine PONG
{

fun PONG_Pong_SendPong_do_PingIgnored55()
{


assert false;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1931566708()
{


;

}
fun PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1951371354()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1700725702()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_131595026()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_193996419()
{


;

}
fun PONG_Pong_SendPong_entry51(PONG_Pong_SendPong_entry51_payload: machine)
{


send PONG_Pong_SendPong_entry51_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_1417698402()
{


;

}
fun PONG_Pong_Halt_entry0_rand_1448420095()
{


;

}
fun PONG_Pong_Halt_exit0_rand_440300524()
{


;

}start  state PONG_Pong_WaitPing
{entry  {
PONG_Pong_WaitPing_entry0_rand_131595026();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_193996419();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_1931566708();
}

on halt goto PONG_Pong_Halt with   {
PONG_Pong_WaitPing_on_halt_goto_PONG_Pong_Halt0_rand_1951371354();
}
}
 state PONG_Pong_SendPong
{entry (payload: machine) {
PONG_Pong_SendPong_entry51(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_1417698402();
}
on PingIgnored do   {
PONG_Pong_SendPong_do_PingIgnored55();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1700725702();
}
}
 state PONG_Pong_Halt
{entry  {
PONG_Pong_Halt_entry0_rand_1448420095();
}
exit  {
PONG_Pong_Halt_exit0_rand_440300524();
}
ignore Ping;
ignore PingIgnored;}
}

