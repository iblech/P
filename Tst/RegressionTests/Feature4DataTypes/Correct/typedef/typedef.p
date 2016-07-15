event test: ((int, (int, bool)), seq[(int, (int, bool))]);

main machine Main
{
var Main_compVal2: ((int, (int, bool)), seq[(int, (int, bool))]);
var Main_compVal1: (int, (int, bool));

fun Main_S1_do_test22(Main_S1_do_test22_payload: ((int, (int, bool)), seq[(int, (int, bool))]))
{
var Tmp369: bool;
var Tmp370: bool;
var Tmp371: bool;
var Tmp372: bool;


Tmp369 = (Main_S1_do_test22_payload.0.0 == 1);
assert Tmp369;
Tmp370 = (Main_S1_do_test22_payload.0.1.0 == 100);
assert Tmp370;
Tmp371 = (Main_S1_do_test22_payload.0.1.1 == false);
assert Tmp371;
Tmp372 = (sizeof(Main_S1_do_test22_payload.1) == 1);
assert Tmp372;
}
fun Main_S1_entry12()
{


Main_compVal1.0 = 1;
Main_compVal1.1.0 = 100;
Main_compVal1.1.1 = false;
Main_compVal2.0 = Main_compVal1;
Main_compVal2.1 += (0, Main_compVal1);
send this, test, Main_compVal2;
}
fun Main_S1_exit0_rand_758263229()
{


;

}start 
 state Main_S1
{
entry  {
Main_S1_entry12();
}
exit  {
Main_S1_exit0_rand_758263229();
}
on test do  (payload: ((int, (int, bool)), seq[(int, (int, bool))])) {
Main_S1_do_test22(payload);
}
}
}

