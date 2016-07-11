event E: int;
event F;
event G: int;

main machine A
{
var A_x: int;

fun A_foo_case_G24(env: (machine, int), A_foo_case_G24_payload: int): (machine, int)
{
var A_foo_b: machine;
var A_foo_p: int;
var _tmp38: (machine, int);


A_foo_b = env.0;
;
A_foo_p = env.1;
;
A_x = ((A_x + A_foo_p) + A_foo_case_G24_payload);
;
_tmp38 = (A_foo_b, A_foo_p);
;
return (_tmp38);


}
fun A_foo_case_F23(env: (machine, int)): (machine, int)
{
var A_foo_b: machine;
var A_foo_p: int;
var _tmp39: (machine, int);


A_foo_b = env.0;
;
A_foo_p = env.1;
;
A_x = ((A_x + A_foo_p) + 2);
;
_tmp39 = (A_foo_b, A_foo_p);
;
return (_tmp39);


}
fun A_foo_case_E22(env: (machine, int), A_foo_case_E22__payload_1: any): (machine, int)
{
var A_foo_b: machine;
var A_foo_p: int;
var _tmp40: (machine, int);


A_foo_b = env.0;
;
A_foo_p = env.1;
;
A_x = ((A_x + A_foo_p) + 1);
;
_tmp40 = (A_foo_b, A_foo_p);
;
return (_tmp40);


}
fun A_foo(A_foo_b: machine, A_foo_p: int)
{


send A_foo_b, E, 0;
;
send A_foo_b, G, 1;
;
receive
{
case G:  (payload: int) {
var env: (machine, int);
env = A_foo_case_G24((A_foo_b, A_foo_p), payload);
A_foo_b=env.0;
A_foo_p=env.1;
}

case F:   {
var env: (machine, int);
env = A_foo_case_F23((A_foo_b, A_foo_p));
A_foo_b=env.0;
A_foo_p=env.1;
}

case E:  (payload: int) {
var env: (machine, int);
env = A_foo_case_E22((A_foo_b, A_foo_p), payload);
A_foo_b=env.0;
A_foo_p=env.1;
}

}


}
fun A_Init_entry11(A_Init_entry11__payload_0: any)
{
var A_Init_entry11_b: machine;
var _tmp41: machine;
var _tmp42: bool;
var _tmp43: bool;


_tmp41 = new B(this);
;
A_Init_entry11_b = _tmp41;
;
A_x = (A_x + 1);
;
_tmp42 = (A_x == 1);
;
assert _tmp42;
;
A_foo(A_Init_entry11_b, 0);
;
_tmp43 = (A_x == 2);
;
assert _tmp43;


}
fun A_Init_exit0_rand_467965854()
{


;


}start  state A_Init
{entry (payload: any) {
A_Init_entry11(payload);
}
exit  {
A_Init_exit0_rand_467965854();
}
}
}

machine B
{

fun B_Init_entry34_case_E38_case_G44(env: (int, machine, machine, int), B_Init_entry34_case_E38_case_G44_payload3: int): (int, machine, machine, int)
{
var B_Init_entry34_case_E38_payload2: int;
var B_Init_entry34_payload1: machine;
var B_Init_entry34_y: machine;
var B_Init_entry34_z: int;
var B_Init_entry34_case_E38_case_G44_x: int;
var B_Init_entry34_case_E38_case_G44_a: int;
var B_Init_entry34_case_E38_case_G44_b: int;
var B_Init_entry34_case_E38_case_G44_c: event;
var _tmp44: bool;
var _tmp45: (int, machine, machine, int);


B_Init_entry34_case_E38_payload2 = env.0;
;
B_Init_entry34_payload1 = env.1;
;
B_Init_entry34_y = env.2;
;
B_Init_entry34_z = env.3;
;
B_Init_entry34_case_E38_case_G44_x = B_Init_entry34_case_E38_case_G44_payload3;
;
send B_Init_entry34_y, G, B_Init_entry34_case_E38_case_G44_x;
;
B_Init_entry34_case_E38_case_G44_a = 10;
;
B_Init_entry34_case_E38_case_G44_b = 11;
;
_tmp44 = (B_Init_entry34_case_E38_case_G44_b == (B_Init_entry34_case_E38_case_G44_a + B_Init_entry34_z));
;
assert _tmp44;
;
_tmp45 = (B_Init_entry34_case_E38_payload2, B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z);
;
return (_tmp45);


}
fun B_Init_entry34_case_E38(env: (machine, machine, int), B_Init_entry34_case_E38_payload2: int): (machine, machine, int)
{
var B_Init_entry34_payload1: machine;
var B_Init_entry34_y: machine;
var B_Init_entry34_z: int;
var _tmp46: bool;
var _tmp47: bool;
var _tmp48: (machine, machine, int);


B_Init_entry34_payload1 = env.0;
;
B_Init_entry34_y = env.1;
;
B_Init_entry34_z = env.2;
;
_tmp46 = (B_Init_entry34_case_E38_payload2 == 0);
;
assert _tmp46;
;
receive
{
case G:  (payload: int) {
var env: (int, machine, machine, int, int, int, int, event);
env = B_Init_entry34_case_E38_case_G44((B_Init_entry34_case_E38_payload2, B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z, B_Init_entry34_case_E38_case_G44_x, B_Init_entry34_case_E38_case_G44_a, B_Init_entry34_case_E38_case_G44_b, B_Init_entry34_case_E38_case_G44_c), payload);
B_Init_entry34_case_E38_payload2=env.0;
B_Init_entry34_payload1=env.1;
B_Init_entry34_y=env.2;
B_Init_entry34_z=env.3;
B_Init_entry34_case_E38_case_G44_x=env.4;
B_Init_entry34_case_E38_case_G44_a=env.5;
B_Init_entry34_case_E38_case_G44_b=env.6;
B_Init_entry34_case_E38_case_G44_c=env.7;
}

}
;
_tmp47 = (B_Init_entry34_case_E38_payload2 == 0);
;
assert _tmp47;
;
_tmp48 = (B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z);
;
return (_tmp48);


}
fun B_Init_entry34(B_Init_entry34_payload1: machine)
{
var B_Init_entry34_y: machine;
var B_Init_entry34_z: int;
var _tmp49: bool;


B_Init_entry34_z = (B_Init_entry34_z + 1);
;
B_Init_entry34_y = B_Init_entry34_payload1;
;
receive
{
case E:  (payload: int) {
var env: (machine, machine, int);
env = B_Init_entry34_case_E38((B_Init_entry34_payload1, B_Init_entry34_y, B_Init_entry34_z), payload);
B_Init_entry34_payload1=env.0;
B_Init_entry34_y=env.1;
B_Init_entry34_z=env.2;
}

}
;
_tmp49 = (B_Init_entry34_y == B_Init_entry34_payload1);
;
assert _tmp49;


}
fun B_Init_exit0_rand_551005507()
{


;


}start  state B_Init
{entry (payload: machine) {
B_Init_entry34(payload);
}
exit  {
B_Init_exit0_rand_551005507();
}
}
}

