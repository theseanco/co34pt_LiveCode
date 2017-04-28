//coï¿¥ï¾¡pt for #ALGOFIVE

//good morning from the UK

//it's too early for this...

(
f = File.new("codeExecutedAlgoFive.txt","a");
this.codeDump = { |str| f.write(str);};
d[\scale] = Scale.chromatic(\et53);
~r = {0};
p.fadeTime = 2;
)

(
l = Pbjorklund2(Pseq([3,10,9,6,11,13,15,10,8,3,6,8,7],inf),16)/8;
d[\deg] = Prewrite(0, // start with 0
        (    0: #[5,0,20],
            20: #[1,52,30],
            30: #[31,32,33,34,35],
		5: #[10,15,20,0,0]
        ), 4);

~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,2,\dur,l,\d,Pexprand(0.25,0.31),\a,Pexprand(10,400),\pan,0,\amp,Pwhite(0.5,0.7));
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([3,4],[10,1].normalizeSum,inf),\dur,l,\d,Pexprand(0.25,0.31),\a,Pexprand(20,400),\pan,0,\amp,Pwhite(0.5,0.7));
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-2,2),\octave,Pwrand([4,5],[10,1].normalizeSum,inf),\dur,l,\d,Pexprand(0.3,0.34),\a,Pexprand(10,400),\pan,0,\amp,0.5);
~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\degree,Pseq([2,50,30,20,60],inf),\dur,0.125,\amp,1.5,\fb,Pexprand(0.1,1.7),\rel,Pexprand(0.01,0.05),\octave,6,\root,Pkr(~r));
~sinfb2 = Pbind(\instrument,\sinfb,\scale,d[\scale],\degree,Pseq([2,50,30,20,60],inf),\dur,0.125,\amp,1.5,\fb,Pexprand(0.1,1.7),\rel,Pexprand(0.01,0.5),\octave,5,\root,Pkr(~r));
~h = Pbind(\instrument,\bplay,\buf,d["ch"][1],\dur,Pwrand([0.25,Pseq([0.125],2),Pseq([0.125/2],4)],[5,10,2].normalizeSum,inf),\amp,Pwhite(0.2,1));
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,2,\amp,1);
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\amp,3);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(5,16,inf,Pwhite(1,10).asStream)/4,\amp,7,\rate,20);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][1],\dur,Pbjorklund2(5,16,inf,Pwhite(1,10).asStream)/8,\amp,4,\rate,3.8);
~t3 = Pbind(\instrument,\bplay,\buf,d["t"][2],\dur,Pbjorklund2(5,16,inf,Pwhite(1,10).asStream)/8,\amp,3,\rate,30);
~t4 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(Pwhite(7,14),16,inf,Pwhite(1,10).asStream)/8,\amp,2.5,\rate,7);
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,3,\rate,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/8,\amp,0.5);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/8,\amp,0.5);
~sinfbx = Pbind(\instrument,\sinfb,\scale,d[\scale],\degree,Pseq([0,52],inf),\dur,0.5,\amp,0.3,\fb,Pexprand(0.1,1.7),\rel,1,\octave,Pseq([3,3,4,4],inf),\root,Pkr(~r));
)

s.makeWindow
~sinfbx.clear
p.clock.tempo = 0.000001
//that's all folks <3
//now for my extratone set

~ring1.stop

~sinfbx.stop

p.clock.tempo = 1.0

~oh.stop


~k.stop

~sinfb

(
~r = {4};
~k.play;
)

//up we go!

~c2.play

~ring1.play

~t4.play

~oh.play
~sinfbx.play




~ring3.stop

~k.play

~oh.play
~c.stop

~sinfb1.play


~h.play




~h.stop

~c.play


~k.play

~oh.stop


~t3.play

(
~ring1.play;
~ring2.play;
~ring3.play;
~k.play;
)

//happy birthday algorave <3
//it is DEFINITELY too early for this

//where's the beer?



(
~ring1.stop

(
~sinfb2.stop

~h.play

~t2.play

p.clock.tempo = 1.46

~h.stop

~sn.play

~sinfb2.play

~sinfb.play

~h.play

~ring3.play
~sinfb.stop
~sinfb.play

~ring1.play











s.makeWindow


(
//l systems
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
)