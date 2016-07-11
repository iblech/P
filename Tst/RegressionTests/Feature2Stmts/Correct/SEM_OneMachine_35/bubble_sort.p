
main machine Entry
{
var Entry_sorted: seq[int];
var Entry_rev: seq[int];
var Entry_s: int;
var Entry_t: int;
var Entry_i: int;
var Entry_b: bool;
var Entry_swapped: bool;

model fun Entry_reverse(Entry_reverse_l: seq[int]): seq[int]
{
var _tmp84: int;


Entry_i = 0;
;
Entry_s = sizeof(Entry_reverse_l);
;
while((Entry_i < Entry_s))
{

_tmp84 = Entry_reverse_l[Entry_i];
;
Entry_t = _tmp84;
;
Entry_reverse_l -= Entry_i;
;
Entry_reverse_l += (0, Entry_t);
;
Entry_i = (Entry_i + 1);
;
Entry_t = Entry_reverse_l[Entry_i];
;
Entry_reverse_l -= Entry_i;
;
Entry_reverse_l += (0, Entry_t);
;
Entry_i = (Entry_i + 1);



}
;
return (Entry_reverse_l);


}
model fun Entry_BubbleSort(Entry_BubbleSort_l: seq[int]): seq[int]
{
var _tmp85: int;
var _tmp86: int;
var _tmp87: int;
var _tmp88: int;


Entry_swapped = true;
;
while(Entry_swapped)
{

Entry_i = 0;
;
Entry_swapped = false;
;
while((Entry_i < (sizeof(Entry_BubbleSort_l) - 1)))
{

_tmp85 = Entry_BubbleSort_l[Entry_i];
;
_tmp86 = Entry_BubbleSort_l[(Entry_i + 1)];
;
if((_tmp85 > _tmp86))
{

_tmp87 = Entry_BubbleSort_l[Entry_i];
;
Entry_t = _tmp87;
;
_tmp88 = Entry_BubbleSort_l[(Entry_i + 1)];
;
Entry_BubbleSort_l[Entry_i] = _tmp88;
;
Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;
;
Entry_swapped = true;
;
Entry_t = Entry_BubbleSort_l[Entry_i];
;
Entry_BubbleSort_l[Entry_i] = Entry_BubbleSort_l[(Entry_i + 1)];
;
Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;
;
Entry_swapped = true;



}
else
{

;
;
;



}
;
Entry_i = (Entry_i + 1);
;
if((Entry_BubbleSort_l[Entry_i] > Entry_BubbleSort_l[(Entry_i + 1)]))
{

Entry_t = Entry_BubbleSort_l[Entry_i];
;
Entry_BubbleSort_l[Entry_i] = Entry_BubbleSort_l[(Entry_i + 1)];
;
Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;
;
Entry_swapped = true;



}
else
{
;

}
;
Entry_i = (Entry_i + 1);



}
;
Entry_i = 0;
;
Entry_swapped = false;
;
while((Entry_i < (sizeof(Entry_BubbleSort_l) - 1)))
{

if((Entry_BubbleSort_l[Entry_i] > Entry_BubbleSort_l[(Entry_i + 1)]))
{

Entry_t = Entry_BubbleSort_l[Entry_i];
;
Entry_BubbleSort_l[Entry_i] = Entry_BubbleSort_l[(Entry_i + 1)];
;
Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;
;
Entry_swapped = true;



}
else
{
;

}
;
Entry_i = (Entry_i + 1);



}



}
;
return (Entry_BubbleSort_l);


}
model fun Entry_IsSorted(Entry_IsSorted_l: seq[int]): bool
{
var _tmp89: int;
var _tmp90: int;


Entry_i = 0;
;
while((Entry_i < (sizeof(Entry_IsSorted_l) - 1)))
{

_tmp89 = Entry_IsSorted_l[Entry_i];
;
_tmp90 = Entry_IsSorted_l[(Entry_i + 1)];
;
if((_tmp89 > _tmp90))
{

return (false);
;
return (false);



}
else
{

;
;
;



}
;
Entry_i = (Entry_i + 1);
;
if((Entry_IsSorted_l[Entry_i] > Entry_IsSorted_l[(Entry_i + 1)]))
{
return (false);

}
else
{
;

}
;
Entry_i = (Entry_i + 1);



}
;
return (true);


}
fun Entry_init_entry52(Entry_init_entry52__payload_0: any)
{
var _tmp91: bool;
var _tmp92: bool;


Entry_i = 0;
;
while((Entry_i < 10))
{

Entry_rev += (0, Entry_i);
;
Entry_sorted += (sizeof(Entry_sorted), Entry_i);
;
Entry_i = (Entry_i + 1);
;
Entry_rev += (0, Entry_i);
;
Entry_sorted += (sizeof(Entry_sorted), Entry_i);
;
Entry_i = (Entry_i + 1);



}
;
_tmp91 = (sizeof(Entry_rev) == 10);
;
assert _tmp91;
;
Entry_sorted = Entry_reverse(Entry_rev);
;
Entry_b = Entry_IsSorted(Entry_sorted);
;
assert Entry_b;
;
Entry_b = Entry_IsSorted(Entry_rev);
;
assert !(Entry_b);
;
Entry_sorted = Entry_BubbleSort(Entry_rev);
;
_tmp92 = (sizeof(Entry_sorted) == 10);
;
assert _tmp92;
;
Entry_b = Entry_IsSorted(Entry_sorted);
;
assert Entry_b;
;
Entry_b = Entry_IsSorted(Entry_rev);
;
assert !(Entry_b);


}
fun Entry_init_exit0_rand_1206804407()
{


;


}start  state Entry_init
{entry (payload: any) {
Entry_init_entry52(payload);
}
exit  {
Entry_init_exit0_rand_1206804407();
}
}
}

