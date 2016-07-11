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

fun DownloadManagerMachine_Begin_entry0_rand_2035765050(DownloadManagerMachine_Begin_entry0_rand_2035765050__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Begin_exit0_rand_2104082342()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_1227610372(DownloadManagerMachine_QueryingArtifacts_entry0_rand_1227610372__payload_skip: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_1578518169()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_1659680981(DownloadManagerMachine_CloneArtifactPart_entry0_rand_1659680981__payload_skip: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_1093919608()
{


;


}
fun DownloadManagerMachine_Downloading_entry0_rand_1391810482(DownloadManagerMachine_Downloading_entry0_rand_1391810482__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Downloading_exit0_rand_870529570()
{


;


}
fun DownloadManagerMachine_Canceling_entry0_rand_1246329140(DownloadManagerMachine_Canceling_entry0_rand_1246329140__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Canceling_exit0_rand_721773574()
{


;


}
fun DownloadManagerMachine_Complete_entry121(DownloadManagerMachine_Complete_entry121__payload_27: any)
{


raise halt;


}
fun DownloadManagerMachine_Complete_exit0_rand_594725363()
{


;


}
fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_2123311966(DownloadManagerMachine_Begin_do_BeginDownload0_rand_2123311966__payload_0: any)
{


;


}
fun DownloadManagerMachine_Begin_do_E60_rand_2094849157(DownloadManagerMachine_Begin_do_E60_rand_2094849157__payload_1: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_2055162997(DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_2055162997__payload_2: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_561680411(DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_561680411__payload_3: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_49633969(DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_49633969__payload_4: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_2066068022(DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_2066068022__payload_5: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_131566794(DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_131566794__payload_6: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_689041942(DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_689041942__payload_7: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_null0_rand_497192807(DownloadManagerMachine_CloneArtifactPart_do_null0_rand_497192807__payload_8: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_758624844(DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_758624844__payload_9: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1645964246(DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1645964246__payload_10: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_521962082(DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_521962082__payload_11: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_401966803(DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_401966803__payload_12: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1806888680(DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1806888680__payload_13: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E50_rand_461566198(DownloadManagerMachine_CloneArtifactPart_do_E50_rand_461566198__payload_14: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E130_rand_680626358(DownloadManagerMachine_CloneArtifactPart_do_E130_rand_680626358__payload_15: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1104846087(DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1104846087__payload_16: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_866351819(DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_866351819__payload_17: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1905315493(DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1905315493__payload_18: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_780096828(DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_780096828__payload_19: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1496481391(DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1496481391__payload_20: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_34780995(DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_34780995__payload_21: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1818973825(DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1818973825__payload_22: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1751593414(DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1751593414__payload_23: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_E20_rand_1629538623(DownloadManagerMachine_Canceling_do_E20_rand_1629538623__payload_24: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_E80_rand_287705898(DownloadManagerMachine_Canceling_do_E80_rand_287705898__payload_25: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_E110_rand_151012211(DownloadManagerMachine_Canceling_do_E110_rand_151012211__payload_26: any)
{


;


}start  state DownloadManagerMachine_Begin
{entry (payload: any) {
DownloadManagerMachine_Begin_entry0_rand_2035765050(payload);
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_2104082342();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry (payload: any) {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_1227610372(payload);
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_1578518169();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry (payload: any) {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_1659680981(payload);
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_1093919608();
}
}
 state DownloadManagerMachine_Downloading
{entry (payload: any) {
DownloadManagerMachine_Downloading_entry0_rand_1391810482(payload);
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_870529570();
}
}
 state DownloadManagerMachine_Canceling
{entry (payload: any) {
DownloadManagerMachine_Canceling_entry0_rand_1246329140(payload);
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_721773574();
}
}
 state DownloadManagerMachine_Complete
{entry (payload: any) {
DownloadManagerMachine_Complete_entry121(payload);
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_594725363();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_249084257(MainMachine_Init_entry0_rand_249084257__payload_28: any)
{


;


}
fun MainMachine_Init_exit0_rand_1379163094()
{


;


}start  state MainMachine_Init
{entry (payload: any) {
MainMachine_Init_entry0_rand_249084257(payload);
}
exit  {
MainMachine_Init_exit0_rand_1379163094();
}
}
}

