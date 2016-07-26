event E;
event F;
event Unit;

main machine A
{
var A_x: int;

fun A_Init_entry11(A_Init_entry11__payload_0: null)
{
var A_Init_entry11_b: machine;
var Tmp67: machine;


;

Tmp67 = new B(null);
A_Init_entry11_b = Tmp67;
;

send A_Init_entry11_b, F;
return;
}
fun A_Init_exit0_rand_1142964486(A_Init_exit0_rand_1142964486__payload_skip: any)
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
A_Init_exit0_rand_1142964486(null);
}}
}

machine B
{

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
fun B_Init_exit0_rand_322820305(B_Init_exit0_rand_322820305__payload_skip: any)
{


;

;

return;
}
fun B_X_entry27_case_F28(B_X_entry27_case_F28__payload_3: null, B_X_entry27_case_F28_env: (null)): (null)
{
var B_X_entry27__payload_2: null;
var Tmp68: (null);


B_X_entry27__payload_2 = B_X_entry27_case_F28_env.0;
;

pop;
Tmp68 = (B_X_entry27__payload_2,);
return (Tmp68);
}
fun B_X_entry27(B_X_entry27__payload_2: null)
{
var B_X_entry27_case_F28_env: (null);


;

receive
{
case F: (payload: null) {

B_X_entry27_case_F28_env = B_X_entry27_case_F28(payload, (B_X_entry27__payload_2,));
B_X_entry27__payload_2 = B_X_entry27_case_F28_env.0;

}
}

return;
}
fun B_X_exit0_rand_1538113919(B_X_exit0_rand_1538113919__payload_skip: any)
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
B_Init_exit0_rand_322820305(null);
}on Unit push B_X;}

 state B_X
{
entry (payload: null) {
B_X_entry27(payload);
}exit {
B_X_exit0_rand_1538113919(null);
}on F goto B_X with (payload: null) {
B_X_on_F_goto_B_X31(payload);
}}
}

