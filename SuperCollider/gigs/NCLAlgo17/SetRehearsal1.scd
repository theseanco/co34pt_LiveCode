("/home/smc/src/github/howto_co34pt_liveCode/Setup/Setup.scd").load


(
// running this block will take some time!

var whole, whole_text;

d[\data] = ();

whole=FileReader.read("/home/smc/Documents/Data/AlgoraveData/data/androgen-receptor/st1/trajectory.pdb", skipBlanks:true);


whole = whole.select{|itm, i| itm[2] == "CA" }; // find the CA as this is the centre position of each 'element(?)'
whole = whole.collect{|itm, i| itm = itm[1..8]; }; // just keep the useful bits of the data

whole_text = whole.collect{|itm, i| itm[2..3]}; // new array with just the text columns

whole = whole.collect{|itm, i| itm[3..].asFloat }; // new array with just the numerical data converted to floats

whole = whole.collect{|itm, i| itm = itm.insert(0, whole_text[i]); }; // put the text back into the float array

whole = whole.clump(251); // group the data by frame

d[\data].x_model = whole[0].collect{|itm| itm[3] }; // make a new array which is only the x coordinates of the whole model in the first frame
d[\data].x_traj = whole.flop[0].collect{|itm| itm[3] }; // make a new array which is only the x coordinates of the first residue over time
)

d[\data].bass = d[\data].x_model.linlin(d[\data].x_model.minItem, d[\data].x_model.maxItem, 40, 200);  // map the data to a good range for pitch values
d[\data].melody = d[\data].x_model.linlin(d[\data].x_model.minItem, d[\data].x_model.maxItem, 100, 2000);  // map the data to a good range for pitch values

p.clock.tempo = 2.2
p.fadeTime = 2


/*

Hellaw Newcassel!

My name is coï¿¥ï¾¡pt.

I will be making some music for you today.

s/o to hellocatfood <3

*/




/*

Start set with intermittent molecular bass
Add tone clusters

ravestabs into molecularbass
add molecular sines
end in madness

*/

(
~sines = Pbind(\instrument,\sinfb,\atk,3,\rel,3,\dur,Pseq([0,0,0,6],inf),\freq,Pseq(d[\data].melody,inf).round(45),\amp,0.1);
~sin = {SinOsc.kr(0.1).range(0.01,1.5)};
~sines.set(\fb,~sin);
)

(
l = Pbjorklund2(Pseq([3,6,9,11,2,5,7,3,4,9,10,2,6,4].scramble,inf),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/3,inf),\dur,0.25,\d,0.21,\a,Pwhite(1,600),\pan,0,\amp,1);
~ring2 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/4,inf),\dur,l,\d,0.26,\a,Pwhite(1,400),\pan,0,\amp,0.8);
~ring3 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass,inf),\dur,l,\d,0.3,\a,Pwhite(1,60),\pan,0,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass*2,inf),\dur,l,\d,0.21,\a,Pwhite(1,120),\pan,0,\amp,0.5);
~ring5 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass*4,inf),\dur,l,\d,0.19,\a,Pwhite(1,120),\pan,0,\amp,0.5);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,l,\amp,Pexprand(0.5,1));
)


~ring3.stop(10)
~ring4.stop(10)

~k.stop

~kx.stop

p.clock.tempo = 2.36


~ring5.stop

~h.stop

//delay
~delaySend = {Mix.ar([~sn2.ar])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.05).range(0.01,0.1),16)};
~delay.play;

~delay.stop(10)

~sn2.play

~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[3,2],\degree,[0,4],\dur,0.25,\amp,0.9,\fb,0.1,\rel,0.3);

(
~piano1 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,16,\amp,1);
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,1,\rate,0.5);
~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pseq((200..500)/1000,inf),\amp,1,\rate,2);
~pianoChop3 = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pseq((200..500)/1000,inf),\amp,1,\rate,2);
~pianoChop4 = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pseq((200..500)/1000,inf),\amp,1,\rate,1);
~pianoChop5 = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pseq((200..500)/1000,inf),\amp,1,\rate,1.5);
~pianoChop2 = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,[4,8,16]);
)

~pianoChop5.play

~pianoChop3.play


d["ah"][0].play









~kbk.stop;~lsf.stop

~hipass.play


~kbk2.stop


~piano1.play



~hipass.stop



//delay
~reverbSend = {Mix.ar([~piano1])};
~reverb = {arg size = 10, time = 5, damping = 0.5, spread = 15, dry = 0, amp = 0.8; GVerb.ar(Mix.ar([~reverbSend.ar]),size,time,damping,0.5,spread,dry,mul:amp)}
~reverb.play;

~reverb.clear

~verb = {FreeVerb.ar(~piano1.ar,1,1,0.1)}


~verb.play

~k.stop

~verb.stop(10)

(
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(6),\amp,2);
~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(6),\amp,2);
~ravestab2xx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq(([50,52,55,57]+12).midicps/120,inf).stutter(6)*2,\amp,2);
)


~k.stop









d["ah"][0].play



~hipass.play
~kbk4.stop








~ravestab2x.play


~lsf.stop;~kbk.stop;~kbk2.stop

~k.stop


(
d["ah"][0].play;
~lsf.play;~kbk.play;~kbk2.play;
)

~k.play


~delay.clear

p.fadeTime = 0

~hipass.stop




~ravestab2xx.play



//delay
~delaySend = {Mix.ar([~ravestab2xx])};
~delay = {arg spd = 0.1; CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,Line.kr(0.2,0.001,10),15)};
~delay.stop;

d["ah"][0].play

~hipass.stop

~ravestab2xx.stop
~delay.stop

~delay.clear
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,10,\rate,1.6);



~k.play

~hipass.play

~piano1.stop(5)

~verb.play

~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(6),\amp,1)

~pianoChop5.stop(20)

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,3);

~sn.stop

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);

~sn.play

~k.play

~piano2.stop

~pianoChop2.stop




~pianoChop2.play

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk3 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\amp,1);
~kbk4 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,4,\amp,1);
)

~kbk4.play

~hipass = {HPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),1200,0.6)}

~hipass.stop


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,2,\amp,2);

~k.play

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),130,1,13)}




~hipass.play

~piano2.play


~piano2.stop
~pianoChop.play


~k.stop


d["ah"][0].play;~kbk.play;~kbk2.play;~lsf.play;~pianoChop2.play;

~sinfb.stop(5)

p.clock.tempo = 175/60

~oh.stop

~sn2.stop

~k.stop

~sinfb.set(\fb,~sin)

~sinfb.play

~k.play

~sn2.stop

~sn2 = Pbind(\instrument,\bplay,\buf,d["s"][3],\dur,2,\amp,3,\rate,Pwhite(0.5,3));

~sn2.play

~k.play

~fx = Pbind(\instrument,\bplay,\buf,d["sfx"][3],\dur,Pbjorklund2(3,8)/4,\amp,1);


~oh.play

~fx.play


~oh.stop

~k.stop

~fx.stop

~kx = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,5);

~kx.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,3,\rate,Pseq([1.2,1.5]*1.5,inf));


~k.play
(
~c.play;
~h.play;
~sn.play;
)

~ring5.play

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,2);


~oh.play
~h.play

~sines.stop


~c.play

p.clock.tempo = 2.3

~ring4.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);

~sn.play