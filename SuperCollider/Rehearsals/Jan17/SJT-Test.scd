(
r = CSVFileReader.readInterpret("/home/smc/src/github/scratchpads/python/RandomSJTRhythmGeneration/rhythmFile.csv").flat;
m = CSVFileReader.readInterpret("/home/smc/src/github/scratchpads/python/RandomSJTRhythmGeneration/melodyFile.csv").flat;
)

~mel.play;
~melx.play;

p.clock.tempo=2

(
~one = Pbind(\instrument,\bplay,\buf,d["clang"][0],\dur,Pseq(r,inf)/4,\amp,1,\rate,Pwrand([1,2],[0.2,0.8],inf));
~one1 = Pbind(\instrument,\bplay,\buf,d["uk"][0],\dur,Pseq(r,inf)/4,\amp,1);
~one2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pseq(r,inf)/4,\amp,1);
~one3 = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,Pseq(r,inf)/4,\amp,1);
~one30 = Pbind(\instrument,\bplaym,\buf,d["t"][0],\dur,Pseq(r,inf)/4,\amp,1);
~mel = Pbind(\instrument,\sinfb,\scale,Scale.chromatic(\et24),\degree,Pseq(m,inf),\dur,Pseq(r,inf)/4,\amp,0.4,\fb,Pexprand(0.4,1),\octave,3);
~melx = Pbind(\instrument,\sinfb,\scale,Scale.chromatic(\et24),\degree,Pseq(m,inf),\dur,Pseq(r,inf)/4,\amp,0.5,\fb,Pexprand(0.1,1.8),\octave,[3,4,5,6],\rel,Pexprand(0.1,0.3));
~one5 = Pbind(\instrument,\bplay,\buf,Pwrand([d["ch"][1],d["oh"][0]],[0.8,0.2],inf),\dur,Pseq(r,inf)/4/2,\amp,1,\rate,2);
~oney = Pbind(\instrument,\bplaym,\buf,d["sk"][1],\dur,1,\amp,4);
~oney2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Pseq([3,5],inf),8)/4,\amp,4,\rate,Pseq([1,2],inf));
~onez = Pbind(\instrument,\bplay,\buf,d["c"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf)*2,\amp,4)
)