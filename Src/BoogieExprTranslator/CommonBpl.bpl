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


// The Queues

// MachineId -> index -> EventId
var MachineInboxStoreEvent: [int][int]int;

// MachineId -> index -> Payload
var MachineInboxStorePayload: [int][int]PrtRef;

// MachineId -> head index
var MachineInboxHead: [int]int;

// MachineId -> tail index
var MachineInboxTail: [int]int;

procedure {:inline} InitializeInbox(mid: int)
{
   assume MachineInboxHead[mid] == 1;
   assume MachineInboxTail[mid] == 0;
}

// State stack
type {:datatype} StateStackType;
function {:constructor} Nil(): StateStackType;
function {:constructor} Cons(state: int, stack: StateStackType): StateStackType;

var {:thread_local} StateStack: StateStackType;
var {:thread_local} CurrState: int;
var {:thread_local} thisMid  : int;

procedure StateStackPush(state: int) 
{
   StateStack := Cons(state, StateStack);
}

procedure StateStackPop returns (state: int)
{
   assert StateStack != Nil();
   return stack#Cons(StateStack);
}

procedure RaiseEvent(mid:int, event: int, payload: PrtRef) 
{
   var head: int;

   head := MachineInboxHead[mid] - 1;
   MachineInboxHead[mid] := head;

   MachineInboxStoreEvent[mid][head] := event;
   MachineInboxStorePayload[mid][head] := payload;   
}

procedure AssertEventCard(mid: int, event: int)
{
   var head: int;
   var tail: int;
   var ptr : int;
   var curr: int
   var count: int;
   
   head := MachineInboxHead[mid];
   tail := MachineInboxTail[mid];
   ptr  := head;
   count := 0;

   while(ptr <= tail)
   {
    	curr := MachineInboxStoreEvent[mid][ptr];
    	if(curr == event)
    	{
    		count := count + 1;
    	}
   }
   //Add queue constraints for specific events.
}

procedure AssertMachineQueueSize(mid: int)
{
	var head: int;
	var tail: int;
    var size: int;
    var c: [string]int;

    head := MachineInboxHead[mid];
    tail := MachineInboxTail[mid];
    size := (tail - head) + 1;

    c = qc[mid];
    if(c)
}


procedure Enqueue(mid:int, event: int, payload: PrtRef) 
{
   var tail: int;

   tail := MachineInboxTail[mid] + 1;
   MachineInboxTail[mid] := tail;

   AssertEventCard(mid, event);
   AssertMachineQueueSize(mid);

   MachineInboxStoreEvent[mid][tail] := event;
   MachineInboxStorePayload[mid][tail] := payload;
}


procedure Dequeue(mid: int, deferEvents: [int]bool, ignoreEvents: [int]bool, registeredEvents: [int]bool ) returns (event: int, payload: PrtRef)
{
   var ptr: int;
   var head: int;
   var tail: int;

   head := MachineInboxHead[mid];
   tail := MachineInboxTail[mid];

   ptr := head;
   event := 0 - 1;

   while(ptr <= tail) 
   {
      event := MachineInboxStoreEvent[mid][ptr];
      if(event >= 0 && ignoreEvents[event]) 
      {
         // dequeue
         if(ptr == head) 
         {
            MachineInboxHead[mid] := head + 1;
         } 
         else if(ptr == tail) 
         {
            MachineInboxTail[mid] := tail - 1;
         }
         else
         {
            MachineInboxStoreEvent[mid] := 0 - 1;        
         }
      }
      else if(event >= 0 && !deferEvents[event] && registeredEvents[event])
      {
         // dequeue
         if(ptr == head) 
         {
            MachineInboxHead[mid] := head + 1;
         } 
         else if(ptr == tail) 
         {
            MachineInboxTail[mid] := tail - 1;
         }
         else
         {
            MachineInboxStoreEvent[mid] := 0 - 1;        
         }
         payload := MachineInboxStorePayload[mid][ptr];
         break;
      }   
      ptr := ptr + 1;   
      event := 0 - 1;
   }

   // block
   assume event >= 0;
}

/*
procedure MachineThread(mid: int) 
{
   var event: int;
   var payload: PrtRef;

   // Initialize
   StateStack := Nil();
   CurrState := start_state;
   call InitializeInbox(mid);

   call EntryAction(mid, CurrState);
   
   while(true) 
   {
      call event, payload := Dequeue(mid, **, **, **);
      if(DoAction(event)) 
      {
         call action();
      } 
      else if(GotoWith(event)) 
      {
         call ExitAction();
         call WithAction();
         CurrState := New_State;
         call EntryAction(mid, CurrState);
      } 
      else if(Push(event)) 
      {
         StateStackPush(CurrState);
         CurrState := New_State;
         call EntryAction(mid, CurrState);
      }
      else 
      {
        assume false;
      }
   }
}

*/