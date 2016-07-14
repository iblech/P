event halt;
event null;

main machine Manager
{

fun Manager_foo()
{
var Manager_foo_s: int;


Manager_foo_s = Manager_bar0();

Manager_foo_s = Manager_bar1(1);

Manager_foo_s = Manager_bar2(0, 0);


}
fun Manager_bar0(): int
{


return (default(int));


}
fun Manager_bar1(Manager_bar1_Settings: int): int
{


return (default(int));


}
fun Manager_bar2(Manager_bar2_Settings: int, Manager_bar2_Settings1: int): int
{


return ((0 + default(int)));


}
fun Manager_Init_entry0_rand_35657633()
{


;


}
fun Manager_Init_exit0_rand_1586899918()
{


;


}start  state Manager_Init
{entry  {
Manager_Init_entry0_rand_35657633();
}
exit  {
Manager_Init_exit0_rand_1586899918();
}
}
}

