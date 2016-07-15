event E: int;

main machine M
{
	var M_g: int;

	fun M_G(M_G_a: int): int
	{
		return (0);
	}

	fun M_F(M_F_a: int, M_F_b: int)
	{
		M_F_a = (M_F_a + 1);
	}

	fun M_S_entry17()
	{
		var M_S_entry17_y: int;
		var _tmp29: bool;
		var _tmp30: bool;
		var _tmp31: int;
		var _tmp32: bool;
		var _tmp33: bool;

		_tmp29 = (M_S_entry17_y == 0);
		assert _tmp29;
		
		M_F(M_g, M_S_entry17_y);
		_tmp30 = (M_g == 1);
		assert _tmp30;
		
		_tmp31 = M_G(M_g);
		_tmp32 = (_tmp31 == 0);
		if(_tmp32)
		{
			M_S_entry17_y = 1;
		}
		else
		{
			M_S_entry17_y = 0;
		}

		M_S_entry17_y = M_G(M_S_entry17_y);
		
		_tmp33 = (M_S_entry17_y == 0);
		assert _tmp33;
	}
	
	fun M_S_exit0_rand_212992660()
	{
		;
	}
	
	start  state M_S
	{
		entry  {
		M_S_entry17();
		}
		exit  {
		M_S_exit0_rand_212992660();
		}
	}
}

