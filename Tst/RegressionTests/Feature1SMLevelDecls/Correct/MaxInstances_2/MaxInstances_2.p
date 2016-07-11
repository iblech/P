event E1  assert 1;
event E2  assert 1: int;
event E3  assume 1;
event E4;
event unit  assert 1;

main machine Real
{
var Real_ghost_machine: machine;

fun Real_Action1(Real_Action1_payload: int)
{
var _tmp21: bool;


_tmp21 = (Real_Action1_payload == 100);

assert _tmp21;

send Real_ghost_machine, E3;

send Real_ghost_machine, E3;


}
fun Real_Real_Init_entry13(Real_Real_Init_entry13__payload_0: any)
{
var _tmp22: machine;


_tmp22 = new Ghost(this);

Real_ghost_machine = _tmp22;

raise unit;


}
fun Real_Real_Init_exit0_rand_881081217()
{


;


}
fun Real_Real_S1_entry23(Real_Real_S1_entry23__payload_1: any)
{


send Real_ghost_machine, E1;


}
fun Real_Real_S1_exit0_rand_2050168645()
{


;


}
fun Real_Real_S2_entry29(Real_Real_S2_entry29__payload_2: any)
{


raise unit;


}
fun Real_Real_S2_exit0_rand_1188080711()
{


;


}
fun Real_Real_S3_entry0_rand_261821379(Real_Real_S3_entry0_rand_261821379__payload_3: any)
{


;


}
fun Real_Real_S3_exit0_rand_621281067()
{


;


}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);


}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_218268609(Real_Real_Init_on_E4_goto_Real_Real_S20_rand_218268609__payload_skip: any)
{


;


}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1772588530(Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1772588530__payload_skip: any)
{


;


}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_2003796972(Real_Real_S3_on_E4_goto_Real_Real_S30_rand_2003796972__payload_skip: any)
{


;


}start  state Real_Real_Init
{entry (payload: any) {
Real_Real_Init_entry13(payload);
}
exit  {
Real_Real_Init_exit0_rand_881081217();
}
}
 state Real_Real_S1
{entry (payload: any) {
Real_Real_S1_entry23(payload);
}
exit  {
Real_Real_S1_exit0_rand_2050168645();
}
}
 state Real_Real_S2
{entry (payload: any) {
Real_Real_S2_entry29(payload);
}
exit  {
Real_Real_S2_exit0_rand_1188080711();
}
}
 state Real_Real_S3
{entry (payload: any) {
Real_Real_S3_entry0_rand_261821379(payload);
}
exit  {
Real_Real_S3_exit0_rand_621281067();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_entry49(Ghost__Init_entry49_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry49_payload;

raise unit;


}
fun Ghost__Init_exit0_rand_1058369389()
{


;


}
fun Ghost_Ghost_Init_entry0_rand_1010858539(Ghost_Ghost_Init_entry0_rand_1010858539__payload_4: any)
{


;


}
fun Ghost_Ghost_Init_exit0_rand_903280321()
{


;


}
fun Ghost_Ghost_S1_entry62(Ghost_Ghost_S1_entry62__payload_5: any)
{


send Ghost_real_machine, E2, 100;


}
fun Ghost_Ghost_S1_exit0_rand_1792188472()
{


;


}
fun Ghost_Ghost_S2_entry69(Ghost_Ghost_S2_entry69__payload_6: any)
{


send Ghost_real_machine, E4;

send Ghost_real_machine, E4;

send Ghost_real_machine, E4;


}
fun Ghost_Ghost_S2_exit0_rand_1738799401()
{


;


}
fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1187106638(Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1187106638__payload_skip: any)
{


;


}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1376716160(Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1376716160__payload_skip: any)
{


;


}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_302384540(Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_302384540__payload_skip: any)
{


;


}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1109269016(Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1109269016__payload_skip: any)
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry49(payload);
}
exit  {
Ghost__Init_exit0_rand_1058369389();
}
}
 state Ghost_Ghost_Init
{entry (payload: any) {
Ghost_Ghost_Init_entry0_rand_1010858539(payload);
}
exit  {
Ghost_Ghost_Init_exit0_rand_903280321();
}
}
 state Ghost_Ghost_S1
{entry (payload: any) {
Ghost_Ghost_S1_entry62(payload);
}
exit  {
Ghost_Ghost_S1_exit0_rand_1792188472();
}
}
 state Ghost_Ghost_S2
{entry (payload: any) {
Ghost_Ghost_S2_entry69(payload);
}
exit  {
Ghost_Ghost_S2_exit0_rand_1738799401();
}
}
}

