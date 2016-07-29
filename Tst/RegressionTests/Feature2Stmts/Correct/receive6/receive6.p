event E;
event F;
event Unit;

main machine A
{
var A_x: int;

fun A_Init_entry11(A_Init_entry11__payload_0: null)
{
var A_Init_entry11_b: machine;
var Tmp77: machine;


;

Tmp77 = new B(null);
A_Init_entry11_b = Tmp77;
;

send A_Init_entry11_b, F;
return;
}
fun A_Init_exit0_rand_1582751750(A_Init_exit0_rand_1582751750__payload_skip: any)
{


;

;

return;
}start 
 state A_Init
{
entry (payload: null) {
A_Init_entry11(payload);
}exit {
A_Init_exit0_rand_1582751750(null);
}}
}

machine B
{

fun B_Init_on_Unit_goto_B_X0_rand_1587308380(B_Init_on_Unit_goto_B_X0_rand_1587308380__payload_skip: any)
{


;

;

return;
}
fun B_X_on_F_goto_B_X31(B_X_on_F_goto_B_X31__payload_4: null)
{


;

assert false;
return;
}
fun B_Init_entry20(B_Init_entry20__payload_1: null)
{


;

raise Unit;
return;
}
fun B_Init_exit0_rand_675638594(B_Init_exit0_rand_675638594__payload_skip: any)
{


;

;

return;
}
fun B_X_entry27_case_E0_rand_405737461(B_X_entry27_case_E0_rand_405737461__payload_3: null, B_X_entry27_case_E0_rand_405737461_env: (null)): (null)
{
var B_X_entry27__payload_2: null;
var Tmp78: (null);


B_X_entry27__payload_2 = B_X_entry27_case_E0_rand_405737461_env.0;
;

;

Tmp78 = (B_X_entry27__payload_2,);
return (Tmp78);
}
fun B_X_entry27(B_X_entry27__payload_2: null)
{
var B_X_entry27_case_E0_rand_405737461_env: (null);


;

receive
{
case E: (payload: null) {

B_X_entry27_case_E0_rand_405737461_env = B_X_entry27_case_E0_rand_405737461(payload, (B_X_entry27__payload_2,));
B_X_entry27__payload_2 = B_X_entry27_case_E0_rand_405737461_env.0;

}
}

return;
}
fun B_X_exit0_rand_397334200(B_X_exit0_rand_397334200__payload_skip: any)
{


;

;

return;
}start 
 state B_Init
{
entry (payload: null) {
B_Init_entry20(payload);
}exit {
B_Init_exit0_rand_675638594(null);
}on Unit goto B_X with (payload: null) {
B_Init_on_Unit_goto_B_X0_rand_1587308380(payload);
}}

 state B_X
{
entry (payload: null) {
B_X_entry27(payload);
}exit {
B_X_exit0_rand_397334200(null);
}on F goto B_X with (payload: null) {
B_X_on_F_goto_B_X31(payload);
}}
}

