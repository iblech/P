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
var _tmp4: (machine);


M1_S_entry13_container = env.0;
M1_part[M1_S_entry13_case_x17_payload.0] = M1_S_entry13_case_x17_payload.1;
_tmp4 = (M1_S_entry13_container,);
return (_tmp4);
}
fun M1_S_entry13_case_x22(env: (machine), M1_S_entry13_case_x22_payload: (int, int)): (machine)
{
var M1_S_entry13_container: machine;
var _tmp5: (machine);


M1_S_entry13_container = env.0;
M1_part[M1_S_entry13_case_x22_payload.0] = M1_S_entry13_case_x22_payload.1;
_tmp5 = (M1_S_entry13_container,);
return (_tmp5);
}
fun M1_S_entry13()
{
var M1_S_entry13_container: machine;
var _tmp6: (machine, bool, int);
var _tmp7: (machine, bool, int);


M1_S_entry13_container = M1_CREATECONTAINER();
new M2(this);
_tmp6 = (this, false, 0);
M1_CreateSMR(M1_S_entry13_container, _tmp6);
receive
{
case x:  (payload: (int, int)) {
var env: (machine);
env = M1_S_entry13_case_x17((M1_S_entry13_container,), payload);
M1_S_entry13_container=env.0;
}

}

M1_CREATECONTAINER();
_tmp7 = (this, false, 1);
M1_CreateSMR(M1_S_entry13_container, _tmp7);
receive
{
case x:  (payload: (int, int)) {
var env: (machine);
env = M1_S_entry13_case_x22((M1_S_entry13_container,), payload);
M1_S_entry13_container=env.0;
}

}

}
fun M1_S_exit0_rand_257366375()
{


;

}start  state M1_S
{entry  {
M1_S_entry13();
}
exit  {
M1_S_exit0_rand_257366375();
}
}
}

machine M2
{
var M2_id: machine;
var M2_part: map[int, int];

fun M2_S_entry42(M2_S_entry42_payload: machine)
{
var _tmp8: (int, int);


_tmp8 = (0, 0);
send M2_S_entry42_payload, x, _tmp8;
}
fun M2_S_exit0_rand_1483062206()
{


;

}start  state M2_S
{entry (payload: machine) {
M2_S_entry42(payload);
}
exit  {
M2_S_exit0_rand_1483062206();
}
}
}

