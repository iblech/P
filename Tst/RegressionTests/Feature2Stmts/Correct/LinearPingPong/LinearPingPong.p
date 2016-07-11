event PING  assert 1: int;
event PONG  assert 1: int;
event SUCCESS: int;

main machine Client
{
var Client_server: machine;
var Client_count: int;

fun Client_Init_entry10(Client_Init_entry10__payload_0: any)
{
var _tmp37: machine;


Client_count = 0;
;
_tmp37 = new Server(this);
;
Client_server = _tmp37;
;
raise SUCCESS, 0;


}
fun Client_Init_exit0_rand_1616471076()
{


;


}
fun Client_SendPing_entry19(Client_SendPing_entry19_v: int)
{


if((Client_count < 10))
{

send Client_server, PING, Client_SendPing_entry19_v;
;
Client_count = (Client_count + 1);
;
send Client_server, PING, Client_SendPing_entry19_v;
;
Client_count = (Client_count + 1);



}
else
{

;
;
;



}


}
fun Client_SendPing_exit0_rand_2030165350()
{


;


}
fun Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_303569583(Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_303569583__payload_skip: any)
{


;


}
fun Client_SendPing_on_PONG_goto_Client_SendPing0_rand_1079625435(Client_SendPing_on_PONG_goto_Client_SendPing0_rand_1079625435__payload_skip: any)
{


;


}start  state Client_Init
{entry (payload: any) {
Client_Init_entry10(payload);
}
exit  {
Client_Init_exit0_rand_1616471076();
}
}
 state Client_SendPing
{entry (payload: int) {
Client_SendPing_entry19(payload);
}
exit  {
Client_SendPing_exit0_rand_2030165350();
}
}
}

machine Server
{
var Server_client: machine;

fun Server_Init_entry33(Server_Init_entry33_x: machine)
{


Server_client = Server_Init_entry33_x;


}
fun Server_Init_exit0_rand_2088530971()
{


;


}
fun Server_SendPong_entry40(Server_SendPong_entry40_v: int)
{


send Server_client, PONG, Server_SendPong_entry40_v;


}
fun Server_SendPong_exit0_rand_275875332()
{


;


}
fun Server_Init_on_PING_goto_Server_SendPong0_rand_1909411718(Server_Init_on_PING_goto_Server_SendPong0_rand_1909411718__payload_skip: any)
{


;


}
fun Server_SendPong_on_PING_goto_Server_SendPong0_rand_1915055811(Server_SendPong_on_PING_goto_Server_SendPong0_rand_1915055811__payload_skip: any)
{


;


}start  state Server_Init
{entry (payload: machine) {
Server_Init_entry33(payload);
}
exit  {
Server_Init_exit0_rand_2088530971();
}
}
 state Server_SendPong
{entry (payload: int) {
Server_SendPong_entry40(payload);
}
exit  {
Server_SendPong_exit0_rand_275875332();
}
}
}

