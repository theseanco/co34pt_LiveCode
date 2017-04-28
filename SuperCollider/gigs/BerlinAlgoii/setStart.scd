(
f = File.new(thisProcess.nowExecutingPath.dirname +/+ "codeExecutedBerlinAlgo23-3-17-gig.txt","w");
this.codeDump = { |str| SystemClock.sched(0.0,{arg time; f.write(time.asString)}); f.write("       ");  f.write(str);  f.putChar($\n); };
~r = {0};
d[\scale] = Scale.chromatic(\et53);
p.fadeTime = 2;
)

//note: DON'T FORGET ABOUT SFX


/*

Hallo, Berlin!

My name is coï¿¥ï¾¡pt

thx to Alexandra for organising && Urban Spree for hosting/sound/etc.

<3

*/


~shep = {var intervals, amps; #intervals, amps = Shepard.kr(5,-0.008); (SinOsc.ar( (intervals + 60).midicps) * amps).sum * 0.05 ! 2}
~shep.play

(
l = Pbjorklund2(Pwhite(1,10),16)/4;
~t1 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(5,16,inf,Pwhite(0,0).asStream)/4,\amp,1,\pan,Pwhite(-0.5,0.5));
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(5,16,inf,Pwhite(0,6).asStream)/4,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,1.2);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([3,4],[10,1].normalizeSum,inf),\dur,0.5,\d,0.4,\a,Pexprand(1,20),\pan,0,\amp,0.5);
)