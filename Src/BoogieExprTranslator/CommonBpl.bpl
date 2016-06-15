// Common code for P semantics

// Equality
procedure PrtEquals(a: PrtRef, b: PrtRef) returns (v: bool)
{
  var ta, tb: PrtType;

  if(a == b) { v := true; return; }

  ta := PrtDynamicType(a);
  tb := PrtDynamicType(b);

  if(ta != tb) { v := false; return; }
  if(ta == PrtTypeInt) { v := (PrtFieldInt(a) == PrtFieldInt(b)); return; }
  if(ta == PrtTypeBool) { v := (PrtFieldBool(a) == PrtFieldBool(b)); return; }
  if(ta == PrtTypeMachine) { v := (PrtFieldMachine(a) == PrtFieldMachine(b)); return; }
  if(ta == PrtTypeEvent) { v := (PrtFieldEvent(a) == PrtFieldEvent(b)); return; }
  if(ta == PrtTypeTuple1) { call v := PrtEquals(PrtFieldTuple1(a), PrtFieldTuple1(b)); return; }
  
  // Map, Seq type
  assume false;
}

// Sequences
procedure {:inline} WriteSeq(seq: PrtRef, index: int, value: PrtRef)  returns (nseq: PrtRef);
procedure {:inline} InsertSeq(seq: PrtRef, index: int, value: PrtRef)  returns (nseq: PrtRef);
procedure {:inline} RemoveSeq(seq: PrtRef, index: int)  returns (nseq: PrtRef);


// Maps
procedure {:inline} MapContainsKey(map: PrtRef, key: PrtRef) returns (v: bool);
procedure {:inline} ReadMap(map: PrtRef, key: PrtRef) returns (value: PrtRef);
procedure {:inline} MapGetKeys(map: PrtRef) returns (seq: PrtRef);
procedure {:inline} MapGetValues(map: PrtRef) returns (seq: PrtRef);

procedure {:inline} WriteMap(map: PrtRef, key: PrtRef, value: PrtRef)  returns (nmap: PrtRef);
procedure {:inline} InsertMap(map: PrtRef, key: PrtRef, value: PrtRef)  returns (nmap: PrtRef);
procedure {:inline} RemoveMap(map: PrtRef, key: PrtRef)  returns (nmap: PrtRef);



