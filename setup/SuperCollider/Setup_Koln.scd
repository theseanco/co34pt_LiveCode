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
d.add(\pbang ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/pbang").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\plong ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/plong").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\plow ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/plow").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\pg ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/pg").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\plink ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/plink").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\pspr ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/pspr").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\clow ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/clow").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\cspecial ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/cspecial").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\cscale ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/cscale").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\cmid ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/cmid").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);
d.add(\cspecial ->
	PathName("/home/smc/Documents/Samples/KolnCollab/FormattedForTidal/cspecial").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

)
