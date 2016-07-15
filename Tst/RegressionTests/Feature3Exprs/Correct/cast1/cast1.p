
main machine A
{

fun A_foo(): any
{


return (3);
}
fun A_S_entry5()
{
var A_S_entry5_x: int;
var Tmp68: any;
var Tmp69: int;
var Tmp70: any;
var Tmp71: int;
var Tmp72: bool;


Tmp68 = A_foo();
Tmp69 = (Tmp68 as int);
Tmp70 = A_foo();
Tmp71 = (Tmp70 as int);
A_S_entry5_x = (Tmp69 + Tmp71);
Tmp72 = (A_S_entry5_x == 6);
assert Tmp72;
}
fun A_S_exit0_rand_569923465()
{


;

}start 
 state A_S
{
entry  {
A_S_entry5();
}
exit  {
A_S_exit0_rand_569923465();
}
}
}

