
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
var Tmp173: bool;


Tmp173 = $;
if(Tmp173)
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
var Tmp174: bool;
var Tmp175: bool;
var Tmp176: bool;
var Tmp177: bool;
var Tmp178: bool;
var Tmp179: bool;
var Tmp180: int;
var Tmp181: bool;
var Tmp182: int;
var Tmp183: bool;
var Tmp184: int;
var Tmp185: int;
var Tmp186: bool;
var Tmp187: int;
var Tmp188: bool;
var Tmp189: int;
var Tmp190: bool;
var Tmp191: bool;
var Tmp192: int;
var Tmp193: bool;
var Tmp194: int;
var Tmp195: bool;
var Tmp196: int;
var Tmp197: bool;
var Tmp198: int;
var Tmp199: bool;
var Tmp200: int;
var Tmp201: bool;
var Tmp202: bool;
var Tmp203: bool;
var Tmp204: int;
var Tmp205: bool;
var Tmp206: int;
var Tmp207: bool;
var Tmp208: int;
var Tmp209: bool;
var Tmp210: int;
var Tmp211: bool;
var Tmp212: int;
var Tmp213: bool;
var Tmp214: int;
var Tmp215: bool;
var Tmp216: int;
var Tmp217: bool;
var Tmp218: int;
var Tmp219: bool;
var Tmp220: int;
var Tmp221: bool;
var Tmp222: int;
var Tmp223: bool;
var Tmp224: int;
var Tmp225: bool;
var Tmp226: int;
var Tmp227: bool;
var Tmp228: int;
var Tmp229: bool;
var Tmp230: map[int, seq[int]];
var Tmp231: bool;
var Tmp232: seq[int];
var Tmp233: bool;
var Tmp234: int;
var Tmp235: seq[int];
var Tmp236: bool;
var Tmp237: int;
var Tmp238: seq[int];
var Tmp239: bool;
var Tmp240: seq[int];
var Tmp241: bool;
var Tmp242: int;
var Tmp243: seq[int];
var Tmp244: bool;
var Tmp245: int;
var Tmp246: seq[int];
var Tmp247: bool;
var Tmp248: bool;
var Tmp249: int;
var Tmp250: bool;
var Tmp251: int;
var Tmp252: bool;
var Tmp253: bool;
var Tmp254: int;
var Tmp255: bool;
var Tmp256: int;
var Tmp257: bool;
var Tmp258: int;
var Tmp259: bool;
var Tmp260: int;
var Tmp261: bool;
var Tmp262: map[int, int];
var Tmp263: bool;
var Tmp264: int;
var Tmp265: bool;
var Tmp266: bool;
var Tmp267: int;
var Tmp268: bool;
var Tmp269: map[int, int];
var Tmp270: bool;
var Tmp271: bool;
var Tmp272: int;
var Tmp273: bool;
var Tmp274: bool;
var Tmp275: int;
var Tmp276: bool;
var Tmp277: map[int, seq[int]];
var Tmp278: seq[int];
var Tmp279: seq[int];
var Tmp280: bool;
var Tmp281: bool;
var Tmp282: bool;
var Tmp283: bool;
var Tmp284: int;
var Tmp285: seq[int];
var Tmp286: bool;
var Tmp287: int;
var Tmp288: seq[int];
var Tmp289: bool;
var Tmp290: bool;
var Tmp291: int;
var Tmp292: seq[int];
var Tmp293: bool;
var Tmp294: int;
var Tmp295: seq[int];
var Tmp296: bool;
var Tmp297: map[int, seq[int]];
var Tmp298: bool;
var Tmp299: bool;
var Tmp300: int;
var Tmp301: seq[int];
var Tmp302: bool;
var Tmp303: int;
var Tmp304: seq[int];
var Tmp305: bool;
var Tmp306: bool;
var Tmp307: bool;
var Tmp308: seq[int];
var Tmp309: bool;
var Tmp310: int;
var Tmp311: seq[int];
var Tmp312: bool;
var Tmp313: int;
var Tmp314: seq[int];
var Tmp315: bool;
var Tmp316: seq[int];
var Tmp317: bool;
var Tmp318: int;
var Tmp319: seq[int];
var Tmp320: bool;
var Tmp321: int;
var Tmp322: seq[int];
var Tmp323: bool;
var Tmp324: bool;
var Tmp325: int;
var Tmp326: seq[int];
var Tmp327: bool;
var Tmp328: bool;
var Tmp329: bool;
var Tmp330: int;
var Tmp331: seq[int];
var Tmp332: bool;
var Tmp333: int;
var Tmp334: seq[int];
var Tmp335: bool;
var Tmp336: int;
var Tmp337: seq[int];
var Tmp338: bool;
var Tmp339: int;
var Tmp340: seq[int];
var Tmp341: bool;
var Tmp342: map[int, seq[int]];
var Tmp343: seq[int];
var Tmp344: seq[int];
var Tmp345: bool;
var Tmp346: int;
var Tmp347: seq[int];
var Tmp348: bool;
var Tmp349: bool;


M_i = M_F();
M_x.0.0 = M_i;
Tmp174 = (M_x.0.0 == 0);
Tmp175 = (M_x.0.0 == 1);
assert (Tmp174 || Tmp175);
M_ts.0 = M_i;
Tmp176 = (M_ts.0 == 0);
Tmp177 = (M_ts.0 == 1);
assert (Tmp176 || Tmp177);
M_ts.0 = M_i;
Tmp178 = (M_ts.0 == 0);
Tmp179 = (M_ts.0 == 1);
assert (Tmp178 || Tmp179);
M_t.0 += (0, 2);
M_t.0 += (1, 2);
Tmp180 = M_t.0[0];
Tmp181 = (Tmp180 == 2);
Tmp182 = M_t.0[1];
Tmp183 = (Tmp182 == 2);
assert (Tmp181 && Tmp183);
Tmp184 = M_foo();
M_t.0[Tmp184] = (M_i + 5);
Tmp185 = M_t.0[0];
Tmp186 = (Tmp185 == 2);
Tmp187 = M_t.0[1];
Tmp188 = (Tmp187 == 5);
Tmp189 = M_t.0[1];
Tmp190 = (Tmp189 == 6);
assert (Tmp186 && (Tmp188 || Tmp190));
Tmp191 = (sizeof(M_t.0) == 2);
assert Tmp191;
M_t.0 += (1, M_i);
Tmp192 = M_t.0[0];
Tmp193 = (Tmp192 == 2);
Tmp194 = M_t.0[1];
Tmp195 = (Tmp194 == 0);
Tmp196 = M_t.0[1];
Tmp197 = (Tmp196 == 1);
Tmp198 = M_t.0[2];
Tmp199 = (Tmp198 == 5);
Tmp200 = M_t.0[2];
Tmp201 = (Tmp200 == 6);
assert ((Tmp193 && (Tmp195 || Tmp197)) && (Tmp199 || Tmp201));
Tmp202 = (sizeof(M_t.0) == 3);
assert Tmp202;
M_t.0 -= M_i;
Tmp203 = (sizeof(M_t.0) == 2);
assert Tmp203;
Tmp204 = M_t.0[0];
Tmp205 = (Tmp204 == 2);
Tmp206 = M_t.0[0];
Tmp207 = (Tmp206 == 0);
Tmp208 = M_t.0[0];
Tmp209 = (Tmp208 == 1);
Tmp210 = M_t.0[1];
Tmp211 = (Tmp210 == 5);
Tmp212 = M_t.0[1];
Tmp213 = (Tmp212 == 6);
assert (((Tmp205 || Tmp207) || Tmp209) && (Tmp211 || Tmp213));
Tmp214 = M_foo();
M_t.0 -= Tmp214;
Tmp215 = (sizeof(M_t.0) == 1);
assert Tmp215;
Tmp216 = M_t.0[0];
Tmp217 = (Tmp216 == 2);
Tmp218 = M_t.0[0];
Tmp219 = (Tmp218 == 0);
Tmp220 = M_t.0[0];
Tmp221 = (Tmp220 == 1);
assert ((Tmp217 || Tmp219) || Tmp221);
M_t.0 += (0, 2);
M_t.0 += (1, 4);
M_t.0[M_i] = 5;
Tmp222 = M_t.0[0];
Tmp223 = (Tmp222 == 2);
Tmp224 = M_t.0[0];
Tmp225 = (Tmp224 == 5);
Tmp226 = M_t.0[1];
Tmp227 = (Tmp226 == 4);
Tmp228 = M_t.0[1];
Tmp229 = (Tmp228 == 5);
assert ((Tmp223 || Tmp225) && (Tmp227 || Tmp229));
M_s += (0, 0);
M_s += (1, 1);
M_s1 += (0, 2);
M_s1 += (1, 3);
Tmp230 = default(map[int, seq[int]]);
M_t.1 = Tmp230;
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
Tmp231 = (sizeof(M_t.1) == 2);
assert Tmp231;
Tmp232 = M_t.1[0];
Tmp233 = (sizeof(Tmp232) == 2);
Tmp235 = M_t.1[0];
Tmp234 = Tmp235[0];
Tmp236 = (Tmp234 == 0);
Tmp238 = M_t.1[0];
Tmp237 = Tmp238[1];
Tmp239 = (Tmp237 == 1);
assert ((Tmp233 && Tmp236) && Tmp239);
Tmp240 = M_t.1[1];
Tmp241 = (sizeof(Tmp240) == 2);
Tmp243 = M_t.1[1];
Tmp242 = Tmp243[0];
Tmp244 = (Tmp242 == 2);
Tmp246 = M_t.1[1];
Tmp245 = Tmp246[1];
Tmp247 = (Tmp245 == 3);
assert ((Tmp241 && Tmp244) && Tmp247);
M_m += (0, 1);
M_m += (1, 2);
M_i = M_F();
M_m += (2, M_i);
Tmp248 = (sizeof(M_m) == 3);
Tmp249 = M_m[2];
Tmp250 = (Tmp249 == 0);
Tmp251 = M_m[2];
Tmp252 = (Tmp251 == 1);
assert (Tmp248 && (Tmp250 || Tmp252));
M_m[3] = 5;
M_m[2] = (M_i + 2);
Tmp253 = (sizeof(M_m) == 4);
assert Tmp253;
Tmp254 = M_m[2];
Tmp255 = (Tmp254 == 0);
Tmp256 = M_m[2];
Tmp257 = (Tmp256 == 1);
Tmp258 = M_m[2];
Tmp259 = (Tmp258 == 2);
Tmp260 = M_m[2];
Tmp261 = (Tmp260 == 3);
assert (((Tmp255 || Tmp257) || Tmp259) || Tmp261);
Tmp262 = default(map[int, int]);
M_m = Tmp262;
M_i = M_F();
M_m += (M_i, 0);
Tmp263 = (0 in M_m);
if(Tmp263)
{

Tmp264 = M_m[0];
Tmp265 = (Tmp264 == 0);
assert Tmp265;

}
else
{

;


}

Tmp266 = (1 in M_m);
if(Tmp266)
{

Tmp267 = M_m[1];
Tmp268 = (Tmp267 == 0);
assert Tmp268;

}
else
{

;


}

Tmp269 = default(map[int, int]);
M_m = Tmp269;
M_m[M_i] = 2;
Tmp270 = (sizeof(M_m) == 1);
assert Tmp270;
Tmp271 = (0 in M_m);
if(Tmp271)
{

Tmp272 = M_m[0];
Tmp273 = (Tmp272 == 2);
assert Tmp273;

}
else
{

;


}

Tmp274 = (1 in M_m);
if(Tmp274)
{

Tmp275 = M_m[1];
Tmp276 = (Tmp275 == 2);
assert Tmp276;

}
else
{

;


}

Tmp277 = default(map[int, seq[int]]);
M_t.1 = Tmp277;
Tmp278 = default(seq[int]);
M_s = Tmp278;
Tmp279 = default(seq[int]);
M_s1 = Tmp279;
M_s += (0, 0);
M_s += (1, 1);
M_s1 += (0, 2);
M_s1 += (1, 3);
M_t.1 += (0, M_s);
M_i = M_F();
M_i = (M_i + 1);
Tmp280 = (M_i == 1);
Tmp281 = (M_i == 2);
assert (Tmp280 || Tmp281);
M_t.1 += (M_i, M_s1);
Tmp282 = (sizeof(M_t.1) == 2);
assert Tmp282;
Tmp283 = (M_i == 1);
if(Tmp283)
{

Tmp285 = M_t.1[1];
Tmp284 = Tmp285[0];
Tmp286 = (Tmp284 == 2);
Tmp288 = M_t.1[1];
Tmp287 = Tmp288[1];
Tmp289 = (Tmp287 == 3);
assert (Tmp286 && Tmp289);

}
else
{

;


}

Tmp290 = (M_i == 2);
if(Tmp290)
{

Tmp292 = M_t.1[2];
Tmp291 = Tmp292[0];
Tmp293 = (Tmp291 == 2);
Tmp295 = M_t.1[2];
Tmp294 = Tmp295[1];
Tmp296 = (Tmp294 == 3);
assert (Tmp293 && Tmp296);

}
else
{

;


}

Tmp297 = default(map[int, seq[int]]);
M_t.1 = Tmp297;
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
Tmp298 = (sizeof(M_t.1) == 2);
assert Tmp298;
M_t.1 -= 0;
Tmp299 = (sizeof(M_t.1) == 1);
Tmp301 = M_t.1[1];
Tmp300 = Tmp301[0];
Tmp302 = (Tmp300 == 2);
Tmp304 = M_t.1[1];
Tmp303 = Tmp304[1];
Tmp305 = (Tmp303 == 3);
assert ((Tmp299 && Tmp302) && Tmp305);
M_t.1 -= 1;
Tmp306 = (sizeof(M_t.1) == 0);
assert Tmp306;
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
Tmp307 = (sizeof(M_t.1) == 2);
Tmp308 = M_t.1[0];
Tmp309 = (sizeof(Tmp308) == 2);
Tmp311 = M_t.1[0];
Tmp310 = Tmp311[0];
Tmp312 = (Tmp310 == 0);
Tmp314 = M_t.1[0];
Tmp313 = Tmp314[1];
Tmp315 = (Tmp313 == 1);
assert (((Tmp307 && Tmp309) && Tmp312) && Tmp315);
Tmp316 = M_t.1[1];
Tmp317 = (sizeof(Tmp316) == 2);
Tmp319 = M_t.1[1];
Tmp318 = Tmp319[0];
Tmp320 = (Tmp318 == 2);
Tmp322 = M_t.1[1];
Tmp321 = Tmp322[1];
Tmp323 = (Tmp321 == 3);
assert ((Tmp317 && Tmp320) && Tmp323);
M_i = M_F();
M_t.1 -= M_i;
Tmp324 = (sizeof(M_t.1) == 1);
assert Tmp324;
Tmp326 = keys(M_t.1);
Tmp325 = Tmp326[0];
M_j = Tmp325;
Tmp327 = (M_j == 0);
Tmp328 = (M_j == 1);
assert (Tmp327 || Tmp328);
Tmp329 = (M_j == 0);
if(Tmp329)
{

Tmp331 = M_t.1[0];
Tmp330 = Tmp331[0];
Tmp332 = (Tmp330 == 0);
Tmp334 = M_t.1[0];
Tmp333 = Tmp334[1];
Tmp335 = (Tmp333 == 1);
assert (Tmp332 && Tmp335);

}
else
{

Tmp337 = M_t.1[1];
Tmp336 = Tmp337[0];
Tmp338 = (Tmp336 == 2);
Tmp340 = M_t.1[1];
Tmp339 = Tmp340[1];
Tmp341 = (Tmp339 == 3);
assert (Tmp338 && Tmp341);

}

Tmp342 = default(map[int, seq[int]]);
M_t.1 = Tmp342;
Tmp343 = default(seq[int]);
M_s = Tmp343;
Tmp344 = default(seq[int]);
M_s1 = Tmp344;
M_s += (0, 0);
M_s += (1, 1);
M_s1 += (0, 2);
M_s1 += (1, 3);
M_t.1 += (0, M_s);
M_t.1 += (1, M_s1);
Tmp345 = (sizeof(M_t.1) == 2);
assert Tmp345;
Tmp347 = keys(M_t.1);
Tmp346 = Tmp347[M_i];
M_j = Tmp346;
Tmp348 = (M_j == 0);
Tmp349 = (M_j == 1);
assert (Tmp348 || Tmp349);
}
fun M_S_exit0_rand_677250147()
{


;

}start 
 state M_S
{
entry  {
M_S_entry36();
}
exit  {
M_S_exit0_rand_677250147();
}
}
}

