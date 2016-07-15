
main machine M
{
var M_x: ((int));
var M_j: int;
var M_i: int;
var M_s1: seq[int];
var M_s: seq[int];
var M_t1: (seq[int], map[int, seq[int]]);
var M_t: (seq[int], map[int, seq[int]]);
var M_ts: (int, int);
var M_m: map[int, int];

fun M_F(): int
{
var _tmp173: bool;


_tmp173 = $;
if(_tmp173)
{

return (0);

}
else
{

return (1);

}

}
fun M_foo(): int
{


return (1);
}
fun M_S_entry36()
{
var _tmp174: bool;
var _tmp175: bool;
var _tmp176: bool;
var _tmp177: bool;
var _tmp178: bool;
var _tmp179: bool;
var _tmp180: int;
var _tmp181: bool;
var _tmp182: int;
var _tmp183: bool;
var _tmp184: int;
var _tmp185: int;
var _tmp186: bool;
var _tmp187: int;
var _tmp188: bool;
var _tmp189: int;
var _tmp190: bool;
var _tmp191: bool;
var _tmp192: int;
var _tmp193: bool;
var _tmp194: int;
var _tmp195: bool;
var _tmp196: int;
var _tmp197: bool;
var _tmp198: int;
var _tmp199: bool;
var _tmp200: int;
var _tmp201: bool;
var _tmp202: bool;
var _tmp203: bool;
var _tmp204: int;
var _tmp205: bool;
var _tmp206: int;
var _tmp207: bool;
var _tmp208: int;
var _tmp209: bool;
var _tmp210: int;
var _tmp211: bool;
var _tmp212: int;
var _tmp213: bool;
var _tmp214: int;
var _tmp215: bool;
var _tmp216: int;
var _tmp217: bool;
var _tmp218: int;
var _tmp219: bool;
var _tmp220: int;
var _tmp221: bool;
var _tmp222: int;
var _tmp223: bool;
var _tmp224: int;
var _tmp225: bool;
var _tmp226: int;
var _tmp227: bool;
var _tmp228: int;
var _tmp229: bool;
var _tmp230: map[int, seq[int]];
var _tmp231: bool;
var _tmp232: seq[int];
var _tmp233: bool;
var _tmp234: int;
var _tmp235: seq[int];
var _tmp236: bool;
var _tmp237: int;
var _tmp238: seq[int];
var _tmp239: bool;
var _tmp240: seq[int];
var _tmp241: bool;
var _tmp242: int;
var _tmp243: seq[int];
var _tmp244: bool;
var _tmp245: int;
var _tmp246: seq[int];
var _tmp247: bool;
var _tmp248: bool;
var _tmp249: int;
var _tmp250: bool;
var _tmp251: int;
var _tmp252: bool;
var _tmp253: bool;
var _tmp254: int;
var _tmp255: bool;
var _tmp256: int;
var _tmp257: bool;
var _tmp258: int;
var _tmp259: bool;
var _tmp260: int;
var _tmp261: bool;
var _tmp262: map[int, int];
var _tmp263: bool;
var _tmp264: int;
var _tmp265: bool;
var _tmp266: bool;
var _tmp267: int;
var _tmp268: bool;
var _tmp269: map[int, int];
var _tmp270: bool;
var _tmp271: bool;
var _tmp272: int;
var _tmp273: bool;
var _tmp274: bool;
var _tmp275: int;
var _tmp276: bool;
var _tmp277: map[int, seq[int]];
var _tmp278: seq[int];
var _tmp279: seq[int];
var _tmp280: bool;
var _tmp281: bool;
var _tmp282: bool;
var _tmp283: bool;
var _tmp284: int;
var _tmp285: seq[int];
var _tmp286: bool;
var _tmp287: int;
var _tmp288: seq[int];
var _tmp289: bool;
var _tmp290: bool;
var _tmp291: int;
var _tmp292: seq[int];
var _tmp293: bool;
var _tmp294: int;
var _tmp295: seq[int];
var _tmp296: bool;
var _tmp297: map[int, seq[int]];
var _tmp298: bool;
var _tmp299: bool;
var _tmp300: int;
var _tmp301: seq[int];
var _tmp302: bool;
var _tmp303: int;
var _tmp304: seq[int];
var _tmp305: bool;
var _tmp306: bool;
var _tmp307: bool;
var _tmp308: seq[int];
var _tmp309: bool;
var _tmp310: int;
var _tmp311: seq[int];
var _tmp312: bool;
var _tmp313: int;
var _tmp314: seq[int];
var _tmp315: bool;
var _tmp316: seq[int];
var _tmp317: bool;
var _tmp318: int;
var _tmp319: seq[int];
var _tmp320: bool;
var _tmp321: int;
var _tmp322: seq[int];
var _tmp323: bool;
var _tmp324: bool;
var _tmp325: int;
var _tmp326: seq[int];
var _tmp327: bool;
var _tmp328: bool;
var _tmp329: bool;
var _tmp330: int;
var _tmp331: seq[int];
var _tmp332: bool;
var _tmp333: int;
var _tmp334: seq[int];
var _tmp335: bool;
var _tmp336: int;
var _tmp337: seq[int];
var _tmp338: bool;
var _tmp339: int;
var _tmp340: seq[int];
var _tmp341: bool;
var _tmp342: map[int, seq[int]];
var _tmp343: seq[int];
var _tmp344: seq[int];
var _tmp345: bool;
var _tmp346: int;
var _tmp347: seq[int];
var _tmp348: bool;
var _tmp349: bool;


M_i = M_F();
M_x.0.0 = M_i;
_tmp174 = (M_x.0.0 == 0);
_tmp175 = (M_x.0.0 == 1);
assert (_tmp174 || _tmp175);
M_ts.0 = M_i;
_tmp176 = (M_ts.0 == 0);
_tmp177 = (M_ts.0 == 1);
assert (_tmp176 || _tmp177);
M_ts.0 = M_i;
_tmp178 = (M_ts.0 == 0);
_tmp179 = (M_ts.0 == 1);
assert (_tmp178 || _tmp179);
M_t.0 += (0, 2);
M_t.0 += (1, 2);
_tmp180 = M_t.0[0];
_tmp181 = (_tmp180 == 2);
_tmp182 = M_t.0[1];
_tmp183 = (_tmp182 == 2);
assert (_tmp181 && _tmp183);
_tmp184 = M_foo();
M_t.0[_tmp184] = (M_i + 5);
_tmp185 = M_t.0[0];
_tmp186 = (_tmp185 == 2);
_tmp187 = M_t.0[1];
_tmp188 = (_tmp187 == 5);
_tmp189 = M_t.0[1];
_tmp190 = (_tmp189 == 6);
assert (_tmp186 && (_tmp188 || _tmp190));
_tmp191 = (sizeof(M_t.0) == 2);
assert _tmp191;
M_t.0 += (1, M_i);
_tmp192 = M_t.0[0];
_tmp193 = (_tmp192 == 2);
_tmp194 = M_t.0[1];
_tmp195 = (_tmp194 == 0);
_tmp196 = M_t.0[1];
_tmp197 = (_tmp196 == 1);
_tmp198 = M_t.0[2];
_tmp199 = (_tmp198 == 5);
_tmp200 = M_t.0[2];
_tmp201 = (_tmp200 == 6);
assert ((_tmp193 && (_tmp195 || _tmp197)) && (_tmp199 || _tmp201));
_tmp202 = (sizeof(M_t.0) == 3);
assert _tmp202;
M_t.0 -= M_i;
_tmp203 = (sizeof(M_t.0) == 2);
assert _tmp203;
_tmp204 = M_t.0[0];
_tmp205 = (_tmp204 == 2);
_tmp206 = M_t.0[0];
_tmp207 = (_tmp206 == 0);
_tmp208 = M_t.0[0];
_tmp209 = (_tmp208 == 1);
_tmp210 = M_t.0[1];
_tmp211 = (_tmp210 == 5);
_tmp212 = M_t.0[1];
_tmp213 = (_tmp212 == 6);
assert (((_tmp205 || _tmp207) || _tmp209) && (_tmp211 || _tmp213));
_tmp214 = M_foo();
M_t.0 -= _tmp214;
_tmp215 = (sizeof(M_t.0) == 1);
assert _tmp215;
_tmp216 = M_t.0[0];
_tmp217 = (_tmp216 == 2);
_tmp218 = M_t.0[0];
_tmp219 = (_tmp218 == 0);
_tmp220 = M_t.0[0];
_tmp221 = (_tmp220 == 1);
assert ((_tmp217 || _tmp219) || _tmp221);
M_t.0 += (0, 2);
M_t.0 += (1, 4);
M_t.0[M_i] = 5;
_tmp222 = M_t.0[0];
_tmp223 = (_tmp222 == 2);
_tmp224 = M_t.0[0];
_tmp225 = (_tmp224 == 5);
_tmp226 = M_t.0[1];
_tmp227 = (_tmp226 == 4);
_tmp228 = M_t.0[1];
_tmp229 = (_tmp228 == 5);
assert ((_tmp223 || _tmp225) && (_tmp227 || _tmp229));
M_s += (0, 0);
M_s += (1, 1);
M_s1 += (0, 2);
M_s1 += (1, 3);
_tmp230 = default(map[int, seq[int]]);
M_t.1 = _tmp230;
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
_tmp231 = (sizeof(M_t.1) == 2);
assert _tmp231;
_tmp232 = M_t.1[0];
_tmp233 = (sizeof(_tmp232) == 2);
_tmp235 = M_t.1[0];
_tmp234 = _tmp235[0];
_tmp236 = (_tmp234 == 0);
_tmp238 = M_t.1[0];
_tmp237 = _tmp238[1];
_tmp239 = (_tmp237 == 1);
assert ((_tmp233 && _tmp236) && _tmp239);
_tmp240 = M_t.1[1];
_tmp241 = (sizeof(_tmp240) == 2);
_tmp243 = M_t.1[1];
_tmp242 = _tmp243[0];
_tmp244 = (_tmp242 == 2);
_tmp246 = M_t.1[1];
_tmp245 = _tmp246[1];
_tmp247 = (_tmp245 == 3);
assert ((_tmp241 && _tmp244) && _tmp247);
M_m += (0, 1);
M_m += (1, 2);
M_i = M_F();
M_m += (2, M_i);
_tmp248 = (sizeof(M_m) == 3);
_tmp249 = M_m[2];
_tmp250 = (_tmp249 == 0);
_tmp251 = M_m[2];
_tmp252 = (_tmp251 == 1);
assert (_tmp248 && (_tmp250 || _tmp252));
M_m[3] = 5;
M_m[2] = (M_i + 2);
_tmp253 = (sizeof(M_m) == 4);
assert _tmp253;
_tmp254 = M_m[2];
_tmp255 = (_tmp254 == 0);
_tmp256 = M_m[2];
_tmp257 = (_tmp256 == 1);
_tmp258 = M_m[2];
_tmp259 = (_tmp258 == 2);
_tmp260 = M_m[2];
_tmp261 = (_tmp260 == 3);
assert (((_tmp255 || _tmp257) || _tmp259) || _tmp261);
_tmp262 = default(map[int, int]);
M_m = _tmp262;
M_i = M_F();
M_m += (M_i, 0);
_tmp263 = (0 in M_m);
if(_tmp263)
{

_tmp264 = M_m[0];
_tmp265 = (_tmp264 == 0);
assert _tmp265;

}
else
{

;


}

_tmp266 = (1 in M_m);
if(_tmp266)
{

_tmp267 = M_m[1];
_tmp268 = (_tmp267 == 0);
assert _tmp268;

}
else
{

;


}

_tmp269 = default(map[int, int]);
M_m = _tmp269;
M_m[M_i] = 2;
_tmp270 = (sizeof(M_m) == 1);
assert _tmp270;
_tmp271 = (0 in M_m);
if(_tmp271)
{

_tmp272 = M_m[0];
_tmp273 = (_tmp272 == 2);
assert _tmp273;

}
else
{

;


}

_tmp274 = (1 in M_m);
if(_tmp274)
{

_tmp275 = M_m[1];
_tmp276 = (_tmp275 == 2);
assert _tmp276;

}
else
{

;


}

_tmp277 = default(map[int, seq[int]]);
M_t.1 = _tmp277;
_tmp278 = default(seq[int]);
M_s = _tmp278;
_tmp279 = default(seq[int]);
M_s1 = _tmp279;
M_s += (0, 0);
M_s += (1, 1);
M_s1 += (0, 2);
M_s1 += (1, 3);
M_t.1 += (0, M_s);
M_i = M_F();
M_i = (M_i + 1);
_tmp280 = (M_i == 1);
_tmp281 = (M_i == 2);
assert (_tmp280 || _tmp281);
M_t.1 += (M_i, M_s1);
_tmp282 = (sizeof(M_t.1) == 2);
assert _tmp282;
_tmp283 = (M_i == 1);
if(_tmp283)
{

_tmp285 = M_t.1[1];
_tmp284 = _tmp285[0];
_tmp286 = (_tmp284 == 2);
_tmp288 = M_t.1[1];
_tmp287 = _tmp288[1];
_tmp289 = (_tmp287 == 3);
assert (_tmp286 && _tmp289);

}
else
{

;


}

_tmp290 = (M_i == 2);
if(_tmp290)
{

_tmp292 = M_t.1[2];
_tmp291 = _tmp292[0];
_tmp293 = (_tmp291 == 2);
_tmp295 = M_t.1[2];
_tmp294 = _tmp295[1];
_tmp296 = (_tmp294 == 3);
assert (_tmp293 && _tmp296);

}
else
{

;


}

_tmp297 = default(map[int, seq[int]]);
M_t.1 = _tmp297;
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
_tmp298 = (sizeof(M_t.1) == 2);
assert _tmp298;
M_t.1 -= 0;
_tmp299 = (sizeof(M_t.1) == 1);
_tmp301 = M_t.1[1];
_tmp300 = _tmp301[0];
_tmp302 = (_tmp300 == 2);
_tmp304 = M_t.1[1];
_tmp303 = _tmp304[1];
_tmp305 = (_tmp303 == 3);
assert ((_tmp299 && _tmp302) && _tmp305);
M_t.1 -= 1;
_tmp306 = (sizeof(M_t.1) == 0);
assert _tmp306;
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
_tmp307 = (sizeof(M_t.1) == 2);
_tmp308 = M_t.1[0];
_tmp309 = (sizeof(_tmp308) == 2);
_tmp311 = M_t.1[0];
_tmp310 = _tmp311[0];
_tmp312 = (_tmp310 == 0);
_tmp314 = M_t.1[0];
_tmp313 = _tmp314[1];
_tmp315 = (_tmp313 == 1);
assert (((_tmp307 && _tmp309) && _tmp312) && _tmp315);
_tmp316 = M_t.1[1];
_tmp317 = (sizeof(_tmp316) == 2);
_tmp319 = M_t.1[1];
_tmp318 = _tmp319[0];
_tmp320 = (_tmp318 == 2);
_tmp322 = M_t.1[1];
_tmp321 = _tmp322[1];
_tmp323 = (_tmp321 == 3);
assert ((_tmp317 && _tmp320) && _tmp323);
M_i = M_F();
M_t.1 -= M_i;
_tmp324 = (sizeof(M_t.1) == 1);
assert _tmp324;
_tmp326 = keys(M_t.1);
_tmp325 = _tmp326[0];
M_j = _tmp325;
_tmp327 = (M_j == 0);
_tmp328 = (M_j == 1);
assert (_tmp327 || _tmp328);
_tmp329 = (M_j == 0);
if(_tmp329)
{

_tmp331 = M_t.1[0];
_tmp330 = _tmp331[0];
_tmp332 = (_tmp330 == 0);
_tmp334 = M_t.1[0];
_tmp333 = _tmp334[1];
_tmp335 = (_tmp333 == 1);
assert (_tmp332 && _tmp335);

}
else
{

_tmp337 = M_t.1[1];
_tmp336 = _tmp337[0];
_tmp338 = (_tmp336 == 2);
_tmp340 = M_t.1[1];
_tmp339 = _tmp340[1];
_tmp341 = (_tmp339 == 3);
assert (_tmp338 && _tmp341);

}

_tmp342 = default(map[int, seq[int]]);
M_t.1 = _tmp342;
_tmp343 = default(seq[int]);
M_s = _tmp343;
_tmp344 = default(seq[int]);
M_s1 = _tmp344;
M_s += (0, 0);
M_s += (1, 1);
M_s1 += (0, 2);
M_s1 += (1, 3);
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
_tmp345 = (sizeof(M_t.1) == 2);
assert _tmp345;
_tmp347 = keys(M_t.1);
_tmp346 = _tmp347[M_i];
M_j = _tmp346;
_tmp348 = (M_j == 0);
_tmp349 = (M_j == 1);
assert (_tmp348 || _tmp349);
}
fun M_S_exit0_rand_2063408931()
{


;

}start  state M_S
{entry  {
M_S_entry36();
}
exit  {
M_S_exit0_rand_2063408931();
}
}
}

