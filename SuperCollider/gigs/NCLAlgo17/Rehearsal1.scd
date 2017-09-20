p.clock.tempo = 175/60

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk3 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\amp,1);
~kbk4 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,6,\amp,1);
)



p.clock.tempo = 175/60

~kbk4.play

~kbk3.play



~pianoChop2.stop

d["ah"][0].play;


Quarks.gui

~k.stop;~kbk.play;~kbk2.play;~lsf.play;~pianoChop2.play;~piano2.play;


~pianoChop2.play

~pianoChop.stop


~piano2.stop

~piano.stop

~kbk.stop

~kbk2.stop



~kbk.stop

~lsf.stop
~kbk2.stop

~piano2.stop

~k.play

~pianoChop2.stop

~piano1.play

~pianoChop2.stop

~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,4,\amp,10);


~k.play

~k.stop

~piano1.play
(
~piano1 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,16,\amp,1)
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,1,\rate,0.5)
~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,2)
~pianoChop2 = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.9),\amp,1,\rate,4)
)

~piano2.stop


~lsf.stop;~kbk.stop


Quarks.gui

~pianoChop2.play

~piano2.play

~pianoChop3.stop

~pianoChop3.play



~piano1.play

~pianoChop2.play




~pianoChop.play


~piano2.play
~piano1.play

~lsf.stop

ProxyMixer.new(p)

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),150,1,60)}

~piano1.play

~lsf.play



~kbk2.play