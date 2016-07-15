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
var Tmp406: bool;


Tmp406 = (Real_Action1_payload == 100);
assert Tmp406;
send Real_ghost_machine, E3;
send Real_ghost_machine, E3;
}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


Real_Action1(Real_Real_Init_do_E211_payload);
}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_982425220()
{


;

}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1323101853()
{


;

}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1011485419()
{


;

}
fun Real_Real_Init_entry13()
{
var Tmp407: machine;


Tmp407 = new Ghost(this);
Real_ghost_machine = Tmp407;
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
fun Real_Real_S1_exit0_rand_852063781()
{


;

}
fun Real_Real_S2_entry32()
{


raise unit;
}
fun Real_Real_S2_exit0_rand_879416924()
{


;

}
fun Real_Real_S3_entry0_rand_982088487()
{


;

}
fun Real_Real_S3_exit0_rand_605111255()
{


;

}start 
 state Real_Real_Init
{
entry  {
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
Real_Real_Init_on_E4_goto_Real_Real_S20_rand_982425220();
}
}

 state Real_Real_S1
{
entry  {
Real_Real_S1_entry26();
}
exit  {
Real_Real_S1_exit0_rand_852063781();
}
}

 state Real_Real_S2
{
entry  {
Real_Real_S2_entry32();
}
exit  {
Real_Real_S2_exit0_rand_879416924();
}
on unit goto Real_Real_S3 with   {
Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1323101853();
}
}

 state Real_Real_S3
{
entry  {
Real_Real_S3_entry0_rand_982088487();
}
exit  {
Real_Real_S3_exit0_rand_605111255();
}
on E4 goto Real_Real_S3 with   {
Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1011485419();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_2402105()
{


;

}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1017083075()
{


;

}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_989591879()
{


;

}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_946487175()
{


;

}
fun Ghost__Init_entry52(Ghost__Init_entry52_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry52_payload;
raise unit;
}
fun Ghost__Init_exit0_rand_1493073062()
{


;

}
fun Ghost_Ghost_Init_entry0_rand_1963733388()
{


;

}
fun Ghost_Ghost_Init_exit0_rand_505117134()
{


;

}
fun Ghost_Ghost_S1_entry65()
{


send Ghost_real_machine, E2, 100;
}
fun Ghost_Ghost_S1_exit0_rand_1093993122()
{


;

}
fun Ghost_Ghost_S2_entry72()
{


send Ghost_real_machine, E4;
send Ghost_real_machine, E4;
send Ghost_real_machine, E4;
}
fun Ghost_Ghost_S2_exit0_rand_184578608()
{


;

}start 
 state Ghost__Init
{
entry (payload: machine) {
Ghost__Init_entry52(payload);
}
exit  {
Ghost__Init_exit0_rand_1493073062();
}
on unit goto Ghost_Ghost_Init with   {
Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_2402105();
}
}

 state Ghost_Ghost_Init
{
entry  {
Ghost_Ghost_Init_entry0_rand_1963733388();
}
exit  {
Ghost_Ghost_Init_exit0_rand_505117134();
}
on E1 goto Ghost_Ghost_S1 with   {
Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_1017083075();
}
}

 state Ghost_Ghost_S1
{
entry  {
Ghost_Ghost_S1_entry65();
}
exit  {
Ghost_Ghost_S1_exit0_rand_1093993122();
}
ignore E1;on E3 goto Ghost_Ghost_S2 with   {
Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_989591879();
}
}

 state Ghost_Ghost_S2
{
entry  {
Ghost_Ghost_S2_entry72();
}
exit  {
Ghost_Ghost_S2_exit0_rand_184578608();
}
on E3 goto Ghost_Ghost_Init with   {
Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_946487175();
}
}
}

