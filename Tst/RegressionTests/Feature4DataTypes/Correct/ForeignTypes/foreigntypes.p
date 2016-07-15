
main machine M
{
var M_x: int;
var M_y: int;
var M_z: (int, int);

model fun M_bar()
{
var _tmp359: bool;


_tmp359 = (M_z.0 == M_z.1);
assert _tmp359;
}
model fun M_foo(M_foo_x: int, M_foo_y: int): (int, int)
{
var _tmp360: (int, int);


_tmp360 = (M_foo_x, M_foo_y);
return (_tmp360);
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
fun M_Init_exit0_rand_727571542()
{


;

}start  state M_Init
{entry  {
M_Init_entry12();
}
exit  {
M_Init_exit0_rand_727571542();
}
}
}

