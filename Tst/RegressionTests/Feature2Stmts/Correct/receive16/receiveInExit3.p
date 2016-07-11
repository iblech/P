event E: int;
event Unit;

main machine M
{

fun M_S_entry8(M_S_entry8__payload_0: any)
{
var M_S_entry8_x: machine;
var _tmp57: machine;


_tmp57 = new N(this);
;
M_S_entry8_x = _tmp57;
;
send M_S_entry8_x, E, 0;
;
send M_S_entry8_x, E, 0;


}
fun M_S_exit0_rand_1177475367()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry8(payload);
}
exit  {
M_S_exit0_rand_1177475367();
}
}
}

machine N
{

fun N_DoReceive_case_E0_rand_572982536(N_DoReceive_case_E0_rand_572982536__payload_1: any)
{


;


}
fun N_DoReceive()
{


receive
{
case E:  (payload: int) {
N_DoReceive_case_E0_rand_572982536(payload);
}

}


}
fun N_S_entry25(N_S_entry25__payload_2: any)
{


raise Unit;


}
fun N_S_exit29()
{


N_DoReceive();


}
fun N_T_entry0_rand_863981283(N_T_entry0_rand_863981283__payload_skip: any)
{


;


}
fun N_T_exit0_rand_880840303()
{


;


}
fun N_S_on_Unit_goto_N_T32(N_S_on_Unit_goto_N_T32__payload_4: any)
{


N_DoReceive();


}start  state N_S
{entry (payload: any) {
N_S_entry25(payload);
}
exit  {
N_S_exit29();
}
}
 state N_T
{entry (payload: any) {
N_T_entry0_rand_863981283(payload);
}
exit  {
N_T_exit0_rand_880840303();
}
}
}

