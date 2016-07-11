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

machine DownloadManagerMachine
{

fun DownloadManagerMachine_Begin_entry0_rand_291400592(DownloadManagerMachine_Begin_entry0_rand_291400592__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Begin_exit0_rand_184082004()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_462324869(DownloadManagerMachine_QueryingArtifacts_entry0_rand_462324869__payload_skip: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_407923507()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_510903627(DownloadManagerMachine_CloneArtifactPart_entry0_rand_510903627__payload_skip: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_2047951938()
{


;


}
fun DownloadManagerMachine_Downloading_entry0_rand_2019192362(DownloadManagerMachine_Downloading_entry0_rand_2019192362__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Downloading_exit0_rand_929107892()
{


;


}
fun DownloadManagerMachine_Canceling_entry0_rand_242811816(DownloadManagerMachine_Canceling_entry0_rand_242811816__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Canceling_exit0_rand_1827990609()
{


;


}
fun DownloadManagerMachine_Complete_entry108(DownloadManagerMachine_Complete_entry108__payload_18: any)
{


raise halt;


}
fun DownloadManagerMachine_Complete_exit0_rand_413407809()
{


;


}
fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_1649424371(DownloadManagerMachine_Begin_do_BeginDownload0_rand_1649424371__payload_0: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1062974609(DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1062974609__payload_1: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1662469082(DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1662469082__payload_2: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_2092663921(DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_2092663921__payload_3: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_2046813662(DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_2046813662__payload_4: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_961977252(DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_961977252__payload_5: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_916390152(DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_916390152__payload_6: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1986657853(DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1986657853__payload_7: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_1251777601(DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_1251777601__payload_8: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_954849491(DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_954849491__payload_9: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_159940329(DownloadManagerMachine_Downloading_do_CancelDownload0_rand_159940329__payload_10: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1446138138(DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1446138138__payload_11: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1789399157(DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1789399157__payload_12: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1362612602(DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1362612602__payload_13: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_619372855(DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_619372855__payload_14: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_596046385(DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_596046385__payload_15: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1643301596(DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1643301596__payload_16: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_486827461(DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_486827461__payload_17: any)
{


;


}start  state DownloadManagerMachine_Begin
{entry (payload: any) {
DownloadManagerMachine_Begin_entry0_rand_291400592(payload);
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_184082004();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry (payload: any) {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_462324869(payload);
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_407923507();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry (payload: any) {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_510903627(payload);
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_2047951938();
}
}
 state DownloadManagerMachine_Downloading
{entry (payload: any) {
DownloadManagerMachine_Downloading_entry0_rand_2019192362(payload);
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_929107892();
}
}
 state DownloadManagerMachine_Canceling
{entry (payload: any) {
DownloadManagerMachine_Canceling_entry0_rand_242811816(payload);
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_1827990609();
}
}
 state DownloadManagerMachine_Complete
{entry (payload: any) {
DownloadManagerMachine_Complete_entry108(payload);
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_413407809();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_1357089260(MainMachine_Init_entry0_rand_1357089260__payload_19: any)
{


;


}
fun MainMachine_Init_exit0_rand_1113953439()
{


;


}start  state MainMachine_Init
{entry (payload: any) {
MainMachine_Init_entry0_rand_1357089260(payload);
}
exit  {
MainMachine_Init_exit0_rand_1113953439();
}
}
}

