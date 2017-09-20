/*

Sample handler

I need an array of samples with allotted lengths in their respective tempi

I also need a numerical array of those alloted lengths

Then i'll set up a Pkey which contains the number of the sample that's being played, which will be used on both the buffer reading within the folder array, and also the duration of the sample, and this will automatically scale them.

Science.

Loops could do with a low shelf on them

Keys:

ravepiano = 16
butthead = 32

*/

("/home/smc/src/github/howto_co34pt_liveCode/Setup/Setup.scd").load

d[\tambo] = Buffer.read(s,"/home/smc/Downloads/219269__radiopassiveboy__tambourine-loop-80bpm.wav")
d[\onesixty] = Buffer.read(s,"/home/smc/Downloads/43536__mkoenig__ultra-dnb-loop-160bpm.wav")
d[\ravepiano] = Buffer.read(s,"/home/smc/Downloads/looperman-l-1264531-0076076-arixxonsc-keys-grace-addons-d-f.wav")
d[\darkpiano] = Buffer.read(s,"/home/smc/Downloads/looperman-l-1351931-0089651-bradyp1-simple-piano-melody.wav")
d[\loop1] = Buffer.read(s,"/home/smc/Downloads/175BPM Breaks/looperman-l-1048767-0078069-buffalonugaluss-butthead.wav")


//calculation:

//sample rate
d[\loop1].sampleRate
//samples
d[\loop1].numFrames

//number of beats in d[\loop1] assuming it is at 175BPM
d[\loop1].numFrames/d[\loop1].sampleRate/(60/175)

d[\breaks175len] = Array.new

d["breaks175"][9].play

d["breaks175"].size

d[\breaks157Len] = Array.new


//why doesn't this work?
(
d[\breaks175Len] = List.new;
d[\breaks175Len].add(d["breaks175"][0].numFrames/d["breaks175"][0].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][1].numFrames/d["breaks175"][1].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][2].numFrames/d["breaks175"][2].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][3].numFrames/d["breaks175"][3].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][4].numFrames/d["breaks175"][4].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][5].numFrames/d["breaks175"][5].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][6].numFrames/d["breaks175"][6].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][7].numFrames/d["breaks175"][7].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][8].numFrames/d["breaks175"][8].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][9].numFrames/d["breaks175"][9].sampleRate/(60/175));
d[\breaks175Len].add(d["breaks175"][10].numFrames/d["breaks175"][10].sampleRate/(60/175));
)

~k = Pbind(\instrument,\bplay,\patternNum,Pwhite(0,5).asStream,\buf,d["breaks175"][7],\dur,d[\breaks175Len][2],\amp,1);

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,Pseq([8,Pseq([16],inf)],inf),\amp,1);
)

~kbk2.play



p.clock.tempo = 175/60

~kbk2.play

~kbkx = Pbind(\instrument,\bplay,\buf,d["breaks175"][3],\dur,d[\breaks175Len][3],\amp,1);

~kbk.stop

~ravestab.stop

~lsf.play

//delay
~delaySend = {Mix.ar([~k.ar])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,0.1,10)};
~delay.play;


~delay.clear

~kbkx.play

~kbk.play

~lsf = {LowShelf.ar(Mix.ar([~kbkx.ar]),200,1,14)}



~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*1,inf).stutter(3),\amp,1,\rel,0.15)
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,10),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*2,inf).stutter(3),\amp,1)

~ravestab2.play

~lsf.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,10);

~sn.play

~kbk.play
~lsf.play

p.clock.tempo = 175/60

~k = Pbind(\instrument,\bplay,\buf,d["piano"][0],\dur,16,\amp,1);
~k3 = Pbind(\instrument,\bplay,\buf,d["piano"][0],\dur,32,\amp,1,\rate,0.5);
~k2 = Pbind(\instrument,\bplay,\buf,d["piano"][0],\dur,7,\amp,1,\rate,2);

~k.play

~kbk.play

~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.chromatic,\octave,[3,4],\degree,Pseq([\Dm].chordProg,inf),\dur,Pwhite(4,8),\amp,0.3,\fb,0.1,\rel,3,\atk,3);

~sinfb.play

~sinfb.set(\fb,~sin)
q



~sin = {SinOsc.kr(0.1).range(0.01,1.21)}

~lsf.play

~sinfb.play


~sn.stop

~k3.stop

~sinfb.stop

~kbk.play

~k3.play

~k2.play



d[\breaks175Len][6]

~k2.play




~ravestab2.play
(
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*0.5,inf).stutter(3),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1],inf).stutter(3),\amp,1);
)



~ravestab2.play

~k.play

d.keys

p.clock.tempo = 175/60


~k.play

~k = Pbind(\instrument,\bplaym,\buf,d[\tambo],\dur,16.5,\amp,1);
~k2 = Pbind(\instrument,\bplay,\buf,d[\darkpiano],\dur,16,\amp,1);
~k2x = Pbind(\instrument,\bplay,\buf,d[\darkpiano],\dur,16,\amp,1);
~k4 = Pbind(\instrument,\bplay,\buf,d[\darkpiano],\dur,8,\amp,1,\rate,2);
~k4x = Pbind(\instrument,\bplay,\buf,d[\darkpiano],\dur,4,\amp,1,\rate,4);
~k3 = Pbind(\instrument,\bplay,\buf,d[\loop1],\dur,32,\amp,1);



//delay
~delaySend = {Mix.ar([~k2])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.3).range(0.01,0.9),1)};
~delay.play;


~delay.fadeTime=2

~k2.stop

(
~k4.stop;
~k4x.stop;
~k2.play;
)





~reverb.stop(10)

~k.stop


s.makeWindow

~k4x.play

~reverb.play


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,10);




~k.play

~k2.stop

~k3.play



~lsf.play


p.fadeTime = 0

~k3.play

~k2.play

~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1],inf).stutter(3),\amp,1)

~ravestab.stop



//delay
~shiftSend = {Mix.ar([~ravestab])};
~pitchShift = {PitchShift.ar(NumChannels.ar([~shiftSend]),0.05,0.5,0,0,1)}
~pitchShift.clear;



//delay
~reverbSend = {Mix.ar([~k4.ar,~k4x.ar])};
~reverb = {arg size = 10, time = 5, damping = 0.5, spread = 15, dry = 0, amp = 0.8; FreeVerb.ar(~reverbSend.ar,1,1,0.1,1)}
~reverb.play;

	~reverb.clear

~shiftSend.clear

~k.stop

~k.play

~k2.play

p.clock.tempo = 175/60