~warp = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01),1,0.2,-1,8,0.02,4,0.3)}

~warp.play

{PlayBuf.ar(2,d["rhodes"][0])}.play

(
~warpEnv = {var env = EnvGen.ar(Env.perc(0.01,0.5,0.1),Impulse.kr(LFNoise1.kr(0.1).range(0.5,4)),1,0,1,0);
	Pan2.ar(FreeVerb.ar(Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01)+env,2,0.2,-1,32,0.01,4,env*4),0.33,0.9,0.5,2),LFNoise1.kr(0.1,0.7))}
)

~c = Pbind(\instrument,\bplay,\buf,d["crev"][0],\dur,Pwhite(20,40),\amp,0.5);



~c.play

s.record

~synth.stop

~verb.fadeTime = 10

~warpEnv.play

~warper = {Warp1.ar(2,d["rhodes"][0],LFNoise0.kr(LFNoise1.kr(0.1).range(0.1,10)),2,0.3,-1,16,0.0,4,LFNoise1.kr(0.1).range(0.01,0.3))}

~synth = {Pan2.ar(SoundIn.ar(0))}

~synth.play

(
~verb = {
	var chans = [~warper.ar,~warper2.play,SoundIn.ar(0)];
	FreeVerb.ar(Mix.ar(Splay.ar(chans,0)),1,0.7,0.5,1).flat}
)


~verb.play
~synth = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.33,0.7,0.5))}

~verb.play

~warper.play

~warper2 = {Warp1.ar(2,d["rhodes"][0],LFNoise0.kr(LFNoise1.kr(0.1).range(0.5,10)),4,0.2,-1,8,0.02,4,LFNoise1.kr(0.1).range(0.01,0.3))}
~warper2.play

~warper2.play
~sn.stop

~warper.play

~warpEnv.play

~warp3.play

~warpEnv.play
~warp.play

~warp2 = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.05),2,0.2,-1,8,0.01,4,0.3)}

~warp3 = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01),0.5,0.2,-1,8,0.03,4,0.3)}

~warp3.play

p.fadeTime = 10

~warplin = Pbind(\instrument,\lplay,\buf,d["rhodes"][0],\dur,120,\amp,0.2)

~warplin.play

~warp.stop(10)

~warp4 = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.1).unipolar,4,0.2,-1,8,0.1,4,0.6)}




~warp4.play

~warp3.play

~dfm1 = {HPF.ar(DFM1.ar(SinOscFB.ar([34.midicps,34.midicps+LFNoise1.kr(0.1,2)],{SinOsc.kr(rrand(0.001,0.002)).range(0.2,10.8)}!2,SinOsc.kr(0.1).range(0.1,1)),[46.midicps,46.midicps+LFNoise1.kr(0.1,2),SinOsc.kr(0.1).range(0.2,0.5)],SinOsc.kr(0.001).range(0.1,1.2),1,0,0.004,0.25),50)}

p.fadeTime = 10

~dfm1.play

~synth.play

36.midicps

FreqScope.new

~dfm1.play

	46.midicps*1.01

//rhodes samples are around Bb minor, MIDI note 46 (http://www.electronics.dit.ie/staff/tscarff/Music_technology/midi/midi_note_numbers_for_octaves.htm)

StageLimiter.deactivate

~warpEnv.play

~warp.play

~warp2.play

~warp3.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pwhite(7,15),\amp,0.5);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][1],\dur,Pwhite(7,15),\amp,0.5);
~k3 = Pbind(\instrument,\bplay,\buf,d["k"][9],\dur,Pwhite(7,15),\amp,0.8);

~k3.play

~sn = Pbind(\instrument,\bplay,\buf,d["srev"][0],\dur,Pwhite(15,30),\amp,0.5,\pan,Pwhite(-1.0,1.0));
~k.play

~sn.play
s.stopRecording

s.makeWindow

~synth = {Pan2.ar(CombC.ar(SoundIn.ar(0)))}

~synth.play

~sn.play

~k.play