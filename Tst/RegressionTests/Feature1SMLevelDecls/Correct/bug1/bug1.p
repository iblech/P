event a;

main machine Mach1
{

fun Mach1_S_entry6_case_a0_rand_1808061066()
{


;

}
fun Mach1_S_entry6_case_a0_rand_896289667()
{


;

}
fun Mach1_S_entry6()
{


receive
{
case a:   {
Mach1_S_entry6_case_a0_rand_1808061066();
}

}

receive
{
case a:   {
Mach1_S_entry6_case_a0_rand_896289667();
}

}

}
fun Mach1_S_exit0_rand_1400052899()
{


;

}start  state Mach1_S
{entry  {
Mach1_S_entry6();
}
exit  {
Mach1_S_exit0_rand_1400052899();
}
}
}

