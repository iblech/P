event x: (int, int);
event a;
event y;

main machine M1
{
var M1_part: map[int, int];

fun M1_CREATECONTAINER(): machine
{


return (null);


}
fun M1_CreateSMR(M1_CreateSMR_cont: machine, M1_CreateSMR_param: any): machine
{


return (null);


}
fun M1_S_entry12_case_x15(env: (any, machine), M1_S_entry12_case_x15_payload: (int, int)): (any, machine)
{
var M1_S_entry12__payload_0: any;
var M1_S_entry12_container: machine;
var _tmp3: (any, machine);


M1_S_entry12__payload_0 = env.0;
;
M1_S_entry12_container = env.1;
;
M1_part[M1_S_entry12_case_x15_payload.0] = M1_S_entry12_case_x15_payload.1;
;
_tmp3 = (M1_S_entry12__payload_0, M1_S_entry12_container);
;
return (_tmp3);


}
fun M1_S_entry12_case_x20(env: (any, machine), M1_S_entry12_case_x20_payload: (int, int)): (any, machine)
{
var M1_S_entry12__payload_0: any;
var M1_S_entry12_container: machine;
var _tmp4: (any, machine);


M1_S_entry12__payload_0 = env.0;
;
M1_S_entry12_container = env.1;
;
M1_part[M1_S_entry12_case_x20_payload.0] = M1_S_entry12_case_x20_payload.1;
;
_tmp4 = (M1_S_entry12__payload_0, M1_S_entry12_container);
;
return (_tmp4);


}
fun M1_S_entry12(M1_S_entry12__payload_0: any)
{
var M1_S_entry12_container: machine;
var _tmp5: (machine, bool, int);
var _tmp6: (machine, bool, int);


M1_S_entry12_container = M1_CREATECONTAINER();
;
_tmp5 = (this, false, 0);
;
M1_CreateSMR(M1_S_entry12_container, _tmp5);
;
receive
{
case x:  (payload: (int, int)) {
var env: (any, machine);
env = M1_S_entry12_case_x15((M1_S_entry12__payload_0, M1_S_entry12_container), payload);
M1_S_entry12__payload_0=env.0;
M1_S_entry12_container=env.1;
}

}
;
M1_S_entry12_container = M1_CREATECONTAINER();
;
_tmp6 = (this, false, 1);
;
M1_CreateSMR(M1_S_entry12_container, _tmp6);
;
receive
{
case x:  (payload: (int, int)) {
var env: (any, machine);
env = M1_S_entry12_case_x20((M1_S_entry12__payload_0, M1_S_entry12_container), payload);
M1_S_entry12__payload_0=env.0;
M1_S_entry12_container=env.1;
}

}


}
fun M1_S_exit0_rand_140115311()
{


;


}start  state M1_S
{entry (payload: any) {
M1_S_entry12(payload);
}
exit  {
M1_S_exit0_rand_140115311();
}
}
}

