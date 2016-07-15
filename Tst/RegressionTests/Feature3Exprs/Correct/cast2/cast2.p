
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
var Tmp73: int;
var Tmp74: int;
var Tmp75: bool;


A_S_entry6_y = A_foo();
Tmp73 = (A_S_entry6_y as int);
Tmp74 = (A_S_entry6_y as int);
A_S_entry6_x = (Tmp73 + Tmp74);
Tmp75 = (A_S_entry6_x == 6);
assert Tmp75;
}
fun A_S_exit0_rand_1120994497()
{


;

}start 
 state A_S
{
entry  {
A_S_entry6();
}
exit  {
A_S_exit0_rand_1120994497();
}
}
}

