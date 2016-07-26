event a;

main machine Mach1
{

fun Mach1_S_entry6_case_a0_rand_1726438879(Mach1_S_entry6_case_a0_rand_1726438879__payload_1: null, Mach1_S_entry6_case_a0_rand_1726438879_env: (null)): (null)
{
var Mach1_S_entry6__payload_0: null;
var Tmp1: (null);


Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_1726438879_env.0;
;

;

Tmp1 = (Mach1_S_entry6__payload_0,);
return (Tmp1);
}
fun Mach1_S_entry6_case_a0_rand_779276406(Mach1_S_entry6_case_a0_rand_779276406__payload_2: null, Mach1_S_entry6_case_a0_rand_779276406_env: (null)): (null)
{
var Mach1_S_entry6__payload_0: null;
var Tmp2: (null);


Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_779276406_env.0;
;

;

Tmp2 = (Mach1_S_entry6__payload_0,);
return (Tmp2);
}
fun Mach1_S_entry6(Mach1_S_entry6__payload_0: null)
{
var Mach1_S_entry6_case_a0_rand_1726438879_env: (null);
var Mach1_S_entry6_case_a0_rand_779276406_env: (null);


;

receive
{
case a: (payload: null) {

Mach1_S_entry6_case_a0_rand_1726438879_env = Mach1_S_entry6_case_a0_rand_1726438879(payload, (Mach1_S_entry6__payload_0,));
Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_1726438879_env.0;

}
}

;

receive
{
case a: (payload: null) {

Mach1_S_entry6_case_a0_rand_779276406_env = Mach1_S_entry6_case_a0_rand_779276406(payload, (Mach1_S_entry6__payload_0,));
Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_779276406_env.0;

}
}

return;
}
fun Mach1_S_exit0_rand_2104312551(Mach1_S_exit0_rand_2104312551__payload_skip: any)
{


;

;

return;
}start 
 state Mach1_S
{
entry (payload: null) {
Mach1_S_entry6(payload);
}exit {
Mach1_S_exit0_rand_2104312551(null);
}}
}

