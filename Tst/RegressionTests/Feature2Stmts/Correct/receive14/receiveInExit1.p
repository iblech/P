event E: int;
event Unit;

main machine M
{

fun M_S_entry7(M_S_entry7__payload_0: any)
{


new N(this);
;
raise Unit;


}
fun M_S_exit11_case_E0_rand_1843769863(M_S_exit11_case_E0_rand_1843769863__payload_2: any)
{


;


}
fun M_S_exit11()
{


receive
{
case E:  (payload: int) {
M_S_exit11_case_E0_rand_1843769863(payload);
}

}


}
fun M_T_entry0_rand_686989278(M_T_entry0_rand_686989278__payload_skip: any)
{


;


}
fun M_T_exit0_rand_1783594623()
{


;


}
fun M_S_on_Unit_goto_M_T16_case_E0_rand_1396981835(env: (any), M_S_on_Unit_goto_M_T16_case_E0_rand_1396981835__payload_4: any): (any)
{
var M_S_on_Unit_goto_M_T16__payload_3: any;
var _tmp54: (any);


M_S_on_Unit_goto_M_T16__payload_3 = env.0;
;
;
;
_tmp54 = (M_S_on_Unit_goto_M_T16__payload_3,);
;
return (_tmp54);


}
fun M_S_on_Unit_goto_M_T16(M_S_on_Unit_goto_M_T16__payload_3: any)
{


receive
{
case E:  (payload: int) {
var env: (any);
env = M_S_on_Unit_goto_M_T16_case_E0_rand_1396981835((M_S_on_Unit_goto_M_T16__payload_3,), payload);
M_S_on_Unit_goto_M_T16__payload_3=env.0;
}

}


}start  state M_S
{entry (payload: any) {
M_S_entry7(payload);
}
exit  {
M_S_exit11();
}
}
 state M_T
{entry (payload: any) {
M_T_entry0_rand_686989278(payload);
}
exit  {
M_T_exit0_rand_1783594623();
}
}
}

machine N
{

fun N_S_entry29(N_S_entry29_t: machine)
{


send N_S_entry29_t, E, 0;
;
send N_S_entry29_t, E, 0;


}
fun N_S_exit0_rand_190795891()
{


;


}start  state N_S
{entry (payload: machine) {
N_S_entry29(payload);
}
exit  {
N_S_exit0_rand_190795891();
}
}
}

