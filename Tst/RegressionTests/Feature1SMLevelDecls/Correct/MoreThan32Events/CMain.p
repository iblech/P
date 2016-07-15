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

fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_622921163()
{


;

}
fun DownloadManagerMachine_Begin_do_E60_rand_1995558601()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_773959568()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1498502178()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1944347789()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1446128605()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1134738580()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_979085603()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_null0_rand_2022726871()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1039560926()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1584013612()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_948858648()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1645463893()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1213572110()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_E50_rand_510950067()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_E130_rand_785299061()
{


;

}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1436088030()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1463865497()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_549258334()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_827681257()
{


;

}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1470347971()
{


;

}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_415461137()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_13087921()
{


;

}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_692114099()
{


;

}
fun DownloadManagerMachine_Canceling_do_E20_rand_1963918588()
{


;

}
fun DownloadManagerMachine_Canceling_do_E80_rand_32756178()
{


;

}
fun DownloadManagerMachine_Canceling_do_E110_rand_227331048()
{


;

}
fun DownloadManagerMachine_Begin_entry0_rand_209305573()
{


;

}
fun DownloadManagerMachine_Begin_exit0_rand_472554386()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_1601632767()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_611636213()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_1371020952()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_1830750367()
{


;

}
fun DownloadManagerMachine_Downloading_entry0_rand_295224936()
{


;

}
fun DownloadManagerMachine_Downloading_exit0_rand_846232320()
{


;

}
fun DownloadManagerMachine_Canceling_entry0_rand_562558575()
{


;

}
fun DownloadManagerMachine_Canceling_exit0_rand_674791895()
{


;

}
fun DownloadManagerMachine_Complete_entry121()
{


raise halt;
}
fun DownloadManagerMachine_Complete_exit0_rand_1728748540()
{


;

}start  state DownloadManagerMachine_Begin
{entry  {
DownloadManagerMachine_Begin_entry0_rand_209305573();
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_472554386();
}
on BeginDownload do   {
DownloadManagerMachine_Begin_do_BeginDownload0_rand_622921163();
}

on E6 do   {
DownloadManagerMachine_Begin_do_E60_rand_1995558601();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry  {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_1601632767();
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_611636213();
}
on CancelDownload do   {
DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_773959568();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1498502178();
}

on BeginClonePart do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1944347789();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1446128605();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1134738580();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry  {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_1371020952();
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_1830750367();
}
on halt do   {
DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_979085603();
}

on null do   {
DownloadManagerMachine_CloneArtifactPart_do_null0_rand_2022726871();
}

on CancelDownload do   {
DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1039560926();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1584013612();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_948858648();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1645463893();
}

on E1 do   {
DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1213572110();
}

on E5 do   {
DownloadManagerMachine_CloneArtifactPart_do_E50_rand_510950067();
}

on E13 do   {
DownloadManagerMachine_CloneArtifactPart_do_E130_rand_785299061();
}
}
 state DownloadManagerMachine_Downloading
{entry  {
DownloadManagerMachine_Downloading_entry0_rand_295224936();
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_846232320();
}
on CancelDownload do   {
DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1436088030();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1463865497();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_549258334();
}
}
 state DownloadManagerMachine_Canceling
{entry  {
DownloadManagerMachine_Canceling_entry0_rand_562558575();
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_674791895();
}
on DownloadCompleteInternal do   {
DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_827681257();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1470347971();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_415461137();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_13087921();
}

on AttemptCancelDownloadOperationComplete do   {
DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_692114099();
}

on E2 do   {
DownloadManagerMachine_Canceling_do_E20_rand_1963918588();
}

on E8 do   {
DownloadManagerMachine_Canceling_do_E80_rand_32756178();
}

on E11 do   {
DownloadManagerMachine_Canceling_do_E110_rand_227331048();
}
}
 state DownloadManagerMachine_Complete
{entry  {
DownloadManagerMachine_Complete_entry121();
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_1728748540();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_425917507()
{


;

}
fun MainMachine_Init_exit0_rand_474295912()
{


;

}start  state MainMachine_Init
{entry  {
MainMachine_Init_entry0_rand_425917507();
}
exit  {
MainMachine_Init_exit0_rand_474295912();
}
}
}

