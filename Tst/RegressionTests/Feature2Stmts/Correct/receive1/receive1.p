event E: int;
event F;
event G: int;

main machine A
{
var A_x: int;

fun A_foo_case_G24(A_foo_case_G24_payload: int, A_foo_case_G24_env: (machine, int)): (machine, int)
{
var A_foo_b: machine;
var A_foo_p: int;
var Tmp55: (machine, int);


A_foo_b = A_foo_case_G24_env.0;
A_foo_p = A_foo_case_G24_env.1;
;

A_x = ((A_x + A_foo_p) + A_foo_case_G24_payload);
Tmp55 = (A_foo_b, A_foo_p);
return (Tmp55);
}
fun A_foo_case_F23(A_foo_case_F23__payload_1: null, A_foo_case_F23_env: (machine, int)): (machine, int)
{
var A_foo_b: machine;
var A_foo_p: int;
var Tmp56: (machine, int);


A_foo_b = A_foo_case_F23_env.0;
A_foo_p = A_foo_case_F23_env.1;
;

A_x = ((A_x + A_foo_p) + 2);
Tmp56 = (A_foo_b, A_foo_p);
return (Tmp56);
}
fun A_foo_case_E22(A_foo_case_E22_payload: int, A_foo_case_E22_env: (machine, int)): (machine, int)
{
var A_foo_b: machine;
var A_foo_p: int;
var Tmp57: (machine, int);


A_foo_b = A_foo_case_E22_env.0;
A_foo_p = A_foo_case_E22_env.1;
;

A_x = ((A_x + A_foo_p) + 1);
Tmp57 = (A_foo_b, A_foo_p);
return (Tmp57);
}
fun A_foo(A_foo_b: machine, A_foo_p: int)
{
var A_foo_case_G24_env: (machine, int);
var A_foo_case_F23_env: (machine, int);
var A_foo_case_E22_env: (machine, int);


;

send A_foo_b, E, 0;
;

send A_foo_b, G, 1;
;

receive
{
case G: (payload: int) {

A_foo_case_G24_env = A_foo_case_G24(payload, (A_foo_b, A_foo_p));
A_foo_b = A_foo_case_G24_env.0;
A_foo_p = A_foo_case_G24_env.1;

}
case F: (payload: null) {

A_foo_case_F23_env = A_foo_case_F23(payload, (A_foo_b, A_foo_p));
A_foo_b = A_foo_case_F23_env.0;
A_foo_p = A_foo_case_F23_env.1;

}
case E: (payload: int) {

A_foo_case_E22_env = A_foo_case_E22(payload, (A_foo_b, A_foo_p));
A_foo_b = A_foo_case_E22_env.0;
A_foo_p = A_foo_case_E22_env.1;

}
}

}
fun A_Init_entry11(A_Init_entry11__payload_0: null)
{
var A_Init_entry11_b: machine;
var Tmp58: machine;
var Tmp59: bool;
var Tmp60: bool;


;

Tmp58 = new B(this);
A_Init_entry11_b = Tmp58;
;

A_x = (A_x + 1);
;

Tmp59 = (A_x == 1);
assert Tmp59;
;

A_foo(A_Init_entry11_b, 0);
;

Tmp60 = (A_x == 2);
assert Tmp60;
return;
}
fun A_Init_exit0_rand_1558344141(A_Init_exit0_rand_1558344141__payload_skip: any)
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
A_Init_exit0_rand_1558344141(null);
}}
}

machine B
{

fun B_Init_entry34_case_E38_case_G44(B_Init_entry34_case_E38_case_G44_payload3: int, B_Init_entry34_case_E38_case_G44_env: (int, machine, machine, int)): (int, machine, machine, int)
{
var B_Init_entry34_case_E38_payload2: int;
var B_Init_entry34_payload1: machine;
var B_Init_entry34_y: machine;
var B_Init_entry34_z: int;
var B_Init_entry34_case_E38_case_G44_x: int;
var B_Init_entry34_case_E38_case_G44_a: int;
var B_Init_entry34_case_E38_case_G44_b: int;
var B_Init_entry34_case_E38_case_G44_c: event;
var Tmp61: bool;
var Tmp62: (int, machine, machine, int);


B_Init_entry34_case_E38_payload2 = B_Init_entry34_case_E38_case_G44_env.0;
B_Init_entry34_payload1 = B_Init_entry34_case_E38_case_G44_env.1;
B_Init_entry34_y = B_Init_entry34_case_E38_case_G44_env.2;
B_Init_entry34_z = B_Init_entry34_case_E38_case_G44_env.3;
;

B_Init_entry34_case_E38_case_G44_x = B_Init_entry34_case_E38_case_G44_payload3;
;

send B_Init_entry34_y, G, B_Init_entry34_case_E38_case_G44_x;
;

B_Init_entry34_case_E38_case_G44_a = 10;
;

B_Init_entry34_case_E38_case_G44_b = 11;
;

Tmp61 = (B_Init_entry34_case_E38_case_G44_b == (B_Init_entry34_case_E38_case_G44_a + B_Init_entry34_z));
assert Tmp61;
Tmp62 = (B_Init_entry34_case_E38_payload2, B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z);
return (Tmp62);
}
fun B_Init_entry34_case_E38(B_Init_entry34_case_E38_payload2: int, B_Init_entry34_case_E38_env: (machine, machine, int)): (machine, machine, int)
{
var B_Init_entry34_payload1: machine;
var B_Init_entry34_y: machine;
var B_Init_entry34_z: int;
var B_Init_entry34_case_E38_case_G44_env: (int, machine, machine, int);
var Tmp63: bool;
var Tmp64: bool;
var Tmp65: (machine, machine, int);


B_Init_entry34_payload1 = B_Init_entry34_case_E38_env.0;
B_Init_entry34_y = B_Init_entry34_case_E38_env.1;
B_Init_entry34_z = B_Init_entry34_case_E38_env.2;
;

Tmp63 = (B_Init_entry34_case_E38_payload2 == 0);
assert Tmp63;
;

receive
{
case G: (payload: int) {

B_Init_entry34_case_E38_case_G44_env = B_Init_entry34_case_E38_case_G44(payload, (B_Init_entry34_case_E38_payload2, B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z));
B_Init_entry34_case_E38_payload2 = B_Init_entry34_case_E38_case_G44_env.0;
B_Init_entry34_payload1 = B_Init_entry34_case_E38_case_G44_env.1;
B_Init_entry34_y = B_Init_entry34_case_E38_case_G44_env.2;
B_Init_entry34_z = B_Init_entry34_case_E38_case_G44_env.3;

}
}

;

Tmp64 = (B_Init_entry34_case_E38_payload2 == 0);
assert Tmp64;
Tmp65 = (B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z);
return (Tmp65);
}
fun B_Init_entry34(B_Init_entry34_payload1: machine)
{
var B_Init_entry34_y: machine;
var B_Init_entry34_z: int;
var B_Init_entry34_case_E38_env: (machine, machine, int);
var Tmp66: bool;


;

B_Init_entry34_z = (B_Init_entry34_z + 1);
;

B_Init_entry34_y = B_Init_entry34_payload1;
;

receive
{
case E: (payload: int) {

B_Init_entry34_case_E38_env = B_Init_entry34_case_E38(payload, (B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z));
B_Init_entry34_payload1 = B_Init_entry34_case_E38_env.0;
B_Init_entry34_y = B_Init_entry34_case_E38_env.1;
B_Init_entry34_z = B_Init_entry34_case_E38_env.2;

}
}

;

Tmp66 = (B_Init_entry34_y == B_Init_entry34_payload1);
assert Tmp66;
return;
}
fun B_Init_exit0_rand_579018567(B_Init_exit0_rand_579018567__payload_skip: any)
{


;

;

return;
}start 
 state B_Init
{
entry (payload: machine) {
B_Init_entry34(payload);
}exit {
B_Init_exit0_rand_579018567(null);
}}
}

