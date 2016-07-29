event E: int;
event Unit;

main machine M
{

fun M_S_on_Unit_goto_M_T16_case_E0_rand_296704046(M_S_on_Unit_goto_M_T16_case_E0_rand_296704046_payload: int, M_S_on_Unit_goto_M_T16_case_E0_rand_296704046_env: (null)): (null)
{
var M_S_on_Unit_goto_M_T16__payload_2: null;
var Tmp71: (null);


M_S_on_Unit_goto_M_T16__payload_2 = M_S_on_Unit_goto_M_T16_case_E0_rand_296704046_env.0;
;

;

Tmp71 = (M_S_on_Unit_goto_M_T16__payload_2,);
return (Tmp71);
}
fun M_S_on_Unit_goto_M_T16(M_S_on_Unit_goto_M_T16__payload_2: null)
{
var M_S_on_Unit_goto_M_T16_case_E0_rand_296704046_env: (null);


;

receive
{
case E: (payload: int) {

M_S_on_Unit_goto_M_T16_case_E0_rand_296704046_env = M_S_on_Unit_goto_M_T16_case_E0_rand_296704046(payload, (M_S_on_Unit_goto_M_T16__payload_2,));
M_S_on_Unit_goto_M_T16__payload_2 = M_S_on_Unit_goto_M_T16_case_E0_rand_296704046_env.0;

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
fun M_S_exit11_case_E0_rand_1169963728(M_S_exit11_case_E0_rand_1169963728_payload: int, M_S_exit11_case_E0_rand_1169963728_env: (null)): (null)
{
var M_S_exit11__payload_1: null;
var Tmp72: (null);


M_S_exit11__payload_1 = M_S_exit11_case_E0_rand_1169963728_env.0;
;

;

Tmp72 = (M_S_exit11__payload_1,);
return (Tmp72);
}
fun M_S_exit11(M_S_exit11__payload_1: null)
{
var M_S_exit11_case_E0_rand_1169963728_env: (null);


;

receive
{
case E: (payload: int) {

M_S_exit11_case_E0_rand_1169963728_env = M_S_exit11_case_E0_rand_1169963728(payload, (M_S_exit11__payload_1,));
M_S_exit11__payload_1 = M_S_exit11_case_E0_rand_1169963728_env.0;

}
}

return;
}
fun M_T_entry0_rand_1341320916(M_T_entry0_rand_1341320916__payload_skip: any)
{


;

;

return;
}
fun M_T_exit0_rand_635895608(M_T_exit0_rand_635895608__payload_skip: any)
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
M_T_entry0_rand_1341320916(payload);
}exit {
M_T_exit0_rand_635895608(null);
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
fun N_S_exit0_rand_62229321(N_S_exit0_rand_62229321__payload_skip: any)
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
N_S_exit0_rand_62229321(null);
}}
}

