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
var Tmp451: bool;


;

Tmp451 = (Real_Action1_payload == 100);
assert Tmp451;
;

send Real_ghost_machine, E3;
;

send Real_ghost_machine, E3;
}
fun Real_Real_Init_do_E211(Real_Real_Init_do_E211_payload: int)
{


;

Real_Action1(Real_Real_Init_do_E211_payload);
return;
}
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1026408415(Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1026408415__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1674141899(Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1674141899__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1694299811(Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1694299811__payload_skip: any)
{


;

;

return;
}
fun Real_Real_Init_entry13(Real_Real_Init_entry13__payload_0: null)
{
var Tmp452: machine;


;

Tmp452 = new Ghost(this);
Real_ghost_machine = Tmp452;
;

raise unit;
return;
}
fun Real_Real_Init_exit18(Real_Real_Init_exit18__payload_1: null)
{


;

Real_test = true;
return;
}
fun Real_Real_S1_entry26(Real_Real_S1_entry26__payload_2: null)
{


;

send Real_ghost_machine, E1;
return;
}
fun Real_Real_S1_exit0_rand_170908229(Real_Real_S1_exit0_rand_170908229__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S2_entry32(Real_Real_S2_entry32__payload_3: null)
{


;

raise unit;
return;
}
fun Real_Real_S2_exit0_rand_62823464(Real_Real_S2_exit0_rand_62823464__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S3_entry0_rand_1091515109(Real_Real_S3_entry0_rand_1091515109__payload_4: null)
{


;

;

return;
}
fun Real_Real_S3_exit0_rand_516706233(Real_Real_S3_exit0_rand_516706233__payload_skip: any)
{


;

;

return;
}start 
 state Real_Real_Init
{
entry (payload: null) {
Real_Real_Init_entry13(payload);
}exit {
Real_Real_Init_exit18(null);
}on E2 do (payload: int) {
Real_Real_Init_do_E211(payload);
}on unit push Real_Real_S1;
on E4 goto Real_Real_S2 with (payload: null) {
Real_Real_Init_on_E4_goto_Real_Real_S20_rand_1026408415(payload);
}}

 state Real_Real_S1
{
entry (payload: null) {
Real_Real_S1_entry26(payload);
}exit {
Real_Real_S1_exit0_rand_170908229(null);
}}

 state Real_Real_S2
{
entry (payload: null) {
Real_Real_S2_entry32(payload);
}exit {
Real_Real_S2_exit0_rand_62823464(null);
}on unit goto Real_Real_S3 with (payload: null) {
Real_Real_S2_on_unit_goto_Real_Real_S30_rand_1674141899(payload);
}}

 state Real_Real_S3
{
entry (payload: null) {
Real_Real_S3_entry0_rand_1091515109(payload);
}exit {
Real_Real_S3_exit0_rand_516706233(null);
}on E4 goto Real_Real_S3 with (payload: null) {
Real_Real_S3_on_E4_goto_Real_Real_S30_rand_1694299811(payload);
}}
}

machine Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_743868311(Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_743868311__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_2108524833(Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_2108524833__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_1009531206(Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_1009531206__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1882069128(Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1882069128__payload_skip: any)
{


;

;

return;
}
fun Ghost__Init_entry52(Ghost__Init_entry52_payload: machine)
{


;

Ghost_real_machine = Ghost__Init_entry52_payload;
;

raise unit;
return;
}
fun Ghost__Init_exit0_rand_2035856391(Ghost__Init_exit0_rand_2035856391__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_Init_entry0_rand_1032493975(Ghost_Ghost_Init_entry0_rand_1032493975__payload_5: null)
{


;

;

return;
}
fun Ghost_Ghost_Init_exit0_rand_68337004(Ghost_Ghost_Init_exit0_rand_68337004__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S1_entry65(Ghost_Ghost_S1_entry65__payload_6: null)
{


;

send Ghost_real_machine, E2, 100;
return;
}
fun Ghost_Ghost_S1_exit0_rand_1660959336(Ghost_Ghost_S1_exit0_rand_1660959336__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S2_entry72(Ghost_Ghost_S2_entry72__payload_7: null)
{


;

send Ghost_real_machine, E4;
;

send Ghost_real_machine, E4;
;

send Ghost_real_machine, E4;
return;
}
fun Ghost_Ghost_S2_exit0_rand_888177619(Ghost_Ghost_S2_exit0_rand_888177619__payload_skip: any)
{


;

;

return;
}start 
 state Ghost__Init
{
entry (payload: machine) {
Ghost__Init_entry52(payload);
}exit {
Ghost__Init_exit0_rand_2035856391(null);
}on unit goto Ghost_Ghost_Init with (payload: null) {
Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_743868311(payload);
}}

 state Ghost_Ghost_Init
{
entry (payload: null) {
Ghost_Ghost_Init_entry0_rand_1032493975(payload);
}exit {
Ghost_Ghost_Init_exit0_rand_68337004(null);
}on E1 goto Ghost_Ghost_S1 with (payload: null) {
Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_2108524833(payload);
}}

 state Ghost_Ghost_S1
{
entry (payload: null) {
Ghost_Ghost_S1_entry65(payload);
}exit {
Ghost_Ghost_S1_exit0_rand_1660959336(null);
}ignore E1;on E3 goto Ghost_Ghost_S2 with (payload: null) {
Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_1009531206(payload);
}}

 state Ghost_Ghost_S2
{
entry (payload: null) {
Ghost_Ghost_S2_entry72(payload);
}exit {
Ghost_Ghost_S2_exit0_rand_888177619(null);
}on E3 goto Ghost_Ghost_Init with (payload: null) {
Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_1882069128(payload);
}}
}

