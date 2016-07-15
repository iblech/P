
main machine M
{
var M_x: int;
var M_y: int;
var M_z: (int, int);

model fun M_bar()
{
var Tmp359: bool;


Tmp359 = (M_z.0 == M_z.1);
assert Tmp359;
}
model fun M_foo(M_foo_x: int, M_foo_y: int): (int, int)
{
var Tmp360: (int, int);


Tmp360 = (M_foo_x, M_foo_y);
return (Tmp360);
}
model fun M_def(): int
{


return (1);
}
fun M_Init_entry12()
{


M_x = M_def();
M_y = M_def();
M_z = M_foo(M_x, M_y);
M_bar();
}
fun M_Init_exit0_rand_513212883()
{


;

}start 
 state M_Init
{
entry  {
M_Init_entry12();
}
exit  {
M_Init_exit0_rand_513212883();
}
}
}

