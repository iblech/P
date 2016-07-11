event E;
event F;
event Unit;

main machine A
{
var A_x: int;

fun A_Init_entry11(A_Init_entry11__payload_0: any)
{
var A_Init_entry11_b: machine;
var _tmp52: machine;


_tmp52 = new B(this);
;
A_Init_entry11_b = _tmp52;
;
send A_Init_entry11_b, F;


}
fun A_Init_exit0_rand_1317392754()
{


;


}start  state A_Init
{entry (payload: any) {
A_Init_entry11(payload);
}
exit  {
A_Init_exit0_rand_1317392754();
}
}
}

machine B
{

fun B_Init_entry20(B_Init_entry20__payload_1: any)
{


raise Unit;


}
fun B_Init_exit0_rand_1655489826()
{


;


}
fun B_X_entry28_case_F29(env: (any)): (any)
{
var B_X_entry28__payload_3: any;
var _tmp53: (any);


B_X_entry28__payload_3 = env.0;
;
pop;
;
_tmp53 = (B_X_entry28__payload_3,);
;
return (_tmp53);


}
fun B_X_entry28(B_X_entry28__payload_3: any)
{


receive
{
case F:   {
var env: (any);
env = B_X_entry28_case_F29((B_X_entry28__payload_3,));
B_X_entry28__payload_3=env.0;
}

}


}
fun B_X_exit0_rand_1586013754()
{


;


}
fun B_Init_do_F23(B_Init_do_F23__payload_2: any)
{


assert false;


}
fun B_X_do_F32(B_X_do_F32__payload_5: any)
{


assert false;


}start  state B_Init
{entry (payload: any) {
B_Init_entry20(payload);
}
exit  {
B_Init_exit0_rand_1655489826();
}
}
 state B_X
{entry (payload: any) {
B_X_entry28(payload);
}
exit  {
B_X_exit0_rand_1586013754();
}
}
}

