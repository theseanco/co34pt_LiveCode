/*

hello, my name is coï¿¥ï¾¡pt

*/

// s1
(
s = Scale.chromatic(\et53);
~r = {0};
~r2 = {100};
)


//s2 - rings initially divergent and then in unison
(
l = Pbjorklund2(Pwhite(1,10),16)/4;
Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,s,\root,Pkr(~r),\degree,0,\octave,4,\dur,l,\d,0.6,\a,Pwhite(1,5),\pan,0,\amp,0.5);
)


//s2.5 starting background drones in order to lay 100hz root
(
~dfm1 = {DFM1.ar(SinOsc.ar([~r2,~r2+1],0,0.1),~r2*2,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};
)


//s3 sines on harmonic series
(
~sinfb =coï¿¥ï¾¡p Pbind(\instrument,\sinfb,\freq,Pseq((1..10),inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1);
)


//s3.5 modulation
(
~mod1 = {SinOsc.kr(0.1).range(0.01,1.01)};
~r2 = {SinOsc.kr(0.1).range(100,110)};
)
