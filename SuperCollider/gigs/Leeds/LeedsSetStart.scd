/*

Hello Leeds!

My name is coï¿¥ï¾¡pt!

s/o to Ryan, Joanne, ODI and all visualists <3

github.com/theseanco
@theseanco
seancotterill.xyz

*/

~rlpfd.play

(
~chords = Pbind(\instrument,\bpfsaw,
	\dur,Pwhite(4.5,15.0,inf),
	\scale,Scale.minor,
	\degree,Pwrand([[0,2,4],[3,5,7],[4,6,8]],[0.5,0.25,0.25],inf),
	\cfmin,100,
	\cfmax,1500,
	\rqmin,Pexprand(0.02,0.15,inf),
	\atk,Pwhite(2.0,4.5,inf),
	\rel,Pwhite(6.5,10.0,inf),
	\ldb,6,
	\lsf,1000,
	\octave,Pwrand([4,3,5],[0.6,0.3,0.1],inf),
	\amp,Pwhite(0.8,2.0),
	\out,0);
~chords.play
)

(
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pexprand(0.01,1));
~sin = {SinOsc.kr(0.1).range(0.01,1.4)};
)

(
d[\scale] = Scale.chromatic(\et53);
l = Pbjorklund2(Pwhite(1,13),16)/4;
~r = {0};
~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,4,\degree,0,\dur,l,\amp,0.3,\fb,0.1,\rel,0.3);
)


~sinfb.play
~sinfb.set(\fb,~sin)
