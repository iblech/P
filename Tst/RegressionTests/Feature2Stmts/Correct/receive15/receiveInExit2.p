event E: int;
event Unit;

main machine M
{

fun M_S_entry8(M_S_entry8__payload_0: null)
{
var M_S_entry8_x: machine;
var Tmp73: machine;


;

Tmp73 = new N(null);
M_S_entry8_x = Tmp73;
;

send M_S_entry8_x, E, 0;
;

send M_S_entry8_x, E, 0;
return;
}
fun M_S_exit0_rand_299083588(M_S_exit0_rand_299083588__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry8(payload);
}exit {
M_S_exit0_rand_299083588(null);
}}
}

machine N
{

fun N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386(N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386_payload: int, N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386_env: (null)): (null)
{
var N_S_on_Unit_goto_N_T28__payload_3: null;
var Tmp74: (null);


N_S_on_Unit_goto_N_T28__payload_3 = N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386_env.0;
;

;

Tmp74 = (N_S_on_Unit_goto_N_T28__payload_3,);
return (Tmp74);
}
fun N_S_on_Unit_goto_N_T28(N_S_on_Unit_goto_N_T28__payload_3: null)
{
var N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386_env: (null);


;

receive
{
case E: (payload: int) {

N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386_env = N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386(payload, (N_S_on_Unit_goto_N_T28__payload_3,));
N_S_on_Unit_goto_N_T28__payload_3 = N_S_on_Unit_goto_N_T28_case_E0_rand_1626063386_env.0;

}
}

return;
}
fun N_S_entry19(N_S_entry19__payload_1: null)
{


;

raise Unit;
return;
}
fun N_S_exit23_case_E0_rand_2046193837(N_S_exit23_case_E0_rand_2046193837_payload: int, N_S_exit23_case_E0_rand_2046193837_env: (null)): (null)
{
var N_S_exit23__payload_2: null;
var Tmp75: (null);


N_S_exit23__payload_2 = N_S_exit23_case_E0_rand_2046193837_env.0;
;

;

Tmp75 = (N_S_exit23__payload_2,);
return (Tmp75);
}
fun N_S_exit23(N_S_exit23__payload_2: null)
{
var N_S_exit23_case_E0_rand_2046193837_env: (null);


;

receive
{
case E: (payload: int) {

N_S_exit23_case_E0_rand_2046193837_env = N_S_exit23_case_E0_rand_2046193837(payload, (N_S_exit23__payload_2,));
N_S_exit23__payload_2 = N_S_exit23_case_E0_rand_2046193837_env.0;

}
}

return;
}
fun N_T_entry0_rand_1922161370(N_T_entry0_rand_1922161370__payload_skip: any)
{


;

;

return;
}
fun N_T_exit0_rand_638304253(N_T_exit0_rand_638304253__payload_skip: any)
{


;

;

return;
}start 
 state N_S
{
entry (payload: null) {
N_S_entry19(payload);
}exit {
N_S_exit23(null);
}on Unit goto N_T with (payload: null) {
N_S_on_Unit_goto_N_T28(payload);
}}

 state N_T
{
entry (payload: any) {
N_T_entry0_rand_1922161370(payload);
}exit {
N_T_exit0_rand_638304253(null);
}}
}

