
main machine A
{

fun A_foo(): any
{


return (3);
}
fun A_S_entry6()
{
var A_S_entry6_x: int;
var A_S_entry6_y: any;
var _tmp73: int;
var _tmp74: int;
var _tmp75: bool;


A_S_entry6_y = A_foo();
_tmp73 = (A_S_entry6_y as int);
_tmp74 = (A_S_entry6_y as int);
A_S_entry6_x = (_tmp73 + _tmp74);
_tmp75 = (A_S_entry6_x == 6);
assert _tmp75;
}
fun A_S_exit0_rand_1615295715()
{


;

}start  state A_S
{entry  {
A_S_entry6();
}
exit  {
A_S_exit0_rand_1615295715();
}
}
}

