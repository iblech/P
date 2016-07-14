event halt;
event null;
event Ping  assert 1: machine;
event Pong  assert 1;
event Success  assert 1;
event Ding  assert 1;
event Dong  assert 1;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_start_entry13()
{
var _tmp580: machine;


_tmp580 = new PONG(this);

PING_pongId = _tmp580;

raise Success;


}
fun PING_Ping_start_exit0_rand_2029716676()
{


;


}
fun PING_Ping_ping1_entry21()
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_ping1_exit0_rand_2056017221()
{


;


}
fun PING_Ping_ding1_entry30()
{


send PING_pongId, Ding;


}
fun PING_Ping_ding1_exit0_rand_673742375()
{


;


}
fun PING_Ping_ping2_entry0_rand_1312275155()
{


;


}
fun PING_Ping_ping2_exit0_rand_537411521()
{


;


}
fun PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_1883081916()
{


;


}
fun PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_171476426()
{


;


}
fun PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1961350320()
{


;


}start  state PING_Ping_start
{entry  {
PING_Ping_start_entry13();
}
exit  {
PING_Ping_start_exit0_rand_2029716676();
}
}
 state PING_Ping_ping1
{entry  {
PING_Ping_ping1_entry21();
}
exit  {
PING_Ping_ping1_exit0_rand_2056017221();
}
}
 state PING_Ping_ding1
{entry  {
PING_Ping_ding1_entry30();
}
exit  {
PING_Ping_ding1_exit0_rand_673742375();
}
}
 state PING_Ping_ping2
{entry  {
PING_Ping_ping2_entry0_rand_1312275155();
}
exit  {
PING_Ping_ping2_exit0_rand_537411521();
}
}
}

machine PONG
{
var PONG_pingid: machine;

fun PONG__Init_entry47(PONG__Init_entry47_payload: machine)
{


PONG_pingid = PONG__Init_entry47_payload;

raise Success;


}
fun PONG__Init_exit0_rand_260192262()
{


;


}
fun PONG_Pong_start_entry0_rand_196980301()
{


;


}
fun PONG_Pong_start_exit0_rand_1779980832()
{


;


}
fun PONG_Pong_dong1_entry0_rand_1872639384()
{


;


}
fun PONG_Pong_dong1_exit0_rand_1643962102()
{


;


}
fun PONG_Pong_dong2_entry66()
{


send PONG_pingid, Dong;

raise Success;


}
fun PONG_Pong_dong2_exit0_rand_2133301315()
{


;


}
fun PONG_Pong_pong1_entry73()
{


send PONG_pingid, Pong;

raise Success;


}
fun PONG_Pong_pong1_exit0_rand_1328723197()
{


;


}
fun PONG__Init_on_Success_goto_PONG_Pong_start0_rand_1186460257()
{


;


}
fun PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_1924512041()
{


;


}
fun PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_1312277802()
{


;


}
fun PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_1524411051()
{


;


}start  state PONG__Init
{entry (payload: machine) {
PONG__Init_entry47(payload);
}
exit  {
PONG__Init_exit0_rand_260192262();
}
}
 state PONG_Pong_start
{entry  {
PONG_Pong_start_entry0_rand_196980301();
}
exit  {
PONG_Pong_start_exit0_rand_1779980832();
}
}
 state PONG_Pong_dong1
{entry  {
PONG_Pong_dong1_entry0_rand_1872639384();
}
exit  {
PONG_Pong_dong1_exit0_rand_1643962102();
}
}
 state PONG_Pong_dong2
{entry  {
PONG_Pong_dong2_entry66();
}
exit  {
PONG_Pong_dong2_exit0_rand_2133301315();
}
}
 state PONG_Pong_pong1
{entry  {
PONG_Pong_pong1_entry73();
}
exit  {
PONG_Pong_pong1_exit0_rand_1328723197();
}
}
}

