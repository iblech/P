event E: int;
event Unit;

main machine M
{

fun M_S_entry8(M_S_entry8__payload_0: null)
{
var M_S_entry8_x: machine;
var Tmp76: machine;


;

Tmp76 = new N(null);
M_S_entry8_x = Tmp76;
;

send M_S_entry8_x, E, 0;
;

send M_S_entry8_x, E, 0;
return;
}
fun M_S_exit0_rand_104866836(M_S_exit0_rand_104866836__payload_skip: any)
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
M_S_exit0_rand_104866836(null);
}}
}

machine N
{

fun N_DoReceive_case_E0_rand_563733321(N_DoReceive_case_E0_rand_563733321_payload: int)
{


;

;

return;
}
fun N_DoReceive()
{


;

receive
{
case E: (payload: int) {

N_DoReceive_case_E0_rand_563733321(payload);

}
}

}
fun N_S_on_Unit_goto_N_T32(N_S_on_Unit_goto_N_T32__payload_3: null)
{


;

N_DoReceive();
return;
}
fun N_S_entry25(N_S_entry25__payload_1: null)
{


;

raise Unit;
return;
}
fun N_S_exit29(N_S_exit29__payload_2: null)
{


;

N_DoReceive();
return;
}
fun N_T_entry0_rand_1302059831(N_T_entry0_rand_1302059831__payload_skip: any)
{


;

;

return;
}
fun N_T_exit0_rand_1837666131(N_T_exit0_rand_1837666131__payload_skip: any)
{


;

;

return;
}start 
 state N_S
{
entry (payload: null) {
N_S_entry25(payload);
}exit {
N_S_exit29(null);
}on Unit goto N_T with (payload: null) {
N_S_on_Unit_goto_N_T32(payload);
}}

 state N_T
{
entry (payload: any) {
N_T_entry0_rand_1302059831(payload);
}exit {
N_T_exit0_rand_1837666131(null);
}}
}

