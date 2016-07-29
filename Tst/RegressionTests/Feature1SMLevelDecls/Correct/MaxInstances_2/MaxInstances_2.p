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
var Tmp29: bool;


;

Tmp29 = (Real_Action1_payload == 100);
assert Tmp29;
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
fun Real_Real_Init_on_E4_goto_Real_Real_S20_rand_967001759(Real_Real_Init_on_E4_goto_Real_Real_S20_rand_967001759__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S2_on_unit_goto_Real_Real_S30_rand_687480353(Real_Real_S2_on_unit_goto_Real_Real_S30_rand_687480353__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S3_on_E4_goto_Real_Real_S30_rand_269103(Real_Real_S3_on_E4_goto_Real_Real_S30_rand_269103__payload_skip: any)
{


;

;

return;
}
fun Real_Real_Init_entry13(Real_Real_Init_entry13__payload_0: null)
{
var Tmp30: machine;


;

Tmp30 = new Ghost(this);
Real_ghost_machine = Tmp30;
;

raise unit;
return;
}
fun Real_Real_Init_exit0_rand_323077330(Real_Real_Init_exit0_rand_323077330__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S1_entry23(Real_Real_S1_entry23__payload_1: null)
{


;

send Real_ghost_machine, E1;
return;
}
fun Real_Real_S1_exit0_rand_889598801(Real_Real_S1_exit0_rand_889598801__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S2_entry29(Real_Real_S2_entry29__payload_2: null)
{


;

raise unit;
return;
}
fun Real_Real_S2_exit0_rand_808706966(Real_Real_S2_exit0_rand_808706966__payload_skip: any)
{


;

;

return;
}
fun Real_Real_S3_entry0_rand_544295395(Real_Real_S3_entry0_rand_544295395__payload_3: null)
{


;

;

return;
}
fun Real_Real_S3_exit0_rand_491102389(Real_Real_S3_exit0_rand_491102389__payload_skip: any)
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
Real_Real_Init_exit0_rand_323077330(null);
}on E2 do (payload: int) {
Real_Real_Init_do_E211(payload);
}on unit push Real_Real_S1;
on E4 goto Real_Real_S2 with (payload: null) {
Real_Real_Init_on_E4_goto_Real_Real_S20_rand_967001759(payload);
}}

 state Real_Real_S1
{
entry (payload: null) {
Real_Real_S1_entry23(payload);
}exit {
Real_Real_S1_exit0_rand_889598801(null);
}}

 state Real_Real_S2
{
entry (payload: null) {
Real_Real_S2_entry29(payload);
}exit {
Real_Real_S2_exit0_rand_808706966(null);
}on unit goto Real_Real_S3 with (payload: null) {
Real_Real_S2_on_unit_goto_Real_Real_S30_rand_687480353(payload);
}}

 state Real_Real_S3
{
entry (payload: null) {
Real_Real_S3_entry0_rand_544295395(payload);
}exit {
Real_Real_S3_exit0_rand_491102389(null);
}on E4 goto Real_Real_S3 with (payload: null) {
Real_Real_S3_on_E4_goto_Real_Real_S30_rand_269103(payload);
}}
}

machine Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_885825110(Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_885825110__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_557359354(Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_557359354__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_834225958(Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_834225958__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_277559053(Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_277559053__payload_skip: any)
{


;

;

return;
}
fun Ghost__Init_entry49(Ghost__Init_entry49_payload: machine)
{


;

Ghost_real_machine = Ghost__Init_entry49_payload;
;

raise unit;
return;
}
fun Ghost__Init_exit0_rand_1769972513(Ghost__Init_exit0_rand_1769972513__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_Init_entry0_rand_1158447395(Ghost_Ghost_Init_entry0_rand_1158447395__payload_4: null)
{


;

;

return;
}
fun Ghost_Ghost_Init_exit0_rand_658821166(Ghost_Ghost_Init_exit0_rand_658821166__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S1_entry62(Ghost_Ghost_S1_entry62__payload_5: null)
{


;

send Ghost_real_machine, E2, 100;
return;
}
fun Ghost_Ghost_S1_exit0_rand_98936170(Ghost_Ghost_S1_exit0_rand_98936170__payload_skip: any)
{


;

;

return;
}
fun Ghost_Ghost_S2_entry69(Ghost_Ghost_S2_entry69__payload_6: null)
{


;

send Ghost_real_machine, E4;
;

send Ghost_real_machine, E4;
;

send Ghost_real_machine, E4;
return;
}
fun Ghost_Ghost_S2_exit0_rand_96798752(Ghost_Ghost_S2_exit0_rand_96798752__payload_skip: any)
{


;

;

return;
}start 
 state Ghost__Init
{
entry (payload: machine) {
Ghost__Init_entry49(payload);
}exit {
Ghost__Init_exit0_rand_1769972513(null);
}on unit goto Ghost_Ghost_Init with (payload: null) {
Ghost__Init_on_unit_goto_Ghost_Ghost_Init0_rand_885825110(payload);
}}

 state Ghost_Ghost_Init
{
entry (payload: null) {
Ghost_Ghost_Init_entry0_rand_1158447395(payload);
}exit {
Ghost_Ghost_Init_exit0_rand_658821166(null);
}on E1 goto Ghost_Ghost_S1 with (payload: null) {
Ghost_Ghost_Init_on_E1_goto_Ghost_Ghost_S10_rand_557359354(payload);
}}

 state Ghost_Ghost_S1
{
entry (payload: null) {
Ghost_Ghost_S1_entry62(payload);
}exit {
Ghost_Ghost_S1_exit0_rand_98936170(null);
}ignore E1;on E3 goto Ghost_Ghost_S2 with (payload: null) {
Ghost_Ghost_S1_on_E3_goto_Ghost_Ghost_S20_rand_834225958(payload);
}}

 state Ghost_Ghost_S2
{
entry (payload: null) {
Ghost_Ghost_S2_entry69(payload);
}exit {
Ghost_Ghost_S2_exit0_rand_96798752(null);
}on E3 goto Ghost_Ghost_Init with (payload: null) {
Ghost_Ghost_S2_on_E3_goto_Ghost_Ghost_Init0_rand_277559053(payload);
}}
}

