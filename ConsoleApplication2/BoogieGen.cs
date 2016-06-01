using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.Pc;
using Microsoft.Pc.Domains;
using Microsoft.Pc.Domains.P_Root;
using Microsoft.Formula.API.Generators;
using System.IO;

namespace Microsoft.P2Boogie
{
    class BoogieGen
    {
        private List<PProgram> parsedPrograms;
        private TextWriter writer;

        private static const string tab = "  ";

   /****************************************************************************
    *                                                                          *
    *  The basic definitions of P primitives and some basic functions.         *
    *  These will not change, and can be printed directly.                     *
    *  Reference: https://github.com/pdeligia/Poogie/blob/master/pingpong.bpl  *
    *  Credit to Pantazis Deligiannis - pdeligia on GitHub.                    *
    *                                                                          * 
    ****************************************************************************/

        private static const string declarations =
@"var $CurrMid: int;
var $Inbox: [int][int]Event;
var $InboxSize: [int]int;
var $Payload: [int]Payload;

var {:thread_local} $Heap: [int][int]int;
var {:thread_local} $State: [int]State;
var {:thread_local} $IsHalted: [int]bool;
var {:thread_local} $Raised: [int]Event;
var {:thread_local} $Ignores: [int][Event]bool;
var {:thread_local} $Defers: [int][Event]bool;


// Types
type Machine;
type State;
type Event;
type Payload = int;

const unique $DEFAULT: Event;
const unique $HALT: Event;

const unique $NULL: int;
axiom $NULL == 0;
";

        private static const string raise_fn =
@"procedure {:inline 1} $raise(mid: int, e: Event, p: Payload);
  modifies $Heap, $State, $IsHalted, $Inbox, $InboxSize, $Payload;

implementation {:inline 1} $raise(mid: int, e: Event, p: Payload)
{
  $bb0:
    $Payload[mid] := p;
    $Raised[mid] := e;
    return;
}
";
        private static const string send_fn =
@"procedure {:inline 1} $send(mid: int, e: Event, p: Payload);
  modifies $Inbox, $InboxSize, $Payload;

implementation {:inline 1} $send(mid: int, e: Event, p: Payload)
{
  var index: int;

  $bb0:
    index := $InboxSize[mid];
    $Inbox[mid][index] := e;
    $InboxSize[mid] := $InboxSize[mid] + 1;
    $Payload[mid] := p;
    return;
}
";

        private static const string q_rem_fn =
@"procedure {:inline 1} $q_remove(mid: int, idx: int);
  modifies $Inbox, $InboxSize;

implementation {:inline 1} $q_remove(mid: int, idx: int)
{
  var index: int;

  $bb0:
    index := idx;

    while (index < $InboxSize[mid] - 1)
    {
      $Inbox[mid][index] := $Inbox[mid][index + 1];
      index := index + 1;
    }

    $InboxSize[mid] := $InboxSize[mid] - 1;

    return;
}
";
        private static const string run_ev_handler_stub =
@"procedure {:inline 1} $run_event_handler(mid: int, mtype: Machine);
  modifies $Heap, $State, $IsHalted, $Inbox, $InboxSize, $Payload;

implementation {:inline 1} $run_event_handler(mid: int, mtype: Machine)
{
  var nextEvent: Event;

  $bb0:
    nextEvent := $DEFAULT;
    while (!$IsHalted[mid])
    {
      call nextEvent := $get_next_event(mid);
      if (nextEvent == $DEFAULT)
      {
        assume false;
      }
      else if (nextEvent == $HALT)
      {
        $IsHalted[mid] := true;
        break;
      }";

        private static const string get_next_ev_fn =
@"procedure {:inline 1} $get_next_event(mid: int) returns (r: Event);
  modifies $Inbox, $InboxSize;

implementation {:inline 1} $get_next_event(mid: int) returns (r: Event)
{
  var nextEvent: Event;
  var index: int;
  var inbox: [int] Event;
  var size: int;

  $bb0:
    nextEvent := $DEFAULT;

    index := 0;
    if ($Raised[mid] != $DEFAULT)
    {
      nextEvent := $Raised[mid];
      $Raised[mid] := $DEFAULT;
    }
    else
    {
      yield;
      while (index < $InboxSize[mid])
      {
        if ($Ignores[mid][$Inbox[mid][index]])
        {
          call $q_remove(mid, index);
          index := index - 1;
        }
        else if (!$Defers[mid][$Inbox[mid][index]])
        {
          nextEvent := $Inbox[mid][index];
          call $q_remove(mid, index);
          break;
        }

        index := index + 1;
      }
    }

    r := nextEvent;
    return;
}
";

        public BoogieGen()
        {

        }
        private static string getName(ICSharpTerm x)
        {
            return (x as P_Root.StringCnst).Value;
        }
    }
}
