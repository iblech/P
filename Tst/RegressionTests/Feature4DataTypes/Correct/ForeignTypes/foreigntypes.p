
main machine M
{
var M_x: int;
var M_y: int;
var M_z: (int, int);

model fun M_bar()
{
var _tmp506: bool;


_tmp506 = (M_z.0 == M_z.1);
;
assert _tmp506;


}
model fun M_foo(M_foo_x: int, M_foo_y: int): (int, int)
{
var _tmp507: (int, int);


_tmp507 = (M_foo_x, M_foo_y);
;
return (_tmp507);


}
model fun M_def(): int
{


return (1);


}
fun M_Init_entry12(M_Init_entry12__payload_0: any)
{


M_x = M_def();
;
M_y = M_def();
;
M_z = M_foo(M_x, M_y);
;
M_bar();


}
fun M_Init_exit0_rand_602872284()
{


;


}start  state M_Init
{entry (payload: any) {
M_Init_entry12(payload);
}
exit  {
M_Init_exit0_rand_602872284();
}
}
}

