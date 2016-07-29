
main machine A
{

fun A_foo(): any
{


;

return (3);
}
fun A_S_entry6(A_S_entry6__payload_0: null)
{
var A_S_entry6_x: int;
var A_S_entry6_y: any;
var Tmp117: int;
var Tmp118: int;
var Tmp119: bool;


;

A_S_entry6_y = A_foo();
;

Tmp117 = (A_S_entry6_y as int);
Tmp118 = (A_S_entry6_y as int);
A_S_entry6_x = (Tmp117 + Tmp118);
;

Tmp119 = (A_S_entry6_x == 6);
assert Tmp119;
return;
}
fun A_S_exit0_rand_1105064893(A_S_exit0_rand_1105064893__payload_skip: any)
{


;

;

return;
}start 
 state A_S
{
entry (payload: null) {
A_S_entry6(payload);
}exit {
A_S_exit0_rand_1105064893(null);
}}
}

