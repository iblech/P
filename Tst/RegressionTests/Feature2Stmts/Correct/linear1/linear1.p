event E: int;

main machine M
{
var M_g: int;

fun M_G(M_G_a: int): int
{


;

return (0);
}
fun M_F(M_F_a: int, M_F_b: int): (int)
{


;

M_F_a = (M_F_a + 1);
}
fun M_S_entry17(M_S_entry17__payload_0: null)
{
var M_S_entry17_y: int;
var M_F_ret: (int);
var Tmp40: bool;
var Tmp41: bool;
var Tmp42: int;
var Tmp43: bool;
var Tmp44: bool;


;

Tmp40 = (M_S_entry17_y == 0);
assert Tmp40;
;

M_F_ret = M_F(M_g, M_S_entry17_y);
M_g = M_F_ret.0;
;

Tmp41 = (M_g == 1);
assert Tmp41;
;

Tmp42 = M_G(M_g);
Tmp43 = (Tmp42 == 0);
if(Tmp43)
{

;

M_S_entry17_y = 1;

}
else
{

;

M_S_entry17_y = 0;

}

;

M_S_entry17_y = M_G(M_S_entry17_y);
;

Tmp44 = (M_S_entry17_y == 0);
assert Tmp44;
return;
}
fun M_S_exit0_rand_1340878547(M_S_exit0_rand_1340878547__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry17(payload);
}exit {
M_S_exit0_rand_1340878547(null);
}}
}

