
main machine A
{

fun A_foo(): any
{


;

return (3);
}
fun A_S_entry5(A_S_entry5__payload_0: null)
{
var A_S_entry5_x: int;
var Tmp112: any;
var Tmp113: int;
var Tmp114: any;
var Tmp115: int;
var Tmp116: bool;


;

Tmp112 = A_foo();
Tmp113 = (Tmp112 as int);
Tmp114 = A_foo();
Tmp115 = (Tmp114 as int);
A_S_entry5_x = (Tmp113 + Tmp115);
;

Tmp116 = (A_S_entry5_x == 6);
assert Tmp116;
return;
}
fun A_S_exit0_rand_299573349(A_S_exit0_rand_299573349__payload_skip: any)
{


;

;

return;
}start 
 state A_S
{
entry (payload: null) {
A_S_entry5(payload);
}exit {
A_S_exit0_rand_299573349(null);
}}
}

