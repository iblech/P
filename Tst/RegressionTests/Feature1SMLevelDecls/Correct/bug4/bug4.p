event x: (int, int);
event a;
event y;

main machine M1
{
var M1_id: machine;
var M1_part: map[int, int];

fun M1_CREATECONTAINER(): machine
{


return (null);


}
fun M1_CreateSMR(M1_CreateSMR_cont: machine, M1_CreateSMR_param: any): machine
{


return (null);


}
fun M1_S_entry13_case_x17(env: (any, machine), M1_S_entry13_case_x17_payload: (int, int)): (any, machine)
{
var M1_S_entry13__payload_0: any;
var M1_S_entry13_container: machine;
var _tmp7: (any, machine);


M1_S_entry13__payload_0 = env.0;
;
M1_S_entry13_container = env.1;
;
M1_part[M1_S_entry13_case_x17_payload.0] = M1_S_entry13_case_x17_payload.1;
;
_tmp7 = (M1_S_entry13__payload_0, M1_S_entry13_container);
;
return (_tmp7);


}
fun M1_S_entry13_case_x22(env: (any, machine), M1_S_entry13_case_x22_payload: (int, int)): (any, machine)
{
var M1_S_entry13__payload_0: any;
var M1_S_entry13_container: machine;
var _tmp8: (any, machine);


M1_S_entry13__payload_0 = env.0;
;
M1_S_entry13_container = env.1;
;
M1_part[M1_S_entry13_case_x22_payload.0] = M1_S_entry13_case_x22_payload.1;
;
_tmp8 = (M1_S_entry13__payload_0, M1_S_entry13_container);
;
return (_tmp8);


}
fun M1_S_entry13(M1_S_entry13__payload_0: any)
{
var M1_S_entry13_container: machine;
var _tmp10: (machine, bool, int);
var _tmp9: (machine, bool, int);


M1_S_entry13_container = M1_CREATECONTAINER();
;
new M2(this);
;
_tmp9 = (this, false, 0);
;
M1_CreateSMR(M1_S_entry13_container, _tmp9);
;
receive
{
case x:  (payload: (int, int)) {
var env: (any, machine);
env = M1_S_entry13_case_x17((M1_S_entry13__payload_0, M1_S_entry13_container), payload);
M1_S_entry13__payload_0=env.0;
M1_S_entry13_container=env.1;
}

}
;
M1_CREATECONTAINER();
;
_tmp10 = (this, false, 1);
;
M1_CreateSMR(M1_S_entry13_container, _tmp10);
;
receive
{
case x:  (payload: (int, int)) {
var env: (any, machine);
env = M1_S_entry13_case_x22((M1_S_entry13__payload_0, M1_S_entry13_container), payload);
M1_S_entry13__payload_0=env.0;
M1_S_entry13_container=env.1;
}

}


}
fun M1_S_exit0_rand_141688078()
{


;


}start  state M1_S
{entry (payload: any) {
M1_S_entry13(payload);
}
exit  {
M1_S_exit0_rand_141688078();
}
}
}

machine M2
{
var M2_id: machine;
var M2_part: map[int, int];

fun M2_S_entry42(M2_S_entry42_payload: machine)
{
var _tmp11: (int, int);


_tmp11 = (0, 0);
;
send M2_S_entry42_payload, x, _tmp11;


}
fun M2_S_exit0_rand_1572890875()
{


;


}start  state M2_S
{entry (payload: machine) {
M2_S_entry42(payload);
}
exit  {
M2_S_exit0_rand_1572890875();
}
}
}

