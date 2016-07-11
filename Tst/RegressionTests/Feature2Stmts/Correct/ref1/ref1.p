event E: int;

main machine M
{
var M_g: int;

fun M_F(M_F_a: int, M_F_b: int)
{


M_F_a = (M_F_a + M_F_b);


}
fun M_S_entry13(M_S_entry13__payload_0: any)
{
var M_S_entry13_y: int;
var _tmp60: bool;
var _tmp61: bool;


M_S_entry13_y = 1;
;
M_F(M_g, M_S_entry13_y);
;
_tmp60 = (M_g == 1);
;
assert _tmp60;
;
_tmp61 = (M_S_entry13_y == 1);
;
assert _tmp61;
;
raise E, 1;


}
fun M_S_exit24()
{


M_F(M_g, 1);


}
fun M_T_entry30(M_T_entry30_j: int)
{
var _tmp62: bool;


_tmp62 = (M_T_entry30_j == 2);
;
assert _tmp62;


}
fun M_T_exit0_rand_1011278921()
{


;


}
fun M_S_on_E_goto_M_T20(M_S_on_E_goto_M_T20_i: int)
{
var _tmp63: bool;


_tmp63 = (M_g == 2);
;
assert _tmp63;
;
M_S_on_E_goto_M_T20_i = (M_S_on_E_goto_M_T20_i + 1);


}start  state M_S
{entry (payload: any) {
M_S_entry13(payload);
}
exit  {
M_S_exit24();
}
}
 state M_T
{entry (payload: int) {
M_T_entry30(payload);
}
exit  {
M_T_exit0_rand_1011278921();
}
}
}

