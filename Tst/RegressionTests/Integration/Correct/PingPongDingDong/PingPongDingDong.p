event Ping  assert 1: machine;
event Pong  assert 1;
event Success  assert 1;
event Ding  assert 1;
event Dong  assert 1;

main machine PING
{
var PING_pongId: machine;

fun PING_Ping_start_entry13(PING_Ping_start_entry13__payload_0: any)
{
var _tmp1169: machine;


_tmp1169 = new PONG(this);

PING_pongId = _tmp1169;

raise Success;


}
fun PING_Ping_start_exit0_rand_719811154()
{


;


}
fun PING_Ping_ping1_entry21(PING_Ping_ping1_entry21__payload_1: any)
{


send PING_pongId, Ping, this;

raise Success;


}
fun PING_Ping_ping1_exit0_rand_1758907234()
{


;


}
fun PING_Ping_ding1_entry30(PING_Ping_ding1_entry30__payload_2: any)
{


send PING_pongId, Ding;


}
fun PING_Ping_ding1_exit0_rand_924446019()
{


;


}
fun PING_Ping_ping2_entry0_rand_1380841649(PING_Ping_ping2_entry0_rand_1380841649__payload_3: any)
{


;


}
fun PING_Ping_ping2_exit0_rand_1127760372()
{


;


}
fun PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_1098442172(PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_1098442172__payload_skip: any)
{


;


}
fun PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_814295328(PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_814295328__payload_skip: any)
{


;


}
fun PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1543312150(PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1543312150__payload_skip: any)
{


;


}start  state PING_Ping_start
{entry (payload: any) {
PING_Ping_start_entry13(payload);
}
exit  {
PING_Ping_start_exit0_rand_719811154();
}
}
 state PING_Ping_ping1
{entry (payload: any) {
PING_Ping_ping1_entry21(payload);
}
exit  {
PING_Ping_ping1_exit0_rand_1758907234();
}
}
 state PING_Ping_ding1
{entry (payload: any) {
PING_Ping_ding1_entry30(payload);
}
exit  {
PING_Ping_ding1_exit0_rand_924446019();
}
}
 state PING_Ping_ping2
{entry (payload: any) {
PING_Ping_ping2_entry0_rand_1380841649(payload);
}
exit  {
PING_Ping_ping2_exit0_rand_1127760372();
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
fun PONG__Init_exit0_rand_1530272363()
{


;


}
fun PONG_Pong_start_entry0_rand_514548759(PONG_Pong_start_entry0_rand_514548759__payload_4: any)
{


;


}
fun PONG_Pong_start_exit0_rand_1258964452()
{


;


}
fun PONG_Pong_dong1_entry0_rand_538914004(PONG_Pong_dong1_entry0_rand_538914004__payload_5: any)
{


;


}
fun PONG_Pong_dong1_exit0_rand_1117522912()
{


;


}
fun PONG_Pong_dong2_entry66(PONG_Pong_dong2_entry66__payload_6: any)
{


send PONG_pingid, Dong;

raise Success;


}
fun PONG_Pong_dong2_exit0_rand_1083441015()
{


;


}
fun PONG_Pong_pong1_entry73(PONG_Pong_pong1_entry73__payload_7: any)
{


send PONG_pingid, Pong;

raise Success;


}
fun PONG_Pong_pong1_exit0_rand_1794112859()
{


;


}
fun PONG__Init_on_Success_goto_PONG_Pong_start0_rand_425375931(PONG__Init_on_Success_goto_PONG_Pong_start0_rand_425375931__payload_skip: any)
{


;


}
fun PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_1545901726(PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_1545901726__payload_skip: any)
{


;


}
fun PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_2144298253(PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_2144298253__payload_skip: any)
{


;


}
fun PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_1327422400(PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_1327422400__payload_skip: any)
{


;


}start  state PONG__Init
{entry (payload: machine) {
PONG__Init_entry47(payload);
}
exit  {
PONG__Init_exit0_rand_1530272363();
}
}
 state PONG_Pong_start
{entry (payload: any) {
PONG_Pong_start_entry0_rand_514548759(payload);
}
exit  {
PONG_Pong_start_exit0_rand_1258964452();
}
}
 state PONG_Pong_dong1
{entry (payload: any) {
PONG_Pong_dong1_entry0_rand_538914004(payload);
}
exit  {
PONG_Pong_dong1_exit0_rand_1117522912();
}
}
 state PONG_Pong_dong2
{entry (payload: any) {
PONG_Pong_dong2_entry66(payload);
}
exit  {
PONG_Pong_dong2_exit0_rand_1083441015();
}
}
 state PONG_Pong_pong1
{entry (payload: any) {
PONG_Pong_pong1_entry73(payload);
}
exit  {
PONG_Pong_pong1_exit0_rand_1794112859();
}
}
}

