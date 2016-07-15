
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
var Tmp59: int;


Entry_i = 0;
Entry_s = sizeof(Entry_reverse_l);
while((Entry_i < Entry_s))
{

Tmp59 = Entry_reverse_l[Entry_i];
Entry_t = Tmp59;
Entry_reverse_l -= Entry_i;
Entry_reverse_l += (0, Entry_t);
Entry_i = (Entry_i + 1);

}

return (Entry_reverse_l);
}
model fun Entry_BubbleSort(Entry_BubbleSort_l: seq[int]): seq[int]
{
var Tmp60: int;
var Tmp61: int;
var Tmp62: int;
var Tmp63: int;


Entry_swapped = true;
while(Entry_swapped)
{

Entry_i = 0;
Entry_swapped = false;
while((Entry_i < (sizeof(Entry_BubbleSort_l) - 1)))
{

Tmp60 = Entry_BubbleSort_l[Entry_i];
Tmp61 = Entry_BubbleSort_l[(Entry_i + 1)];
if((Tmp60 > Tmp61))
{

Tmp62 = Entry_BubbleSort_l[Entry_i];
Entry_t = Tmp62;
Tmp63 = Entry_BubbleSort_l[(Entry_i + 1)];
Entry_BubbleSort_l[Entry_i] = Tmp63;
Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;
Entry_swapped = true;

}
else
{

;


}

Entry_i = (Entry_i + 1);

}


}

return (Entry_BubbleSort_l);
}
model fun Entry_IsSorted(Entry_IsSorted_l: seq[int]): bool
{
var Tmp64: int;
var Tmp65: int;


Entry_i = 0;
while((Entry_i < (sizeof(Entry_IsSorted_l) - 1)))
{

Tmp64 = Entry_IsSorted_l[Entry_i];
Tmp65 = Entry_IsSorted_l[(Entry_i + 1)];
if((Tmp64 > Tmp65))
{

return (false);

}
else
{

;


}

Entry_i = (Entry_i + 1);

}

return (true);
}
fun Entry_init_entry52()
{
var Tmp66: bool;
var Tmp67: bool;


Entry_i = 0;
while((Entry_i < 10))
{

Entry_rev += (0, Entry_i);
Entry_sorted += (sizeof(Entry_sorted), Entry_i);
Entry_i = (Entry_i + 1);

}

Tmp66 = (sizeof(Entry_rev) == 10);
assert Tmp66;
Entry_sorted = Entry_reverse(Entry_rev);
Entry_b = Entry_IsSorted(Entry_sorted);
assert Entry_b;
Entry_b = Entry_IsSorted(Entry_rev);
assert !(Entry_b);
Entry_sorted = Entry_BubbleSort(Entry_rev);
Tmp67 = (sizeof(Entry_sorted) == 10);
assert Tmp67;
Entry_b = Entry_IsSorted(Entry_sorted);
assert Entry_b;
Entry_b = Entry_IsSorted(Entry_rev);
assert !(Entry_b);
}
fun Entry_init_exit0_rand_1043310548()
{


;

}start 
 state Entry_init
{
entry  {
Entry_init_entry52();
}
exit  {
Entry_init_exit0_rand_1043310548();
}
}
}

