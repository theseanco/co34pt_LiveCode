

(
d["airhorn"][0].play;
~kbk.play;~kbk2.play;~lsf.play;
)

~lsf.stop;~kbk.stop;~kbk2.stop


(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
)

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),200,1,10)}


~lsf.stop;~kbk.stop;~kbk2.stop;

~hpf.play


d["ah"][0].play;~lsf.play;~kbk.play;~kbk2.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,4);
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1,\rate,3);


(
~piano1 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,16,\amp,1);
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,1,\rate,0.5);
)

~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,2)

~pianoChopx = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,Pbjorklund2(Pwhite(1,15),16)/4,\atk,0,\sus,0.1,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,[4,8])


~kbk.stop


~kbk2.stop

~hpf = {BHiPass.ar(Mix.ar([~kbk.ar,~kbk2.ar]),1,1)}

~hpf.play

(
~pianoChop.stop;
~pianoChopx.stop;
~ravestab2.play;
)

~ravestab2.stop

~piano1.stop(10)

~piano2.stop

~kbk.stop;~kbk2.stop;

~lsf.stop



~pianoChopx.play

p.fadeTime = 2

~kbk2.play


~lsf.play

~piano2.play

~k.stop
~oh.stop

~ravestab2.stop

~k.play;~oh.play;

p.clock.tempo = 175/60

~delay.stop
~henon.stop

~ravestab2.play

(
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(6),\amp,1);
~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(6),\amp,1);
~ravestab2xx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq(([50,52,55,57]+24).midicps/120,inf).stutter(6),\amp,1);
)


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,10);

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,1,\amp,3);

~oh.play

~lsf.stop

~k.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,4);



~hpf.play

~ravestab2x.stop


d["ah"][0].play


~kbk2.stop


{10.do{d["ah"][0].play}}.play
~lsf.play;~kbk.play;~kbk2.play;


~hpf.stop#


~ravestab2xx.play


~hpf.stop

~hipass.stop
~lsf.stop

~ravestab2x.play

~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([70,65,59,62].midicps/120,inf).stutter(3),\amp,1.2)


~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,2)

~pianoChop.stop


~kbk2.play




~lsf.stop;~kbk2.stop

~ravestab2.stop;~piano1.play
~piano2.play

~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,2)



~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,2,\rate,2)

~pianoChop.play


d["ah"][0].play


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,3);

~oh = Pbind(\instrument,\bplay,\buf,d["shout"][3],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1,\rate,1.5);


~oh.stop


~k.play

~k.stop

d["ah"][0].play

d["ah"][0].play;~kbk.play;~kbk2.play;~lsf.play;
~lsf.stop
~piano1.fadeTime = 10

~piano2.stop

~kbk.stop

~kbk2.stop






(
~piano1.stop;
~pianoChop.stop;
~ravestab2.play;
)



(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~piano1 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,4000,\amp,4);
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,4,\rate,0.5);
)

~ravestab.stop



~ravestab2.play

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),200,1,10)}


~lsf.play

~ravestab.play



~warp2.clear

~lsf.play

//in transition, Warp1 piano1 at half and quarter speed
//add half and full speed piano 1
//secret sauce
//drums

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),150,1,30)}

~piano2.stop

~kbk.play

~hipass = {BHiPass.ar(Mix.ar([~kbk.ar]),2000,1,1)}

~hipass.stop


~kbk.play


(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
)



(
~kbk = Pbind(instrument,bplay,buf,Prand(d["breaks175"],inf),dur,16,amp,1);
~kbk2 = Pbind(instrument,bplay,buf,Prand(d["breaks175"],inf),dur,Pseq([8,Pseq([16],inf)],inf),amp,1);
)
~pianox.play

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,Pseq([8,Pseq([16],inf)],inf),\amp,1);
~piano = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,16,\amp,1.2);
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,Pwhite(6,8),\amp,1.2,\rate,2);
~pianox = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,1,\rate,0.5);
~piano2 = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\sus,0.05,\rel,0,\rel,0,\amp,2,\rate,Pwhite(2,4).round(2),\pos,Pexprand(0.2,0.9));
)

~piano2.play

~henon.play

~piano.play
~pianox.play

~warp1 = {Warp1.ar(2,d["piano"][1],SinOsc.kr(0.01),0.5,0.5,-1,8,0.1,4,0.5)}
~warp2 = {Warp1.ar(2,d["piano"][1],SinOsc.kr(0.01),0.25,0.5,-1,8,0.1,4,0.5)}

~warp2.play

~warp1.fadeTime = 5

~henon.stop

~delay.clear

~pianox.stop

~piano.stop

~lsf.stop
~kbk2.stop

~piano2.stop

~warp1.play
~pianox.stop

~piano2.stop
//delay
~delaySend = {Mix.ar([~piano2])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.2).range(0.01,1),10)*0.8};
~delay.play;


~piano2.play


~pianox.play

~henon = Pbind(\instrument,\henon,\freq,Pwhite(100,30000),\dur,0.25,\a,Pexprand(1.3,1.9),\b,Pexprand(0.3,0.34),\atk,0,\sus,0,\rel,Pexprand(0.01,0.1),\amp,1);

~henon.play

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),100,1,14)}

~lsf.play

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),100,1,15)}

~lsf.play





