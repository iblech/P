
main machine M
{
var M_x: int;
var M_y: int;
var M_z: (int, int);

fun M_bar()
{
var Tmp404: bool;


;

Tmp404 = (M_z.0 == M_z.1);
assert Tmp404;
}
fun M_foo(M_foo_x: int, M_foo_y: int): (int, int)
{
var Tmp405: (int, int);


;

Tmp405 = (M_foo_x, M_foo_y);
return (Tmp405);
}
fun M_def(): int
{


;

return (1);
}
fun M_Init_entry12(M_Init_entry12__payload_0: null)
{


;

M_x = M_def();
;

M_y = M_def();
;

M_z = M_foo(M_x, M_y);
;

M_bar();
return;
}
fun M_Init_exit0_rand_556180059(M_Init_exit0_rand_556180059__payload_skip: any)
{


;

;

return;
}start 
 state M_Init
{
entry (payload: null) {
M_Init_entry12(payload);
}exit {
M_Init_exit0_rand_556180059(null);
}}
}

