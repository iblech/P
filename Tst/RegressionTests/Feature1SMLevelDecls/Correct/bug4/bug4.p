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
fun M1_S_entry13_case_x17(env: (machine), M1_S_entry13_case_x17_payload: (int, int)): (machine)
{
var M1_S_entry13_container: machine;
var Tmp4: (machine);


M1_S_entry13_container = env.0;
M1_part[M1_S_entry13_case_x17_payload.0] = M1_S_entry13_case_x17_payload.1;
Tmp4 = (M1_S_entry13_container,);
return (Tmp4);
}
fun M1_S_entry13_case_x22(env: (machine), M1_S_entry13_case_x22_payload: (int, int)): (machine)
{
var M1_S_entry13_container: machine;
var Tmp5: (machine);


M1_S_entry13_container = env.0;
M1_part[M1_S_entry13_case_x22_payload.0] = M1_S_entry13_case_x22_payload.1;
Tmp5 = (M1_S_entry13_container,);
return (Tmp5);
}
fun M1_S_entry13()
{
var M1_S_entry13_container: machine;
var Tmp6: (machine, bool, int);
var Tmp7: (machine, bool, int);


M1_S_entry13_container = M1_CREATECONTAINER();
new M2(this);
Tmp6 = (this, false, 0);
M1_CreateSMR(M1_S_entry13_container, Tmp6);
receive
{
case x:  (payload: (int, int)) {
var env: (machine);
env = M1_S_entry13_case_x17((M1_S_entry13_container,), payload);
M1_S_entry13_container=env.0;
}

}

M1_CREATECONTAINER();
Tmp7 = (this, false, 1);
M1_CreateSMR(M1_S_entry13_container, Tmp7);
receive
{
case x:  (payload: (int, int)) {
var env: (machine);
env = M1_S_entry13_case_x22((M1_S_entry13_container,), payload);
M1_S_entry13_container=env.0;
}

}

}
fun M1_S_exit0_rand_1696741705()
{


;

}start 
 state M1_S
{
entry  {
M1_S_entry13();
}
exit  {
M1_S_exit0_rand_1696741705();
}
}
}

machine M2
{
var M2_id: machine;
var M2_part: map[int, int];

fun M2_S_entry42(M2_S_entry42_payload: machine)
{
var Tmp8: (int, int);


Tmp8 = (0, 0);
send M2_S_entry42_payload, x, Tmp8;
}
fun M2_S_exit0_rand_1028561351()
{


;

}start 
 state M2_S
{
entry (payload: machine) {
M2_S_entry42(payload);
}
exit  {
M2_S_exit0_rand_1028561351();
}
}
}

