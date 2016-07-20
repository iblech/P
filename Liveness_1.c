
  #include "Liveness_1.h"
  #define P_SEQ
  #define P_STMT_0(s, x0, f0) P_SEQ(p_tmp_stmt_0 = (x0), (s), ((f0) ? PrtFreeValue(p_tmp_stmt_0) : 0U))
  #define P_STMT_2(s, x2, f2, x1, f1, x0, f0) P_SEQ(p_tmp_stmt_0 = (x0), p_tmp_stmt_1 = (x1), p_tmp_stmt_2 = (x2), (s), ((f0) ? PrtFreeValue(p_tmp_stmt_0) : 0U), ((f1) ? PrtFreeValue(p_tmp_stmt_1) : 0U), ((f2) ? PrtFreeValue(p_tmp_stmt_2) : 0U))
  #define P_BOOL_EXPR(x0, f0) P_SEQ(p_tmp_expr_0 = (x0), p_tmp_bool = PrtPrimGetBool(p_tmp_expr_0), ((f0) ? PrtFreeValue(p_tmp_expr_0) : 0U), p_tmp_bool)
  #define P_EXPR_0(x0, f0) P_SEQ(p_tmp_expr_0 = (x0), p_tmp_expr_0)
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
    "_payload_3"
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
    "_payload_skip"
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
    "_payload_1"
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
    "_payload_2"
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
    "_payload_4"
  };
  PRT_TYPE *P_GEND_TYPE_NMDTUP_TARR_11[] = 
  {
    &P_GEND_TYPE_0
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
    "_payload_5"
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
  PRT_VALUE P_GEND_VALUE_0 = 
  {
    PRT_VALUE_KIND_EVENT,
    
    {
        P_EVENT_Done
    }
  };
  PRT_VALUE P_GEND_VALUE_1 = 
  {
    PRT_VALUE_KIND_EVENT,
    
    {
        P_EVENT_UserEvent
    }
  };
  PRT_VALUE P_GEND_VALUE_2 = 
  {
    PRT_VALUE_KIND_EVENT,
    
    {
        PRT_SPECIAL_EVENT_HALT
    }
  };
  PRT_VALUE P_GEND_VALUE_3 = 
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
        P_EVENT_Computing,
        "Computing",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    },
    
    {
        P_EVENT_Done,
        "Done",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    },
    
    {
        P_EVENT_UserEvent,
        "UserEvent",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    },
    
    {
        P_EVENT_Waiting,
        "Waiting",
        4294967295U,
        &P_GEND_TYPE_4,
        0U,
        NULL
    }
  };
  PRT_TRANSDECL P_GEND_TRANS_EventHandler_EventHandler_HandleEvent[] = 
  {
    
    {
        0,
        P_STATE_EventHandler_EventHandler_HandleEvent,
        P_MACHINE_EventHandler,
        P_EVENT_Done,
        P_STATE_EventHandler_EventHandler_WaitForUser,
        P_FUN_EventHandler_ANON2,
        0U,
        NULL
    }
  };
  PRT_TRANSDECL P_GEND_TRANS_EventHandler_EventHandler_WaitForUser[] = 
  {
    
    {
        0,
        P_STATE_EventHandler_EventHandler_WaitForUser,
        P_MACHINE_EventHandler,
        P_EVENT_UserEvent,
        P_STATE_EventHandler_EventHandler_HandleEvent,
        P_FUN_EventHandler_ANON5,
        0U,
        NULL
    }
  };
  PRT_VALUE *P_FUN_EventHandler_EventHandler_HandleEvent_entry0_rand_1390976448_IMPL(PRT_MACHINEINST *context);

  PRT_VALUE *P_FUN_EventHandler_EventHandler_HandleEvent_exit0_rand_893217488_IMPL(PRT_MACHINEINST *context);

  PRT_VALUE *P_FUN_EventHandler_EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094_IMPL(PRT_MACHINEINST *context);

  PRT_VALUE *P_FUN_EventHandler_EventHandler_WaitForUser_entry0_rand_564662775_IMPL(PRT_MACHINEINST *context);

  PRT_VALUE *P_FUN_EventHandler_EventHandler_WaitForUser_exit0_rand_951537393_IMPL(PRT_MACHINEINST *context);

  PRT_VALUE *P_FUN_EventHandler_EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197_IMPL(PRT_MACHINEINST *context);

  PRT_VALUE *P_FUN_EventHandler_EventHandler_HandleEvent_entry0_rand_1390976448_IMPL(PRT_MACHINEINST *context)
  {
    #line 39 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_expr_0;
      PRT_VALUE *p_tmp_ret;
      PRT_VALUE *p_tmp_stmt_0;
      PRT_VALUE *p_tmp_stmt_1;
      PRT_VALUE *p_tmp_stmt_2;
      #line 39
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 39
      p_tmp_ret = NULL;
      #line 39
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 44
      P_STMT_2(P_SEQ(PrtCheckIsLocalMachineId(context, p_tmp_stmt_0), PrtSend(PrtGetMachine(context->process, p_tmp_stmt_0), p_tmp_stmt_1, p_tmp_stmt_2, PRT_FALSE)), &P_GEND_VALUE_3, PRT_FALSE, P_EXPR_0(&P_GEND_VALUE_0, PRT_FALSE), PRT_FALSE, P_EXPR_0(p_tmp_mach_priv->id, PRT_FALSE), PRT_FALSE);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 45
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 45
      return p_tmp_ret;
    }
  }

  PRT_VALUE *P_FUN_EventHandler_EventHandler_HandleEvent_exit0_rand_893217488_IMPL(PRT_MACHINEINST *context)
  {
    #line 47 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      #line 47
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 47
      p_tmp_ret = NULL;
      #line 47
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 52
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 52
      return p_tmp_ret;
    }
  }

  PRT_VALUE *P_FUN_EventHandler_EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094_IMPL(PRT_MACHINEINST *context)
  {
    #line 17 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      #line 17
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 17
      p_tmp_ret = NULL;
      #line 17
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 22
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 22
      return p_tmp_ret;
    }
  }

  PRT_VALUE *P_FUN_EventHandler_EventHandler_WaitForUser_entry0_rand_564662775_IMPL(PRT_MACHINEINST *context)
  {
    #line 24 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_expr_0;
      PRT_VALUE *p_tmp_ret;
      PRT_VALUE *p_tmp_stmt_0;
      PRT_VALUE *p_tmp_stmt_1;
      PRT_VALUE *p_tmp_stmt_2;
      #line 24
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 24
      p_tmp_ret = NULL;
      #line 24
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 29
      P_STMT_2(P_SEQ(PrtCheckIsLocalMachineId(context, p_tmp_stmt_0), PrtSend(PrtGetMachine(context->process, p_tmp_stmt_0), p_tmp_stmt_1, p_tmp_stmt_2, PRT_FALSE)), &P_GEND_VALUE_3, PRT_FALSE, P_EXPR_0(&P_GEND_VALUE_1, PRT_FALSE), PRT_FALSE, P_EXPR_0(p_tmp_mach_priv->id, PRT_FALSE), PRT_FALSE);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 30
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 30
      return p_tmp_ret;
    }
  }

  PRT_VALUE *P_FUN_EventHandler_EventHandler_WaitForUser_exit0_rand_951537393_IMPL(PRT_MACHINEINST *context)
  {
    #line 32 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      #line 32
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 32
      p_tmp_ret = NULL;
      #line 32
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 37
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 37
      return p_tmp_ret;
    }
  }

  PRT_VALUE *P_FUN_EventHandler_EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197_IMPL(PRT_MACHINEINST *context)
  {
    #line 10 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_ret;
      #line 10
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 10
      p_tmp_ret = NULL;
      #line 10
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 15
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 15
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON0_IMPL(PRT_MACHINEINST *context)
  {
    #line 68 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_funstmt_ret;
      PRT_VALUE *p_tmp_ret;
      #line 68
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 68
      p_tmp_ret = NULL;
      #line 68
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 68
      if (p_tmp_frame.returnTo == 3U)
      {
        #line 68
        goto L3;
      }
      PrtPushNewFrame(p_tmp_mach_priv, 8U);
      L3:
      #line 69
      p_tmp_funstmt_ret = PrtWrapFunStmt(&p_tmp_frame, 3U, p_tmp_mach_priv, 8U);
      #line 69
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 69
        return p_tmp_funstmt_ret;
      }
      #line 69
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 69
        goto P_EXIT_FUN;
      }
      #line 69
      if (p_tmp_funstmt_ret != NULL)
      {
        #line 69
        PrtFreeValue(p_tmp_funstmt_ret);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 70
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 70
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON1_IMPL(PRT_MACHINEINST *context)
  {
    #line 71 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_funstmt_ret;
      PRT_VALUE *p_tmp_ret;
      #line 71
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 71
      p_tmp_ret = NULL;
      #line 71
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 71
      if (p_tmp_frame.returnTo == 4U)
      {
        #line 71
        goto L4;
      }
      PrtPushNewFrame(p_tmp_mach_priv, 9U);
      L4:
      #line 72
      p_tmp_funstmt_ret = PrtWrapFunStmt(&p_tmp_frame, 4U, p_tmp_mach_priv, 9U);
      #line 72
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 72
        return p_tmp_funstmt_ret;
      }
      #line 72
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 72
        goto P_EXIT_FUN;
      }
      #line 72
      if (p_tmp_funstmt_ret != NULL)
      {
        #line 72
        PrtFreeValue(p_tmp_funstmt_ret);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 72
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 72
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON2_IMPL(PRT_MACHINEINST *context)
  {
    #line 74 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_funstmt_ret;
      PRT_VALUE *p_tmp_ret;
      #line 74
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 74
      p_tmp_ret = NULL;
      #line 74
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 74
      if (p_tmp_frame.returnTo == 5U)
      {
        #line 74
        goto L5;
      }
      PrtPushNewFrame(p_tmp_mach_priv, 10U);
      L5:
      #line 75
      p_tmp_funstmt_ret = PrtWrapFunStmt(&p_tmp_frame, 5U, p_tmp_mach_priv, 10U);
      #line 75
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 75
        return p_tmp_funstmt_ret;
      }
      #line 75
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 75
        goto P_EXIT_FUN;
      }
      #line 75
      if (p_tmp_funstmt_ret != NULL)
      {
        #line 75
        PrtFreeValue(p_tmp_funstmt_ret);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 76
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 76
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON3_IMPL(PRT_MACHINEINST *context)
  {
    #line 55 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_funstmt_ret;
      PRT_VALUE *p_tmp_ret;
      #line 55
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 55
      p_tmp_ret = NULL;
      #line 55
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 55
      if (p_tmp_frame.returnTo == 0U)
      {
        #line 55
        goto L0;
      }
      PrtPushNewFrame(p_tmp_mach_priv, 11U);
      L0:
      #line 56
      p_tmp_funstmt_ret = PrtWrapFunStmt(&p_tmp_frame, 0U, p_tmp_mach_priv, 11U);
      #line 56
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 56
        return p_tmp_funstmt_ret;
      }
      #line 56
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 56
        goto P_EXIT_FUN;
      }
      #line 56
      if (p_tmp_funstmt_ret != NULL)
      {
        #line 56
        PrtFreeValue(p_tmp_funstmt_ret);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 57
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 57
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON4_IMPL(PRT_MACHINEINST *context)
  {
    #line 58 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_funstmt_ret;
      PRT_VALUE *p_tmp_ret;
      #line 58
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 58
      p_tmp_ret = NULL;
      #line 58
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 58
      if (p_tmp_frame.returnTo == 1U)
      {
        #line 58
        goto L1;
      }
      PrtPushNewFrame(p_tmp_mach_priv, 12U);
      L1:
      #line 59
      p_tmp_funstmt_ret = PrtWrapFunStmt(&p_tmp_frame, 1U, p_tmp_mach_priv, 12U);
      #line 59
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 59
        return p_tmp_funstmt_ret;
      }
      #line 59
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 59
        goto P_EXIT_FUN;
      }
      #line 59
      if (p_tmp_funstmt_ret != NULL)
      {
        #line 59
        PrtFreeValue(p_tmp_funstmt_ret);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 59
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 59
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON5_IMPL(PRT_MACHINEINST *context)
  {
    #line 61 "file:///c:/users/t-suchav/p/tst/regressiontests/liveness/correct/liveness_1/liveness_1.p"
    {
      PRT_FUNSTACK_INFO p_tmp_frame;
      PRT_MACHINEINST_PRIV *p_tmp_mach_priv;
      PRT_VALUE *p_tmp_funstmt_ret;
      PRT_VALUE *p_tmp_ret;
      #line 61
      p_tmp_mach_priv = (PRT_MACHINEINST_PRIV *)context;
      #line 61
      p_tmp_ret = NULL;
      #line 61
      PrtPopFrame(p_tmp_mach_priv, &p_tmp_frame);
      #line 61
      if (p_tmp_frame.returnTo == 2U)
      {
        #line 61
        goto L2;
      }
      PrtPushNewFrame(p_tmp_mach_priv, 13U);
      L2:
      #line 62
      p_tmp_funstmt_ret = PrtWrapFunStmt(&p_tmp_frame, 2U, p_tmp_mach_priv, 13U);
      #line 62
      if (p_tmp_mach_priv->receive != NULL)
      {
        #line 62
        return p_tmp_funstmt_ret;
      }
      #line 62
      if (p_tmp_mach_priv->lastOperation != ReturnStatement)
      {
        #line 62
        goto P_EXIT_FUN;
      }
      #line 62
      if (p_tmp_funstmt_ret != NULL)
      {
        #line 62
        PrtFreeValue(p_tmp_funstmt_ret);
      }
      goto P_EXIT_FUN;
      P_EXIT_FUN:
      #line 63
      PrtFreeLocals(p_tmp_mach_priv, &p_tmp_frame);
      #line 63
      return p_tmp_ret;
    }
  }

  static PRT_VALUE *P_FUN_EventHandler_ANON6_IMPL(PRT_MACHINEINST *context)
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
  PRT_FUNDECL P_GEND_FUNS_EventHandler[] = 
  {
    
    {
        _P_FUN_PUSH_OR_IGN,
        P_MACHINE_EventHandler,
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
        P_FUN_EventHandler_ANON0,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON0_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_ANON1,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON1_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_ANON2,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON2_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_ANON3,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON3_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_ANON4,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON4_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_ANON5,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON5_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_ANON6,
        P_MACHINE_EventHandler,
        NULL,
        &P_FUN_EventHandler_ANON6_IMPL,
        1U,
        1U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_EventHandler_HandleEvent_entry0_rand_1390976448,
        P_MACHINE_EventHandler,
        "EventHandler_HandleEvent_entry0_rand_1390976448",
        &P_FUN_EventHandler_EventHandler_HandleEvent_entry0_rand_1390976448_IMPL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_EventHandler_HandleEvent_exit0_rand_893217488,
        P_MACHINE_EventHandler,
        "EventHandler_HandleEvent_exit0_rand_893217488",
        &P_FUN_EventHandler_EventHandler_HandleEvent_exit0_rand_893217488_IMPL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094,
        P_MACHINE_EventHandler,
        "EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094",
        &P_FUN_EventHandler_EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094_IMPL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_EventHandler_WaitForUser_entry0_rand_564662775,
        P_MACHINE_EventHandler,
        "EventHandler_WaitForUser_entry0_rand_564662775",
        &P_FUN_EventHandler_EventHandler_WaitForUser_entry0_rand_564662775_IMPL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_EventHandler_WaitForUser_exit0_rand_951537393,
        P_MACHINE_EventHandler,
        "EventHandler_WaitForUser_exit0_rand_951537393",
        &P_FUN_EventHandler_EventHandler_WaitForUser_exit0_rand_951537393_IMPL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    },
    
    {
        P_FUN_EventHandler_EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197,
        P_MACHINE_EventHandler,
        "EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197",
        &P_FUN_EventHandler_EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197_IMPL,
        0U,
        0U,
        NULL,
        0U,
        NULL,
        0U,
        NULL
    }
  };
  PRT_STATEDECL P_GEND_STATES_EventHandler[] = 
  {
    
    {
        P_STATE_EventHandler_EventHandler_HandleEvent,
        P_MACHINE_EventHandler,
        "EventHandler_HandleEvent",
        1,
        0,
        0,
        1,
        0,
        P_GEND_TRANS_EventHandler_EventHandler_HandleEvent,
        NULL,
        P_FUN_EventHandler_ANON0,
        P_FUN_EventHandler_ANON1,
        0U,
        NULL
    },
    
    {
        P_STATE_EventHandler_EventHandler_WaitForUser,
        P_MACHINE_EventHandler,
        "EventHandler_WaitForUser",
        1,
        0,
        0,
        2,
        0,
        P_GEND_TRANS_EventHandler_EventHandler_WaitForUser,
        NULL,
        P_FUN_EventHandler_ANON3,
        P_FUN_EventHandler_ANON4,
        0U,
        NULL
    }
  };
  PRT_MACHINEDECL P_GEND_MACHINES[] = 
  {
    
    {
        P_MACHINE_EventHandler,
        "EventHandler",
        0,
        2,
        14,
        4294967295,
        P_STATE_EventHandler_EventHandler_WaitForUser,
        NULL,
        P_GEND_STATES_EventHandler,
        P_GEND_FUNS_EventHandler,
        &P_CTOR_EventHandler_IMPL,
        &P_DTOR_EventHandler_IMPL,
        0U,
        NULL
    }
  };
  PRT_PROGRAMDECL P_GEND_PROGRAM = 
  {
    6U,
    3U,
    1U,
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
  