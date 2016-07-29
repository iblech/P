event x: (int, int);
event a;
event y;

main machine M1
{
var M1_id: machine;
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
fun M1_S_entry13_case_x17(M1_S_entry13_case_x17_payload: (int, int), M1_S_entry13_case_x17_env: (null, machine)): (null, machine)
{
var M1_S_entry13__payload_0: null;
var M1_S_entry13_container: machine;
var Tmp7: (null, machine);


M1_S_entry13__payload_0 = M1_S_entry13_case_x17_env.0;
M1_S_entry13_container = M1_S_entry13_case_x17_env.1;
;

M1_part[M1_S_entry13_case_x17_payload.0] = M1_S_entry13_case_x17_payload.1;
Tmp7 = (M1_S_entry13__payload_0, M1_S_entry13_container);
return (Tmp7);
}
fun M1_S_entry13_case_x22(M1_S_entry13_case_x22_payload: (int, int), M1_S_entry13_case_x22_env: (null, machine)): (null, machine)
{
var M1_S_entry13__payload_0: null;
var M1_S_entry13_container: machine;
var Tmp8: (null, machine);


M1_S_entry13__payload_0 = M1_S_entry13_case_x22_env.0;
M1_S_entry13_container = M1_S_entry13_case_x22_env.1;
;

M1_part[M1_S_entry13_case_x22_payload.0] = M1_S_entry13_case_x22_payload.1;
Tmp8 = (M1_S_entry13__payload_0, M1_S_entry13_container);
return (Tmp8);
}
fun M1_S_entry13(M1_S_entry13__payload_0: null)
{
var M1_S_entry13_container: machine;
var M1_S_entry13_case_x17_env: (null, machine);
var M1_S_entry13_case_x22_env: (null, machine);
var Tmp10: (machine, bool, int);
var Tmp9: (machine, bool, int);


;

M1_S_entry13_container = M1_CREATECONTAINER();
;

new M2(this);
;

Tmp9 = (this, false, 0);
M1_CreateSMR(M1_S_entry13_container, Tmp9);
;

receive
{
case x: (payload: (int, int)) {

M1_S_entry13_case_x17_env = M1_S_entry13_case_x17(payload, (M1_S_entry13__payload_0, M1_S_entry13_container));
M1_S_entry13__payload_0 = M1_S_entry13_case_x17_env.0;
M1_S_entry13_container = M1_S_entry13_case_x17_env.1;

}
}

;

M1_CREATECONTAINER();
;

Tmp10 = (this, false, 1);
M1_CreateSMR(M1_S_entry13_container, Tmp10);
;

receive
{
case x: (payload: (int, int)) {

M1_S_entry13_case_x22_env = M1_S_entry13_case_x22(payload, (M1_S_entry13__payload_0, M1_S_entry13_container));
M1_S_entry13__payload_0 = M1_S_entry13_case_x22_env.0;
M1_S_entry13_container = M1_S_entry13_case_x22_env.1;

}
}

return;
}
fun M1_S_exit0_rand_897651491(M1_S_exit0_rand_897651491__payload_skip: any)
{


;

;

return;
}start 
 state M1_S
{
entry (payload: null) {
M1_S_entry13(payload);
}exit {
M1_S_exit0_rand_897651491(null);
}}
}

machine M2
{
var M2_id: machine;
var M2_part: map[int, int];

fun M2_S_entry42(M2_S_entry42_payload: machine)
{
var Tmp11: (int, int);


;

Tmp11 = (0, 0);
send M2_S_entry42_payload, x, Tmp11;
return;
}
fun M2_S_exit0_rand_314528035(M2_S_exit0_rand_314528035__payload_skip: any)
{


;

;

return;
}start 
 state M2_S
{
entry (payload: machine) {
M2_S_entry42(payload);
}exit {
M2_S_exit0_rand_314528035(null);
}}
}

