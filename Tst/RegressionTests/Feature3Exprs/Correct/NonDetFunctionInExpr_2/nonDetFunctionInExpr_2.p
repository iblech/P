
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
var _tmp190: bool;


_tmp190 = $;
;
if(_tmp190)
{

return (0);
;
return (0);



}
else
{

return (1);
;
return (1);



}


}
fun M_foo(): int
{


return (1);


}
fun M_S_entry36(M_S_entry36__payload_0: any)
{
var _tmp191: bool;
var _tmp192: bool;
var _tmp193: bool;
var _tmp194: bool;
var _tmp195: bool;
var _tmp196: bool;
var _tmp197: int;
var _tmp198: bool;
var _tmp199: int;
var _tmp200: bool;
var _tmp202: int;
var _tmp203: bool;
var _tmp204: int;
var _tmp205: bool;
var _tmp206: int;
var _tmp207: bool;
var _tmp208: bool;
var _tmp209: int;
var _tmp210: bool;
var _tmp211: int;
var _tmp212: bool;
var _tmp213: int;
var _tmp214: bool;
var _tmp215: int;
var _tmp216: bool;
var _tmp217: int;
var _tmp218: bool;
var _tmp219: bool;
var _tmp220: bool;
var _tmp221: int;
var _tmp222: bool;
var _tmp223: int;
var _tmp224: bool;
var _tmp225: int;
var _tmp226: bool;
var _tmp227: int;
var _tmp228: bool;
var _tmp229: int;
var _tmp230: bool;
var _tmp231: int;
var _tmp232: bool;
var _tmp233: int;
var _tmp234: bool;
var _tmp235: int;
var _tmp236: bool;
var _tmp237: int;
var _tmp238: bool;
var _tmp239: int;
var _tmp240: bool;
var _tmp241: int;
var _tmp242: bool;
var _tmp243: int;
var _tmp244: bool;
var _tmp245: int;
var _tmp246: bool;
var _tmp247: map[int, seq[int]];
var _tmp248: bool;
var _tmp249: seq[int];
var _tmp250: bool;
var _tmp251: int;
var _tmp252: seq[int];
var _tmp253: bool;
var _tmp254: int;
var _tmp255: seq[int];
var _tmp256: bool;
var _tmp257: seq[int];
var _tmp258: bool;
var _tmp259: int;
var _tmp260: seq[int];
var _tmp261: bool;
var _tmp262: int;
var _tmp263: seq[int];
var _tmp264: bool;
var _tmp265: bool;
var _tmp266: int;
var _tmp267: bool;
var _tmp268: int;
var _tmp269: bool;
var _tmp270: bool;
var _tmp271: int;
var _tmp272: bool;
var _tmp273: int;
var _tmp274: bool;
var _tmp275: int;
var _tmp276: bool;
var _tmp277: int;
var _tmp278: bool;
var _tmp279: map[int, int];
var _tmp280: bool;
var _tmp281: int;
var _tmp282: bool;
var _tmp283: bool;
var _tmp284: int;
var _tmp285: bool;
var _tmp286: map[int, int];
var _tmp287: bool;
var _tmp288: bool;
var _tmp289: int;
var _tmp290: bool;
var _tmp291: bool;
var _tmp292: int;
var _tmp293: bool;
var _tmp294: map[int, seq[int]];
var _tmp295: seq[int];
var _tmp296: seq[int];
var _tmp297: bool;
var _tmp298: bool;
var _tmp299: bool;
var _tmp300: bool;
var _tmp301: int;
var _tmp302: seq[int];
var _tmp303: bool;
var _tmp304: int;
var _tmp305: seq[int];
var _tmp306: bool;
var _tmp307: bool;
var _tmp308: int;
var _tmp309: seq[int];
var _tmp310: bool;
var _tmp311: int;
var _tmp312: seq[int];
var _tmp313: bool;
var _tmp314: map[int, seq[int]];
var _tmp315: bool;
var _tmp316: bool;
var _tmp317: int;
var _tmp318: seq[int];
var _tmp319: bool;
var _tmp320: int;
var _tmp321: seq[int];
var _tmp322: bool;
var _tmp323: bool;
var _tmp324: bool;
var _tmp325: seq[int];
var _tmp326: bool;
var _tmp327: int;
var _tmp328: seq[int];
var _tmp329: bool;
var _tmp330: int;
var _tmp331: seq[int];
var _tmp332: bool;
var _tmp333: seq[int];
var _tmp334: bool;
var _tmp335: int;
var _tmp336: seq[int];
var _tmp337: bool;
var _tmp338: int;
var _tmp339: seq[int];
var _tmp340: bool;
var _tmp341: bool;
var _tmp342: int;
var _tmp343: seq[int];
var _tmp344: bool;
var _tmp345: bool;
var _tmp346: bool;
var _tmp347: int;
var _tmp348: seq[int];
var _tmp349: bool;
var _tmp350: int;
var _tmp351: seq[int];
var _tmp352: bool;
var _tmp353: int;
var _tmp354: seq[int];
var _tmp355: bool;
var _tmp356: int;
var _tmp357: seq[int];
var _tmp358: bool;
var _tmp359: map[int, seq[int]];
var _tmp360: seq[int];
var _tmp361: seq[int];
var _tmp362: bool;
var _tmp363: int;
var _tmp364: seq[int];
var _tmp365: bool;
var _tmp366: bool;


M_i = M_F();
;
M_x.0.0 = M_i;
;
_tmp191 = (M_x.0.0 == 0);
;
_tmp192 = (M_x.0.0 == 1);
;
assert (_tmp191 || _tmp192);
;
M_ts.0 = M_i;
;
_tmp193 = (M_ts.0 == 0);
;
_tmp194 = (M_ts.0 == 1);
;
assert (_tmp193 || _tmp194);
;
M_ts.0 = M_i;
;
_tmp195 = (M_ts.0 == 0);
;
_tmp196 = (M_ts.0 == 1);
;
assert (_tmp195 || _tmp196);
;
M_t.0 += (0, 2);
;
M_t.0 += (1, 2);
;
_tmp197 = M_t.0[0];
;
_tmp198 = (_tmp197 == 2);
;
_tmp199 = M_t.0[1];
;
_tmp200 = (_tmp199 == 2);
;
assert (_tmp198 && _tmp200);
;
_tmp201 = M_foo();
;
M_t.0[_tmp201] = (M_i + 5);
;
_tmp202 = M_t.0[0];
;
_tmp203 = (_tmp202 == 2);
;
_tmp204 = M_t.0[1];
;
_tmp205 = (_tmp204 == 5);
;
_tmp206 = M_t.0[1];
;
_tmp207 = (_tmp206 == 6);
;
assert (_tmp203 && (_tmp205 || _tmp207));
;
_tmp208 = (sizeof(M_t.0) == 2);
;
assert _tmp208;
;
M_t.0 += (1, M_i);
;
_tmp209 = M_t.0[0];
;
_tmp210 = (_tmp209 == 2);
;
_tmp211 = M_t.0[1];
;
_tmp212 = (_tmp211 == 0);
;
_tmp213 = M_t.0[1];
;
_tmp214 = (_tmp213 == 1);
;
_tmp215 = M_t.0[2];
;
_tmp216 = (_tmp215 == 5);
;
_tmp217 = M_t.0[2];
;
_tmp218 = (_tmp217 == 6);
;
assert ((_tmp210 && (_tmp212 || _tmp214)) && (_tmp216 || _tmp218));
;
_tmp219 = (sizeof(M_t.0) == 3);
;
assert _tmp219;
;
M_t.0 -= M_i;
;
_tmp220 = (sizeof(M_t.0) == 2);
;
assert _tmp220;
;
_tmp221 = M_t.0[0];
;
_tmp222 = (_tmp221 == 2);
;
_tmp223 = M_t.0[0];
;
_tmp224 = (_tmp223 == 0);
;
_tmp225 = M_t.0[0];
;
_tmp226 = (_tmp225 == 1);
;
_tmp227 = M_t.0[1];
;
_tmp228 = (_tmp227 == 5);
;
_tmp229 = M_t.0[1];
;
_tmp230 = (_tmp229 == 6);
;
assert (((_tmp222 || _tmp224) || _tmp226) && (_tmp228 || _tmp230));
;
_tmp231 = M_foo();
;
M_t.0 -= _tmp231;
;
_tmp232 = (sizeof(M_t.0) == 1);
;
assert _tmp232;
;
_tmp233 = M_t.0[0];
;
_tmp234 = (_tmp233 == 2);
;
_tmp235 = M_t.0[0];
;
_tmp236 = (_tmp235 == 0);
;
_tmp237 = M_t.0[0];
;
_tmp238 = (_tmp237 == 1);
;
assert ((_tmp234 || _tmp236) || _tmp238);
;
M_t.0 += (0, 2);
;
M_t.0 += (1, 4);
;
M_t.0[M_i] = 5;
;
_tmp239 = M_t.0[0];
;
_tmp240 = (_tmp239 == 2);
;
_tmp241 = M_t.0[0];
;
_tmp242 = (_tmp241 == 5);
;
_tmp243 = M_t.0[1];
;
_tmp244 = (_tmp243 == 4);
;
_tmp245 = M_t.0[1];
;
_tmp246 = (_tmp245 == 5);
;
assert ((_tmp240 || _tmp242) && (_tmp244 || _tmp246));
;
M_s += (0, 0);
;
M_s += (1, 1);
;
M_s1 += (0, 2);
;
M_s1 += (1, 3);
;
_tmp247 = default(map[int, seq[int]]);
;
M_t.1 = _tmp247;
;
M_t.1 += (0, M_s);
;
M_t.1 += (1, M_s1);
;
_tmp248 = (sizeof(M_t.1) == 2);
;
assert _tmp248;
;
_tmp249 = M_t.1[0];
;
_tmp250 = (sizeof(_tmp249) == 2);
;
_tmp252 = M_t.1[0];
;
_tmp251 = _tmp252[0];
;
_tmp253 = (_tmp251 == 0);
;
_tmp255 = M_t.1[0];
;
_tmp254 = _tmp255[1];
;
_tmp256 = (_tmp254 == 1);
;
assert ((_tmp250 && _tmp253) && _tmp256);
;
_tmp257 = M_t.1[1];
;
_tmp258 = (sizeof(_tmp257) == 2);
;
_tmp260 = M_t.1[1];
;
_tmp259 = _tmp260[0];
;
_tmp261 = (_tmp259 == 2);
;
_tmp263 = M_t.1[1];
;
_tmp262 = _tmp263[1];
;
_tmp264 = (_tmp262 == 3);
;
assert ((_tmp258 && _tmp261) && _tmp264);
;
M_m += (0, 1);
;
M_m += (1, 2);
;
M_i = M_F();
;
M_m += (2, M_i);
;
_tmp265 = (sizeof(M_m) == 3);
;
_tmp266 = M_m[2];
;
_tmp267 = (_tmp266 == 0);
;
_tmp268 = M_m[2];
;
_tmp269 = (_tmp268 == 1);
;
assert (_tmp265 && (_tmp267 || _tmp269));
;
M_m[3] = 5;
;
M_m[2] = (M_i + 2);
;
_tmp270 = (sizeof(M_m) == 4);
;
assert _tmp270;
;
_tmp271 = M_m[2];
;
_tmp272 = (_tmp271 == 0);
;
_tmp273 = M_m[2];
;
_tmp274 = (_tmp273 == 1);
;
_tmp275 = M_m[2];
;
_tmp276 = (_tmp275 == 2);
;
_tmp277 = M_m[2];
;
_tmp278 = (_tmp277 == 3);
;
assert (((_tmp272 || _tmp274) || _tmp276) || _tmp278);
;
_tmp279 = default(map[int, int]);
;
M_m = _tmp279;
;
M_i = M_F();
;
M_m += (M_i, 0);
;
_tmp280 = (0 in M_m);
;
if(_tmp280)
{

_tmp281 = M_m[0];
;
_tmp282 = (_tmp281 == 0);
;
assert _tmp282;
;
assert (M_m[0] == 0);



}
else
{

;
;
;



}
;
_tmp283 = (1 in M_m);
;
if(_tmp283)
{

_tmp284 = M_m[1];
;
_tmp285 = (_tmp284 == 0);
;
assert _tmp285;
;
assert (M_m[1] == 0);



}
else
{

;
;
;



}
;
_tmp286 = default(map[int, int]);
;
M_m = _tmp286;
;
M_m[M_i] = 2;
;
_tmp287 = (sizeof(M_m) == 1);
;
assert _tmp287;
;
_tmp288 = (0 in M_m);
;
if(_tmp288)
{

_tmp289 = M_m[0];
;
_tmp290 = (_tmp289 == 2);
;
assert _tmp290;
;
assert (M_m[0] == 2);



}
else
{

;
;
;



}
;
_tmp291 = (1 in M_m);
;
if(_tmp291)
{

_tmp292 = M_m[1];
;
_tmp293 = (_tmp292 == 2);
;
assert _tmp293;
;
assert (M_m[1] == 2);



}
else
{

;
;
;



}
;
_tmp294 = default(map[int, seq[int]]);
;
M_t.1 = _tmp294;
;
_tmp295 = default(seq[int]);
;
M_s = _tmp295;
;
_tmp296 = default(seq[int]);
;
M_s1 = _tmp296;
;
M_s += (0, 0);
;
M_s += (1, 1);
;
M_s1 += (0, 2);
;
M_s1 += (1, 3);
;
M_t.1 += (0, M_s);
;
M_i = M_F();
;
M_i = (M_i + 1);
;
_tmp297 = (M_i == 1);
;
_tmp298 = (M_i == 2);
;
assert (_tmp297 || _tmp298);
;
M_t.1 += (M_i, M_s1);
;
_tmp299 = (sizeof(M_t.1) == 2);
;
assert _tmp299;
;
_tmp300 = (M_i == 1);
;
if(_tmp300)
{

_tmp302 = M_t.1[1];
;
_tmp301 = _tmp302[0];
;
_tmp303 = (_tmp301 == 2);
;
_tmp305 = M_t.1[1];
;
_tmp304 = _tmp305[1];
;
_tmp306 = (_tmp304 == 3);
;
assert (_tmp303 && _tmp306);
;
assert ((M_t.1[1][0] == 2) && (M_t.1[1][1] == 3));



}
else
{

;
;
;



}
;
_tmp307 = (M_i == 2);
;
if(_tmp307)
{

_tmp309 = M_t.1[2];
;
_tmp308 = _tmp309[0];
;
_tmp310 = (_tmp308 == 2);
;
_tmp312 = M_t.1[2];
;
_tmp311 = _tmp312[1];
;
_tmp313 = (_tmp311 == 3);
;
assert (_tmp310 && _tmp313);
;
assert ((M_t.1[2][0] == 2) && (M_t.1[2][1] == 3));



}
else
{

;
;
;



}
;
_tmp314 = default(map[int, seq[int]]);
;
M_t.1 = _tmp314;
;
M_t.1 += (0, M_s);
;
M_t.1 += (1, M_s1);
;
_tmp315 = (sizeof(M_t.1) == 2);
;
assert _tmp315;
;
M_t.1 -= 0;
;
_tmp316 = (sizeof(M_t.1) == 1);
;
_tmp318 = M_t.1[1];
;
_tmp317 = _tmp318[0];
;
_tmp319 = (_tmp317 == 2);
;
_tmp321 = M_t.1[1];
;
_tmp320 = _tmp321[1];
;
_tmp322 = (_tmp320 == 3);
;
assert ((_tmp316 && _tmp319) && _tmp322);
;
M_t.1 -= 1;
;
_tmp323 = (sizeof(M_t.1) == 0);
;
assert _tmp323;
;
M_t.1 += (0, M_s);
;
M_t.1 += (1, M_s1);
;
_tmp324 = (sizeof(M_t.1) == 2);
;
_tmp325 = M_t.1[0];
;
_tmp326 = (sizeof(_tmp325) == 2);
;
_tmp328 = M_t.1[0];
;
_tmp327 = _tmp328[0];
;
_tmp329 = (_tmp327 == 0);
;
_tmp331 = M_t.1[0];
;
_tmp330 = _tmp331[1];
;
_tmp332 = (_tmp330 == 1);
;
assert (((_tmp324 && _tmp326) && _tmp329) && _tmp332);
;
_tmp333 = M_t.1[1];
;
_tmp334 = (sizeof(_tmp333) == 2);
;
_tmp336 = M_t.1[1];
;
_tmp335 = _tmp336[0];
;
_tmp337 = (_tmp335 == 2);
;
_tmp339 = M_t.1[1];
;
_tmp338 = _tmp339[1];
;
_tmp340 = (_tmp338 == 3);
;
assert ((_tmp334 && _tmp337) && _tmp340);
;
M_i = M_F();
;
M_t.1 -= M_i;
;
_tmp341 = (sizeof(M_t.1) == 1);
;
assert _tmp341;
;
_tmp343 = keys(M_t.1);
;
_tmp342 = _tmp343[0];
;
M_j = _tmp342;
;
_tmp344 = (M_j == 0);
;
_tmp345 = (M_j == 1);
;
assert (_tmp344 || _tmp345);
;
_tmp346 = (M_j == 0);
;
if(_tmp346)
{

_tmp348 = M_t.1[0];
;
_tmp347 = _tmp348[0];
;
_tmp349 = (_tmp347 == 0);
;
_tmp351 = M_t.1[0];
;
_tmp350 = _tmp351[1];
;
_tmp352 = (_tmp350 == 1);
;
assert (_tmp349 && _tmp352);
;
assert ((M_t.1[0][0] == 0) && (M_t.1[0][1] == 1));



}
else
{

_tmp354 = M_t.1[1];
;
_tmp353 = _tmp354[0];
;
_tmp355 = (_tmp353 == 2);
;
_tmp357 = M_t.1[1];
;
_tmp356 = _tmp357[1];
;
_tmp358 = (_tmp356 == 3);
;
assert (_tmp355 && _tmp358);
;
assert ((M_t.1[1][0] == 2) && (M_t.1[1][1] == 3));



}
;
_tmp359 = default(map[int, seq[int]]);
;
M_t.1 = _tmp359;
;
_tmp360 = default(seq[int]);
;
M_s = _tmp360;
;
_tmp361 = default(seq[int]);
;
M_s1 = _tmp361;
;
M_s += (0, 0);
;
M_s += (1, 1);
;
M_s1 += (0, 2);
;
M_s1 += (1, 3);
;
M_t.1 += (0, M_s);
;
M_t.1 += (1, M_s1);
;
_tmp362 = (sizeof(M_t.1) == 2);
;
assert _tmp362;
;
_tmp364 = keys(M_t.1);
;
_tmp363 = _tmp364[M_i];
;
M_j = _tmp363;
;
_tmp365 = (M_j == 0);
;
_tmp366 = (M_j == 1);
;
assert (_tmp365 || _tmp366);


}
fun M_S_exit0_rand_1886646980()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry36(payload);
}
exit  {
M_S_exit0_rand_1886646980();
}
}
}

