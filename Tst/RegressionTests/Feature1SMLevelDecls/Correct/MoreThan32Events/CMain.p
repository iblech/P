event ArtifactManagerGoalStateAcheived;
event ArtifactManagerGoalStateNotAcheived;
event CreateAssemblyManager;
event CreateAssemblyManagerComplete;
event ArtifactManagerInit;
event TerminateArtifactManager;
event UpdateArtifactManager;
event ArtifactManagerGoalAchieved;
event ArtifactComplete;
event ArtifactStarted;
event ArtifactRequiredNow;
event ReconcileArtifacts;
event BeginArtifact;
event ArtifactAssemblyFailed;
event BeginRemoveStaleArtifactParts;
event BeginArtifactPart;
event CancelArtifact;
event BeginArtifactMerge;
event RemoveStaleArtifactPartsComplete;
event DownloadStarted;
event DownloadComplete;
event DownloadCompleteInternal;
event ArtifactMergeComplete;
event BeginDownload;
event BeginDownloadInternal;
event CancelDownload;
event BeginClonePart;
event InitializeOperationManager;
event OperationStatusUpdate;
event OperationListUpdate;
event TerminateOperationManager;
event QueryArtifactsOperation;
event DeleteArtifactOperation;
event UpdateArtifactOperation;
event QueryArtifactPartsOperation;
event DeleteArtifactPartOperation;
event AssembleArtifactOperation;
event ClonePartFromArtifactOperation;
event DownloadArtifactPartOperation;
event AttemptCancelDownloadOperation;
event QueryArtifactsOperationComplete;
event DeleteArtifactOperationComplete;
event UpdateArtifactOperationComplete;
event QueryArtifactPartsOperationComplete;
event DeleteArtifactPartOperationComplete;
event AssembleArtifactOperationComplete;
event ClonePartFromArtifactOperationComplete;
event DownloadArtifactPartOperationComplete;
event AttemptCancelDownloadOperationComplete;
event E1;
event E2;
event E3;
event E4;
event E5;
event E6;
event E7;
event E8;
event E9;
event E10;
event E11;
event E12;
event E13;

machine DownloadManagerMachine
{

fun DownloadManagerMachine_Begin_entry0_rand_333061507(DownloadManagerMachine_Begin_entry0_rand_333061507__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Begin_exit0_rand_746993867()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_1341163148(DownloadManagerMachine_QueryingArtifacts_entry0_rand_1341163148__payload_skip: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_2125972897()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_1652173334(DownloadManagerMachine_CloneArtifactPart_entry0_rand_1652173334__payload_skip: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_78639008()
{


;


}
fun DownloadManagerMachine_Downloading_entry0_rand_990924134(DownloadManagerMachine_Downloading_entry0_rand_990924134__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Downloading_exit0_rand_1924842499()
{


;


}
fun DownloadManagerMachine_Canceling_entry0_rand_1339742124(DownloadManagerMachine_Canceling_entry0_rand_1339742124__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Canceling_exit0_rand_1463688544()
{


;


}
fun DownloadManagerMachine_Complete_entry121(DownloadManagerMachine_Complete_entry121__payload_27: any)
{


raise halt;


}
fun DownloadManagerMachine_Complete_exit0_rand_1707614458()
{


;


}
fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_1881419560(DownloadManagerMachine_Begin_do_BeginDownload0_rand_1881419560__payload_0: any)
{


;


}
fun DownloadManagerMachine_Begin_do_E60_rand_370696384(DownloadManagerMachine_Begin_do_E60_rand_370696384__payload_1: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1052164493(DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1052164493__payload_2: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1119343265(DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1119343265__payload_3: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1184316759(DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1184316759__payload_4: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1168118090(DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1168118090__payload_5: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_304243213(DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_304243213__payload_6: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_1755997963(DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_1755997963__payload_7: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_null0_rand_1840249711(DownloadManagerMachine_CloneArtifactPart_do_null0_rand_1840249711__payload_8: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1998596771(DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1998596771__payload_9: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_895511707(DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_895511707__payload_10: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_216649950(DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_216649950__payload_11: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_79811043(DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_79811043__payload_12: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1179001106(DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1179001106__payload_13: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E50_rand_1618877246(DownloadManagerMachine_CloneArtifactPart_do_E50_rand_1618877246__payload_14: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E130_rand_2056383244(DownloadManagerMachine_CloneArtifactPart_do_E130_rand_2056383244__payload_15: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_20342418(DownloadManagerMachine_Downloading_do_CancelDownload0_rand_20342418__payload_16: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1667190008(DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1667190008__payload_17: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1617694734(DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1617694734__payload_18: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_554378863(DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_554378863__payload_19: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1637530005(DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1637530005__payload_20: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1919660433(DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1919660433__payload_21: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_134087350(DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_134087350__payload_22: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_709005497(DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_709005497__payload_23: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_E20_rand_1209591461(DownloadManagerMachine_Canceling_do_E20_rand_1209591461__payload_24: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_E80_rand_757131692(DownloadManagerMachine_Canceling_do_E80_rand_757131692__payload_25: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_E110_rand_542642059(DownloadManagerMachine_Canceling_do_E110_rand_542642059__payload_26: any)
{


;


}start  state DownloadManagerMachine_Begin
{entry (payload: any) {
DownloadManagerMachine_Begin_entry0_rand_333061507(payload);
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_746993867();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry (payload: any) {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_1341163148(payload);
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_2125972897();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry (payload: any) {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_1652173334(payload);
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_78639008();
}
}
 state DownloadManagerMachine_Downloading
{entry (payload: any) {
DownloadManagerMachine_Downloading_entry0_rand_990924134(payload);
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_1924842499();
}
}
 state DownloadManagerMachine_Canceling
{entry (payload: any) {
DownloadManagerMachine_Canceling_entry0_rand_1339742124(payload);
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_1463688544();
}
}
 state DownloadManagerMachine_Complete
{entry (payload: any) {
DownloadManagerMachine_Complete_entry121(payload);
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_1707614458();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_1869742700(MainMachine_Init_entry0_rand_1869742700__payload_28: any)
{


;


}
fun MainMachine_Init_exit0_rand_26524287()
{


;


}start  state MainMachine_Init
{entry (payload: any) {
MainMachine_Init_entry0_rand_1869742700(payload);
}
exit  {
MainMachine_Init_exit0_rand_26524287();
}
}
}

