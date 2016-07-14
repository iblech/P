event halt;
event null;
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
var _tmp19: bool;


_tmp19 = (Real_Action1_payload == 100);

assert _tmp19;

send Real_ghost_machine, E3;

send Real_ghost_machine, E3;


}
fun Real_Real_Init_entry13()
{
var _tmp20: machine;


_tmp20 = new Ghost(this);

Real_ghost_machine = _tmp20;

raise unit;


}
fun Real_Real_Init_exit0_rand_2139620205()
{


;


}
fun Real_Real_S1_entry23()
{


send Real_ghost_machine, E1;


}
fun Real_Real_S1_exit0_rand_2077323904()
{


;


}
fun Real_Real_S2_entry29()
{


raise unit;


}
fun Real_Real_S2_exit0_rand_528549145()
{


;


}
fun Real_Real_S3_entry0_rand_816295747()
{


;


}
fun Real_Real_S3_exit0_rand_580945408()
{


;


}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);


}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1511885451()
{


;


}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_795967238()
{


;


}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1959873501()
{


;


}start  state Real_Real_Init
{entry  {
Real_Real_Init_entry13();
}
exit  {
Real_Real_Init_exit0_rand_2139620205();
}
}
 state Real_Real_S1
{entry  {
Real_Real_S1_entry23();
}
exit  {
Real_Real_S1_exit0_rand_2077323904();
}
}
 state Real_Real_S2
{entry  {
Real_Real_S2_entry29();
}
exit  {
Real_Real_S2_exit0_rand_528549145();
}
}
 state Real_Real_S3
{entry  {
Real_Real_S3_entry0_rand_816295747();
}
exit  {
Real_Real_S3_exit0_rand_580945408();
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
fun Ghost__Init_exit0_rand_1329668788()
{


;


}
fun Ghost_Ghost_Init_entry0_rand_976581393()
{


;


}
fun Ghost_Ghost_Init_exit0_rand_379728928()
{


;


}
fun Ghost_Ghost_S1_entry62()
{


send Ghost_real_machine, E2, 100;


}
fun Ghost_Ghost_S1_exit0_rand_1899072815()
{


;


}
fun Ghost_Ghost_S2_entry69()
{


send Ghost_real_machine, E4;

send Ghost_real_machine, E4;

send Ghost_real_machine, E4;


}
fun Ghost_Ghost_S2_exit0_rand_1264737604()
{


;


}
fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1208992795()
{


;


}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_2097216312()
{


;


}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_1001511559()
{


;


}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1023231940()
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry49(payload);
}
exit  {
Ghost__Init_exit0_rand_1329668788();
}
}
 state Ghost_Ghost_Init
{entry  {
Ghost_Ghost_Init_entry0_rand_976581393();
}
exit  {
Ghost_Ghost_Init_exit0_rand_379728928();
}
}
 state Ghost_Ghost_S1
{entry  {
Ghost_Ghost_S1_entry62();
}
exit  {
Ghost_Ghost_S1_exit0_rand_1899072815();
}
}
 state Ghost_Ghost_S2
{entry  {
Ghost_Ghost_S2_entry69();
}
exit  {
Ghost_Ghost_S2_exit0_rand_1264737604();
}
}
}

