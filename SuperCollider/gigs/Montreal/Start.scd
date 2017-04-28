/*

Hello from Newcastle, Montreal Algorave!
My name is coï¿¥ï¾¡pt
Thanks to yecto for organising!

Bonjour de Newcastle UK, Montréal Algorave!
Mon nom est coï¿¥ï¾¡pt
Merci à yecto pour l'organisation!

github.com/theseanco
twitter @theseanco
seancotterill.xyz

*/

/*

NOTES:

- Delayed harmonic runs
- Usual up/down/up-up
- Ring1 with unified/divergent rhythm
- ravestabs

*/


s.makeWindow

~rlpfd = { RLPFD.ar(Mix(LFSaw.ar([120, 180], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }
p.fadeTime=5
~rlpfd.play

~sin = {SinOsc.kr(0.01).range(0.01,10.01)}
~rlpfd.set(\speed,~sin)
~rlpfd = {arg speed = 0.5; RLPFD.ar(Mix(LFSaw.ar([120, 180, 60,SinOsc.kr(speed).range(120,600).round(60),SinOsc.kr(speed*1.01).range(120,1200).round(120)], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Prand([1,20,1,1,1,1],inf),32)*0.125,\amp,1);

//A string resonator example, which sounds great
~streson = {arg speed = 0.0001; Streson.ar(LFSaw.ar([220, 180], 0, mul:EnvGen.kr(Env.asr(0.5, 1, 0.02), 1.0) * 0.2), SinOsc.kr(speed).range(0.003,0.9), 0.9, 0.3) }
~streson.play
//modulating the speed
~stresonsine = {SinOsc.kr(0.1).range(0.00001,0.0001)}
~streson.set(\speed,~stresonsine)


~streson.play