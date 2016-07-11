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
var _tmp1162: machine;


_tmp1162 = new PONG(this);
;
PING_pongId = _tmp1162;
;
raise Success;


}
fun PING_Ping_start_exit0_rand_1761519107()
{


;


}
fun PING_Ping_ping1_entry21(PING_Ping_ping1_entry21__payload_1: any)
{


send PING_pongId, Ping, this;
;
raise Success;


}
fun PING_Ping_ping1_exit0_rand_1476191035()
{


;


}
fun PING_Ping_ding1_entry30(PING_Ping_ding1_entry30__payload_2: any)
{


send PING_pongId, Ding;


}
fun PING_Ping_ding1_exit0_rand_795700809()
{


;


}
fun PING_Ping_ping2_entry0_rand_690277042(PING_Ping_ping2_entry0_rand_690277042__payload_3: any)
{


;


}
fun PING_Ping_ping2_exit0_rand_1933086546()
{


;


}
fun PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_1880260462(PING_Ping_start_on_Success_goto_PING_Ping_ping10_rand_1880260462__payload_skip: any)
{


;


}
fun PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_830663651(PING_Ping_ping1_on_Dong_goto_PING_Ping_ping20_rand_830663651__payload_skip: any)
{


;


}
fun PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1259722977(PING_Ping_ping2_on_Pong_goto_PING_Ping_ping10_rand_1259722977__payload_skip: any)
{


;


}start  state PING_Ping_start
{entry (payload: any) {
PING_Ping_start_entry13(payload);
}
exit  {
PING_Ping_start_exit0_rand_1761519107();
}
}
 state PING_Ping_ping1
{entry (payload: any) {
PING_Ping_ping1_entry21(payload);
}
exit  {
PING_Ping_ping1_exit0_rand_1476191035();
}
}
 state PING_Ping_ding1
{entry (payload: any) {
PING_Ping_ding1_entry30(payload);
}
exit  {
PING_Ping_ding1_exit0_rand_795700809();
}
}
 state PING_Ping_ping2
{entry (payload: any) {
PING_Ping_ping2_entry0_rand_690277042(payload);
}
exit  {
PING_Ping_ping2_exit0_rand_1933086546();
}
}
}

machine PONG
{
var PONG_pingid: machine;

fun PONG__Init_entry47(PONG__Init_entry47_payload: machine)
{


PONG_pingid = PONG__Init_entry47_payload;
;
raise Success;


}
fun PONG__Init_exit0_rand_1304540456()
{


;


}
fun PONG_Pong_start_entry0_rand_1940112722(PONG_Pong_start_entry0_rand_1940112722__payload_4: any)
{


;


}
fun PONG_Pong_start_exit0_rand_1991548990()
{


;


}
fun PONG_Pong_dong1_entry0_rand_1514547641(PONG_Pong_dong1_entry0_rand_1514547641__payload_5: any)
{


;


}
fun PONG_Pong_dong1_exit0_rand_379438964()
{


;


}
fun PONG_Pong_dong2_entry66(PONG_Pong_dong2_entry66__payload_6: any)
{


send PONG_pingid, Dong;
;
raise Success;


}
fun PONG_Pong_dong2_exit0_rand_1148151314()
{


;


}
fun PONG_Pong_pong1_entry73(PONG_Pong_pong1_entry73__payload_7: any)
{


send PONG_pingid, Pong;
;
raise Success;


}
fun PONG_Pong_pong1_exit0_rand_1678637019()
{


;


}
fun PONG__Init_on_Success_goto_PONG_Pong_start0_rand_409913416(PONG__Init_on_Success_goto_PONG_Pong_start0_rand_409913416__payload_skip: any)
{


;


}
fun PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_224076027(PONG_Pong_start_on_Success_goto_PONG_Pong_pong10_rand_224076027__payload_skip: any)
{


;


}
fun PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_162502992(PONG_Pong_dong1_on_Ding_goto_PONG_Pong_dong20_rand_162502992__payload_skip: any)
{


;


}
fun PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_1982967363(PONG_Pong_pong1_on_Success_goto_PONG_Pong_start0_rand_1982967363__payload_skip: any)
{


;


}start  state PONG__Init
{entry (payload: machine) {
PONG__Init_entry47(payload);
}
exit  {
PONG__Init_exit0_rand_1304540456();
}
}
 state PONG_Pong_start
{entry (payload: any) {
PONG_Pong_start_entry0_rand_1940112722(payload);
}
exit  {
PONG_Pong_start_exit0_rand_1991548990();
}
}
 state PONG_Pong_dong1
{entry (payload: any) {
PONG_Pong_dong1_entry0_rand_1514547641(payload);
}
exit  {
PONG_Pong_dong1_exit0_rand_379438964();
}
}
 state PONG_Pong_dong2
{entry (payload: any) {
PONG_Pong_dong2_entry66(payload);
}
exit  {
PONG_Pong_dong2_exit0_rand_1148151314();
}
}
 state PONG_Pong_pong1
{entry (payload: any) {
PONG_Pong_pong1_entry73(payload);
}
exit  {
PONG_Pong_pong1_exit0_rand_1678637019();
}
}
}

