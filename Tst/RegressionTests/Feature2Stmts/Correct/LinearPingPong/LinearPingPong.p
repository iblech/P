event PING  assert 1: int;
event PONG  assert 1: int;
event SUCCESS: int;

main machine Client
{
var Client_server: machine;
var Client_count: int;

fun Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_1265591928()
{


;

}
fun Client_SendPing_on_PONG_goto_Client_SendPing0_rand_1350238957()
{


;

}
fun Client_Init_entry10()
{
var _tmp34: machine;


Client_count = 0;
_tmp34 = new Server(this);
Client_server = _tmp34;
raise SUCCESS, 0;
}
fun Client_Init_exit0_rand_110507166()
{


;

}
fun Client_SendPing_entry19(Client_SendPing_entry19_v: int)
{


if((Client_count < 10))
{

send Client_server, PING, Client_SendPing_entry19_v;
Client_count = (Client_count + 1);

}
else
{

;


}

}
fun Client_SendPing_exit0_rand_1854823137()
{


;

}start  state Client_Init
{entry  {
Client_Init_entry10();
}
exit  {
Client_Init_exit0_rand_110507166();
}
on SUCCESS goto Client_SendPing with  (payload: int) {
Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_1265591928();
}
}
 state Client_SendPing
{entry (payload: int) {
Client_SendPing_entry19(payload);
}
exit  {
Client_SendPing_exit0_rand_1854823137();
}
on PONG goto Client_SendPing with  (payload: int) {
Client_SendPing_on_PONG_goto_Client_SendPing0_rand_1350238957();
}
}
}

machine Server
{
var Server_client: machine;

fun Server_Init_on_PING_goto_Server_SendPong0_rand_367339790()
{


;

}
fun Server_SendPong_on_PING_goto_Server_SendPong0_rand_2095875139()
{


;

}
fun Server_Init_entry33(Server_Init_entry33_x: machine)
{


Server_client = Server_Init_entry33_x;
}
fun Server_Init_exit0_rand_1037947990()
{


;

}
fun Server_SendPong_entry40(Server_SendPong_entry40_v: int)
{


send Server_client, PONG, Server_SendPong_entry40_v;
}
fun Server_SendPong_exit0_rand_74962422()
{


;

}start  state Server_Init
{entry (payload: machine) {
Server_Init_entry33(payload);
}
exit  {
Server_Init_exit0_rand_1037947990();
}
on PING goto Server_SendPong with  (payload: int) {
Server_Init_on_PING_goto_Server_SendPong0_rand_367339790();
}
}
 state Server_SendPong
{entry (payload: int) {
Server_SendPong_entry40(payload);
}
exit  {
Server_SendPong_exit0_rand_74962422();
}
on PING goto Server_SendPong with  (payload: int) {
Server_SendPong_on_PING_goto_Server_SendPong0_rand_2095875139();
}
}
}

