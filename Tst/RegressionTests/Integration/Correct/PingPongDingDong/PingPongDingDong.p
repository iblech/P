event Ping  assert 1: machine;
event Pong  assert 1;
event Success  assert 1;
event Ding  assert 1;
event Dong  assert 1;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_480378707()
{


;

}
fun PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_887263839()
{


;

}
fun PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_228039481()
{


;

}
fun PING_Ping_start_entry13()
{
var _tmp580: machine;


_tmp580 = new PONG(this);
PING_pongId = _tmp580;
raise Success;
}
fun PING_Ping_start_exit0_rand_1919848232()
{


;

}
fun PING_Ping_ping1_entry21()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_ping1_exit0_rand_990969369()
{


;

}
fun PING_Ping_ding1_entry30()
{


send PING_pongId, Ding;
}
fun PING_Ping_ding1_exit0_rand_1119848002()
{


;

}
fun PING_Ping_ping2_entry0_rand_898391322()
{


;

}
fun PING_Ping_ping2_exit0_rand_2041179138()
{


;

}start  state PING_Ping_start
{entry  {
PING_Ping_start_entry13();
}
exit  {
PING_Ping_start_exit0_rand_1919848232();
}
on Success goto PING_Ping_ping1 with   {
PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_480378707();
}
}
 state PING_Ping_ping1
{entry  {
PING_Ping_ping1_entry21();
}
exit  {
PING_Ping_ping1_exit0_rand_990969369();
}
on Success push PING_Ping_ding1;
on Dong goto PING_Ping_ping2 with   {
PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_887263839();
}
}
 state PING_Ping_ding1
{entry  {
PING_Ping_ding1_entry30();
}
exit  {
PING_Ping_ding1_exit0_rand_1119848002();
}
}
 state PING_Ping_ping2
{entry  {
PING_Ping_ping2_entry0_rand_898391322();
}
exit  {
PING_Ping_ping2_exit0_rand_2041179138();
}
on Pong goto PING_Ping_ping1 with   {
PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_228039481();
}
}
}

machine PONG
{
var PONG_pingid: machine;

fun PONG__Init_on_Success_goto_PONG_Pong_start0_rand_1505645021()
{


;

}
fun PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_2067026611()
{


;

}
fun PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_123815754()
{


;

}
fun PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_226744840()
{


;

}
fun PONG__Init_entry47(PONG__Init_entry47_payload: machine)
{


PONG_pingid = PONG__Init_entry47_payload;
raise Success;
}
fun PONG__Init_exit0_rand_1428235630()
{


;

}
fun PONG_Pong_start_entry0_rand_341859497()
{


;

}
fun PONG_Pong_start_exit0_rand_258938295()
{


;

}
fun PONG_Pong_dong1_entry0_rand_1801876827()
{


;

}
fun PONG_Pong_dong1_exit0_rand_1032476754()
{


;

}
fun PONG_Pong_dong2_entry66()
{


send PONG_pingid, Dong;
raise Success;
}
fun PONG_Pong_dong2_exit0_rand_1480935158()
{


;

}
fun PONG_Pong_pong1_entry73()
{


send PONG_pingid, Pong;
raise Success;
}
fun PONG_Pong_pong1_exit0_rand_1158893490()
{


;

}start  state PONG__Init
{entry (payload: machine) {
PONG__Init_entry47(payload);
}
exit  {
PONG__Init_exit0_rand_1428235630();
}
on Success goto PONG_Pong_start with   {
PONG__Init_on_Success_goto_PONG_Pong_start0_rand_1505645021();
}
}
 state PONG_Pong_start
{entry  {
PONG_Pong_start_entry0_rand_341859497();
}
exit  {
PONG_Pong_start_exit0_rand_258938295();
}
on Ping push PONG_Pong_dong1;
on Success goto PONG_Pong_pong1 with   {
PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_2067026611();
}
}
 state PONG_Pong_dong1
{entry  {
PONG_Pong_dong1_entry0_rand_1801876827();
}
exit  {
PONG_Pong_dong1_exit0_rand_1032476754();
}
on Ding goto PONG_Pong_dong2 with   {
PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_123815754();
}
}
 state PONG_Pong_dong2
{entry  {
PONG_Pong_dong2_entry66();
}
exit  {
PONG_Pong_dong2_exit0_rand_1480935158();
}
}
 state PONG_Pong_pong1
{entry  {
PONG_Pong_pong1_entry73();
}
exit  {
PONG_Pong_pong1_exit0_rand_1158893490();
}
on Success goto PONG_Pong_start with   {
PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_226744840();
}
}
}

