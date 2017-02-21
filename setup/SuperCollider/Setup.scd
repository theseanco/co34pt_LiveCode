/*

Setup file as of 24th Feb 2016

Increases memory allocation
Adds more buffers
Boots server and proxyspace
Automatically loads all samples in repo inside a dictionary, following the format d["foldername"][x]
Loads SynthDefs
Activates StageLimiter

NB: StageLimiter requires BatLib quark
NanoKontrol


*/

(
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 64;
s.boot;
s.scope;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 1;
Task({
	3.wait;
	d = Dictionary.new;
	d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries);
	for (0, d[\foldernames].size-1,
		{arg i; d.add(d[\foldernames][i].folderName -> d[\foldernames][i].entries.collect({
			arg sf;
			Buffer.read(s,sf.fullPath);
		});
	)});
	("SynthDefs.scd").loadRelative;
	("snippets.scd").loadRelative;
	//comment out this line if you do not have the BatLib quark
	3.wait;
	StageLimiter.activate;
	"Setup done!".postln;
}).start;
)
