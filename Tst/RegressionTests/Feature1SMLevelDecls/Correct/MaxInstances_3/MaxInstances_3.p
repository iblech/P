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
fun Real_Real_Init_entry11()
{
var _tmp21: machine;


Real_x = 0;
_tmp21 = new Ghost(this);
Real_ghost_machine = _tmp21;
send Real_ghost_machine, E0;
}
fun Real_Real_Init_exit0_rand_1115160708()
{


;

}start  state Real_Real_Init
{entry  {
Real_Real_Init_entry11();
}
exit  {
Real_Real_Init_exit0_rand_1115160708();
}
on E1 do   {
Real_Action1();
}
}
}

model Ghost
{
var Ghost_real_machine: machine;

fun Ghost__Init_entry26(Ghost__Init_entry26_payload: machine)
{


Ghost_real_machine = Ghost__Init_entry26_payload;
send Ghost_real_machine, E1;
}
fun Ghost__Init_exit0_rand_1639242204()
{


;

}start  state Ghost__Init
{entry (payload: machine) {
Ghost__Init_entry26(payload);
}
exit  {
Ghost__Init_exit0_rand_1639242204();
}
}
}

