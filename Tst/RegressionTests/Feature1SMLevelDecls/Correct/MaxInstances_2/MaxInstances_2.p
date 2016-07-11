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
var _tmp22: bool;


_tmp22 = (Real_Action1_payload == 100);
;
assert _tmp22;
;
send Real_ghost_machine, E3;
;
send Real_ghost_machine, E3;


}
fun Real_Real_Init_entry13(Real_Real_Init_entry13__payload_0: any)
{
var _tmp23: machine;


_tmp23 = new Ghost(this);
;
Real_ghost_machine = _tmp23;
;
raise unit;


}
fun Real_Real_Init_exit0_rand_1775572520()
{


;


}
fun Real_Real_S1_entry23(Real_Real_S1_entry23__payload_1: any)
{


send Real_ghost_machine, E1;


}
fun Real_Real_S1_exit0_rand_831720139()
{


;


}
fun Real_Real_S2_entry29(Real_Real_S2_entry29__payload_2: any)
{


raise unit;


}
fun Real_Real_S2_exit0_rand_1060573145()
{


;


}
fun Real_Real_S3_entry0_rand_1947386879(Real_Real_S3_entry0_rand_1947386879__payload_3: any)
{


;


}
fun Real_Real_S3_exit0_rand_1244931819()
{


;


}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);


}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1601137232(Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1601137232__payload_skip: any)
{


;


}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_125640071(Real_Real_S2_on_unit_goto_Real_Real_S30_rand_125640071__payload_skip: any)
{


;


}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_196703245(Real_Real_S3_on_E4_goto_Real_Real_S30_rand_196703245__payload_skip: any)
{


;


}start  state Real_Real_Init
{entry (payload: any) {
Real_Real_Init_entry13(payload);
}
exit  {
Real_Real_Init_exit0_rand_1775572520();
}
}
 state Real_Real_S1
{entry (payload: any) {
Real_Real_S1_entry23(payload);
}
exit  {
Real_Real_S1_exit0_rand_831720139();
}
}
 state Real_Real_S2
{entry (payload: any) {
Real_Real_S2_entry29(payload);
}
exit  {
Real_Real_S2_exit0_rand_1060573145();
}
}
 state Real_Real_S3
{entry (payload: any) {
Real_Real_S3_entry0_rand_1947386879(payload);
}
exit  {
Real_Real_S3_exit0_rand_1244931819();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_entry49(Ghost__Init_entry49_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry49_payload;
;
raise unit;


}
fun Ghost__Init_exit0_rand_1055411422()
{


;


}
fun Ghost_Ghost_Init_entry0_rand_1008566005(Ghost_Ghost_Init_entry0_rand_1008566005__payload_4: any)
{


;


}
fun Ghost_Ghost_Init_exit0_rand_65042797()
{


;


}
fun Ghost_Ghost_S1_entry62(Ghost_Ghost_S1_entry62__payload_5: any)
{


send Ghost_real_machine, E2, 100;


}
fun Ghost_Ghost_S1_exit0_rand_1883101338()
{


;


}
fun Ghost_Ghost_S2_entry69(Ghost_Ghost_S2_entry69__payload_6: any)
{


send Ghost_real_machine, E4;
;
send Ghost_real_machine, E4;
;
send Ghost_real_machine, E4;


}
fun Ghost_Ghost_S2_exit0_rand_1508123716()
{


;


}
fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_712645492(Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_712645492__payload_skip: any)
{


;


}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_2048800077(Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_2048800077__payload_skip: any)
{


;


}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_2030415522(Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_2030415522__payload_skip: any)
{


;


}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_725189897(Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_725189897__payload_skip: any)
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry49(payload);
}
exit  {
Ghost__Init_exit0_rand_1055411422();
}
}
 state Ghost_Ghost_Init
{entry (payload: any) {
Ghost_Ghost_Init_entry0_rand_1008566005(payload);
}
exit  {
Ghost_Ghost_Init_exit0_rand_65042797();
}
}
 state Ghost_Ghost_S1
{entry (payload: any) {
Ghost_Ghost_S1_entry62(payload);
}
exit  {
Ghost_Ghost_S1_exit0_rand_1883101338();
}
}
 state Ghost_Ghost_S2
{entry (payload: any) {
Ghost_Ghost_S2_entry69(payload);
}
exit  {
Ghost_Ghost_S2_exit0_rand_1508123716();
}
}
}

