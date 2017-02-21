/*


Samples available

BD  CL  HC  LT  MT  SD
CB  CP  HT  MA  OH  TR808.TXT
CH  CY  LC  MC  RS

*/

e = Pbjorklund2

~one[0] = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\dur,Pbjorklund2(3,8)/8,\amp,1,\rate,Pseq([1,1,1,1.2,1,1],inf))
~one2 = Pbind(\instrument,\bplaym,\buf,d["BD"][7],\dur,0.5,\amp,130,\rate,Pseq([1,1.2],inf))

~one22 = Pbind(\instrument,\bplaym,\buf,d["BD"][7],\dur,0.75/2,\amp,50,\rate,Pseq([0.8,1,0.9],inf))
~one[1] = Pbind(\instrument,\bplaym,\buf,d["BD"][3],\dur,Pbjorklund2(3,8)/8,\amp,1,\rate,Pseq([1,1,1,1.2,1,1]*3,inf))
~one2.play

~one22.play

~one.stop

~cb = Pbind(\instrument,\bplaym,\buf,d["CB"][0],\dur,0.75*3,\amp,1,\rate,Pseq([1,1,1,1.1,1.2,1.3],inf))

~cb.stop

~cb.play


~one[1].play

~hat = Pbind(\instrument,\bplaym,\buf,d["CH"][0],\dur,Prand([0.25,0.125,0.125/2],inf).stutter(8),\amp,1)

~hat2 = Pbind(\instrument,\bplaym,\buf,d["RS"][1],\dur,Pwhite(1,8),\amp,1)

~hat2.play

~sn = Pbind(\instrument,\bplaym,\dur,Pseq([0.5,Pseq([1],16),0.5],inf),\buf,Prand(d["CP"],inf).stutter(16),\amp,1)

~sn2 = Pbind(\instrument,\bplaym,\dur,Pbjorklund2(Prand([3,3,9,3,3,7],inf),16)/8,\buf,d["SD"][3],\amp,4)


~one2.stop

~t.stop

~t[0] = Pbind(\instrument,\bplaym,\dur,Pbjorklund2(Pwhite(1,9),16)/8,\buf,d["MT"][1],\amp,1)
~t[1] = Pbind(\instrument,\bplaym,\dur,Pbjorklund2(Pwhite(1,9),16)/8,\buf,d["LT"][1],\amp,1)
~t[2] = Pbind(\instrument,\bplaym,\dur,Pbjorklund2(Pwhite(1,9),16)/8,\buf,d["HT"][0],\amp,1)

s.makeWindow

~t.play

~one.play

~sn2.play

p.clock.tempo = 1.39


~sn.play


~hat.play