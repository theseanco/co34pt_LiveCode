/*
TODO:

Normalizer
Compander
GlitchBPF/HPF/BRF/BPRF

*/

(
// o=ServerOptions.new;
// o.numBuffers=2000;
// s.options=o;
// Server.local.options.device = "MOTU Traveler";
Server.local.options.memSize * 128;
s.options.numBuffers=4000;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 172/60;
// c=NanoKontrol.new;
// StageLimiter.activate;
);

(
// SynthDescLib.global.read("synthdefs/default.scsyndef");


d=Dictionary.new;
d.add(\kick ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/1 - Kicks").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\snare ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/2 - Snares").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\rim ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/3 - Rims").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\clap ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/4 - Claps").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\hats ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/5 - Hats").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\cymbal ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/6 - Cymbals").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\toms ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/7 - Toms").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\perc ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/8 - Percussion").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\fx ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/9 - FX").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\bkgd ->
	PathName("/home/smc/Documents/Samples/New-Sc/background").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbkick ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Drums/Kicks").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\dnbhat ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Drums/Hats").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\dnbsnare ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Drums/Snares").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\dnbclap ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Drums/Claps").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbsynth1 ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Synth/in A").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbbass1 ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Bass/in A").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbsynth2 ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Synth/in E").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbbass2 ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/Bass/in E").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbfx ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/One Shots/FX").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbbassloop ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/Loops/Bass Loops/172 em").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);


d.add(\dnbdrumloop ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/Loops/Drum Loops/172").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\dnbhiloop ->
	PathName("/home/smc/Documents/Samples/Sample Library 2016/Samplephonics.Morphic.Drum.and.Bass.MULTiFORMAT/Samplephonics - Morphic Drum and Bass Wav Acid SP/MorphicDrum&Bass_Wav_SP/Loops/Music Loops/hi").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

d.add(\speech ->
	PathName("/home/smc/Documents/Samples/SpokenUtopia/Speech").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);



d.add(\crik ->
	PathName("/home/smc/Documents/Samples/New-Sc/crik").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\crunchbang ->
	PathName("/home/smc/Documents/Samples/New-Sc/crunchbang").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\dblhi ->
	PathName("/home/smc/Documents/Samples/New-Sc/doublehi").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\fuzz ->
	PathName("/home/smc/Documents/Samples/New-Sc/fuzzer").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\hdrone ->
	PathName("/home/smc/Documents/Samples/New-Sc/hdrone").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\lcrik ->
	PathName("/home/smc/Documents/Samples/New-Sc/lcrik").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\pwhine ->
	PathName("/home/smc/Documents/Samples/New-Sc/pitchwhine").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\ssub ->
	PathName("/home/smc/Documents/Samples/New-Sc/supersub").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\tran ->
	PathName("/home/smc/Documents/Samples/New-Sc/Transitions").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\crackling ->
	PathName("/home/smc/Documents/Samples/New-Sc/Crackling").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\drone ->
	PathName("/home/smc/Documents/Samples/New-Sc/Drones").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\howling ->
	PathName("/home/smc/Documents/Samples/New-Sc/Howling").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\sprinkle ->
	PathName("/home/smc/Documents/Samples/New-Sc/Sprinkling").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
)
