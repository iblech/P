
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
fun Manager_Init_entry0_rand_1268781448(Manager_Init_entry0_rand_1268781448__payload_skip: any)
{


;


}
fun Manager_Init_exit0_rand_540096702()
{


;


}start  state Manager_Init
{entry (payload: any) {
Manager_Init_entry0_rand_1268781448(payload);
}
exit  {
Manager_Init_exit0_rand_540096702();
}
}
}

