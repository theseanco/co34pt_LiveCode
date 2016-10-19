/*

Cheat sheet for sample playing

Drums:
k = kick
kld = loud kick
h = hat
c = clap
t = tom
s = snare
dsn = dry snare

Percussion
p1 = breathy pitched hit
808 = 808 kicks
8h = 808 hats

MELODIC ELEMENTS
m1 = slow delay hit
m2 = gratuitous square wave
ork = orchestra

Vocals
woo = woo
bounce = bounce
chant = misc chanting, DJ Mustard etc.

*/

~one = Pbind(\instrument,\bplay,\buf,Pwrand(d["k"],[0.8,0,0,0.2],inf),\dur,Pbjorklund2(3,8)/4,\amp,1)

~two = Pbind(\instrument,\bplay,\buf,d["808"][0],\dur,Pbjorklund2(Pwhite(1,6),8),\amp,1)

~three = Pbind(\instrument,\bplay,\buf,d["c"][0],\rate,3,\amp,1,\dur,Pbjorklund2(3,8)/4)