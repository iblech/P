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
var Real_test: bool;

fun Real_Action1(Real_Action1_payload: int)
{
var _tmp406: bool;


_tmp406 = (Real_Action1_payload == 100);

assert _tmp406;

send Real_ghost_machine, E3;

send Real_ghost_machine, E3;


}
fun Real_Real_Init_entry13()
{
var _tmp407: machine;


_tmp407 = new Ghost(this);

Real_ghost_machine = _tmp407;

raise unit;


}
fun Real_Real_Init_exit18()
{


Real_test = true;


}
fun Real_Real_S1_entry26()
{


send Real_ghost_machine, E1;


}
fun Real_Real_S1_exit0_rand_1342588087()
{


;


}
fun Real_Real_S2_entry32()
{


raise unit;


}
fun Real_Real_S2_exit0_rand_934006012()
{


;


}
fun Real_Real_S3_entry0_rand_98014857()
{


;


}
fun Real_Real_S3_exit0_rand_2146306492()
{


;


}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);


}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1294814352()
{


;


}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_570942030()
{


;


}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_48578367()
{


;


}start  state Real_Real_Init
{entry  {
Real_Real_Init_entry13();
}
exit  {
Real_Real_Init_exit18();
}
}
 state Real_Real_S1
{entry  {
Real_Real_S1_entry26();
}
exit  {
Real_Real_S1_exit0_rand_1342588087();
}
}
 state Real_Real_S2
{entry  {
Real_Real_S2_entry32();
}
exit  {
Real_Real_S2_exit0_rand_934006012();
}
}
 state Real_Real_S3
{entry  {
Real_Real_S3_entry0_rand_98014857();
}
exit  {
Real_Real_S3_exit0_rand_2146306492();
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
fun Ghost__Init_exit0_rand_425203358()
{


;


}
fun Ghost_Ghost_Init_entry0_rand_1417204127()
{


;


}
fun Ghost_Ghost_Init_exit0_rand_931802738()
{


;


}
fun Ghost_Ghost_S1_entry65()
{


send Ghost_real_machine, E2, 100;


}
fun Ghost_Ghost_S1_exit0_rand_1879231499()
{


;


}
fun Ghost_Ghost_S2_entry72()
{


send Ghost_real_machine, E4;

send Ghost_real_machine, E4;

send Ghost_real_machine, E4;


}
fun Ghost_Ghost_S2_exit0_rand_571469272()
{


;


}
fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_551229027()
{


;


}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1281143640()
{


;


}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_601747478()
{


;


}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1002482009()
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry52(payload);
}
exit  {
Ghost__Init_exit0_rand_425203358();
}
}
 state Ghost_Ghost_Init
{entry  {
Ghost_Ghost_Init_entry0_rand_1417204127();
}
exit  {
Ghost_Ghost_Init_exit0_rand_931802738();
}
}
 state Ghost_Ghost_S1
{entry  {
Ghost_Ghost_S1_entry65();
}
exit  {
Ghost_Ghost_S1_exit0_rand_1879231499();
}
}
 state Ghost_Ghost_S2
{entry  {
Ghost_Ghost_S2_entry72();
}
exit  {
Ghost_Ghost_S2_exit0_rand_571469272();
}
}
}

