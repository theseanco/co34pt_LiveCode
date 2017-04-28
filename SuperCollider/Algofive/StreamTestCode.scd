e = Scale.chromatic(\et53)
~r = {0}


(
l = Prewrite(0.25, // start with 0
        (    0.25: #[0.25,0.5],
            0.5: #[0.5,1,0.125,0.125,0.75],
            1: #[3,3,2]/4
        ), 4);
d[\deg] = Prewrite(0, // start with 0
        (    0: #[5,0,20],
            20: #[1,52,30],
            30: #[31,32,33,34,35],
		5: #[10,15,20,0,0]
        ), 4);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,e,\root,Pkr(~r),\degree,d[\deg],\octave,4,\dur,l,\d,0.3,\a,Pexprand(0.5,20),\pan,0,\amp,0.5,\pan,0.7);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,e,\root,Pkr(~r),\degree,d[\deg],\octave,3,\dur,l,\d,0.3,\a,Pexprand(0.5,20),\pan,0,\amp,0.5,\pan,-0.7);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,e,\root,Pkr(~r),\degree,d[\deg],\octave,2,\dur,l,\d,0.3,\a,Pexprand(20,400),\pan,0,\amp,0.5,\pan,0);
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,l*4,\amp,1);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,l*6,\amp,1);
~sk = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,5);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,l,\amp,Pexprand(0.2,1.5));
~h2 = Pbind(\instrument,\bplay,\buf,d["ch"][2],\dur,l,\amp,Pexprand(0.2,1.5));
~sn = Pbind(\instrument,\bplay,\buf,d["s"][3],\dur,l*2,\amp,Pseq((1..5)/5,inf));
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l*4,\amp,1);
//~sinfb = Pbind(\instrument,\sinfb,\scale,e,\degree,[Pwhite(1,52).stutter(40).asStream,0,52],\octave,5,\dur,1,\amp,0.3,\fb,Pkr(~sins),\atk,0.5,\rel,2)
)

~c.play
~sn.play
~h2.play
~h.play
~k.play
~k2.play
~ring3.play

// any luck?

// Hello, world!

p.clock.tempo = 2.2

~sinfb.clear

~sins.clear
~sinfb.clear

~sk.stop

p.clock.tempo = 2

~sinfb.stop

~sins = {SinOsc.kr(0.1).range(0.01,1.01)}

~deg = {SinOsc.kr(0.3,0,30).abs}
~deg.clear


~sk.play

~sinfb.play

~c.play

~sn.play

~h2.play
~k2.play

~ring2.play

p.clock.tempo = 2.2

~ring3.play