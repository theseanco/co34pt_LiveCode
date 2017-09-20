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

END SET

ravestabs into molecularbass
add molecular sines
end in madness

*/



p.clock.tempo = 2.4

~h.stop

~sinfb.stop


(
l = Pbjorklund2(Pseq([3,5,10,12,9,7,14,13].scramble,inf),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/2,inf),\dur,l,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.7);
~ring2 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/4,inf),\dur,0.25,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.9);
~ring3 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass,inf),\dur,l,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.7);
~ring4 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass*2,inf),\dur,l,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.7);
~c = Pbind(\instrument,\bplay,\buf,d["t"][2],\dur,l,\amp,1.5,\rate,3);
~c2 = Pbind(\instrument,\bplay,\buf,d["t"][2],\dur,l,\amp,1.5,\rate,4);
)

~sinfb.stop(20)





~c2.play


//delay
~delaySend = {Mix.ar([~sn])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.1).range(0.01,0.4),0.8)};
~delay.play;

~ring1.stop

~c2.stop


~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[4,5,6,7],\degree,[0],\dur,0.25,\amp,0.4,\fb,Pwhite(0.1,2),\rel,0.3);


~sinfb3 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[5,6],\degree,Pseq((0..7),inf),\dur,0.25,\amp,0.5,\fb,Pwhite(0.1,2),\rel,0.05);
~sinfb4 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[1,2,3,4,5,6,7],\degree,Pseq((0..7).reverse,inf),\dur,0.25,\amp,0.5,\fb,Pwhite(0.1,2),\rel,0.1);
~sinfb5 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[1,2,3,4,5,6,7],\degree,Pseq((0..7).reverse,inf,Pwhite(1,4).asStream),\dur,0.25,\amp,0.5,\fb,Pwhite(0.1,2),\rel,0.1);

p.clock.tempo = 43890489l

~k.stop

~sn.stop

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);

~k.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,4);

~oh.stop

~sn.play

~sinfb5.play

d["ah"][0].play

~sinfb3.stop


~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);

~oh.play

p.clock.tempo = 2.5

~ring1.stop

~.stop

~k.stop

p.clock.tempo = 175/60

~sinfb3.stop


~sinfb4.stop(20)

~sinfb4.play

~piano1.play

~pianoChop = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,Pwhite(2,8))
~pianoChopxx = Pbind(\instrument,\vplay,\buf,d["piano"][1],\dur,0.25,\atk,0,\sus,0.04,\rel,0,\pos,Pexprand(0.2,0.5),\amp,1,\rate,[4,8])


~kbk.stop

~pianoChop.stop

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

(
~ravestab2x = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,2],inf),8)/4,\rate,Pseq([50,52,55,57].midicps/120,inf).stutter(5),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,2],inf),8)/4,\rate,Pseq(([50,52,55,57]+7).midicps/120,inf).stutter(5),\amp,1);
~ravestab2xxx = Pbind(\instrument,\bplay,\buf,d["stab"][2],\dur,Pbjorklund2(Pseq([3,2],inf),8)/4,\rate,Pseq(([50,52,55,57]+12).midicps/120,inf).stutter(5),\amp,1.5);

)



d["ah"][0].play;~ravestab2x.play;~ravestab2.play;~lsf.play;~kbk.play;~kbk2.play;


~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,Scale.minor,\degree,Pwhite(0,14),\octave,3,\dur,0.25,\d,0.21,\a,Pexprand(1,300),\pan,0,\amp,0.3);

~sinfb3.play




~sn = Pbind(\instrument,\vplay,\buf,d["s"][0],\dur,Pwhite(0.25,1).round(0.25),\amp,2,\rate,Prand([-1,1],inf),\pos,Pkey(\rate).linlin(-1,1,0.8,0));

~sn.play

~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,1);

~k.play

p.clock.tempo = 2.5




~ravestab2xxx.stop(30)


~lsf.stop(10)

~kbk2.stop(40)


~lsf.stop(10)

~hipass.stop



~lsf.stop

~ring1.play

~strings.stop(20)

~ravestab2xxx.stop

p.fadeTime = 4

~ravestab2xxx.play



~ravestab2x.play



~strings = Pbind(\instrument,\bplay,\buf,d["strings"][0],\dur,10,\rate,2,\amp,1)


~oh.stop

~k.stop

~sn.stop

~c.stop

~strings.play

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,2,\amp,2);

~c.play

~ravestab2.play

d["ah"][0].play

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);

~oh.play

~hipass.stop

~k.play

~kbk.stop;
~kbk2.stop;
~lsf.stop;

~piano2.stop

~piano1.stop

~pianoChop.play

~pianoChopxx.play

p.clock.tempo = 175/60




(
~lsf.play;
~kbk.play;
~kbk2.play;
)



(
~kbk.stop;
~pianoChop.stop;
~pianoChopxx.stop;
)

d["ah"][0].play

~pianoChop.play

~sinfb3.play

~c2.stop

~ring3.stop

~piano1.play

~piano2.play

~hipass = {HPF.ar(Mix.ar([~kbk.ar,~kbk2.ar]),1200,0.9)}


~kbk.play;
~kbk.stop;



~hipass.play

(
~piano1 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,16,\amp,1);
~piano2 = Pbind(\instrument,\bplay,\buf,d["piano"][1],\dur,32,\amp,0.5,\rate,0.5);
)

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
)
~oh.stop

~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,1)


~ring2.stop



~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),200,1,10)}

p.fadeTime = 2

~sinfb.fadeTime = 10

~sinfb.play

~delay.stop



~k.stop

~c2.stop

(
~oh.play;
~k.play;
)

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,1.4);


~c2.play

~c.play
~c.stop

~sn.stop

~oh.play

~k.play;
~c.play

~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq(d[\data].melody,inf),\dur,Pseq([0,0,0,10],inf),\amp,0.1,\fb,Pwhite(0.1,1),\atk,3,\sus,2,\rel,3);



~sinfb.play

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pexprand(0.5,1.5),\rate,3);

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);


~h.play

p.clock.tempo = 2.3

~ring1.stop;~ring2.stop;~ring3.stop;~ring4.stop;~sn.stop;~c.stop;~c2.stop;

~ring1.play;~ring2.play;~ring3.play;~ring4.play;~sn.play;~c.play;~c2.play;

~k.play;

~oh.stop

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1.4,\rate,Pwhite(1,3.0));

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1.4);

~sn.play

~oh.play

p.clock.tempo = 2

~c2.play

~c.play



p.clock.tempo = 1.7

~ring4.play
~ring3.play


~ring2.play

~ring1.play

~k.play

~ring4.play


~sn.play


~k.stop

~sn.stop

~sin = Pbind(\instrument,\sinfb,\freq,Pseq(d[\data].melody/2,inf),\dur,Pseq([0,0,0,10],inf),\amp,0.6,\fb,0.1,\rel,4,\atk,4);


~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*1,inf).stutter(3),\amp,1)



p.clock.tempo = 175/60

~lsf = {LowShelf.ar(Mix.ar([~kbk.ar,~kbk2.ar]),200,1,10)}

~lsf.play


d["ah"][0].play

(
~kbk = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
~kbk2 = Pbind(\instrument,\bplay,\buf,Prand(d["breaks175"],inf),\dur,16,\amp,1);
)


~kbk2.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,2);


~sn.play



~c2.play

~c.play


~ring3.play

~k.play

~ring1.play

p.clock.tempo = 2.3

~ring1.play

~rlpfd.clear
~ring1.clear


~rlpfdSend.clear

//rlpfd
~rlpfdSend = {Mix.ar([~ring1.ar,~ring2.ar])};
~rlpfd = {arg speed = 0.1, min = 800, max = 4000, res = 0.5, dist = 0.2; XFade2.ar(~ring1, RLPFD.ar(NumChannels.ar([~rlpfdSend]),SinOsc.kr(speed).range(min,max),res,dist,3),0.9,2)};
~rlpfd.play;



