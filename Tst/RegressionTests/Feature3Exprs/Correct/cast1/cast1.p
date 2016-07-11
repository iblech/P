
main machine A
{

fun A_foo(): any
{


return (3);


}
fun A_S_entry5(A_S_entry5__payload_0: any)
{
var A_S_entry5_x: int;
var _tmp92: any;
var _tmp93: int;
var _tmp94: any;
var _tmp95: int;
var _tmp96: bool;


_tmp92 = A_foo();

_tmp93 = (_tmp92 as int);

_tmp94 = A_foo();

_tmp95 = (_tmp94 as int);

A_S_entry5_x = (_tmp93 + _tmp95);

_tmp96 = (A_S_entry5_x == 6);

assert _tmp96;


}
fun A_S_exit0_rand_1268806915()
{


;


}start  state A_S
{entry (payload: any) {
A_S_entry5(payload);
}
exit  {
A_S_exit0_rand_1268806915();
}
}
}

