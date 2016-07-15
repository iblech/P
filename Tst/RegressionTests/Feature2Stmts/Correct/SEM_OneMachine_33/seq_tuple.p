event unit;
event seqpayload: seq[int];

main machine Entry
{
var Entry_l: seq[int];
var Entry_i: int;
var Entry_mac: machine;
var Entry_t: (seq[int], int);

fun Entry_init_entry12()
{
var Tmp39: (seq[int], int);
var Tmp40: machine;


Entry_l += (0, 12);
Entry_l += (0, 23);
Entry_l += (0, 12);
Entry_l += (0, 23);
Entry_l += (0, 12);
Entry_l += (0, 23);
Tmp39 = (Entry_l, 1);
Tmp40 = new test(Tmp39);
Entry_mac = Tmp40;
send Entry_mac, seqpayload, Entry_l;
}
fun Entry_init_exit0_rand_353447285()
{


;

}start 
 state Entry_init
{
entry  {
Entry_init_entry12();
}
exit  {
Entry_init_exit0_rand_353447285();
}
}
}

machine test
{
var test_ii: seq[int];
var test_rec: seq[int];
var test_i: int;

fun test_init_on_seqpayload_goto_test_testitnow0_rand_2051302741()
{


;

}
fun test_init_entry30(test_init_entry30_payload: (seq[int], int))
{
var Tmp41: int;
var Tmp42: bool;
var Tmp43: bool;


test_ii = test_init_entry30_payload.0;
Tmp41 = test_init_entry30_payload.0[0];
Tmp42 = (Tmp41 == 23);
assert Tmp42;
Tmp43 = (test_init_entry30_payload.1 == 1);
assert Tmp43;
}
fun test_init_exit0_rand_690118784()
{


;

}
fun test_testitnow_entry39(test_testitnow_entry39_payload: seq[int])
{
var Tmp44: int;
var Tmp45: int;
var Tmp46: bool;


test_rec = test_testitnow_entry39_payload;
test_i = (sizeof(test_rec) - 1);
while((test_i >= 0))
{

Tmp44 = test_rec[test_i];
Tmp45 = test_ii[test_i];
Tmp46 = (Tmp44 == Tmp45);
assert Tmp46;
test_i = (test_i - 1);

}

}
fun test_testitnow_exit0_rand_783134206()
{


;

}start 
 state test_init
{
entry (payload: (seq[int], int)) {
test_init_entry30(payload);
}
exit  {
test_init_exit0_rand_690118784();
}
on seqpayload goto test_testitnow with  (payload: seq[int]) {
test_init_on_seqpayload_goto_test_testitnow0_rand_2051302741();
}
}

 state test_testitnow
{
entry (payload: seq[int]) {
test_testitnow_entry39(payload);
}
exit  {
test_testitnow_exit0_rand_783134206();
}
}
}

