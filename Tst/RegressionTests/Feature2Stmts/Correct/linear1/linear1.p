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
fun M_S_entry17()
{
var M_S_entry17_y: int;
var Tmp29: bool;
var Tmp30: bool;
var Tmp31: int;
var Tmp32: bool;
var Tmp33: bool;


Tmp29 = (M_S_entry17_y == 0);
assert Tmp29;
M_F(M_g, M_S_entry17_y);
Tmp30 = (M_g == 1);
assert Tmp30;
Tmp31 = M_G(M_g);
Tmp32 = (Tmp31 == 0);
if(Tmp32)
{

M_S_entry17_y = 1;

}
else
{

M_S_entry17_y = 0;

}

M_S_entry17_y = M_G(M_S_entry17_y);
Tmp33 = (M_S_entry17_y == 0);
assert Tmp33;
}
fun M_S_exit0_rand_1343596486()
{


;

}start 
 state M_S
{
entry  {
M_S_entry17();
}
exit  {
M_S_exit0_rand_1343596486();
}
}
}

