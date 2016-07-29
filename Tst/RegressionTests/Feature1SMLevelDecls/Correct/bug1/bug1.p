event a;

main machine Mach1
{

fun Mach1_S_entry6_case_a0_rand_660540770(Mach1_S_entry6_case_a0_rand_660540770__payload_1: null, Mach1_S_entry6_case_a0_rand_660540770_env: (null)): (null)
{
var Mach1_S_entry6__payload_0: null;
var Tmp1: (null);


Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_660540770_env.0;
;

;

Tmp1 = (Mach1_S_entry6__payload_0,);
return (Tmp1);
}
fun Mach1_S_entry6_case_a0_rand_1402181411(Mach1_S_entry6_case_a0_rand_1402181411__payload_2: null, Mach1_S_entry6_case_a0_rand_1402181411_env: (null)): (null)
{
var Mach1_S_entry6__payload_0: null;
var Tmp2: (null);


Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_1402181411_env.0;
;

;

Tmp2 = (Mach1_S_entry6__payload_0,);
return (Tmp2);
}
fun Mach1_S_entry6(Mach1_S_entry6__payload_0: null)
{
var Mach1_S_entry6_case_a0_rand_660540770_env: (null);
var Mach1_S_entry6_case_a0_rand_1402181411_env: (null);


;

receive
{
case a: (payload: null) {

Mach1_S_entry6_case_a0_rand_660540770_env = Mach1_S_entry6_case_a0_rand_660540770(payload, (Mach1_S_entry6__payload_0,));
Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_660540770_env.0;

}
}

;

receive
{
case a: (payload: null) {

Mach1_S_entry6_case_a0_rand_1402181411_env = Mach1_S_entry6_case_a0_rand_1402181411(payload, (Mach1_S_entry6__payload_0,));
Mach1_S_entry6__payload_0 = Mach1_S_entry6_case_a0_rand_1402181411_env.0;

}
}

return;
}
fun Mach1_S_exit0_rand_1310113302(Mach1_S_exit0_rand_1310113302__payload_skip: any)
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
Mach1_S_exit0_rand_1310113302(null);
}}
}

