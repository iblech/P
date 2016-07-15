event a;

main machine Mach1
{

fun Mach1_S_entry6_case_a0_rand_132221254()
{


;

}
fun Mach1_S_entry6_case_a0_rand_1594629485()
{


;

}
fun Mach1_S_entry6()
{


receive
{
case a:   {
Mach1_S_entry6_case_a0_rand_132221254();
}

}

receive
{
case a:   {
Mach1_S_entry6_case_a0_rand_1594629485();
}

}

}
fun Mach1_S_exit0_rand_1419064240()
{


;

}start 
 state Mach1_S
{
entry  {
Mach1_S_entry6();
}
exit  {
Mach1_S_exit0_rand_1419064240();
}
}
}

