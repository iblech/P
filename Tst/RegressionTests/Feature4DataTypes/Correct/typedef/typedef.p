event test: ((int, (int, bool)), seq[(int, (int, bool))]);

main machine Main
{
var Main_compVal2: ((int, (int, bool)), seq[(int, (int, bool))]);
var Main_compVal1: (int, (int, bool));

fun Main_S1_entry12(Main_S1_entry12__payload_0: any)
{


Main_compVal1.0 = 1;

Main_compVal1.1.0 = 100;

Main_compVal1.1.1 = false;

Main_compVal2.0 = Main_compVal1;

Main_compVal2.1 += (0, Main_compVal1);

send this, test, Main_compVal2;


}
fun Main_S1_exit0_rand_1224448368()
{


;


}
fun Main_S1_do_test22(Main_S1_do_test22_payload: ((int, (int, bool)), seq[(int, (int, bool))]))
{
var _tmp958: bool;
var _tmp959: bool;
var _tmp960: bool;
var _tmp961: bool;


_tmp958 = (Main_S1_do_test22_payload.0.0 == 1);

assert _tmp958;

_tmp959 = (Main_S1_do_test22_payload.0.1.0 == 100);

assert _tmp959;

_tmp960 = (Main_S1_do_test22_payload.0.1.1 == false);

assert _tmp960;

_tmp961 = (sizeof(Main_S1_do_test22_payload.1) == 1);

assert _tmp961;


}start  state Main_S1
{entry (payload: any) {
Main_S1_entry12(payload);
}
exit  {
Main_S1_exit0_rand_1224448368();
}
}
}

