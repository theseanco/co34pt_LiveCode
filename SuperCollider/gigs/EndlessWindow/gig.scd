/*


Samples available

BD  CL  HC  LT  MT  SD
CB  CP  HT  MA  OH  TR808.TXT
CH  CY  LC  MC  RS
MET TEK

*/


~pad1 = Pbind(\instrument,\vplay,\buf,d["PAD"][0],\atk,5,\rel,5,\rel2,10,\dur,90000,\amp,Pwhite(0.1,0.8),\rate,Prand([0.25,0.5,1,1],inf),\pos,Pwhite(0,0.5))

~pad1.stop



~pad2 = Pbind(\instrument,\vplay,\buf,d["PAD"][1],\dur,Pwhite(0.25,1.5).round(0.25),\rel,Pwhite(0.1,0.3),\rel2,Pwhite(0.1,0.3),\amp,Pwhite(0.7,1.2),\pos,Pwhite(0.1,0.9),\rate,Prand([0.5,0.25],inf))

~pad3 = Pbind(\instrument,\vplay,\buf,d["PAD"][1],\dur,Pwhite(0.25,1.5).round(0.25),\rel,Pwhite(0.1,0.3),\rel2,Pwhite(0.1,0.3),\amp,Pwhite(0.7,1.2),\rate,Prand([0.5,0.25],inf),\pos,Pwhite(0.1,0.9))

~pad4 = Pbind(\instrument,\vplay,\buf,d["PAD"][1],\dur,0.125,\rel,Pexprand(0.01,0.1),\rate,Prand([0.5,0.5,0.25],inf),\amp,1,\pos,Pwhite(0.1,0.9))

~shout.stop

~cb.stop

~cl.stop



~pad4.play

~padverb = {FreeVerb.ar(~pad4.ar,Line.kr(0,1,35),0.9,0.5)}

~padverb.stop(20)

p.clock.tempo=1.25

1.25*120

~padverb.play

~pad4.stop



~pad2.stop(120)

~h.play

~pad1.clear

~pad3.stop(30)

~pad1.stop(120)

vp.clock.tempo=1

p.clock.tempo=0.1

~sn = Pbind(\instrument,\bplaym,\dur,Pwhite(1,5),\buf,d["SD"][1],\amp,1)

~bd = Pbind(\instrument,\bplaym,\dur,0.75,\buf,d["BD"][1],\amp,1,\rate,1)

~bd2 = Pbind(\instrument,\bplaym,\dur,0.75,\buf,d["BD"][0],\amp,20,\rate,1)

~bdx = Pbind(\instrument,\bplaym,\buf,d["BD"][0],\dur,0.5,\amp,40)

~lt.play



~bdx.play

~bd2.play

p.clock.tempo=1.52

(
~pad4.play;
~sn.play;
)

~bd.play

~lt.stop

~mt.stop

~ht.stop

~cb = Pbind(\instrument,\bplaym,\buf,d["CB"][0],\dur,0.75,\amp,Prand([1,1,1,0],inf))

~h.play

~cb.play

~h.stop

~k.stop
~k2.stop

~mt.stop

~tek = Pbind(\instrument,\vplay,\buf,d["TEK"][0],\rel,0.1,\dur,Pbjorklund2(Pwhite(1,7),8)/8,\amp,0.4)

~tek.play

~bd.play

~met = Pbind(\instrument,\vplaym,\buf,d["MET"][0],\dur,Pbjorklund2(Pwhite(1,10),8)/8,\amp,Pwhite(0.1,0.4),\rel,0.1,\rate,Prand([2,1.5,2,1],inf))


~bd.stop

~shout = Pbind(\instrument,\bplay,\buf,d["HEY"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,0.2)

~tek.stop

~h.play

~cl = Pbind(\instrument,\bplaym,\buf,d["CP"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,2)

~cl.play

~h.play

~sn = Pbind(\instrument,Prand([\bplaym,\bplaymr,\bplaym,\bplaymr],inf),\dur,Pwhite(0.25,1).round(0.25)/2,\amp,1,\buf,d["SD"][1],\rate,2)

~cl.play

p.clock.tempo=140949584543543345

~ht.stop



(
~mt.stop;
~ht.stop;
~lt.stop;
~h.stop;
~k.stop
~k2.stop
)

~sn.play

~h = Pbind(\instrument,\bplaym,\dur,Prand([0.25,0.125,0.125/2,0.125]/16,inf).stutter(8),\amp,Pwhite(0.8,1.2),\pan,Pwhite(-0.8,0.8),\buf,d["CH"][0],\rate,Pwhite(1,1.8))

p.clock.tempo=1.35

~mt.play

~bd.stop

~shout.play

~met.play

~shout.play


~ht = Pbind(\instrument,\bplaym,\buf,d["HT"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/8,\amp,1)
~mt = Pbind(\instrument,\bplaym,\buf,d["MT"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/8,\amp,1)
~lt = Pbind(\instrument,\bplaym,\buf,d["MT"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/8,\amp,1)

(
~met.stop;
)

~k = Pbind(\instrument,\bplaym,\buf,d["BD"][0],\dur,1,\amp,1.5)

~k.stop

~k2 = Pbind(\instrument,\bplaym,\buf,d["BD"][12],\dur,0.5,\amp,2.5)

~k2.play

d["BD"][12].play


~k3 = Pbind(\instrument,\bplaym,\buf,d["BD"][0],\dur,Pbjorklund2(3,8)/8,\amp,1.5)

~k3.stop

~k3.play

~k.play



(
~ht.stop;
~mt.stop;
~lt.stop;
)

~mt.play

~ht.play

~h.play

~met.play


~bd.play

~sn.play

~

~pad4.play


~pad3.play
~pad2.play





