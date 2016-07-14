event halt;
event null;
event a;

main machine Mach1
{

fun Mach1_S_entry6_case_a0_rand_821850445()
{


;


}
fun Mach1_S_entry6_case_a0_rand_1152080166()
{


;


}
fun Mach1_S_entry6()
{


receive
{
case a:   {
Mach1_S_entry6_case_a0_rand_821850445();
}

}

receive
{
case a:   {
Mach1_S_entry6_case_a0_rand_1152080166();
}

}


}
fun Mach1_S_exit0_rand_727084317()
{


;


}start  state Mach1_S
{entry  {
Mach1_S_entry6();
}
exit  {
Mach1_S_exit0_rand_727084317();
}
}
}

