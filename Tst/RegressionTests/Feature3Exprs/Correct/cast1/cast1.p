event halt;
event null;

main machine A
{

fun A_foo(): any
{


return (3);


}
fun A_S_entry5()
{
var A_S_entry5_x: int;
var _tmp68: any;
var _tmp69: int;
var _tmp70: any;
var _tmp71: int;
var _tmp72: bool;


_tmp68 = A_foo();

_tmp69 = (_tmp68 as int);

_tmp70 = A_foo();

_tmp71 = (_tmp70 as int);

A_S_entry5_x = (_tmp69 + _tmp71);

_tmp72 = (A_S_entry5_x == 6);

assert _tmp72;


}
fun A_S_exit0_rand_396446050()
{


;


}start  state A_S
{entry  {
A_S_entry5();
}
exit  {
A_S_exit0_rand_396446050();
}
}
}

