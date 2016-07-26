fun IntToFloat32(IntToFloat32_val: int): int
{


;

return (default(int));
}
fun AddFloat32(AddFloat32_op1: int, AddFloat32_op2: int): int
{


;

return (default(int));
}
main machine Test
{

fun Test_Init_entry19(Test_Init_entry19__payload_0: null)
{
var Test_Init_entry19_f: int;
var Tmp214: int;


;

Test_Init_entry19_f = IntToFloat32(1);
;

Tmp214 = IntToFloat32(1000);
Test_Init_entry19_f = AddFloat32(Test_Init_entry19_f, Tmp214);
return;
}
fun Test_Init_exit0_rand_524284474(Test_Init_exit0_rand_524284474__payload_skip: any)
{


;

;

return;
}start 
 state Test_Init
{
entry (payload: null) {
Test_Init_entry19(payload);
}exit {
Test_Init_exit0_rand_524284474(null);
}}
}

