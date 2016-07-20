
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
      P_EVENT_E = 2,
      P_EVENT_F = 3,
      P_EVENT_Unit = 4,
      _P_EVENTS_COUNT = 5
    };

    enum P_FORGN_TYPES
    {
      _P_FORGN_TYPES_COUNT = 0
    };

    enum P_FUNS_A
    {
      P_FUN_A_ANON0 = 1,
      P_FUN_A_ANON1 = 2,
      _P_FUNS_A_COUNT = 3
    };

    enum P_FUNS_B
    {
      P_FUN_B_ANON0 = 1,
      P_FUN_B_ANON1 = 2,
      P_FUN_B_ANON2 = 3,
      P_FUN_B_ANON3 = 4,
      P_FUN_B_ANON4 = 5,
      _P_FUNS_B_COUNT = 6
    };

    enum P_FUNS_GLOBAL
    {
      _P_FUN_PUSH_OR_IGN = 0
    };

    enum P_MACHINES
    {
      P_MACHINE_A = 0,
      _P_MACHINE_MAIN = 0,
      P_MACHINE_B = 1,
      _P_MACHINES_COUNT = 2
    };

    enum P_MODELS
    {
      _P_MODELS_COUNT = 0
    };

    enum P_STATES_A
    {
      P_STATE_A_Init = 0,
      _P_STATES_A_COUNT = 1
    };

    enum P_STATES_B
    {
      P_STATE_B_Init = 0,
      P_STATE_B_X = 1,
      _P_STATES_B_COUNT = 2
    };

    enum P_VARS_A
    {
      P_VAR_A_x = 0,
      _P_VARS_A_COUNT = 1
    };

    enum P_VARS_B
    {
      _P_VARS_B_COUNT = 0
    };

    void P_DTOR_A_IMPL(PRT_MACHINEINST *context);

    void P_DTOR_B_IMPL(PRT_MACHINEINST *context);

    void P_CTOR_A_IMPL(PRT_MACHINEINST *context, PRT_VALUE *value);

    void P_CTOR_B_IMPL(PRT_MACHINEINST *context, PRT_VALUE *value);

    extern PRT_PROGRAMDECL P_GEND_PROGRAM;
    #ifdef __cplusplus
      }
    #endif
  #endif
  