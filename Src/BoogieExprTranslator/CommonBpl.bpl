// Common code for P semantics

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



