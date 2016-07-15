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
fun M1_S_entry12_case_x15(env: (machine), M1_S_entry12_case_x15_payload: (int, int)): (machine)
{
var M1_S_entry12_container: machine;
var _tmp0: (machine);


M1_S_entry12_container = env.0;
M1_part[M1_S_entry12_case_x15_payload.0] = M1_S_entry12_case_x15_payload.1;
_tmp0 = (M1_S_entry12_container,);
return (_tmp0);
}
fun M1_S_entry12_case_x20(env: (machine), M1_S_entry12_case_x20_payload: (int, int)): (machine)
{
var M1_S_entry12_container: machine;
var _tmp1: (machine);


M1_S_entry12_container = env.0;
M1_part[M1_S_entry12_case_x20_payload.0] = M1_S_entry12_case_x20_payload.1;
_tmp1 = (M1_S_entry12_container,);
return (_tmp1);
}
fun M1_S_entry12()
{
var M1_S_entry12_container: machine;
var _tmp2: (machine, bool, int);
var _tmp3: (machine, bool, int);


M1_S_entry12_container = M1_CREATECONTAINER();
_tmp2 = (this, false, 0);
M1_CreateSMR(M1_S_entry12_container, _tmp2);
receive
{
case x:  (payload: (int, int)) {
var env: (machine);
env = M1_S_entry12_case_x15((M1_S_entry12_container,), payload);
M1_S_entry12_container=env.0;
}

}

M1_S_entry12_container = M1_CREATECONTAINER();
_tmp3 = (this, false, 1);
M1_CreateSMR(M1_S_entry12_container, _tmp3);
receive
{
case x:  (payload: (int, int)) {
var env: (machine);
env = M1_S_entry12_case_x20((M1_S_entry12_container,), payload);
M1_S_entry12_container=env.0;
}

}

}
fun M1_S_exit0_rand_141008955()
{


;

}start  state M1_S
{entry  {
M1_S_entry12();
}
exit  {
M1_S_exit0_rand_141008955();
}
}
}

