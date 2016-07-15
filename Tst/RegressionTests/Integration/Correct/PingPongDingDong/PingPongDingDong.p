event Ping  assert 1: machine;
event Pong  assert 1;
event Success  assert 1;
event Ding  assert 1;
event Dong  assert 1;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_362907556()
{


;

}
fun PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_433035608()
{


;

}
fun PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_692222858()
{


;

}
fun PING_Ping_start_entry13()
{
var Tmp580: machine;


Tmp580 = new PONG(this);
PING_pongId = Tmp580;
raise Success;
}
fun PING_Ping_start_exit0_rand_635325374()
{


;

}
fun PING_Ping_ping1_entry21()
{


send PING_pongId, Ping, this;
raise Success;
}
fun PING_Ping_ping1_exit0_rand_627376584()
{


;

}
fun PING_Ping_ding1_entry30()
{


send PING_pongId, Ding;
}
fun PING_Ping_ding1_exit0_rand_69616359()
{


;

}
fun PING_Ping_ping2_entry0_rand_930080500()
{


;

}
fun PING_Ping_ping2_exit0_rand_934510192()
{


;

}start 
 state PING_Ping_start
{
entry  {
PING_Ping_start_entry13();
}
exit  {
PING_Ping_start_exit0_rand_635325374();
}
on Success goto PING_Ping_ping1 with   {
PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_362907556();
}
}

 state PING_Ping_ping1
{
entry  {
PING_Ping_ping1_entry21();
}
exit  {
PING_Ping_ping1_exit0_rand_627376584();
}
on Success push PING_Ping_ding1;
on Dong goto PING_Ping_ping2 with   {
PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_433035608();
}
}

 state PING_Ping_ding1
{
entry  {
PING_Ping_ding1_entry30();
}
exit  {
PING_Ping_ding1_exit0_rand_69616359();
}
}

 state PING_Ping_ping2
{
entry  {
PING_Ping_ping2_entry0_rand_930080500();
}
exit  {
PING_Ping_ping2_exit0_rand_934510192();
}
on Pong goto PING_Ping_ping1 with   {
PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_692222858();
}
}
}

machine PONG
{
var PONG_pingid: machine;

fun PONG__Init_on_Success_goto_PONG_Pong_start0_rand_246451476()
{


;

}
fun PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_775212435()
{


;

}
fun PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_290950866()
{


;

}
fun PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_2144814991()
{


;

}
fun PONG__Init_entry47(PONG__Init_entry47_payload: machine)
{


PONG_pingid = PONG__Init_entry47_payload;
raise Success;
}
fun PONG__Init_exit0_rand_2003374504()
{


;

}
fun PONG_Pong_start_entry0_rand_1146125803()
{


;

}
fun PONG_Pong_start_exit0_rand_2110443492()
{


;

}
fun PONG_Pong_dong1_entry0_rand_407671805()
{


;

}
fun PONG_Pong_dong1_exit0_rand_66675458()
{


;

}
fun PONG_Pong_dong2_entry66()
{


send PONG_pingid, Dong;
raise Success;
}
fun PONG_Pong_dong2_exit0_rand_1469041521()
{


;

}
fun PONG_Pong_pong1_entry73()
{


send PONG_pingid, Pong;
raise Success;
}
fun PONG_Pong_pong1_exit0_rand_23834897()
{


;

}start 
 state PONG__Init
{
entry (payload: machine) {
PONG__Init_entry47(payload);
}
exit  {
PONG__Init_exit0_rand_2003374504();
}
on Success goto PONG_Pong_start with   {
PONG__Init_on_Success_goto_PONG_Pong_start0_rand_246451476();
}
}

 state PONG_Pong_start
{
entry  {
PONG_Pong_start_entry0_rand_1146125803();
}
exit  {
PONG_Pong_start_exit0_rand_2110443492();
}
on Ping push PONG_Pong_dong1;
on Success goto PONG_Pong_pong1 with   {
PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_775212435();
}
}

 state PONG_Pong_dong1
{
entry  {
PONG_Pong_dong1_entry0_rand_407671805();
}
exit  {
PONG_Pong_dong1_exit0_rand_66675458();
}
on Ding goto PONG_Pong_dong2 with   {
PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_290950866();
}
}

 state PONG_Pong_dong2
{
entry  {
PONG_Pong_dong2_entry66();
}
exit  {
PONG_Pong_dong2_exit0_rand_1469041521();
}
}

 state PONG_Pong_pong1
{
entry  {
PONG_Pong_pong1_entry73();
}
exit  {
PONG_Pong_pong1_exit0_rand_23834897();
}
on Success goto PONG_Pong_start with   {
PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_2144814991();
}
}
}

