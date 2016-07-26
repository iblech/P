event test: ((int, (int, bool)), seq[(int, (int, bool))]);

main machine Main
{
var Main_compVal2: ((int, (int, bool)), seq[(int, (int, bool))]);
var Main_compVal1: (int, (int, bool));

fun Main_S1_do_test22(Main_S1_do_test22_payload: ((int, (int, bool)), seq[(int, (int, bool))]))
{
var Tmp414: bool;
var Tmp415: bool;
var Tmp416: bool;
var Tmp417: bool;


;

Tmp414 = (Main_S1_do_test22_payload.0.0 == 1);
assert Tmp414;
;

Tmp415 = (Main_S1_do_test22_payload.0.1.0 == 100);
assert Tmp415;
;

Tmp416 = (Main_S1_do_test22_payload.0.1.1 == false);
assert Tmp416;
;

Tmp417 = (sizeof(Main_S1_do_test22_payload.1) == 1);
assert Tmp417;
return;
}
fun Main_S1_entry12(Main_S1_entry12__payload_0: null)
{


;

Main_compVal1.0 = 1;
;

Main_compVal1.1.0 = 100;
;

Main_compVal1.1.1 = false;
;

Main_compVal2.0 = Main_compVal1;
;

Main_compVal2.1 += (0, Main_compVal1);
;

send this, test, Main_compVal2;
return;
}
fun Main_S1_exit0_rand_746083936(Main_S1_exit0_rand_746083936__payload_skip: any)
{


;

;

return;
}start 
 state Main_S1
{
entry (payload: null) {
Main_S1_entry12(payload);
}exit {
Main_S1_exit0_rand_746083936(null);
}on test do (payload: ((int, (int, bool)), seq[(int, (int, bool))])) {
Main_S1_do_test22(payload);
}}
}

