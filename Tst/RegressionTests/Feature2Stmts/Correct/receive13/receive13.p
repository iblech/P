event E;
event F;
event Unit;

main machine A
{
var A_x: int;

fun A_Init_entry11(A_Init_entry11__payload_0: null)
{
var A_Init_entry11_b: machine;
var Tmp69: machine;


;

Tmp69 = new B(null);
A_Init_entry11_b = Tmp69;
;

send A_Init_entry11_b, F;
return;
}
fun A_Init_exit0_rand_87883443(A_Init_exit0_rand_87883443__payload_skip: any)
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
A_Init_exit0_rand_87883443(null);
}}
}

machine B
{

fun B_Init_do_F23(B_Init_do_F23__payload_2: null)
{


;

assert false;
return;
}
fun B_X_do_F32(B_X_do_F32__payload_5: null)
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
fun B_Init_exit0_rand_917378774(B_Init_exit0_rand_917378774__payload_skip: any)
{


;

;

return;
}
fun B_X_entry28_case_F29(B_X_entry28_case_F29__payload_4: null, B_X_entry28_case_F29_env: (null)): (null)
{
var B_X_entry28__payload_3: null;
var Tmp70: (null);


B_X_entry28__payload_3 = B_X_entry28_case_F29_env.0;
;

pop;
Tmp70 = (B_X_entry28__payload_3,);
return (Tmp70);
}
fun B_X_entry28(B_X_entry28__payload_3: null)
{
var B_X_entry28_case_F29_env: (null);


;

receive
{
case F: (payload: null) {

B_X_entry28_case_F29_env = B_X_entry28_case_F29(payload, (B_X_entry28__payload_3,));
B_X_entry28__payload_3 = B_X_entry28_case_F29_env.0;

}
}

return;
}
fun B_X_exit0_rand_1791221156(B_X_exit0_rand_1791221156__payload_skip: any)
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
B_Init_exit0_rand_917378774(null);
}on F do (payload: null) {
B_Init_do_F23(payload);
}on Unit push B_X;}

 state B_X
{
entry (payload: null) {
B_X_entry28(payload);
}exit {
B_X_exit0_rand_1791221156(null);
}on F do (payload: null) {
B_X_do_F32(payload);
}}
}

