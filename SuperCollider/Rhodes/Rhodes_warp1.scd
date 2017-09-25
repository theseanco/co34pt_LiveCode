~warp = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01),1,0.2,-1,8,0.02,4,0.3)}

(
~warpEnv = {var env = EnvGen.ar(Env.perc(0.01,0.5,0.1),Impulse.kr(LFNoise1.kr(0.1).range(0.5,4)),1,0,1,0);
	FreeVerb.ar(Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01)+env,2,0.2,-1,32,0.01,4,env*4),0.33,0.9,0.5,2)}
)

~warpEnv.play
~warp.play

~warp2 = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.05),2,0.2,-1,8,0.01,4,0.3)}

~warp3 = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01),0.5,0.2,-1,8,0.03,4,0.3)}


~warp4 = {Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.1).unipolar,4,0.2,-1,8,0.1,4,0.6)}




~warp4.play

~warp3.play

~dfm1 = {HPF.ar(DFM1.ar(SinOscFB.ar([34.midicps,34.midicps+LFNoise1.kr(0.1,2)],{SinOsc.kr(rrand(0.001,0.002)).range(0.2,10.8)}!2,SinOsc.kr(0.1).range(0.1,1)),[46.midicps,46.midicps+LFNoise1.kr(0.1,2),SinOsc.kr(0.1).range(0.2,0.5)],SinOsc.kr(0.001).range(0.1,1.2),1,0,0.004,0.25),50)}

p.fadeTime = 10

~dfm1.play

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

~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,4,\amp,1);

~k.play