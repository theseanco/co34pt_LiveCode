("/home/smc/src/github/howto_co34pt_liveCode/Setup/Setup.scd").load


//Hello Late Shows :)
//My name is coï¿¥ï¾¡pt

//big s/o to Shelly Knotts - Good luck in oz!


(
~r2 = {80};
~mastermod = {Slew.ar(HenonN.ar(XLine.kr(1,120,300).round(1),LFNoise2.kr(0.1,0.2,1.2),LFNoise2.kr(1,0.15,0.15)),XLine.kr(1,1000,200).round(1),XLine.kr(1,10000,200).round(1))};
~sin = {SinOscFB.ar([(~mastermod*440).round(80)]!2*[1,1.01],0,XLine.kr(0.000001,0.3,1))};
~sin2 = {SinOscFB.ar([(~mastermod*440).round(40)]!2*[1,1.01],0,XLine.kr(0.000001,0.3,2))};
~sin3 = {SinOscFB.ar([(~mastermod*440).round(160)]!2*[1.01,1],0,XLine.kr(0.000001,0.3,40))};
~sin4 = {SinOscFB.ar([(~mastermod*880).round(160)]!2*[1.01,1],0,XLine.kr(0.000001,0.1,80))};
~sin5 = {SinOscFB.ar([(~mastermod*1760).round(320)]!2*[1.01,1.04],0,XLine.kr(0.000001,0.05,200))};
~sin.play;~sin2.play;~sin3.play;~sin4.play;~sin5.play;
)

~sin5.stop(50)

p.fadeTime = 5;

~r2 = {80}
//here's your start
//run these both a few times
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].scramble,inf,Pwhite(0,4).asStream)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10].scramble,inf,Pwhite(0,4).asStream)*Pkr(~r2)*4,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1,\pan,Pwhite(-0.4,0.4));



(
Tdef(\task,{
	loop{
		~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].scramble,inf,Pwhite(0,4).asStream)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10].scramble,inf,Pwhite(0,4).asStream)*Pkr(~r2)*4,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3,\pan,Pwhite(-0.4,0.4));
		rrand(5,20).wait;
}});
)
Tdef(\task).play;


~dfm1 = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01],0,0.1),~r2*4,SinOsc.kr(0.05).range(0.9,1.3),1,0,0.0003,0.9)};








//<3





~dfm1.play


~sinfb4.fadeTime = 10

~sinfb4.play


~sn = Pbind(\instrument,\bplay,\buf,d["s"][2],\dur,2,\amp,2,\rate,1.5);


~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,2);


~shout = Pbind(\instrument,\bplay,\buf,d["shout"][2],\dur,2,\amp,0.5,\rate,1.3);

~dfm1.stop(10)

~sn.play

~shout.play

(
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*1,inf).stutter(3),\amp,1);


~ring1.play

~r2 = {LFNoise1.kr(40).range(1000,6000)}

~t.stop

~c2.stop


~h.stop


~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,2);

~sn.play




~k.stop

~sinfb1.clear

~oh.stop

p.clock.tempo = 175/60


(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk3 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\amp,1);
~kbk4 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,1,\amp,1);
~kbk5 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,0.5,\amp,1);
~kbk6 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,0.1,\amp,1);
~kbk7 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,0.01,\amp,1);
)

~kbk7.play

~kbk6.play

~kbk5.play

~lsf.play

~kbk4.play

~kbk3.play


~k.stop



~lsf.play

~k.play


~hipass = {HPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),1200,0.9)}







~hipass.play

~strings.stop(5)

p.fadeTime = 0


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~k.play



~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*1,inf).stutter(3),\amp,0.6)
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*1,inf).stutter(3),\amp,0.6)


~hipass.play


~k.stop
~hipass.stop

d["ah"][0].play;~kbk.play;~kbk2.play;~lsf.play;

~lsf.stop

~hipass.play

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),200,1,8)}



(
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(6),\amp,1);~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(6),\amp,1);~ravestab2xx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq(([50,52,55,57]+12).midicps/120,inf).stutter(6),\amp,1);
)

~lsf.stop


~ravestab2xx.stop(160)


~ravestab2xx.play

~ravestab2x.play
~ravestab.stop

~ravestab2.play

~hpf.play

~shout.stop

~sn.stop

~strings = Pbind(\instrument,\bplay,\buf,d["strings"][0],\dur,10,\rate,2.5,\amp,2)



~strings.play

~sinfb4.stop

p.clock.tempo = 2.49

~k.play

~r2 = {XLine.kr(2000,4000,40)}

~ring1.stop

(
~sinfb1.play;
~sinfb2.play;
~sinfb3.play;
~sinfb2.play;
~ring1.play;
)

~c.stop

p.clock.tempo = 2.4

~sinfb4.stop

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1,\rate,4);


//how do i do a techno



~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1,\rate,1.5,\pan,1);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,1.6,\pan,-1);





~k.stop

~c2.play


~c.play


~oh.play

~h.play

~h.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(3,8)/4,\amp,1);

p.fadeTime = 2

~t.play

~c.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,2);

~sinfb3.play

~sinfb2.play

~sinfb2.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,1);

~k.play

~k.play

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1,\rate,3);


~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\amp,Pexprand(0.5,1),\rate,2);

~h.play

~oh.play

~ring1 = Pbind(\instrument,\ring1,\f,(Pwrand([1,2],[0.8,0.2],inf)*Pkr(~r2)),\dur,0.25,\d,Pexprand(0.21,0.4),\a,Pexprand(1,400),\pan,0,\amp,0.8);

~ring1.play

p.clock.tempo = 2.1

~ring1.play

(
~sin1 = {arg min = 0.2, max = 1.5; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb.set(\fb,~sin1);
)


(
~ring1.stop;
~k.stop;
~h.stop;
~oh.stop;
)


~h.play



~sin2.clear

(
~sin2 = {arg min = 0.2, max = 1.5; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb2.set(\fb,~sin2);
)

~sin3.clear

(
~sin3 = {arg min = 0.2, max = 1.5; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb3.set(\fb,~sin3);
)

(
~sin4 = {arg min = 0.2, max = 1.5; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb4.set(\fb,~sin4);
)


//big s/o to Shelly Knotts - Good luck in oz!


//big s/o to Shelly Knotts - Good luck in oz!


//big s/o to Shelly Knotts - Good luck in oz!    