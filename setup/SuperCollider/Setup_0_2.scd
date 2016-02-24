//Setup file as of 24th Feb 2016

(
Server.local.options.memSize * 128;
s.options.numBuffers=4000;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 1;
);

//dictionary now loads with relative paths
(
d=Dictionary.new;
d.add(\water ->
	PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples/Water").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

)

d[\water][0].play