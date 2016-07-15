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
var Tmp35: bool;


Tmp35 = (M_g == 2);
assert Tmp35;
M_S_on_E_goto_M_T20_i = (M_S_on_E_goto_M_T20_i + 1);
}
fun M_S_entry13()
{
var M_S_entry13_y: int;
var Tmp36: bool;
var Tmp37: bool;


M_S_entry13_y = 1;
M_F(M_g, M_S_entry13_y);
Tmp36 = (M_g == 1);
assert Tmp36;
Tmp37 = (M_S_entry13_y == 1);
assert Tmp37;
raise E, 1;
}
fun M_S_exit24()
{


M_F(M_g, 1);
}
fun M_T_entry30(M_T_entry30_j: int)
{
var Tmp38: bool;


Tmp38 = (M_T_entry30_j == 2);
assert Tmp38;
}
fun M_T_exit0_rand_46703444()
{


;

}start 
 state M_S
{
entry  {
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
{
entry (payload: int) {
M_T_entry30(payload);
}
exit  {
M_T_exit0_rand_46703444();
}
}
}

