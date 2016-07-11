
main machine M
{
var M_x: int;
var M_y: int;
var M_z: (int, int);

model fun M_bar()
{
var _tmp513: bool;


_tmp513 = (M_z.0 == M_z.1);

assert _tmp513;


}
model fun M_foo(M_foo_x: int, M_foo_y: int): (int, int)
{
var _tmp514: (int, int);


_tmp514 = (M_foo_x, M_foo_y);

return (_tmp514);


}
model fun M_def(): int
{


return (1);


}
fun M_Init_entry12(M_Init_entry12__payload_0: any)
{


M_x = M_def();

M_y = M_def();

M_z = M_foo(M_x, M_y);

M_bar();


}
fun M_Init_exit0_rand_1138095451()
{


;


}start  state M_Init
{entry (payload: any) {
M_Init_entry12(payload);
}
exit  {
M_Init_exit0_rand_1138095451();
}
}
}

