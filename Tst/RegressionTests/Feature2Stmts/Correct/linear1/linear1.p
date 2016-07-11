event E: int;

main machine M
{
var M_g: int;

fun M_G(M_G_a: int): int
{


return (0);


}
fun M_F(M_F_a: int, M_F_b: int)
{


M_F_a = (M_F_a + 1);


}
fun M_S_entry17(M_S_entry17__payload_0: any)
{
var M_S_entry17_y: int;
var _tmp32: bool;
var _tmp33: bool;
var _tmp34: int;
var _tmp35: bool;
var _tmp36: bool;


_tmp32 = (M_S_entry17_y == 0);
;
assert _tmp32;
;
M_F(M_g, M_S_entry17_y);
;
_tmp33 = (M_g == 1);
;
assert _tmp33;
;
_tmp34 = M_G(M_g);
;
_tmp35 = (_tmp34 == 0);
;
if(_tmp35)
{

M_S_entry17_y = 1;
;
M_S_entry17_y = 1;



}
else
{

M_S_entry17_y = 0;
;
M_S_entry17_y = 0;



}
;
M_S_entry17_y = M_G(M_S_entry17_y);
;
_tmp36 = (M_S_entry17_y == 0);
;
assert _tmp36;


}
fun M_S_exit0_rand_836893517()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry17(payload);
}
exit  {
M_S_exit0_rand_836893517();
}
}
}

