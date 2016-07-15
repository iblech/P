event E: int;

main machine M
{
var M_g: int;

fun M_F(M_F_a: int, M_F_b: int)
{


M_F_a = (M_F_a + M_F_b);
}
fun M_S_on_E_goto_M_T20(M_S_on_E_goto_M_T20_i: int)
{
var _tmp35: bool;


_tmp35 = (M_g == 2);
assert _tmp35;
M_S_on_E_goto_M_T20_i = (M_S_on_E_goto_M_T20_i + 1);
}
fun M_S_entry13()
{
var M_S_entry13_y: int;
var _tmp36: bool;
var _tmp37: bool;


M_S_entry13_y = 1;
M_F(M_g, M_S_entry13_y);
_tmp36 = (M_g == 1);
assert _tmp36;
_tmp37 = (M_S_entry13_y == 1);
assert _tmp37;
raise E, 1;
}
fun M_S_exit24()
{


M_F(M_g, 1);
}
fun M_T_entry30(M_T_entry30_j: int)
{
var _tmp38: bool;


_tmp38 = (M_T_entry30_j == 2);
assert _tmp38;
}
fun M_T_exit0_rand_569283614()
{


;

}start  state M_S
{entry  {
M_S_entry13();
}
exit  {
M_S_exit24();
}
on E goto M_T with  (payload: int) {
M_S_on_E_goto_M_T20(payload);
}
}
 state M_T
{entry (payload: int) {
M_T_entry30(payload);
}
exit  {
M_T_exit0_rand_569283614();
}
}
}

