event E  assert 1: int;
event EI1: int;
event EI2: int;
event EI3: int;
event EI4: int;
event EI5: int;
event EI6: int;
event E1  assert 1;
event E2  assert 1;
event ET1: (int, bool);
event ET2: (int, bool);
event ESEQ1: seq[int];
event ESEQ2: seq[int];
event EMAP1: map[int, int];
event EMAP11: map[int, int];
event EMAP2: map[int, int];
event EMAP3: map[int, int];

main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_t1: (seq[int], map[int, seq[int]]);
var M_ts: (int, int);
var M_ts1: (int, bool);
var M_tt: (int, int);
var M_tbool: (bool, bool);
var M_te: (int, event);
var M_b: bool;
var M_y: int;
var M_tmp: int;
var M_tmp1: int;
var M_ev: event;
var M_a: any;
var M_tmp2: (seq[any], map[int, seq[any]]);
var M_tmp3: map[int, seq[int]];
var M_s: seq[int];
var M_s1: seq[any];
var M_s2: seq[int];
var M_s3: seq[seq[any]];
var M_s8: seq[(int, int)];
var M_s4: seq[(int, int)];
var M_s5: seq[bool];
var M_s6: seq[map[int, any]];
var M_s7: seq[int];
var M_s9: seq[event];
var M_s10: seq[any];
var M_s11: seq[int];
var M_s12: seq[bool];
var M_i: int;
var M_mac: machine;
var M_m1: map[int, int];
var M_m4: map[int, int];
var M_m3: map[int, bool];
var M_m6: map[int, any];
var M_m5: map[int, any];
var M_m2: map[int, map[int, any]];
var M_m7: map[bool, seq[(int, int)]];
var M_m8: map[int, event];
var M_m9: map[int, any];

fun M_S_entry69(M_S_entry69__payload_0: any)
{
var _tmp385: int;
var _tmp386: bool;
var _tmp387: bool;
var _tmp388: bool;
var _tmp389: bool;
var _tmp390: event;
var _tmp391: bool;
var _tmp392: event;
var _tmp393: bool;
var _tmp394: bool;
var _tmp395: bool;
var _tmp396: machine;
var _tmp397: bool;
var _tmp398: machine;
var _tmp399: machine;
var _tmp400: bool;
var _tmp401: bool;
var _tmp402: bool;
var _tmp403: bool;
var _tmp404: bool;
var _tmp405: int;
var _tmp406: (int, bool);
var _tmp407: seq[int];
var _tmp408: seq[int];
var _tmp409: map[int, int];
var _tmp410: map[int, any];
var _tmp411: map[int, int];
var _tmp412: map[int, int];


M_a = default(any);
;
M_a = 1;
;
_tmp385 = (M_a as int);
;
M_y = _tmp385;
;
_tmp386 = (M_y == M_a);
;
assert _tmp386;
;
M_a = default(any);
;
M_a = true;
;
_tmp387 = (M_a as bool);
;
M_b = _tmp387;
;
_tmp388 = (M_b == M_a);
;
assert _tmp388;
;
M_a = default(any);
;
_tmp389 = (M_a == null);
;
assert _tmp389;
;
_tmp390 = (M_a as event);
;
M_ev = _tmp390;
;
_tmp391 = (M_a == M_ev);
;
assert _tmp391;
;
M_a = E;
;
_tmp392 = (M_a as event);
;
M_ev = _tmp392;
;
_tmp393 = (M_ev == E);
;
assert _tmp393;
;
M_a = default(any);
;
_tmp394 = (M_a == null);
;
assert _tmp394;
;
M_mac = default(machine);
;
_tmp395 = (M_mac == null);
;
assert _tmp395;
;
_tmp396 = (M_a as machine);
;
M_mac = _tmp396;
;
_tmp397 = (M_mac == M_a);
;
assert _tmp397;
;
_tmp398 = new Test(null);
;
M_a = _tmp398;
;
_tmp399 = (M_a as machine);
;
M_mac = _tmp399;
;
_tmp400 = (M_mac == M_a);
;
assert _tmp400;
;
M_a = default(any);
;
M_m1[0] = 1;
;
M_m1[1] = 2;
;
M_a = M_m1;
;
_tmp401 = (M_a == M_m1);
;
assert _tmp401;
;
M_a = default(any);
;
M_s += (0, 1);
;
M_s += (1, 2);
;
M_a = M_s;
;
_tmp402 = (M_a == M_s);
;
assert _tmp402;
;
M_a = default(any);
;
M_ts.0 = 1;
;
M_ts.1 = 2;
;
M_a = M_ts;
;
_tmp403 = (M_a == M_ts);
;
assert _tmp403;
;
M_a = default(any);
;
M_tt.0 = 1;
;
M_tt.1 = 2;
;
M_a = M_tt;
;
_tmp404 = (M_a == M_tt);
;
assert _tmp404;
;
M_y = 1;
;
send M_mac, EI1, M_y;
;
M_a = 1;
;
_tmp405 = (M_a as int);
;
send M_mac, EI6, _tmp405;
;
M_ts1.0 = 1;
;
M_ts1.1 = true;
;
send M_mac, ET1, M_ts1;
;
_tmp406 = (2, false);
;
send M_mac, ET2, _tmp406;
;
_tmp407 = default(seq[int]);
;
M_s = _tmp407;
;
M_s += (0, 1);
;
M_s += (1, 2);
;
send M_mac, ESEQ1, M_s;
;
M_s1 = M_s;
;
_tmp408 = (M_s1 as seq[int]);
;
send M_mac, ESEQ2, _tmp408;
;
_tmp409 = default(map[int, int]);
;
M_m1 = _tmp409;
;
send M_mac, EMAP1, M_m1;
;
M_m1[0] = 1;
;
M_m1[3] = 3;
;
send M_mac, EMAP11, M_m1;
;
_tmp410 = default(map[int, any]);
;
M_m9 = _tmp410;
;
_tmp411 = (M_m9 as map[int, int]);
;
send M_mac, EMAP2, _tmp411;
;
M_m9 = M_m1;
;
_tmp412 = (M_m9 as map[int, int]);
;
send M_mac, EMAP3, _tmp412;
;
raise halt;


}
fun M_S_exit0_rand_1650397581()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry69(payload);
}
exit  {
M_S_exit0_rand_1650397581();
}
}
}

machine Test
{
var Test_ss: seq[int];
var Test_yt: int;
var Test_tts1: (int, bool);
var Test_tts: (int, int);
var Test_ta: any;
var Test_s: seq[int];
var Test_s1: seq[any];
var Test_mi: map[int, int];
var Test_ma: map[int, any];

fun Test_init_entry0_rand_505372077(Test_init_entry0_rand_505372077__payload_1: any)
{


;


}
fun Test_init_exit0_rand_1812109511()
{


;


}
fun Test_testEI1_entry193(Test_testEI1_entry193_payload: any)
{
var _tmp413: bool;


Test_ta = Test_testEI1_entry193_payload;
;
_tmp413 = (Test_ta == 1);
;
assert _tmp413;
;
pop;


}
fun Test_testEI1_exit0_rand_1587395329()
{


;


}
fun Test_testEI6_entry203(Test_testEI6_entry203_payload: int)
{
var _tmp414: bool;
var _tmp415: bool;
var _tmp416: bool;


Test_yt = Test_testEI6_entry203_payload;
;
_tmp414 = (Test_yt == 1);
;
assert _tmp414;
;
Test_yt = Test_testEI6_entry203_payload;
;
_tmp415 = (Test_yt == 1);
;
assert _tmp415;
;
Test_ta = Test_testEI6_entry203_payload;
;
_tmp416 = (Test_yt == 1);
;
assert _tmp416;
;
pop;


}
fun Test_testEI6_exit0_rand_363660862()
{


;


}
fun Test_testET1_entry215(Test_testET1_entry215_payload: (int, bool))
{
var _tmp417: bool;
var _tmp418: bool;
var _tmp419: bool;
var _tmp420: bool;


Test_tts1 = Test_testET1_entry215_payload;
;
_tmp417 = (Test_tts1.0 == 1);
;
_tmp418 = (Test_tts1.1 == true);
;
assert (_tmp417 && _tmp418);
;
Test_tts1 = Test_testET1_entry215_payload;
;
_tmp419 = (Test_tts1.0 == 1);
;
_tmp420 = (Test_tts1.1 == true);
;
assert (_tmp419 && _tmp420);
;
pop;


}
fun Test_testET1_exit0_rand_563731983()
{


;


}
fun Test_testET2_entry225(Test_testET2_entry225_payload: (int, bool))
{
var _tmp421: bool;
var _tmp422: bool;


Test_tts1 = Test_testET2_entry225_payload;
;
_tmp421 = (Test_tts1.0 == 2);
;
_tmp422 = (Test_tts1.1 == false);
;
assert (_tmp421 && _tmp422);
;
pop;


}
fun Test_testET2_exit0_rand_1444838572()
{


;


}
fun Test_testESEQ1_entry233(Test_testESEQ1_entry233_payload: seq[int])
{
var _tmp423: int;
var _tmp424: bool;
var _tmp425: int;
var _tmp426: bool;
var _tmp427: any;
var _tmp428: bool;
var _tmp429: any;
var _tmp430: bool;
var _tmp431: seq[any];
var _tmp432: any;
var _tmp433: bool;


Test_s = Test_testESEQ1_entry233_payload;
;
_tmp423 = Test_s[0];
;
_tmp424 = (_tmp423 == 1);
;
assert _tmp424;
;
Test_s = Test_testESEQ1_entry233_payload;
;
_tmp425 = Test_s[0];
;
_tmp426 = (_tmp425 == 1);
;
assert _tmp426;
;
Test_s1 = Test_testESEQ1_entry233_payload;
;
_tmp427 = Test_s1[0];
;
_tmp428 = (_tmp427 == 1);
;
assert _tmp428;
;
Test_s1 = Test_testESEQ1_entry233_payload;
;
_tmp429 = Test_s1[0];
;
_tmp430 = (_tmp429 == 1);
;
assert _tmp430;
;
_tmp431 = (Test_testESEQ1_entry233_payload as seq[any]);
;
Test_s1 = _tmp431;
;
_tmp432 = Test_s1[0];
;
_tmp433 = (_tmp432 == 1);
;
assert _tmp433;
;
pop;


}
fun Test_testESEQ1_exit0_rand_1949842652()
{


;


}
fun Test_testESEQ2_entry251(Test_testESEQ2_entry251_payload: seq[int])
{
var _tmp434: int;
var _tmp435: bool;
var _tmp436: int;
var _tmp437: bool;
var _tmp438: any;
var _tmp439: bool;
var _tmp440: any;
var _tmp441: bool;
var _tmp442: seq[any];
var _tmp443: any;
var _tmp444: bool;


Test_s = Test_testESEQ2_entry251_payload;
;
_tmp434 = Test_s[0];
;
_tmp435 = (_tmp434 == 1);
;
assert _tmp435;
;
Test_s = Test_testESEQ2_entry251_payload;
;
_tmp436 = Test_s[0];
;
_tmp437 = (_tmp436 == 1);
;
assert _tmp437;
;
Test_s1 = Test_testESEQ2_entry251_payload;
;
_tmp438 = Test_s1[0];
;
_tmp439 = (_tmp438 == 1);
;
assert _tmp439;
;
Test_s1 = Test_testESEQ2_entry251_payload;
;
_tmp440 = Test_s1[0];
;
_tmp441 = (_tmp440 == 1);
;
assert _tmp441;
;
_tmp442 = (Test_testESEQ2_entry251_payload as seq[any]);
;
Test_s1 = _tmp442;
;
_tmp443 = Test_s1[0];
;
_tmp444 = (_tmp443 == 1);
;
assert _tmp444;
;
pop;


}
fun Test_testESEQ2_exit0_rand_281105942()
{


;


}
fun Test_testEMAP1_entry269(Test_testEMAP1_entry269_payload: map[int, int])
{
var _tmp445: int;
var _tmp446: bool;
var _tmp447: int;
var _tmp448: bool;
var _tmp449: map[int, int];
var _tmp450: map[int, any];
var _tmp451: map[int, any];
var _tmp452: map[int, any];


Test_mi = Test_testEMAP1_entry269_payload;
;
Test_mi[0] = 0;
;
Test_mi[3] = 3;
;
_tmp445 = Test_mi[0];
;
_tmp446 = (_tmp445 == 0);
;
_tmp447 = Test_mi[3];
;
_tmp448 = (_tmp447 == 3);
;
assert (_tmp446 && _tmp448);
;
_tmp449 = default(map[int, int]);
;
Test_mi = _tmp449;
;
Test_mi = Test_testEMAP1_entry269_payload;
;
Test_ma = Test_testEMAP1_entry269_payload;
;
_tmp450 = default(map[int, any]);
;
Test_ma = _tmp450;
;
Test_ma = Test_testEMAP1_entry269_payload;
;
_tmp451 = default(map[int, any]);
;
Test_ma = _tmp451;
;
_tmp452 = (Test_testEMAP1_entry269_payload as map[int, any]);
;
Test_ma = _tmp452;
;
pop;


}
fun Test_testEMAP1_exit0_rand_506642899()
{


;


}
fun Test_testEMAP11_entry294(Test_testEMAP11_entry294_payload: map[int, int])
{
var _tmp453: map[int, int];
var _tmp454: int;
var _tmp455: bool;
var _tmp456: int;
var _tmp457: bool;
var _tmp458: map[int, int];
var _tmp459: int;
var _tmp460: bool;
var _tmp461: int;
var _tmp462: bool;
var _tmp463: any;
var _tmp464: bool;
var _tmp465: any;
var _tmp466: bool;
var _tmp467: map[int, any];
var _tmp468: any;
var _tmp469: bool;
var _tmp470: any;
var _tmp471: bool;
var _tmp472: map[int, any];
var _tmp473: map[int, any];
var _tmp474: any;
var _tmp475: bool;
var _tmp476: any;
var _tmp477: bool;


_tmp453 = default(map[int, int]);
;
Test_mi = _tmp453;
;
Test_mi = Test_testEMAP11_entry294_payload;
;
_tmp454 = Test_mi[0];
;
_tmp455 = (_tmp454 == 1);
;
_tmp456 = Test_mi[3];
;
_tmp457 = (_tmp456 == 3);
;
assert (_tmp455 && _tmp457);
;
_tmp458 = default(map[int, int]);
;
Test_mi = _tmp458;
;
Test_mi = Test_testEMAP11_entry294_payload;
;
_tmp459 = Test_mi[0];
;
_tmp460 = (_tmp459 == 1);
;
_tmp461 = Test_mi[3];
;
_tmp462 = (_tmp461 == 3);
;
assert (_tmp460 && _tmp462);
;
Test_ma = Test_testEMAP11_entry294_payload;
;
_tmp463 = Test_ma[0];
;
_tmp464 = (_tmp463 == 1);
;
_tmp465 = Test_ma[3];
;
_tmp466 = (_tmp465 == 3);
;
assert (_tmp464 && _tmp466);
;
_tmp467 = default(map[int, any]);
;
Test_ma = _tmp467;
;
Test_ma = Test_testEMAP11_entry294_payload;
;
_tmp468 = Test_ma[0];
;
_tmp469 = (_tmp468 == 1);
;
_tmp470 = Test_ma[3];
;
_tmp471 = (_tmp470 == 3);
;
assert (_tmp469 && _tmp471);
;
_tmp472 = default(map[int, any]);
;
Test_ma = _tmp472;
;
_tmp473 = (Test_testEMAP11_entry294_payload as map[int, any]);
;
Test_ma = _tmp473;
;
_tmp474 = Test_ma[0];
;
_tmp475 = (_tmp474 == 1);
;
_tmp476 = Test_ma[3];
;
_tmp477 = (_tmp476 == 3);
;
assert (_tmp475 && _tmp477);
;
pop;


}
fun Test_testEMAP11_exit0_rand_731936351()
{


;


}
fun Test_testEMAP2_entry317(Test_testEMAP2_entry317_payload: map[int, int])
{
var _tmp478: map[int, int];
var _tmp479: map[int, any];
var _tmp480: map[int, any];
var _tmp481: map[int, any];


Test_mi = Test_testEMAP2_entry317_payload;
;
_tmp478 = default(map[int, int]);
;
Test_mi = _tmp478;
;
Test_mi = Test_testEMAP2_entry317_payload;
;
Test_ma = Test_testEMAP2_entry317_payload;
;
_tmp479 = default(map[int, any]);
;
Test_ma = _tmp479;
;
Test_ma = Test_testEMAP2_entry317_payload;
;
_tmp480 = default(map[int, any]);
;
Test_ma = _tmp480;
;
_tmp481 = (Test_testEMAP2_entry317_payload as map[int, any]);
;
Test_ma = _tmp481;
;
pop;


}
fun Test_testEMAP2_exit0_rand_1051074528()
{


;


}
fun Test_testEMAP3_entry341(Test_testEMAP3_entry341_payload: map[int, int])
{
var _tmp482: int;
var _tmp483: bool;
var _tmp484: int;
var _tmp485: bool;
var _tmp486: map[int, int];
var _tmp487: int;
var _tmp488: bool;
var _tmp489: int;
var _tmp490: bool;
var _tmp491: any;
var _tmp492: bool;
var _tmp493: any;
var _tmp494: bool;
var _tmp495: map[int, any];
var _tmp496: any;
var _tmp497: bool;
var _tmp498: any;
var _tmp499: bool;
var _tmp500: map[int, any];
var _tmp501: map[int, any];
var _tmp502: any;
var _tmp503: bool;
var _tmp504: any;
var _tmp505: bool;


Test_mi = Test_testEMAP3_entry341_payload;
;
_tmp482 = Test_mi[0];
;
_tmp483 = (_tmp482 == 1);
;
_tmp484 = Test_mi[3];
;
_tmp485 = (_tmp484 == 3);
;
assert (_tmp483 && _tmp485);
;
_tmp486 = default(map[int, int]);
;
Test_mi = _tmp486;
;
Test_mi = Test_testEMAP3_entry341_payload;
;
_tmp487 = Test_mi[0];
;
_tmp488 = (_tmp487 == 1);
;
_tmp489 = Test_mi[3];
;
_tmp490 = (_tmp489 == 3);
;
assert (_tmp488 && _tmp490);
;
Test_ma = Test_testEMAP3_entry341_payload;
;
_tmp491 = Test_ma[0];
;
_tmp492 = (_tmp491 == 1);
;
_tmp493 = Test_ma[3];
;
_tmp494 = (_tmp493 == 3);
;
assert (_tmp492 && _tmp494);
;
_tmp495 = default(map[int, any]);
;
Test_ma = _tmp495;
;
Test_ma = Test_testEMAP3_entry341_payload;
;
_tmp496 = Test_ma[0];
;
_tmp497 = (_tmp496 == 1);
;
_tmp498 = Test_ma[3];
;
_tmp499 = (_tmp498 == 3);
;
assert (_tmp497 && _tmp499);
;
_tmp500 = default(map[int, any]);
;
Test_ma = _tmp500;
;
_tmp501 = (Test_testEMAP3_entry341_payload as map[int, any]);
;
Test_ma = _tmp501;
;
_tmp502 = Test_ma[0];
;
_tmp503 = (_tmp502 == 1);
;
_tmp504 = Test_ma[3];
;
_tmp505 = (_tmp504 == 3);
;
assert (_tmp503 && _tmp505);
;
pop;


}
fun Test_testEMAP3_exit0_rand_1734609198()
{


;


}start  state Test_init
{entry (payload: any) {
Test_init_entry0_rand_505372077(payload);
}
exit  {
Test_init_exit0_rand_1812109511();
}
}
 state Test_testEI1
{entry (payload: any) {
Test_testEI1_entry193(payload);
}
exit  {
Test_testEI1_exit0_rand_1587395329();
}
}
 state Test_testEI6
{entry (payload: int) {
Test_testEI6_entry203(payload);
}
exit  {
Test_testEI6_exit0_rand_363660862();
}
}
 state Test_testET1
{entry (payload: (int, bool)) {
Test_testET1_entry215(payload);
}
exit  {
Test_testET1_exit0_rand_563731983();
}
}
 state Test_testET2
{entry (payload: (int, bool)) {
Test_testET2_entry225(payload);
}
exit  {
Test_testET2_exit0_rand_1444838572();
}
}
 state Test_testESEQ1
{entry (payload: seq[int]) {
Test_testESEQ1_entry233(payload);
}
exit  {
Test_testESEQ1_exit0_rand_1949842652();
}
}
 state Test_testESEQ2
{entry (payload: seq[int]) {
Test_testESEQ2_entry251(payload);
}
exit  {
Test_testESEQ2_exit0_rand_281105942();
}
}
 state Test_testEMAP1
{entry (payload: map[int, int]) {
Test_testEMAP1_entry269(payload);
}
exit  {
Test_testEMAP1_exit0_rand_506642899();
}
}
 state Test_testEMAP11
{entry (payload: map[int, int]) {
Test_testEMAP11_entry294(payload);
}
exit  {
Test_testEMAP11_exit0_rand_731936351();
}
}
 state Test_testEMAP2
{entry (payload: map[int, int]) {
Test_testEMAP2_entry317(payload);
}
exit  {
Test_testEMAP2_exit0_rand_1051074528();
}
}
 state Test_testEMAP3
{entry (payload: map[int, int]) {
Test_testEMAP3_entry341(payload);
}
exit  {
Test_testEMAP3_exit0_rand_1734609198();
}
}
}

