event E: int;

main machine M
{
var M_g: int;

fun M_F(M_F_a: int, M_F_b: int): (int)
{


;

M_F_a = (M_F_a + M_F_b);
}
fun M_S_on_E_goto_M_T20(M_S_on_E_goto_M_T20_i: int)
{
var Tmp79: bool;


;

Tmp79 = (M_g == 2);
assert Tmp79;
;

M_S_on_E_goto_M_T20_i = (M_S_on_E_goto_M_T20_i + 1);
return;
}
fun M_S_entry13(M_S_entry13__payload_0: null)
{
var M_S_entry13_y: int;
var M_F_ret: (int);
var Tmp80: bool;
var Tmp81: bool;


;

M_S_entry13_y = 1;
;

M_F_ret = M_F(M_g, M_S_entry13_y);
M_g = M_F_ret.0;
;

Tmp80 = (M_g == 1);
assert Tmp80;
;

Tmp81 = (M_S_entry13_y == 1);
assert Tmp81;
;

raise E, 1;
return;
}
fun M_S_exit24(M_S_exit24__payload_1: null)
{
var M_F_ret: (int);


;

M_F_ret = M_F(M_g, 1);
M_g = M_F_ret.0;
return;
}
fun M_T_entry30(M_T_entry30_j: int)
{
var Tmp82: bool;


;

Tmp82 = (M_T_entry30_j == 2);
assert Tmp82;
return;
}
fun M_T_exit0_rand_702532453(M_T_exit0_rand_702532453__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry13(payload);
}exit {
M_S_exit24(null);
}on E goto M_T with (payload: int) {
M_S_on_E_goto_M_T20(payload);
}}

 state M_T
{
entry (payload: int) {
M_T_entry30(payload);
}exit {
M_T_exit0_rand_702532453(null);
}}
}

