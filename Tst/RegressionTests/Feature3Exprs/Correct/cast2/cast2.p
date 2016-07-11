
main machine A
{

fun A_foo(): any
{


return (3);


}
fun A_S_entry6(A_S_entry6__payload_0: any)
{
var A_S_entry6_x: int;
var A_S_entry6_y: any;
var _tmp97: int;
var _tmp98: int;
var _tmp99: bool;


A_S_entry6_y = A_foo();

_tmp97 = (A_S_entry6_y as int);

_tmp98 = (A_S_entry6_y as int);

A_S_entry6_x = (_tmp97 + _tmp98);

_tmp99 = (A_S_entry6_x == 6);

assert _tmp99;


}
fun A_S_exit0_rand_511067576()
{


;


}start  state A_S
{entry (payload: any) {
A_S_entry6(payload);
}
exit  {
A_S_exit0_rand_511067576();
}
}
}

