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

fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_298443339()
{


;

}
fun DownloadManagerMachine_Begin_do_E60_rand_1596823691()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_2138062283()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_2005008693()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1049534219()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1889396930()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_280523894()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_1649659613()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_null0_rand_716058077()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1631989998()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1563683808()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_236159132()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_2084411337()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1205752664()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_E50_rand_181201178()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_E130_rand_1949928296()
{


;

}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_290705306()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1792231560()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1452709218()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_2125677040()
{


;

}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_125761961()
{


;

}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1420311889()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1907806926()
{


;

}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1597004219()
{


;

}
fun DownloadManagerMachine_Canceling_do_E20_rand_143052815()
{


;

}
fun DownloadManagerMachine_Canceling_do_E80_rand_1086845158()
{


;

}
fun DownloadManagerMachine_Canceling_do_E110_rand_355864639()
{


;

}
fun DownloadManagerMachine_Begin_entry0_rand_476934465()
{


;

}
fun DownloadManagerMachine_Begin_exit0_rand_38496328()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_30480861()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_244501247()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_220087322()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_1612938133()
{


;

}
fun DownloadManagerMachine_Downloading_entry0_rand_1189698491()
{


;

}
fun DownloadManagerMachine_Downloading_exit0_rand_1147423575()
{


;

}
fun DownloadManagerMachine_Canceling_entry0_rand_202229648()
{


;

}
fun DownloadManagerMachine_Canceling_exit0_rand_1748509776()
{


;

}
fun DownloadManagerMachine_Complete_entry121()
{


raise halt;
}
fun DownloadManagerMachine_Complete_exit0_rand_1925519062()
{


;

}start 
 state DownloadManagerMachine_Begin
{
entry  {
DownloadManagerMachine_Begin_entry0_rand_476934465();
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_38496328();
}
on BeginDownload do   {
DownloadManagerMachine_Begin_do_BeginDownload0_rand_298443339();
}

on E6 do   {
DownloadManagerMachine_Begin_do_E60_rand_1596823691();
}
}

 state DownloadManagerMachine_QueryingArtifacts
{
entry  {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_30480861();
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_244501247();
}
on CancelDownload do   {
DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_2138062283();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_2005008693();
}

on BeginClonePart do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1049534219();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1889396930();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_280523894();
}
}

 state DownloadManagerMachine_CloneArtifactPart
{
entry  {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_220087322();
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_1612938133();
}
on halt do   {
DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_1649659613();
}

on null do   {
DownloadManagerMachine_CloneArtifactPart_do_null0_rand_716058077();
}

on CancelDownload do   {
DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1631989998();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1563683808();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_236159132();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_2084411337();
}

on E1 do   {
DownloadManagerMachine_CloneArtifactPart_do_E10_rand_1205752664();
}

on E5 do   {
DownloadManagerMachine_CloneArtifactPart_do_E50_rand_181201178();
}

on E13 do   {
DownloadManagerMachine_CloneArtifactPart_do_E130_rand_1949928296();
}
}

 state DownloadManagerMachine_Downloading
{
entry  {
DownloadManagerMachine_Downloading_entry0_rand_1189698491();
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_1147423575();
}
on CancelDownload do   {
DownloadManagerMachine_Downloading_do_CancelDownload0_rand_290705306();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1792231560();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1452709218();
}
}

 state DownloadManagerMachine_Canceling
{
entry  {
DownloadManagerMachine_Canceling_entry0_rand_202229648();
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_1748509776();
}
on DownloadCompleteInternal do   {
DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_2125677040();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_125761961();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1420311889();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1907806926();
}

on AttemptCancelDownloadOperationComplete do   {
DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1597004219();
}

on E2 do   {
DownloadManagerMachine_Canceling_do_E20_rand_143052815();
}

on E8 do   {
DownloadManagerMachine_Canceling_do_E80_rand_1086845158();
}

on E11 do   {
DownloadManagerMachine_Canceling_do_E110_rand_355864639();
}
}

 state DownloadManagerMachine_Complete
{
entry  {
DownloadManagerMachine_Complete_entry121();
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_1925519062();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_134676873()
{


;

}
fun MainMachine_Init_exit0_rand_1969991829()
{


;

}start 
 state MainMachine_Init
{
entry  {
MainMachine_Init_entry0_rand_134676873();
}
exit  {
MainMachine_Init_exit0_rand_1969991829();
}
}
}

