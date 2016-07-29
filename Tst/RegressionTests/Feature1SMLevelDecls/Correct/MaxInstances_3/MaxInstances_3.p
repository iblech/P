event E0;
event E1  assume 0;

main machine Real
{
var Real_ghost_machine: machine;
var Real_x: int;

fun Real_Action1()
{


;

assert false;
}
fun Real_Real_Init_do_E1(payload: null)
{


Real_Action1();
}
fun Real_Real_Init_entry11(Real_Real_Init_entry11__payload_0: null)
{
var Tmp31: machine;


;

Real_x = 0;
;

Tmp31 = new Ghost(this);
Real_ghost_machine = Tmp31;
;

send Real_ghost_machine, E0;
return;
}
fun Real_Real_Init_exit0_rand_1407502893(Real_Real_Init_exit0_rand_1407502893__payload_skip: any)
{


;

;

return;
}start 
 state Real_Real_Init
{
entry (payload: null) {
Real_Real_Init_entry11(payload);
}exit {
Real_Real_Init_exit0_rand_1407502893(null);
}on E1 do (payload: null) {
Real_Real_Init_do_E1(payload);
}}
}

machine Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_entry26(Ghost__Init_entry26_payload: machine)
{


;

Ghost_real_machine = Ghost__Init_entry26_payload;
;

send Ghost_real_machine, E1;
return;
}
fun Ghost__Init_exit0_rand_2056787780(Ghost__Init_exit0_rand_2056787780__payload_skip: any)
{


;

;

return;
}start 
 state Ghost__Init
{
entry (payload: machine) {
Ghost__Init_entry26(payload);
}exit {
Ghost__Init_exit0_rand_2056787780(null);
}}
}

