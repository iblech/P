event a;

main machine Mach1
{

fun Mach1_S_entry6_case_a0_rand_313554716(env: (any)): (any)
{
var Mach1_S_entry6__payload_0: any;
var _tmp1: (any);


Mach1_S_entry6__payload_0 = env.0;
;
;
;
_tmp1 = (Mach1_S_entry6__payload_0,);
;
return (_tmp1);


}
fun Mach1_S_entry6_case_a0_rand_151666252(env: (any)): (any)
{
var Mach1_S_entry6__payload_0: any;
var _tmp2: (any);


Mach1_S_entry6__payload_0 = env.0;
;
;
;
_tmp2 = (Mach1_S_entry6__payload_0,);
;
return (_tmp2);


}
fun Mach1_S_entry6(Mach1_S_entry6__payload_0: any)
{


receive
{
case a:   {
var env: (any);
env = Mach1_S_entry6_case_a0_rand_313554716((Mach1_S_entry6__payload_0,));
Mach1_S_entry6__payload_0=env.0;
}

}
;
receive
{
case a:   {
var env: (any);
env = Mach1_S_entry6_case_a0_rand_151666252((Mach1_S_entry6__payload_0,));
Mach1_S_entry6__payload_0=env.0;
}

}


}
fun Mach1_S_exit0_rand_2048932981()
{


;


}start  state Mach1_S
{entry (payload: any) {
Mach1_S_entry6(payload);
}
exit  {
Mach1_S_exit0_rand_2048932981();
}
}
}

