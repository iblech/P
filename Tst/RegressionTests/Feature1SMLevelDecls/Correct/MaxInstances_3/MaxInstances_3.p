event E0;
event E1  assume 0;

main machine Real
{
var Real_ghost_machine: machine;
var Real_x: int;

fun Real_Action1()
{


assert false;


}
fun Real_Real_Init_entry11(Real_Real_Init_entry11__payload_0: any)
{
var _tmp24: machine;


Real_x = 0;
;
_tmp24 = new Ghost(this);
;
Real_ghost_machine = _tmp24;
;
send Real_ghost_machine, E0;


}
fun Real_Real_Init_exit0_rand_426918033()
{


;


}start  state Real_Real_Init
{entry (payload: any) {
Real_Real_Init_entry11(payload);
}
exit  {
Real_Real_Init_exit0_rand_426918033();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_entry26(Ghost__Init_entry26_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry26_payload;
;
send Ghost_real_machine, E1;


}
fun Ghost__Init_exit0_rand_1806337055()
{


;


}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry26(payload);
}
exit  {
Ghost__Init_exit0_rand_1806337055();
}
}
}

