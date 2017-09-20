l = Buffer.read(s,"/home/~smc/Documents/Samples/TidalSamples/breaks/270313__dee-vigga__dv-amen-break-175bpm.wav")
l.play

//synthdef i started with
(
SynthDef(\lplay,
	{arg out = 0, buf = 0, rate = 1, amp = 0.5, pan = 0, pos = 0, rel=15;
		var sig,env ;
		sig = Mix.ar(PlayBuf.ar(2,buf,BufRateScale.ir(buf) * rate,1,BufDur.kr(buf)*pos*44100,doneAction:2));
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,Pan2.ar(sig,pan));
}).add;
)


~one = Pbind(\instrument,\lplay,\buf,l,\dur,(l.numFrames/s.sampleRate)*p.clock.tempo/1.2,\rate,1.2)
~one.play

~one.play

//this seems to work
~one = Pbind(\instrument,\lplay,\buf,l,\dur,(l.numFrames/s.sampleRate)*p.clock.tempo/1.3714285714286,\rate,1.3714285714286)
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~k.play
~one.play

Buffer

// I am trying to work out how to get samples to loop seamlessly in SuperCollider without


//this tells you how many beats a sample occupies
l = Buffer.read(s,"/home/smc/Documents/Samples/TidalSamples/breaks/looperman-l-0767706-0074678-loonygoon1-killa-dnb-loop-175-bpm.wav")
(l.numFrames/s.sampleRate)*p.clock.tempo

//I then need to scale that to a specific number of beats somehow
// (l.numFrames/s.sampleRate)*p.clock.tempo = l at rate 1
// (l.numFrames/s.sampleRate)*p.clock.tempo/1.12 = l at rate 1.12


// I need to work out what I need to divide this by to get a certain number of beats. I then need to convert that to a rate
q = (l.numFrames/s.sampleRate)*p.clock.tempo

//i need to do 'find x as a percentage of y'
// Equation: Y = P% * X
// Where Y is 10 (number beats we want), X is 10.971... (l.numFrames/s.sampleRate)*p.clock.tempo

(l.numFrames/s.sampleRate)*p.clock.tempo/8

//this seems to work, now how do i get the thing to fuckin' work
~one = Pbind(\instrument,\lplay,\buf,l,\dur,(l.numFrames/s.sampleRate)*p.clock.tempo/1.3714285714286,\rate,1.3714285714286)
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

(l.numFrames/s.sampleRate)*p.clock.tempo/dur

~one.play


//now adding that equation
//A SynthDef that will automatically scale and loop samples by duration value. Does also pitch the sample accordingly.
//This is very useful when in 'roughly' the right tempo for loops, but not quite able to sync tempo to loops directly or loops are all of slightly different tempo
(
SynthDef(\lplay,
	{arg out = 0, buf = d["k"][0], rate = 1, amp = 0.5, pan = 0, pos = 0, rel=15, dur = 8;
		var sig,env ;
		sig = Mix.ar(PlayBuf.ar(2,buf,BufRateScale.ir(buf) * ((BufFrames.ir(buf)/s.sampleRate)*p.clock.tempo/dur),1,BufDur.kr(buf)*pos*44100,doneAction:2));
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,Pan2.ar(sig,pan));
}).add;
)


~one = {Pan2.ar(SoundIn.ar(0))}

~k2 = Pbind(\instrument,\lplay,\buf,d["k"][4],\dur,4.5,\amp,1)
~k2.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1/3*2,\amp,0.5);
~k.play