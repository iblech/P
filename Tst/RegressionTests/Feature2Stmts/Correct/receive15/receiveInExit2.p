event E: int;
event Unit;

main machine M
{

fun M_S_entry8(M_S_entry8__payload_0: any)
{
var M_S_entry8_x: machine;
var _tmp55: machine;


_tmp55 = new N(this);
;
M_S_entry8_x = _tmp55;
;
send M_S_entry8_x, E, 0;
;
send M_S_entry8_x, E, 0;


}
fun M_S_exit0_rand_1252810214()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry8(payload);
}
exit  {
M_S_exit0_rand_1252810214();
}
}
}

machine N
{

fun N_S_entry19(N_S_entry19__payload_1: any)
{


raise Unit;


}
fun N_S_exit23_case_E0_rand_1466433367(N_S_exit23_case_E0_rand_1466433367__payload_3: any)
{


;


}
fun N_S_exit23()
{


receive
{
case E:  (payload: int) {
N_S_exit23_case_E0_rand_1466433367(payload);
}

}


}
fun N_T_entry0_rand_643692399(N_T_entry0_rand_643692399__payload_skip: any)
{


;


}
fun N_T_exit0_rand_473516327()
{


;


}
fun N_S_on_Unit_goto_N_T28_case_E0_rand_22463641(env: (any), N_S_on_Unit_goto_N_T28_case_E0_rand_22463641__payload_5: any): (any)
{
var N_S_on_Unit_goto_N_T28__payload_4: any;
var _tmp56: (any);


N_S_on_Unit_goto_N_T28__payload_4 = env.0;
;
;
;
_tmp56 = (N_S_on_Unit_goto_N_T28__payload_4,);
;
return (_tmp56);


}
fun N_S_on_Unit_goto_N_T28(N_S_on_Unit_goto_N_T28__payload_4: any)
{


receive
{
case E:  (payload: int) {
var env: (any);
env = N_S_on_Unit_goto_N_T28_case_E0_rand_22463641((N_S_on_Unit_goto_N_T28__payload_4,), payload);
N_S_on_Unit_goto_N_T28__payload_4=env.0;
}

}


}start  state N_S
{entry (payload: any) {
N_S_entry19(payload);
}
exit  {
N_S_exit23();
}
}
 state N_T
{entry (payload: any) {
N_T_entry0_rand_643692399(payload);
}
exit  {
N_T_exit0_rand_473516327();
}
}
}

