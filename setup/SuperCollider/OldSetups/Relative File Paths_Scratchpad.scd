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
	PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples/water").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

)

//dictionary can now be used to automatically grab folders without specification
(
d = Dictionary.new;
//grabs all PathNames within a directory
d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries);
//turns all PathNames into "name" dictionary entries full of the contents of that folder
d.add(d[\foldernames][1].folderName -> d[\foldernames][1].entries.collect({
	arg sf;
	Buffer.read(s,sf.fullPath);
});
)
)




//dictionary can now be used to automatically grab folders without specification
(
d = Dictionary.new;
//grabs all PathNames within a directory
d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries);
//for loop to turn all of those pathnames into dictionary entries
for (0, d[\foldernames].size-1,
	{arg i; d.add(d[\foldernames][i].folderName -> d[\foldernames][i].entries.collect({
	arg sf;
	Buffer.read(s,sf.fullPath);
	});
)})
)

d["water"][0]

d[\foldernames].size

for (3, 7, { arg i; i.postln });

d.at(\foldernames)


"\\" ++ d[\foldernames][1].folderName

"jddo" ++ "dkdkd"

d["water"][0].play

{PlayBuf.ar(2,0)}.play

d[\foldernames][0]

d[\foldernames][0].folderName

d[\hidetail][1]

d[\foldernames][0].folderName.asKey

d[\hidetail][1].play

d[\water][1].play

d[\hidetail][1].play

d[\foldernames][0].entries.collect

//This grabs all of the files within a directory, then prints the names of each entry
(
var myPath;
myPath = PathName.new(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries;
myPath[1].folderName.postln;
)

d[\



d.add(\foldernames -> PathName(thisProcess.nowExecutingPath.dirname +/+ "Samples").entries)

d[\foldernames][1]