
  #include "receive12.h"
  #define P_SEQ
  #define P_STMT_0(s, x0, f0) P_SEQ(p_tmp_stmt_0 = (x0), (s), ((f0) ? PrtFreeValue(p_tmp_stmt_0) : 0U))
  #define P_STMT_1(s, x1, f1, x0, f0) P_SEQ(p_tmp_stmt_0 = (x0), p_tmp_stmt_1 = (x1), (s), ((f0) ? PrtFreeValue(p_tmp_stmt_0) : 0U), ((f1) ? PrtFreeValue(p_tmp_stmt_1) : 0U))
  #define P_STMT_2(s, x2, f2, x1, f1, x0, f0) P_SEQ(p_tmp_stmt_0 = (x0), p_tmp_stmt_1 = (x1), p_tmp_stmt_2 = (x2), (s), ((f0) ? PrtFreeValue(p_tmp_stmt_0) : 0U), ((f1) ? PrtFreeValue(p_tmp_stmt_1) : 0U), ((f2) ? PrtFreeValue(p_tmp_stmt_2) : 0U))
  #define P_BOOL_EXPR(x0, f0) P_SEQ(p_tmp_expr_0 = (x0), p_tmp_bool = PrtPrimGetBool(p_tmp_expr_0), ((f0) ? PrtFreeValue(p_tmp_expr_0) : 0U), p_tmp_bool)
  #define P_EXPR_0(x0, f0) P_SEQ(p_tmp_expr_0 = (x0), p_tmp_expr_0)
  #define P_EXPR_1(x1, f1, x0, f0) P_SEQ(p_tmp_expr_0 = (x0), p_tmp_expr_1 = (x1), ((f0) ? PrtFreeValue(p_tmp_expr_0) : 0U), p_tmp_expr_1)
  PRT_TYPE P_GEND_TYPE_0 = 
  {
    PRT_KIND_ANY,
    
    {
        NULL
    }
  };
  PRT_TYPE P_GEND_TYPE_1 = 
  {
    PRT_KIND_BOOL,
    
    {
        NULL
    }
  };
  PRT_TYPE P_GEND_TYPE_2 = 
  {
    PRT_KIND_EVENT,
    
    {
        NULL
    }
  };
  PRT_TYPE P_GEND_TYPE_3 = 
  {
    PRT_KIND_INT,
    
    {
        NULL
    }
  };
  PRT_TYPE P_GEND_TYPE_4 = 
  {
    PRT_KIND_NULL,
    
    {
        NULL
    }
  };
  PRT_TYPE P_GEND_TYPE_5 = 
  {
    PRT_KIND_MACHINE,
    
    {
        NULL
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_6[] = 
  {
    "_payload_0"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_6[] = 
  {
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_6 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_6,
    P_GEND_TYPE_NMDTUP_TARR_6
  };
  PRT_TYPE P_GEND_TYPE_6 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_6
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_7[] = 
  {
    "_payload_1"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_7[] = 
  {
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_7 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_7,
    P_GEND_TYPE_NMDTUP_TARR_7
  };
  PRT_TYPE P_GEND_TYPE_7 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_7
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_8[] = 
  {
    "_payload_2"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_8[] = 
  {
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_8 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_8,
    P_GEND_TYPE_NMDTUP_TARR_8
  };
  PRT_TYPE P_GEND_TYPE_8 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_8
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_9[] = 
  {
    "_payload_3"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_9[] = 
  {
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_9 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_9,
    P_GEND_TYPE_NMDTUP_TARR_9
  };
  PRT_TYPE P_GEND_TYPE_9 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_9
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_10[] = 
  {
    "_payload_skip"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_10[] = 
  {
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_10 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_10,
    P_GEND_TYPE_NMDTUP_TARR_10
  };
  PRT_TYPE P_GEND_TYPE_10 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_10
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_11[] = 
  {
    "c"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_11[] = 
  {
    &P_GEND_TYPE_5
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_11 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_11,
    P_GEND_TYPE_NMDTUP_TARR_11
  };
  PRT_TYPE P_GEND_TYPE_11 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_11
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_12[] = 
  {
    "_payload_4"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_12[] = 
  {
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_12 = 
  {
    1,
    P_GEND_TYPE_NMDTUP_NARR_12,
    P_GEND_TYPE_NMDTUP_TARR_12
  };
  PRT_TYPE P_GEND_TYPE_12 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_12
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_13[] = 
  {
    "_payload_2",
    "_payload_3"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_13[] = 
  {
    &P_GEND_TYPE_0,
    &P_GEND_TYPE_0
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_13 = 
  {
    2,
    P_GEND_TYPE_NMDTUP_NARR_13,
    P_GEND_TYPE_NMDTUP_TARR_13
  };
  PRT_TYPE P_GEND_TYPE_13 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_13
    }
  };
  PRT_STRING P_GEND_TYPE_NMDTUP_NARR_14[] = 
  {
    "b",
    "c"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_14[] = 
  {
    &P_GEND_TYPE_5,
    &P_GEND_TYPE_5
  };
  PRT_NMDTUPTYPE P_GEND_TYPE_NMDTUP_14 = 
  {
    2,
    P_GEND_TYPE_NMDTUP_NARR_14,
    P_GEND_TYPE_NMDTUP_TARR_14
  };
  PRT_TYPE P_GEND_TYPE_14 = 
  {
    PRT_KIND_NMDTUP,
    
    {
        (PRT_MAPTYPE *)&P_GEND_TYPE_NMDTUP_14
    }
  };
  PRT_VALUE P_GEND_VALUE_0 = 
  {
    PRT_VALUE_KIND_EVENT,
    
    {
        P_EVENT_F
    }
  };
  PRT_VALUE P_GEND_VALUE_1 = 
  {
    PRT_VALUE_KIND_EVENT,
    
    {
        P_EVENT_Unit
    }
  };
  PRT_VALUE P_GEND_VALUE_2 = 
  {
    PRT_VALUE_KIND_BOOL,
    
    {
        PRT_FALSE
    }
  };
  PRT_VALUE P_GEND_VALUE_3 = 
  {
    PRT_VALUE_KIND_EVENT,
    
    {
        PRT_SPECIAL_EVENT_HALT
    }
  };
  PRT_VALUE P_GEND_VALUE_4 = 
  {
    PRT_VALUE_KIND_NULL,
    
    {
        PRT_SPECIAL_EVENT_NULL
    }
  };
  PRT_EVENTDECL P_GEND_EVENTS[] = 
  {
    
    {
        _P_EVENT_NULL,
        "null",
        0U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    },
    
    {
        _P_EVENT_HALT,
        "halt",
        4294967295U,
        &P_GEND_TYPE_0,
        0U,
        NULL
    },
    
    {
        P_EVENT_E,
        "E",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    },
    
    {
        P_EVENT_F,
        "F",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    },
    
    {
        P_EVENT_Unit,
        "Unit",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    }
  };
  PRT_VARDECL P_GEND_VARS_A[] = 
  {
    
    {
        P_VAR_A_x,
        P_MACHINE_A,
        "x",
        &P_GEND_TYPE_3,
        0U,
        NULL
    }
  };
  PRT_TRANSDECL P_GEND_TRANS_B_Init[] = 
  {
    
    {
        0,
        P_STATE_B_Init,
        P_MACHINE_B,
        P_EVENT_Unit,
        P_STATE_B_X,
        _P_FUN_PUSH_OR_IGN,
        0U,
        NULL
    }
  };
  PRT_TRANSDECL P_GEND_TRANS_B_X[] = 
  {
    
    {
        0,
        P_STATE_B_X,
        P_MACHINE_B,
        P_EVENT_F,
        P_STATE_B_X,
        P_FUN_B_ANON0,
        0U,
        NULL
    }
  };
  static PRT_VALUE *P_FUN_A_ANON0_IMPL(PRT_MACHINEINST *context)
  {
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      p_tmp_ret = NULL;
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_A_ANON1_IMPL(PRT_MACHINEINST *context)
  {
    #line 9 "file:///c:/users/t-suchav/p/tst/regressiontests/feature2stmts/correct/receive12/receive12.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_expr_0;
      PRT_VALUE *p_tmp_expr_1;
      PRT_VALUE *p_tmp_ret;
      PRT_VALUE *p_tmp_stmt_0;
      PRT_VALUE *p_tmp_stmt_1;
      PRT_VALUE *p_tmp_stmt_2;
      #line 9
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 9
      p_tmp_ret = NULL;
      #line 9
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 12
      P_STMT_0(PrtSetLocalVarEx(p_tmp_frame.locals, 2U, p_tmp_stmt_0, !PRT_TRUE), P_EXPR_1(PrtCloneValue(PrtMkMachine(context->process, P_MACHINE_B, p_tmp_expr_0)->id), PRT_TRUE, &P_GEND_VALUE_4, PRT_FALSE), PRT_FALSE);
      #line 13
      P_STMT_0(PrtSetLocalVarEx(p_tmp_frame.locals, 1U, p_tmp_stmt_0, !PRT_TRUE), P_EXPR_1(PrtCloneValue(PrtMkMachine(context->process, P_MACHINE_B, p_tmp_expr_0)->id), PRT_TRUE, p_tmp_mach_priv->id, PRT_FALSE), PRT_FALSE);
      #line 14
      P_STMT_2(P_SEQ(PrtCheckIsLocalMachineId(context, p_tmp_stmt_0), PrtSend(PrtGetMachine(context->process, p_tmp_stmt_0), p_tmp_stmt_1, p_tmp_stmt_2, PRT_FALSE)), &P_GEND_VALUE_4, PRT_FALSE, P_EXPR_0(&P_GEND_VALUE_0, PRT_FALSE), PRT_FALSE, P_EXPR_0(p_tmp_frame.locals[1U], PRT_FALSE), PRT_FALSE);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 15
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 15
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_B_ANON0_IMPL(PRT_MACHINEINST *context)
  {
    #line 33 "file:///c:/users/t-suchav/p/tst/regressiontests/feature2stmts/correct/receive12/receive12.p"
    {
      PRT_BOOLEAN p_tmp_bool;
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_expr_0;
      PRT_VALUE *p_tmp_ret;
      #line 33
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 33
      p_tmp_ret = NULL;
      #line 33
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 33
      if (!P_BOOL_EXPR(P_EXPR_0(&P_GEND_VALUE_2, PRT_FALSE), PRT_FALSE))
      {
        #line 33
        PrtHandleError(PRT_STATUS_ASSERT, p_tmp_mach_priv);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 33
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 33
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_B_ANON1_IMPL(PRT_MACHINEINST *context)
  {
    #line 30 "file:///c:/users/t-suchav/p/tst/regressiontests/feature2stmts/correct/receive12/receive12.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      #line 30
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 30
      p_tmp_ret = NULL;
      #line 30
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 30
      PrtPop(p_tmp_mach_priv);
      goto P_EXIT_FUN;
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 30
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 30
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_B_ANON2_IMPL(PRT_MACHINEINST *context)
  {
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      p_tmp_ret = NULL;
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_B_ANON3_IMPL(PRT_MACHINEINST *context)
  {
    #line 21 "file:///c:/users/t-suchav/p/tst/regressiontests/feature2stmts/correct/receive12/receive12.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_expr_0;
      PRT_VALUE *p_tmp_ret;
      PRT_VALUE *p_tmp_stmt_0;
      PRT_VALUE *p_tmp_stmt_1;
      #line 21
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 21
      p_tmp_ret = NULL;
      #line 21
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 22
      P_STMT_1(PrtRaise(p_tmp_mach_priv, p_tmp_stmt_0, p_tmp_stmt_1), &P_GEND_VALUE_4, PRT_FALSE, P_EXPR_0(&P_GEND_VALUE_1, PRT_FALSE), PRT_FALSE);
      goto P_EXIT_FUN;
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 23
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 23
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_B_ANON4_IMPL(PRT_MACHINEINST *context)
  {
    #line 28 "file:///c:/users/t-suchav/p/tst/regressiontests/feature2stmts/correct/receive12/receive12.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      #line 28
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 28
      p_tmp_ret = NULL;
      #line 28
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 28
      if (p_tmp_frame.returnTo == 0U)
      {
        #line 28
        goto L0;
      }
      L0:
      #line 29
      if (p_tmp_frame.rcase == NULL && !PrtReceive(p_tmp_mach_priv, &p_tmp_frame, 0U))
      {
        #line 29
        return NULL;
      }
      #line 29
      PrtGetFunction(p_tmp_mach_priv, p_tmp_frame.rcase->funIndex)(context);
      #line 29
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 29
        PrtPushFrame(p_tmp_mach_priv, &p_tmp_frame);
        #line 29
        return NULL;
      }
      #line 29
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 29
        goto P_EXIT_FUN;
      }
      #line 29
      p_tmp_frame.rcase = NULL;
      #line 29
      p_tmp_frame.returnTo = 0x0FFFFU;
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 32
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 32
      return p_tmp_ret;
    }
  }

  PRT_CASEDECL P_GEND_CASES_0[] = 
  {
    
    {
        P_EVENT_F,
        2U
    }
  };
  PRT_UINT32 P_GEND_EVENTSET_0[] = 
  {
    0x0U
  };
  PRT_UINT32 P_GEND_EVENTSET_1[] = 
  {
    0x08U
  };
  PRT_UINT32 P_GEND_EVENTSET_2[] = 
  {
    0x10U
  };
  PRT_EVENTSETDECL P_GEND_EVENTSETS[] = 
  {
    
    {
        0,
        P_GEND_EVENTSET_0
    },
    
    {
        1,
        P_GEND_EVENTSET_1
    },
    
    {
        2,
        P_GEND_EVENTSET_2
    }
  };
  PRT_RECEIVEDECL P_GEND_RECEIVE_P_FUN_B_ANON4[] = 
  {
    
    {
        0U,
        1U,
        1U,
        P_GEND_CASES_0
    }
  };
  PRT_FUNDECL P_GEND_FUNS_A[] = 
  {
    
    {
        _P_FUN_PUSH_OR_IGN,
        P_MACHINE_A,
        NULL,
        NULL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_A_ANON0,
        P_MACHINE_A,
        NULL,
        &P_FUN_A_ANON0_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_A_ANON1,
        P_MACHINE_A,
        NULL,
        &P_FUN_A_ANON1_IMPL,
        3U,
        1U,
        &P_GEND_TYPE_14,
        0U,
        NULL,
        0U,
        NULL
    }
  };
  PRT_FUNDECL P_GEND_FUNS_B[] = 
  {
    
    {
        _P_FUN_PUSH_OR_IGN,
        P_MACHINE_B,
        NULL,
        NULL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_B_ANON0,
        P_MACHINE_B,
        NULL,
        &P_FUN_B_ANON0_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_B_ANON1,
        P_MACHINE_B,
        NULL,
        &P_FUN_B_ANON1_IMPL,
        1U,
        2U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_B_ANON2,
        P_MACHINE_B,
        NULL,
        &P_FUN_B_ANON2_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_B_ANON3,
        P_MACHINE_B,
        NULL,
        &P_FUN_B_ANON3_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_B_ANON4,
        P_MACHINE_B,
        NULL,
        &P_FUN_B_ANON4_IMPL,
        2U,
        1U,
        NULL,
        1U,
        P_GEND_RECEIVE_P_FUN_B_ANON4,
        0U,
        NULL
    }
  };
  PRT_STATEDECL P_GEND_STATES_A[] = 
  {
    
    {
        P_STATE_A_Init,
        P_MACHINE_A,
        "Init",
        0,
        0,
        0,
        0,
        0,
        NULL,
        NULL,
        P_FUN_A_ANON1,
        P_FUN_A_ANON0,
        0U,
        NULL
    }
  };
  PRT_STATEDECL P_GEND_STATES_B[] = 
  {
    
    {
        P_STATE_B_Init,
        P_MACHINE_B,
        "Init",
        1,
        0,
        0,
        2,
        0,
        P_GEND_TRANS_B_Init,
        NULL,
        P_FUN_B_ANON3,
        P_FUN_B_ANON2,
        0U,
        NULL
    },
    
    {
        P_STATE_B_X,
        P_MACHINE_B,
        "X",
        1,
        0,
        0,
        1,
        0,
        P_GEND_TRANS_B_X,
        NULL,
        P_FUN_B_ANON4,
        P_FUN_B_ANON2,
        0U,
        NULL
    }
  };
  PRT_MACHINEDECL P_GEND_MACHINES[] = 
  {
    
    {
        P_MACHINE_A,
        "A",
        1,
        1,
        3,
        4294967295,
        P_STATE_A_Init,
        P_GEND_VARS_A,
        P_GEND_STATES_A,
        P_GEND_FUNS_A,
        &P_CTOR_A_IMPL,
        &P_DTOR_A_IMPL,
        0U,
        NULL
    },
    
    {
        P_MACHINE_B,
        "B",
        0,
        2,
        6,
        4294967295,
        P_STATE_B_Init,
        NULL,
        P_GEND_STATES_B,
        P_GEND_FUNS_B,
        &P_CTOR_B_IMPL,
        &P_DTOR_B_IMPL,
        0U,
        NULL
    }
  };
  PRT_PROGRAMDECL P_GEND_PROGRAM = 
  {
    5U,
    3U,
    2U,
    0U,
    0U,
    P_GEND_EVENTS,
    P_GEND_EVENTSETS,
    P_GEND_MACHINES,
    NULL,
    NULL,
    0U,
    NULL
  };
  