//kick
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

//clap
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);

//hat
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pexprand(0.05,1));

//snare
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);

//ravepiano
(
~piano1 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,16,\amp,1);
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,1,\rate,0.5);
)

//pianochop
~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,2)


//ravestabs
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*1,inf).stutter(3),\amp,1)


//ravedrums
(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
)

//pianostabs
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(6),\amp,1);


//e8
Pbjorklund2(3,8)/4

//e16
Pbjorklund2(3,16)/4

//sinfbscale
Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,4,\degree,0,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3);

//sinfbf
Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5],inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3);

//ring1
Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,4,\dur,1,\d,0.6,\a,1,\pan,0,\amp,0.5);

//ring1f
Pbind(\instrument,\ring1,\f,Pkr(~r2),\dur,1,\d,0.6,\a,1,\pan,0,\amp,0.5);

//clap
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);

//lsf
~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),200,1,10)};

//hipass
~hipass = {HPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),1200,0.6)};

//delay

//delay
~delaySend = {Mix.ar([~one])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,p.clock.tempo/16,1)};
~delay.play;

//verb

//delay
~reverbSend = {Mix.ar([~one])};
~reverb = {arg size = 10, time = 5, damping = 0.5, spread = 15, dry = 0, amp = 0.8; GVerb.ar(Mix.ar([~reverbSend.ar]),size,time,damping,0.5,spread,dry,mul:amp)}
~reverb.play;
