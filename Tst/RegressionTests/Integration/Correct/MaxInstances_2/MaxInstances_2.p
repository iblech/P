event E1  assert 1;
event E2  assert 1: int;
event E3  assume 1;
event E4;
event unit  assert 1;

main machine Real
{
var Real_ghost_machine: machine;
var Real_test: bool;

fun Real_Action1(Real_Action1_payload: int)
{
var _tmp995: bool;


_tmp995 = (Real_Action1_payload == 100);

assert _tmp995;

send Real_ghost_machine, E3;

send Real_ghost_machine, E3;


}
fun Real_Real_Init_entry13(Real_Real_Init_entry13__payload_0: any)
{
var _tmp996: machine;


_tmp996 = new Ghost(this);

Real_ghost_machine = _tmp996;

raise unit;


}
fun Real_Real_Init_exit18()
{


Real_test = true;


}
fun Real_Real_S1_entry26(Real_Real_S1_entry26__payload_2: any)
{


send Real_ghost_machine, E1;


}
fun Real_Real_S1_exit0_rand_1372297064()
{


;


}
fun Real_Real_S2_entry32(Real_Real_S2_entry32__payload_3: any)
{


raise unit;


}
fun Real_Real_S2_exit0_rand_943744481()
{


;


}
fun Real_Real_S3_entry0_rand_1264017372(Real_Real_S3_entry0_rand_1264017372__payload_4: any)
{


;


}
fun Real_Real_S3_exit0_rand_1045620563()
{


;


}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);


}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1305442044(Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1305442044__payload_skip: any)
{


;


}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1804877116(Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1804877116__payload_skip: any)
{


;


}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_999411189(Real_Real_S3_on_E4_goto_Real_Real_S30_rand_999411189__payload_skip: any)
{


;


}start  state Real_Real_Init
{entry (payload: any) {
Real_Real_Init_entry13(payload);
}
exit  {
Real_Real_Init_exit18();
}
}
 state Real_Real_S1
{entry (payload: any) {
Real_Real_S1_entry26(payload);
}
exit  {
Real_Real_S1_exit0_rand_1372297064();
}
}
 state Real_Real_S2
{entry (payload: any) {
Real_Real_S2_entry32(payload);
}
exit  {
Real_Real_S2_exit0_rand_943744481();
}
}
 state Real_Real_S3
{entry (payload: any) {
Real_Real_S3_entry0_rand_1264017372(payload);
}
exit  {
Real_Real_S3_exit0_rand_1045620563();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_entry52(Ghost__Init_entry52_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry52_payload;

raise unit;


}
fun Ghost__Init_exit0_rand_1318594446()
{


;


}
fun Ghost_Ghost_Init_entry0_rand_2038576685(Ghost_Ghost_Init_entry0_rand_2038576685__payload_5: any)
{


;


}
fun Ghost_Ghost_Init_exit0_rand_950420155()
{


;


}
fun Ghost_Ghost_S1_entry65(Ghost_Ghost_S1_entry65__payload_6: any)
{


send Ghost_real_machine, E2, 100;


}
fun Ghost_Ghost_S1_exit0_rand_1240099731()
{


;


}
fun Ghost_Ghost_S2_entry72(Ghost_Ghost_S2_entry72__payload_7: any)
{


send Ghost_real_machine, E4;

send Ghost_real_machine, E4;

send Ghost_real_machine, E4;


}
fun Ghost_Ghost_S2_exit0_rand_1805734837()
{


;


}
fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1131445177(Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1131445177__payload_skip: any)
{


;


}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1451825963(Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1451825963__payload_skip: any)
{


;


}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_1374794257(Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_1374794257__payload_skip: any)
{


;


}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_770223348(Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_770223348__payload_skip: any)
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry52(payload);
}
exit  {
Ghost__Init_exit0_rand_1318594446();
}
}
 state Ghost_Ghost_Init
{entry (payload: any) {
Ghost_Ghost_Init_entry0_rand_2038576685(payload);
}
exit  {
Ghost_Ghost_Init_exit0_rand_950420155();
}
}
 state Ghost_Ghost_S1
{entry (payload: any) {
Ghost_Ghost_S1_entry65(payload);
}
exit  {
Ghost_Ghost_S1_exit0_rand_1240099731();
}
}
 state Ghost_Ghost_S2
{entry (payload: any) {
Ghost_Ghost_S2_entry72(payload);
}
exit  {
Ghost_Ghost_S2_exit0_rand_1805734837();
}
}
}

