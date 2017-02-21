d["PAD"][0].play

~pad1 = Pbind(\instrument,\vplay,\buf,d["PAD"][0],\atk,5,\rel,5,\rel2,10,\dur,Pwhite(1,3),\amp,1,\rate,Prand([0.125,0.25,0.25,0.5,1,1,1,1.01],inf))
~pad2.play

~pad1.play

~pad2 = Pbind(\instrument,\vplay,\buf,d["PAD"][1],\rel,Pexprand(0.1,1),\pos,Pwhite(0.01,0.7),\dur,Pwhite(0.25,1).round(0.25)/2,\rel2,Pexprand(0.000000001,0.5),\amp,Pwhite(0.1,1.5),\rate,Pwrand([1,1.5,2],[0.6,0.3,0.1],inf))

~pad3 = Pbind(\instrument,\vplay,\buf,d["PAD"][1],\rel,Pexprand(0.05,0.2),\pos,Pwhite(0.01,0.7),\dur,0.125,\amp,Pwhite(0.1,1.5),\rate,Pwrand([1,1.5,2]*2,[0.6,0.3,0.1],inf))

~sn = Pbind(\instrument,\bplaym,\buf,d["SD"][0],\amp,100)
~sn1 = Pbind(\instrument,\bplaym,\buf,d["SD"][1],\amp,1)
~sn2 = Pbind(\instrument,\bplaym,\buf,d["SD"][2],\amp,1)
~sn3 = Pbind(\instrument,\bplaym,\buf,d["SD"][3],\amp,1)
~sn4 = Pbind(\instrument,\bplaym,\buf,d["SD"][4],\amp,1)

~sn.stop
~pad1.stop(80)

~k = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\dur,4/4,\amp,1)
~k2 = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\dur,5/4,\amp,1,\rate,1.5)
~k3 = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\dur,7/4,\amp,1,\rate,2)

~mt = Pbind(\instrument,\bplaym,\buf,d["HT"][1],\dur,(3/2)/4,\amp,4)
~ht = Pbind(\instrument,\bplaym,\buf,d["MT"][1],\dur,Pbjorklund2(3,8)/8,\amp,4)

~k4 = Pbind(\instrument,\bplaym,\buf,d["BD"][2],\amp,300,\dur,0.5)

(
~k.play;
~k2.play;
~k3.play;
~k4.play;
)

p.clock.tempo=1.15


~k2.play

~ht.play

~mt.play

p.clock.tempo=1

~k3.play
~k2.play

~h = Pbind(\instrument,\bplaym,\buf,d["CH"][0],\dur,0.125,\amp,Pwhite(0.5,1),\rate,Pwhite(1,1.2))

~h.play

~k.play

(
~sn1.stop;
~sn2.stop;
~sn3.stop;
~sn4.stop;
)

~cp.clear
~sn4.play

d["SD"][11].play

~clp.play
~pad3.play

~pad2.play

