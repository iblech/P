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
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);
}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_242010299()
{


;

}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_5284610()
{


;

}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_722209006()
{


;

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
fun Real_Real_S1_exit0_rand_836332348()
{


;

}
fun Real_Real_S2_entry32()
{


raise unit;
}
fun Real_Real_S2_exit0_rand_1965982592()
{


;

}
fun Real_Real_S3_entry0_rand_394560013()
{


;

}
fun Real_Real_S3_exit0_rand_1450334293()
{


;

}start  state Real_Real_Init
{entry  {
Real_Real_Init_entry13();
}
exit  {
Real_Real_Init_exit18();
}
on E2 do  (payload: int) {
Real_Real_Init_do_E211(payload);
}
on unit push Real_Real_S1;
on E4 goto Real_Real_S2 with   {
Real_Real_Init_on_E4_goto_Real_Real_S20_rand_242010299();
}
}
 state Real_Real_S1
{entry  {
Real_Real_S1_entry26();
}
exit  {
Real_Real_S1_exit0_rand_836332348();
}
}
 state Real_Real_S2
{entry  {
Real_Real_S2_entry32();
}
exit  {
Real_Real_S2_exit0_rand_1965982592();
}
on unit goto Real_Real_S3 with   {
Real_Real_S2_on_unit_goto_Real_Real_S30_rand_5284610();
}
}
 state Real_Real_S3
{entry  {
Real_Real_S3_entry0_rand_394560013();
}
exit  {
Real_Real_S3_exit0_rand_1450334293();
}
on E4 goto Real_Real_S3 with   {
Real_Real_S3_on_E4_goto_Real_Real_S30_rand_722209006();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1015489751()
{


;

}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1004918612()
{


;

}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_3476597()
{


;

}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_415662758()
{


;

}
fun Ghost__Init_entry52(Ghost__Init_entry52_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry52_payload;
raise unit;
}
fun Ghost__Init_exit0_rand_440939383()
{


;

}
fun Ghost_Ghost_Init_entry0_rand_2084322884()
{


;

}
fun Ghost_Ghost_Init_exit0_rand_1506275729()
{


;

}
fun Ghost_Ghost_S1_entry65()
{


send Ghost_real_machine, E2, 100;
}
fun Ghost_Ghost_S1_exit0_rand_1762333936()
{


;

}
fun Ghost_Ghost_S2_entry72()
{


send Ghost_real_machine, E4;
send Ghost_real_machine, E4;
send Ghost_real_machine, E4;
}
fun Ghost_Ghost_S2_exit0_rand_515157399()
{


;

}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry52(payload);
}
exit  {
Ghost__Init_exit0_rand_440939383();
}
on unit goto Ghost_Ghost_Init with   {
Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1015489751();
}
}
 state Ghost_Ghost_Init
{entry  {
Ghost_Ghost_Init_entry0_rand_2084322884();
}
exit  {
Ghost_Ghost_Init_exit0_rand_1506275729();
}
on E1 goto Ghost_Ghost_S1 with   {
Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1004918612();
}
}
 state Ghost_Ghost_S1
{entry  {
Ghost_Ghost_S1_entry65();
}
exit  {
Ghost_Ghost_S1_exit0_rand_1762333936();
}
ignore E1;on E3 goto Ghost_Ghost_S2 with   {
Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_3476597();
}
}
 state Ghost_Ghost_S2
{entry  {
Ghost_Ghost_S2_entry72();
}
exit  {
Ghost_Ghost_S2_exit0_rand_515157399();
}
on E3 goto Ghost_Ghost_Init with   {
Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_415662758();
}
}
}

