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
var _tmp249: bool;


_tmp249 = (Real_Action1_payload == 100);

assert _tmp249;

send Real_ghost_machine, E3;

send Real_ghost_machine, E3;


}
fun Real_Real_Init_entry13(Real_Real_Init_entry13__payload_0: any)
{
var _tmp250: machine;


_tmp250 = new Ghost(this);

Real_ghost_machine = _tmp250;

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
fun Real_Real_S1_exit0_rand_1408302631()
{


;


}
fun Real_Real_S2_entry32(Real_Real_S2_entry32__payload_3: any)
{


raise unit;


}
fun Real_Real_S2_exit0_rand_1614931501()
{


;


}
fun Real_Real_S3_entry0_rand_1622993974(Real_Real_S3_entry0_rand_1622993974__payload_4: any)
{


;


}
fun Real_Real_S3_exit0_rand_1664556153()
{


;


}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);


}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1447774370(Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1447774370__payload_skip: any)
{


;


}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_538575514(Real_Real_S2_on_unit_goto_Real_Real_S30_rand_538575514__payload_skip: any)
{


;


}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1962849181(Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1962849181__payload_skip: any)
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
Real_Real_S1_exit0_rand_1408302631();
}
}
 state Real_Real_S2
{entry (payload: any) {
Real_Real_S2_entry32(payload);
}
exit  {
Real_Real_S2_exit0_rand_1614931501();
}
}
 state Real_Real_S3
{entry (payload: any) {
Real_Real_S3_entry0_rand_1622993974(payload);
}
exit  {
Real_Real_S3_exit0_rand_1664556153();
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
fun Ghost__Init_exit0_rand_720634711()
{


;


}
fun Ghost_Ghost_Init_entry0_rand_1744383533(Ghost_Ghost_Init_entry0_rand_1744383533__payload_5: any)
{


;


}
fun Ghost_Ghost_Init_exit0_rand_1938733362()
{


;


}
fun Ghost_Ghost_S1_entry65(Ghost_Ghost_S1_entry65__payload_6: any)
{


send Ghost_real_machine, E2, 100;


}
fun Ghost_Ghost_S1_exit0_rand_1905551928()
{


;


}
fun Ghost_Ghost_S2_entry72(Ghost_Ghost_S2_entry72__payload_7: any)
{


send Ghost_real_machine, E4;

send Ghost_real_machine, E4;

send Ghost_real_machine, E4;


}
fun Ghost_Ghost_S2_exit0_rand_827160129()
{


;


}
fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1587378472(Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1587378472__payload_skip: any)
{


;


}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_202616744(Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_202616744__payload_skip: any)
{


;


}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_44551900(Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_44551900__payload_skip: any)
{


;


}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1613440733(Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1613440733__payload_skip: any)
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry52(payload);
}
exit  {
Ghost__Init_exit0_rand_720634711();
}
}
 state Ghost_Ghost_Init
{entry (payload: any) {
Ghost_Ghost_Init_entry0_rand_1744383533(payload);
}
exit  {
Ghost_Ghost_Init_exit0_rand_1938733362();
}
}
 state Ghost_Ghost_S1
{entry (payload: any) {
Ghost_Ghost_S1_entry65(payload);
}
exit  {
Ghost_Ghost_S1_exit0_rand_1905551928();
}
}
 state Ghost_Ghost_S2
{entry (payload: any) {
Ghost_Ghost_S2_entry72(payload);
}
exit  {
Ghost_Ghost_S2_exit0_rand_827160129();
}
}
}

