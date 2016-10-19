(
~willleft = {Pan2.ar(DelayC.ar(HPF.ar(SoundIn.ar,100),5,5,1),-1)};
~willright = {Pan2.ar(DelayC.ar(HPF.ar(SoundIn.ar,100),10,10,1),1)};
~willleft.play;
~willright.play;
)

{SoundIn.ar(0)}.play

(
c.fader1.onChanged = {|val| "Will Left Volume".post; ~willleft.vol=val.linlin(0,127,0,1.5).postln;};
c.fader2.onChanged = {|val| "Will Right Volume".post; ~willright.vol=val.linlin(0,127,0,1.5).postln;};
)

//if you don't have the controller available
ProxyMixer.new(p);


{SinOsc.ar([440,550],0,0.1)}.play

//


MIDIFunc.trace