
  #ifndef P_PROGRAM_H
    #define P_PROGRAM_H
    #include "PrtUser.h"
    #include "PrtExecution.h"
    #ifdef __cplusplus
      extern "C"{
    #endif
    enum P_EVENTS
    {
      _P_EVENT_NULL = 0,
      _P_EVENT_HALT = 1,
      P_EVENT_Computing = 2,
      P_EVENT_Done = 3,
      P_EVENT_UserEvent = 4,
      P_EVENT_Waiting = 5,
      _P_EVENTS_COUNT = 6
    };

    enum P_FORGN_TYPES
    {
      _P_FORGN_TYPES_COUNT = 0
    };

    enum P_FUNS_EventHandler
    {
      P_FUN_EventHandler_ANON0 = 1,
      P_FUN_EventHandler_ANON1 = 2,
      P_FUN_EventHandler_ANON2 = 3,
      P_FUN_EventHandler_ANON3 = 4,
      P_FUN_EventHandler_ANON4 = 5,
      P_FUN_EventHandler_ANON5 = 6,
      P_FUN_EventHandler_ANON6 = 7,
      P_FUN_EventHandler_EventHandler_HandleEvent_entry0_rand_1390976448 = 8,
      P_FUN_EventHandler_EventHandler_HandleEvent_exit0_rand_893217488 = 9,
      P_FUN_EventHandler_EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094 = 10,
      P_FUN_EventHandler_EventHandler_WaitForUser_entry0_rand_564662775 = 11,
      P_FUN_EventHandler_EventHandler_WaitForUser_exit0_rand_951537393 = 12,
      P_FUN_EventHandler_EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197 = 13,
      _P_FUNS_EventHandler_COUNT = 14
    };

    enum P_FUNS_GLOBAL
    {
      _P_FUN_PUSH_OR_IGN = 0
    };

    enum P_MACHINES
    {
      P_MACHINE_EventHandler = 0,
      _P_MACHINE_MAIN = 0,
      _P_MACHINES_COUNT = 1
    };

    enum P_MODELS
    {
      _P_MODELS_COUNT = 0
    };

    enum P_STATES_EventHandler
    {
      P_STATE_EventHandler_EventHandler_HandleEvent = 0,
      P_STATE_EventHandler_EventHandler_WaitForUser = 1,
      _P_STATES_EventHandler_COUNT = 2
    };

    enum P_VARS_EventHandler
    {
      _P_VARS_EventHandler_COUNT = 0
    };

    void P_DTOR_EventHandler_IMPL(PRT_MACHINEINST *context);

    void P_CTOR_EventHandler_IMPL(PRT_MACHINEINST *context, PRT_VALUE *value);

    extern PRT_PROGRAMDECL P_GEND_PROGRAM;
    #ifdef __cplusplus
      }
    #endif
  #endif
  