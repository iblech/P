event E;
event F;
event Unit;

main machine A
{
var A_x: int;

fun A_Init_entry11(A_Init_entry11__payload_0: any)
{
var A_Init_entry11_b: machine;
var _tmp58: machine;


_tmp58 = new B(this);
;
A_Init_entry11_b = _tmp58;
;
send A_Init_entry11_b, F;


}
fun A_Init_exit0_rand_2095616870()
{


;


}start  state A_Init
{entry (payload: any) {
A_Init_entry11(payload);
}
exit  {
A_Init_exit0_rand_2095616870();
}
}
}

machine B
{

fun B_Init_entry20(B_Init_entry20__payload_1: any)
{


raise Unit;


}
fun B_Init_exit0_rand_824714251()
{


;


}
fun B_X_entry27_case_E0_rand_1305906009(env: (any)): (any)
{
var B_X_entry27__payload_2: any;
var _tmp59: (any);


B_X_entry27__payload_2 = env.0;
;
;
;
_tmp59 = (B_X_entry27__payload_2,);
;
return (_tmp59);


}
fun B_X_entry27(B_X_entry27__payload_2: any)
{


receive
{
case E:   {
var env: (any);
env = B_X_entry27_case_E0_rand_1305906009((B_X_entry27__payload_2,));
B_X_entry27__payload_2=env.0;
}

}


}
fun B_X_exit0_rand_76504836()
{


;


}
fun B_Init_on_Unit_goto_B_X0_rand_1883065546(B_Init_on_Unit_goto_B_X0_rand_1883065546__payload_skip: any)
{


;


}
fun B_X_on_F_goto_B_X31(B_X_on_F_goto_B_X31__payload_4: any)
{


assert false;


}start  state B_Init
{entry (payload: any) {
B_Init_entry20(payload);
}
exit  {
B_Init_exit0_rand_824714251();
}
}
 state B_X
{entry (payload: any) {
B_X_entry27(payload);
}
exit  {
B_X_exit0_rand_76504836();
}
}
}

