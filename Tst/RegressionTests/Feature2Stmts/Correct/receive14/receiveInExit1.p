event E: int;
event Unit;

main machine M
{

fun M_S_on_Unit_goto_M_T16_case_E0_rand_795860232(M_S_on_Unit_goto_M_T16_case_E0_rand_795860232_payload: int, M_S_on_Unit_goto_M_T16_case_E0_rand_795860232_env: (null)): (null)
{
var M_S_on_Unit_goto_M_T16__payload_2: null;
var Tmp71: (null);


M_S_on_Unit_goto_M_T16__payload_2 = M_S_on_Unit_goto_M_T16_case_E0_rand_795860232_env.0;
;

;

Tmp71 = (M_S_on_Unit_goto_M_T16__payload_2,);
return (Tmp71);
}
fun M_S_on_Unit_goto_M_T16(M_S_on_Unit_goto_M_T16__payload_2: null)
{
var M_S_on_Unit_goto_M_T16_case_E0_rand_795860232_env: (null);


;

receive
{
case E: (payload: int) {

M_S_on_Unit_goto_M_T16_case_E0_rand_795860232_env = M_S_on_Unit_goto_M_T16_case_E0_rand_795860232(payload, (M_S_on_Unit_goto_M_T16__payload_2,));
M_S_on_Unit_goto_M_T16__payload_2 = M_S_on_Unit_goto_M_T16_case_E0_rand_795860232_env.0;

}
}

return;
}
fun M_S_entry7(M_S_entry7__payload_0: null)
{


;

new N(this);
;

raise Unit;
return;
}
fun M_S_exit11_case_E0_rand_806815710(M_S_exit11_case_E0_rand_806815710_payload: int, M_S_exit11_case_E0_rand_806815710_env: (null)): (null)
{
var M_S_exit11__payload_1: null;
var Tmp72: (null);


M_S_exit11__payload_1 = M_S_exit11_case_E0_rand_806815710_env.0;
;

;

Tmp72 = (M_S_exit11__payload_1,);
return (Tmp72);
}
fun M_S_exit11(M_S_exit11__payload_1: null)
{
var M_S_exit11_case_E0_rand_806815710_env: (null);


;

receive
{
case E: (payload: int) {

M_S_exit11_case_E0_rand_806815710_env = M_S_exit11_case_E0_rand_806815710(payload, (M_S_exit11__payload_1,));
M_S_exit11__payload_1 = M_S_exit11_case_E0_rand_806815710_env.0;

}
}

return;
}
fun M_T_entry0_rand_1160509814(M_T_entry0_rand_1160509814__payload_skip: any)
{


;

;

return;
}
fun M_T_exit0_rand_2046765901(M_T_exit0_rand_2046765901__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry7(payload);
}exit {
M_S_exit11(null);
}on Unit goto M_T with (payload: null) {
M_S_on_Unit_goto_M_T16(payload);
}}

 state M_T
{
entry (payload: any) {
M_T_entry0_rand_1160509814(payload);
}exit {
M_T_exit0_rand_2046765901(null);
}}
}

machine N
{

fun N_S_entry29(N_S_entry29_t: machine)
{


;

send N_S_entry29_t, E, 0;
;

send N_S_entry29_t, E, 0;
return;
}
fun N_S_exit0_rand_56172372(N_S_exit0_rand_56172372__payload_skip: any)
{


;

;

return;
}start 
 state N_S
{
entry (payload: machine) {
N_S_entry29(payload);
}exit {
N_S_exit0_rand_56172372(null);
}}
}

