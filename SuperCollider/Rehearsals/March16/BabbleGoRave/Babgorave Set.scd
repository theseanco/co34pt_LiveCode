(
~start = Task({
	inf.do({ arg i;
		rrand(5,20).do{Synth(\bpfsaw,[\freq,exprand(1,10).round(1)*60,\amp,rrand(0.5,0.9),\atk,rrand(5,10),\sus,rrand(10,20),\rel,rrand(10,20),\detune,Pexprand(0.000001,0.9)])};
		rrand(5,25).wait;
		i.postln;
	});
});
)

s.scope