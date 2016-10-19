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
chant = misc chanting

*/

~one = Pbind(\instrument,\bplay,\buf,Pwrand(d["k"],[0.8,0,0,0.2],inf),\dur,Pbjorklund2(3,8)/4,\amp,1)

~two = Pbind(\instrument,\bplay,\buf,d["808"][0],\dur,Pbjorklund2(Pwhite(1,6),8),\amp,1)

~three = Pbind(\instrument,\bplay,\buf,d["c"][0],\rate,3,\amp,1,\dur,Pbjorklund2(3,8)/4)

~three.play

~one.play


p.clock.tempo=170/60

~four = Pbind(\instrument,\vplay,\buf,Prand(d["808"],inf),\dur,Pbjorklund2(Pwhite(1,6),16)/4,\rate,2,\amp,1,\rel,0.1,\rel2,0.01)

~kickmaster = Pbind(\instrument,\bplay,\buf,d["k"][0],\amp,5)

~kickmaster.play

~mel = Pbind(\instrument,\vplay,\buf,d["m1"][0],\amp,0.8,\rel,Pexprand(0.05,0.7),\rel2,0.01,\dur,Pwhite(0.25,3.5).round(0.5))


~mel2 = Pbind(\instrument,\vplay,\buf,d["m1"][4],\amp,0.8,\rel,Pexprand(0.05,0.7),\rel2,0.01,\dur,Pwhite(0.25,3.5).round(0.5))

~three.stop

~mel3 = Pbind(\instrument,\vplay,\buf,Prand(d["m2"],inf).stutter(Pwhite(1,7).asStream),\amp,0.8,\rel,Pexprand(0.05,0.7),\rel2,0.01,\dur,Pwhite(0.25,3.5).round(0.25))

~mel4 = Pbind(\instrument,\vplay,\buf,Pseq(d["p1"],inf).stutter(Pexprand(1,5).asInt.asStream),\dur,Pbjorklund2(Pwhite(1,7),8)/4,\amp,1,\rel,0.1,\rel2,0.05)

// (
~mel.play;
~mel2.play;
~mel4.play;
)

~ride = Pbind(\instrument,\vplay,\buf,d["rd"][0],\amp,2,\rel,0.4)

~ride.

p.clock.tempo=165/60

~right = Pbind(\instrument,\vplay,\buf,Pseq([d["808"][0],d["808"][3]],inf),\dur,Pbjorklund2(3,8)/4,\amp,7,\rel,0.3,\rel2,0.01,\rate,Pseq([1,1,2,2,2,2,3],inf).stutter(6))

~right.stop

~woo = Pbind(\instrument,\vplay,\buf,d["woo"][0],\dur,4,\amp,1)

~woo.play

~bounce = Pbind(\instrument,\bplay,\buf,d["bounce"][0],\dur,Pseq([0.5,Pseq([2],inf)],inf),\amp,2)

~bounce.play

d["808"][3].play

~hats.play

~right.stop

~mel4.play

~two.play

~four.play

~three.play


~snare = Pbind(\instrument,\bplay,\buf,d["dsn"][0],\dur,Pwhite(1,5),\amp,9,\rate,1.5)

~snare.play

~hats = Pbind(\instrument,\bplay,\buf,d["8h"][0],\dur,0.25,\rate,1,\amp,Pexprand(0.7,1),\pan,Pwhite(0.1,-0.5))





~hats.play


~mel3.play


~mel.play

~four.play

~three.play

~two.play



p.clock.tempo=170/60

~one.play

~master.play


~master = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(Pseq([3,3,3,8],inf),8)/4,\amp,4,\rate,1)