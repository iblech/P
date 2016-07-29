event x: (int, int);
event a;
event y;

main machine M1
{
var M1_part: map[int, int];

fun M1_CREATECONTAINER(): machine
{


;

return (null);
}
fun M1_CreateSMR(M1_CreateSMR_cont: machine, M1_CreateSMR_param: any): machine
{


;

return (null);
}
fun M1_S_entry12_case_x15(M1_S_entry12_case_x15_payload: (int, int), M1_S_entry12_case_x15_env: (null, machine)): (null, machine)
{
var M1_S_entry12__payload_0: null;
var M1_S_entry12_container: machine;
var Tmp3: (null, machine);


M1_S_entry12__payload_0 = M1_S_entry12_case_x15_env.0;
M1_S_entry12_container = M1_S_entry12_case_x15_env.1;
;

M1_part[M1_S_entry12_case_x15_payload.0] = M1_S_entry12_case_x15_payload.1;
Tmp3 = (M1_S_entry12__payload_0, M1_S_entry12_container);
return (Tmp3);
}
fun M1_S_entry12_case_x20(M1_S_entry12_case_x20_payload: (int, int), M1_S_entry12_case_x20_env: (null, machine)): (null, machine)
{
var M1_S_entry12__payload_0: null;
var M1_S_entry12_container: machine;
var Tmp4: (null, machine);


M1_S_entry12__payload_0 = M1_S_entry12_case_x20_env.0;
M1_S_entry12_container = M1_S_entry12_case_x20_env.1;
;

M1_part[M1_S_entry12_case_x20_payload.0] = M1_S_entry12_case_x20_payload.1;
Tmp4 = (M1_S_entry12__payload_0, M1_S_entry12_container);
return (Tmp4);
}
fun M1_S_entry12(M1_S_entry12__payload_0: null)
{
var M1_S_entry12_container: machine;
var M1_S_entry12_case_x15_env: (null, machine);
var M1_S_entry12_case_x20_env: (null, machine);
var Tmp5: (machine, bool, int);
var Tmp6: (machine, bool, int);


;

M1_S_entry12_container = M1_CREATECONTAINER();
;

Tmp5 = (this, false, 0);
M1_CreateSMR(M1_S_entry12_container, Tmp5);
;

receive
{
case x: (payload: (int, int)) {

M1_S_entry12_case_x15_env = M1_S_entry12_case_x15(payload, (M1_S_entry12__payload_0, M1_S_entry12_container));
M1_S_entry12__payload_0 = M1_S_entry12_case_x15_env.0;
M1_S_entry12_container = M1_S_entry12_case_x15_env.1;

}
}

;

M1_S_entry12_container = M1_CREATECONTAINER();
;

Tmp6 = (this, false, 1);
M1_CreateSMR(M1_S_entry12_container, Tmp6);
;

receive
{
case x: (payload: (int, int)) {

M1_S_entry12_case_x20_env = M1_S_entry12_case_x20(payload, (M1_S_entry12__payload_0, M1_S_entry12_container));
M1_S_entry12__payload_0 = M1_S_entry12_case_x20_env.0;
M1_S_entry12_container = M1_S_entry12_case_x20_env.1;

}
}

return;
}
fun M1_S_exit0_rand_652340664(M1_S_exit0_rand_652340664__payload_skip: any)
{


;

;

return;
}start 
 state M1_S
{
entry (payload: null) {
M1_S_entry12(payload);
}exit {
M1_S_exit0_rand_652340664(null);
}}
}

