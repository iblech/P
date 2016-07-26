
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
var Tmp218: bool;


;

Tmp218 = $;
if(Tmp218)
{

;

return (0);

}
else
{

;

return (1);

}

}
fun M_foo(): int
{


;

return (1);
}
fun M_S_entry36(M_S_entry36__payload_0: null)
{
var Tmp219: bool;
var Tmp220: bool;
var Tmp221: bool;
var Tmp222: bool;
var Tmp223: bool;
var Tmp224: bool;
var Tmp225: int;
var Tmp226: bool;
var Tmp227: int;
var Tmp228: bool;
var Tmp229: int;
var Tmp230: int;
var Tmp231: bool;
var Tmp232: int;
var Tmp233: bool;
var Tmp234: int;
var Tmp235: bool;
var Tmp236: bool;
var Tmp237: int;
var Tmp238: bool;
var Tmp239: int;
var Tmp240: bool;
var Tmp241: int;
var Tmp242: bool;
var Tmp243: int;
var Tmp244: bool;
var Tmp245: int;
var Tmp246: bool;
var Tmp247: bool;
var Tmp248: bool;
var Tmp249: int;
var Tmp250: bool;
var Tmp251: int;
var Tmp252: bool;
var Tmp253: int;
var Tmp254: bool;
var Tmp255: int;
var Tmp256: bool;
var Tmp257: int;
var Tmp258: bool;
var Tmp259: int;
var Tmp260: bool;
var Tmp261: int;
var Tmp262: bool;
var Tmp263: int;
var Tmp264: bool;
var Tmp265: int;
var Tmp266: bool;
var Tmp267: int;
var Tmp268: bool;
var Tmp269: int;
var Tmp270: bool;
var Tmp271: int;
var Tmp272: bool;
var Tmp273: int;
var Tmp274: bool;
var Tmp275: map[int, seq[int]];
var Tmp276: bool;
var Tmp277: seq[int];
var Tmp278: bool;
var Tmp279: int;
var Tmp280: seq[int];
var Tmp281: bool;
var Tmp282: int;
var Tmp283: seq[int];
var Tmp284: bool;
var Tmp285: seq[int];
var Tmp286: bool;
var Tmp287: int;
var Tmp288: seq[int];
var Tmp289: bool;
var Tmp290: int;
var Tmp291: seq[int];
var Tmp292: bool;
var Tmp293: bool;
var Tmp294: int;
var Tmp295: bool;
var Tmp296: int;
var Tmp297: bool;
var Tmp298: bool;
var Tmp299: int;
var Tmp300: bool;
var Tmp301: int;
var Tmp302: bool;
var Tmp303: int;
var Tmp304: bool;
var Tmp305: int;
var Tmp306: bool;
var Tmp307: map[int, int];
var Tmp308: bool;
var Tmp309: int;
var Tmp310: bool;
var Tmp311: bool;
var Tmp312: int;
var Tmp313: bool;
var Tmp314: map[int, int];
var Tmp315: bool;
var Tmp316: bool;
var Tmp317: int;
var Tmp318: bool;
var Tmp319: bool;
var Tmp320: int;
var Tmp321: bool;
var Tmp322: map[int, seq[int]];
var Tmp323: seq[int];
var Tmp324: seq[int];
var Tmp325: bool;
var Tmp326: bool;
var Tmp327: bool;
var Tmp328: bool;
var Tmp329: int;
var Tmp330: seq[int];
var Tmp331: bool;
var Tmp332: int;
var Tmp333: seq[int];
var Tmp334: bool;
var Tmp335: bool;
var Tmp336: int;
var Tmp337: seq[int];
var Tmp338: bool;
var Tmp339: int;
var Tmp340: seq[int];
var Tmp341: bool;
var Tmp342: map[int, seq[int]];
var Tmp343: bool;
var Tmp344: bool;
var Tmp345: int;
var Tmp346: seq[int];
var Tmp347: bool;
var Tmp348: int;
var Tmp349: seq[int];
var Tmp350: bool;
var Tmp351: bool;
var Tmp352: bool;
var Tmp353: seq[int];
var Tmp354: bool;
var Tmp355: int;
var Tmp356: seq[int];
var Tmp357: bool;
var Tmp358: int;
var Tmp359: seq[int];
var Tmp360: bool;
var Tmp361: seq[int];
var Tmp362: bool;
var Tmp363: int;
var Tmp364: seq[int];
var Tmp365: bool;
var Tmp366: int;
var Tmp367: seq[int];
var Tmp368: bool;
var Tmp369: bool;
var Tmp370: int;
var Tmp371: seq[int];
var Tmp372: bool;
var Tmp373: bool;
var Tmp374: bool;
var Tmp375: int;
var Tmp376: seq[int];
var Tmp377: bool;
var Tmp378: int;
var Tmp379: seq[int];
var Tmp380: bool;
var Tmp381: int;
var Tmp382: seq[int];
var Tmp383: bool;
var Tmp384: int;
var Tmp385: seq[int];
var Tmp386: bool;
var Tmp387: map[int, seq[int]];
var Tmp388: seq[int];
var Tmp389: seq[int];
var Tmp390: bool;
var Tmp391: int;
var Tmp392: seq[int];
var Tmp393: bool;
var Tmp394: bool;


;

M_i = M_F();
;

M_x.0.0 = M_i;
;

Tmp219 = (M_x.0.0 == 0);
Tmp220 = (M_x.0.0 == 1);
assert (Tmp219 || Tmp220);
;

M_ts.0 = M_i;
;

Tmp221 = (M_ts.0 == 0);
Tmp222 = (M_ts.0 == 1);
assert (Tmp221 || Tmp222);
;

M_ts.0 = M_i;
;

Tmp223 = (M_ts.0 == 0);
Tmp224 = (M_ts.0 == 1);
assert (Tmp223 || Tmp224);
;

M_t.0 += (0, 2);
;

M_t.0 += (1, 2);
;

Tmp225 = M_t.0[0];
Tmp226 = (Tmp225 == 2);
Tmp227 = M_t.0[1];
Tmp228 = (Tmp227 == 2);
assert (Tmp226 && Tmp228);
;

Tmp229 = M_foo();
M_t.0[Tmp229] = (M_i + 5);
;

Tmp230 = M_t.0[0];
Tmp231 = (Tmp230 == 2);
Tmp232 = M_t.0[1];
Tmp233 = (Tmp232 == 5);
Tmp234 = M_t.0[1];
Tmp235 = (Tmp234 == 6);
assert (Tmp231 && (Tmp233 || Tmp235));
;

Tmp236 = (sizeof(M_t.0) == 2);
assert Tmp236;
;

M_t.0 += (1, M_i);
;

Tmp237 = M_t.0[0];
Tmp238 = (Tmp237 == 2);
Tmp239 = M_t.0[1];
Tmp240 = (Tmp239 == 0);
Tmp241 = M_t.0[1];
Tmp242 = (Tmp241 == 1);
Tmp243 = M_t.0[2];
Tmp244 = (Tmp243 == 5);
Tmp245 = M_t.0[2];
Tmp246 = (Tmp245 == 6);
assert ((Tmp238 && (Tmp240 || Tmp242)) && (Tmp244 || Tmp246));
;

Tmp247 = (sizeof(M_t.0) == 3);
assert Tmp247;
;

M_t.0 -= M_i;
;

Tmp248 = (sizeof(M_t.0) == 2);
assert Tmp248;
;

Tmp249 = M_t.0[0];
Tmp250 = (Tmp249 == 2);
Tmp251 = M_t.0[0];
Tmp252 = (Tmp251 == 0);
Tmp253 = M_t.0[0];
Tmp254 = (Tmp253 == 1);
Tmp255 = M_t.0[1];
Tmp256 = (Tmp255 == 5);
Tmp257 = M_t.0[1];
Tmp258 = (Tmp257 == 6);
assert (((Tmp250 || Tmp252) || Tmp254) && (Tmp256 || Tmp258));
;

Tmp259 = M_foo();
M_t.0 -= Tmp259;
;

Tmp260 = (sizeof(M_t.0) == 1);
assert Tmp260;
;

Tmp261 = M_t.0[0];
Tmp262 = (Tmp261 == 2);
Tmp263 = M_t.0[0];
Tmp264 = (Tmp263 == 0);
Tmp265 = M_t.0[0];
Tmp266 = (Tmp265 == 1);
assert ((Tmp262 || Tmp264) || Tmp266);
;

M_t.0 += (0, 2);
;

M_t.0 += (1, 4);
;

M_t.0[M_i] = 5;
;

Tmp267 = M_t.0[0];
Tmp268 = (Tmp267 == 2);
Tmp269 = M_t.0[0];
Tmp270 = (Tmp269 == 5);
Tmp271 = M_t.0[1];
Tmp272 = (Tmp271 == 4);
Tmp273 = M_t.0[1];
Tmp274 = (Tmp273 == 5);
assert ((Tmp268 || Tmp270) && (Tmp272 || Tmp274));
;

M_s += (0, 0);
;

M_s += (1, 1);
;

M_s1 += (0, 2);
;

M_s1 += (1, 3);
;

Tmp275 = default(map[int, seq[int]]);
M_t.1 = Tmp275;
;

M_t.1 += (0, M_s);
;

M_t.1 += (1, M_s1);
;

Tmp276 = (sizeof(M_t.1) == 2);
assert Tmp276;
;

Tmp277 = M_t.1[0];
Tmp278 = (sizeof(Tmp277) == 2);
Tmp280 = M_t.1[0];
Tmp279 = Tmp280[0];
Tmp281 = (Tmp279 == 0);
Tmp283 = M_t.1[0];
Tmp282 = Tmp283[1];
Tmp284 = (Tmp282 == 1);
assert ((Tmp278 && Tmp281) && Tmp284);
;

Tmp285 = M_t.1[1];
Tmp286 = (sizeof(Tmp285) == 2);
Tmp288 = M_t.1[1];
Tmp287 = Tmp288[0];
Tmp289 = (Tmp287 == 2);
Tmp291 = M_t.1[1];
Tmp290 = Tmp291[1];
Tmp292 = (Tmp290 == 3);
assert ((Tmp286 && Tmp289) && Tmp292);
;

M_m += (0, 1);
;

M_m += (1, 2);
;

M_i = M_F();
;

M_m += (2, M_i);
;

Tmp293 = (sizeof(M_m) == 3);
Tmp294 = M_m[2];
Tmp295 = (Tmp294 == 0);
Tmp296 = M_m[2];
Tmp297 = (Tmp296 == 1);
assert (Tmp293 && (Tmp295 || Tmp297));
;

M_m[3] = 5;
;

M_m[2] = (M_i + 2);
;

Tmp298 = (sizeof(M_m) == 4);
assert Tmp298;
;

Tmp299 = M_m[2];
Tmp300 = (Tmp299 == 0);
Tmp301 = M_m[2];
Tmp302 = (Tmp301 == 1);
Tmp303 = M_m[2];
Tmp304 = (Tmp303 == 2);
Tmp305 = M_m[2];
Tmp306 = (Tmp305 == 3);
assert (((Tmp300 || Tmp302) || Tmp304) || Tmp306);
;

Tmp307 = default(map[int, int]);
M_m = Tmp307;
;

M_i = M_F();
;

M_m += (M_i, 0);
;

Tmp308 = (0 in M_m);
if(Tmp308)
{

;

Tmp309 = M_m[0];
Tmp310 = (Tmp309 == 0);
assert Tmp310;

}
else
{

;

;


}

;

Tmp311 = (1 in M_m);
if(Tmp311)
{

;

Tmp312 = M_m[1];
Tmp313 = (Tmp312 == 0);
assert Tmp313;

}
else
{

;

;


}

;

Tmp314 = default(map[int, int]);
M_m = Tmp314;
;

M_m[M_i] = 2;
;

Tmp315 = (sizeof(M_m) == 1);
assert Tmp315;
;

Tmp316 = (0 in M_m);
if(Tmp316)
{

;

Tmp317 = M_m[0];
Tmp318 = (Tmp317 == 2);
assert Tmp318;

}
else
{

;

;


}

;

Tmp319 = (1 in M_m);
if(Tmp319)
{

;

Tmp320 = M_m[1];
Tmp321 = (Tmp320 == 2);
assert Tmp321;

}
else
{

;

;


}

;

Tmp322 = default(map[int, seq[int]]);
M_t.1 = Tmp322;
;

Tmp323 = default(seq[int]);
M_s = Tmp323;
;

Tmp324 = default(seq[int]);
M_s1 = Tmp324;
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

Tmp325 = (M_i == 1);
Tmp326 = (M_i == 2);
assert (Tmp325 || Tmp326);
;

M_t.1 += (M_i, M_s1);
;

Tmp327 = (sizeof(M_t.1) == 2);
assert Tmp327;
;

Tmp328 = (M_i == 1);
if(Tmp328)
{

;

Tmp330 = M_t.1[1];
Tmp329 = Tmp330[0];
Tmp331 = (Tmp329 == 2);
Tmp333 = M_t.1[1];
Tmp332 = Tmp333[1];
Tmp334 = (Tmp332 == 3);
assert (Tmp331 && Tmp334);

}
else
{

;

;


}

;

Tmp335 = (M_i == 2);
if(Tmp335)
{

;

Tmp337 = M_t.1[2];
Tmp336 = Tmp337[0];
Tmp338 = (Tmp336 == 2);
Tmp340 = M_t.1[2];
Tmp339 = Tmp340[1];
Tmp341 = (Tmp339 == 3);
assert (Tmp338 && Tmp341);

}
else
{

;

;


}

;

Tmp342 = default(map[int, seq[int]]);
M_t.1 = Tmp342;
;

M_t.1 += (0, M_s);
;

M_t.1 += (1, M_s1);
;

Tmp343 = (sizeof(M_t.1) == 2);
assert Tmp343;
;

M_t.1 -= 0;
;

Tmp344 = (sizeof(M_t.1) == 1);
Tmp346 = M_t.1[1];
Tmp345 = Tmp346[0];
Tmp347 = (Tmp345 == 2);
Tmp349 = M_t.1[1];
Tmp348 = Tmp349[1];
Tmp350 = (Tmp348 == 3);
assert ((Tmp344 && Tmp347) && Tmp350);
;

M_t.1 -= 1;
;

Tmp351 = (sizeof(M_t.1) == 0);
assert Tmp351;
;

M_t.1 += (0, M_s);
;

M_t.1 += (1, M_s1);
;

Tmp352 = (sizeof(M_t.1) == 2);
Tmp353 = M_t.1[0];
Tmp354 = (sizeof(Tmp353) == 2);
Tmp356 = M_t.1[0];
Tmp355 = Tmp356[0];
Tmp357 = (Tmp355 == 0);
Tmp359 = M_t.1[0];
Tmp358 = Tmp359[1];
Tmp360 = (Tmp358 == 1);
assert (((Tmp352 && Tmp354) && Tmp357) && Tmp360);
;

Tmp361 = M_t.1[1];
Tmp362 = (sizeof(Tmp361) == 2);
Tmp364 = M_t.1[1];
Tmp363 = Tmp364[0];
Tmp365 = (Tmp363 == 2);
Tmp367 = M_t.1[1];
Tmp366 = Tmp367[1];
Tmp368 = (Tmp366 == 3);
assert ((Tmp362 && Tmp365) && Tmp368);
;

M_i = M_F();
;

M_t.1 -= M_i;
;

Tmp369 = (sizeof(M_t.1) == 1);
assert Tmp369;
;

Tmp371 = keys(M_t.1);
Tmp370 = Tmp371[0];
M_j = Tmp370;
;

Tmp372 = (M_j == 0);
Tmp373 = (M_j == 1);
assert (Tmp372 || Tmp373);
;

Tmp374 = (M_j == 0);
if(Tmp374)
{

;

Tmp376 = M_t.1[0];
Tmp375 = Tmp376[0];
Tmp377 = (Tmp375 == 0);
Tmp379 = M_t.1[0];
Tmp378 = Tmp379[1];
Tmp380 = (Tmp378 == 1);
assert (Tmp377 && Tmp380);

}
else
{

;

Tmp382 = M_t.1[1];
Tmp381 = Tmp382[0];
Tmp383 = (Tmp381 == 2);
Tmp385 = M_t.1[1];
Tmp384 = Tmp385[1];
Tmp386 = (Tmp384 == 3);
assert (Tmp383 && Tmp386);

}

;

Tmp387 = default(map[int, seq[int]]);
M_t.1 = Tmp387;
;

Tmp388 = default(seq[int]);
M_s = Tmp388;
;

Tmp389 = default(seq[int]);
M_s1 = Tmp389;
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

Tmp390 = (sizeof(M_t.1) == 2);
assert Tmp390;
;

Tmp392 = keys(M_t.1);
Tmp391 = Tmp392[M_i];
M_j = Tmp391;
;

Tmp393 = (M_j == 0);
Tmp394 = (M_j == 1);
assert (Tmp393 || Tmp394);
return;
}
fun M_S_exit0_rand_661832295(M_S_exit0_rand_661832295__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry36(payload);
}exit {
M_S_exit0_rand_661832295(null);
}}
}

