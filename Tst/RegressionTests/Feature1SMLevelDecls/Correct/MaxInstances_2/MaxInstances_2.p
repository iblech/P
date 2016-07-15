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
var Tmp19: bool;


Tmp19 = (Real_Action1_payload == 100);
assert Tmp19;
send Real_ghost_machine, E3;
send Real_ghost_machine, E3;
}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);
}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1799053339()
{


;

}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1739088412()
{


;

}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1783044108()
{


;

}
fun Real_Real_Init_entry13()
{
var Tmp20: machine;


Tmp20 = new Ghost(this);
Real_ghost_machine = Tmp20;
raise unit;
}
fun Real_Real_Init_exit0_rand_1782922681()
{


;

}
fun Real_Real_S1_entry23()
{


send Real_ghost_machine, E1;
}
fun Real_Real_S1_exit0_rand_702194493()
{


;

}
fun Real_Real_S2_entry29()
{


raise unit;
}
fun Real_Real_S2_exit0_rand_230070174()
{


;

}
fun Real_Real_S3_entry0_rand_446786548()
{


;

}
fun Real_Real_S3_exit0_rand_1411208512()
{


;

}start 
 state Real_Real_Init
{
entry  {
Real_Real_Init_entry13();
}
exit  {
Real_Real_Init_exit0_rand_1782922681();
}
on E2 do  (payload: int) {
Real_Real_Init_do_E211(payload);
}
on unit push Real_Real_S1;
on E4 goto Real_Real_S2 with   {
Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1799053339();
}
}

 state Real_Real_S1
{
entry  {
Real_Real_S1_entry23();
}
exit  {
Real_Real_S1_exit0_rand_702194493();
}
}

 state Real_Real_S2
{
entry  {
Real_Real_S2_entry29();
}
exit  {
Real_Real_S2_exit0_rand_230070174();
}
on unit goto Real_Real_S3 with   {
Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1739088412();
}
}

 state Real_Real_S3
{
entry  {
Real_Real_S3_entry0_rand_446786548();
}
exit  {
Real_Real_S3_exit0_rand_1411208512();
}
on E4 goto Real_Real_S3 with   {
Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1783044108();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1184211092()
{


;

}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1711905112()
{


;

}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_212013843()
{


;

}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1871602480()
{


;

}
fun Ghost__Init_entry49(Ghost__Init_entry49_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry49_payload;
raise unit;
}
fun Ghost__Init_exit0_rand_518306755()
{


;

}
fun Ghost_Ghost_Init_entry0_rand_88212178()
{


;

}
fun Ghost_Ghost_Init_exit0_rand_867430127()
{


;

}
fun Ghost_Ghost_S1_entry62()
{


send Ghost_real_machine, E2, 100;
}
fun Ghost_Ghost_S1_exit0_rand_1212651513()
{


;

}
fun Ghost_Ghost_S2_entry69()
{


send Ghost_real_machine, E4;
send Ghost_real_machine, E4;
send Ghost_real_machine, E4;
}
fun Ghost_Ghost_S2_exit0_rand_987862149()
{


;

}start 
 state Ghost__Init
{
entry (payload: machine) {
Ghost__Init_entry49(payload);
}
exit  {
Ghost__Init_exit0_rand_518306755();
}
on unit goto Ghost_Ghost_Init with   {
Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_1184211092();
}
}

 state Ghost_Ghost_Init
{
entry  {
Ghost_Ghost_Init_entry0_rand_88212178();
}
exit  {
Ghost_Ghost_Init_exit0_rand_867430127();
}
on E1 goto Ghost_Ghost_S1 with   {
Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1711905112();
}
}

 state Ghost_Ghost_S1
{
entry  {
Ghost_Ghost_S1_entry62();
}
exit  {
Ghost_Ghost_S1_exit0_rand_1212651513();
}
ignore E1;on E3 goto Ghost_Ghost_S2 with   {
Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_212013843();
}
}

 state Ghost_Ghost_S2
{
entry  {
Ghost_Ghost_S2_entry69();
}
exit  {
Ghost_Ghost_S2_exit0_rand_987862149();
}
on E3 goto Ghost_Ghost_Init with   {
Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1871602480();
}
}
}

