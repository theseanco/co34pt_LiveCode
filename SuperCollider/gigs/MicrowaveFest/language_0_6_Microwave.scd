//Note - all sounds from keyboard are sent to Out 4, all Sampler sounds sent to Out 6, so that they can be run through an effects bus.

(
~processing = NetAddr.new("127.0.0.1",12000);
//initialises a master list (lists are extendable)
~stitchHistory = List.new;
//initialises the first sub-list, for the stitches to be added
~stitchHistory.add(List.new);
//set value for history to be recorded
// !! THIS MAY NOT BE NEEDED !!
~noHistory = 0;
//a value to track the index to which a metapattern has been logged
~metaPatternIndex = 0;

//this saves the current pattern
~savePattern = {
	if ( ~stitchHistory[~stitchHistory.size-1].size == 0,
		{
			"METAPATTERN CREATED! Created from patterns: ".postln;
			//create a new list index - Unnecessary
			//~stitchHistory.add(List.new);
			for ( ~metaPatternIndex, ~stitchHistory.size-1,
				{arg i;  ~stitchHistory[~stitchHistory.size-1].add(~stitchHistory[i]);
					i.post;
					" ".post;
			});
			"New Pattern Created at Index: ".post;
			(~stitchHistory.size-1).postln;
		}
		,{
	~stitchHistory.add(List.new);
	"".postln;
	"Pattern ".post;
	(~stitchHistory.size.asInt-2).post;
	" Saved!".postln;
	~stitchHistory[~stitchHistory.size-2];
	});
};

//this clears the current iteration
~clearPattern = {
	"Current pattern cleared! ".postln;
	~stitchHistory[~stitchHistory.size-1].clear;
};

//plays pattern according to specified saved pattern and relevant time delay
// TODO: fix what 'long' does, figure out a good way to handle it - probably with strings
~playPattern = {
	arg pattern = 0, period = 0.1, modifier = 0, multiplier = 1, long = 0;
	Task({
		arg listNum = 0;
		var data;
		data = ~stitchHistory[pattern];
		//iterate over the data as a local variable
		data.size.do({
			|i|
			//adjusted to send two values to Processing - I think, the first 0 just queries the list.
			//Modifier in brackets to allow a negative number to be used on patterns
			~processing.sendMsg('/stitchSC',((data[i][0]+(modifier))*multiplier)%8,data[i][1]);
			//data[i].postln;
			period.wait;
		});
		~noHistory = 0;
	}).play;
};

//this can be placed inside a Tdef to schedule the looping of patterns
//num cast as an int because IT CRASHES THE SERVER
//Modifications to add more functionality to pattern classes:
// transform = transformation to be applied to the 'number' index of the pattern being played.
// wrapped to the modulo of the number of possible directions
// multiplier multiplies the value by something
// TODO: long 'long-ifies' patterns, but I haven't figured out an appropriate way to deal with that yet. It would need to give a specific signal to overwrite the already existing 'long' value in the pattern dataset.
~loopPattern = {
	arg pattern = 0, period = 0.1, num = 1, delay = 0.1, transform = 0, multiplier = 1, long = 0, dir1 = "NONE", len1 = "NONE", dir2 = "NONE", len2 = "NONE";
	var numReps = 1;
	//this stops the server crashing, casting the number of repetitions as >0
	if ( num < 1 , { numReps = 1 }, { numReps = num.asInt});
	numReps.do({
		//use playPattern function
		//"Playing Pattern ".post;
		//pattern.post;
		~playPattern.(pattern,period,transform, multiplier, long);
		//wait for as long as it takes to play the pattern - this seems inefficient and i should probably just re-write the function with ~playPattern within it, but maybe not.
		((~stitchHistory[pattern].size)*period).wait;
		//send the modifiers
		~processing.sendMsg('/stitchSC',dir1,len1);
		~processing.sendMsg('/stitchSC',dir2,len2);
		delay.wait;
	})
};

//clears Processing screen, int specifies grid size
~clearScreen = {arg size = 10; ~processing.sendMsg('/stitchSC',"CLEAR", size); "Screen Cleared!"};

/*
Old sample responder
//function to send commands to OSCResponder
//adjusted to handle ints
~sampleResponder = {
	arg freq = 400, amp = 0.1, atk = 0.01, rel = 0.1, pan = 0, envMul = 2;
	OSCdef(\stitchResponderSampler,
		{
			|msg, time, addr, recvPort, sw, stitch|


			var
			//synthesises different stitching combinations
			up = {arg f = 440, amp = 0.1; SinOsc.ar(f,0,amp)},
			down = {arg f = 440, amp = 0.1; SawDPW.ar(f,0,amp)},
			left = {arg f = 440, amp = 0.1, w = 0.5; PulseDPW.ar(f,w,amp)},
			right = {arg f = 440, amp = 0.1, w = 0.5; LFTri.ar(f,0,amp)},
			upleft = {arg f = 440, amp = 0.1, a = 1, b = 3, c = 0.5, d = 0.5; LatoocarfianN.ar(f,a,b,c,d,0.5,0.5,amp)},
			upright = {arg f = 440, amp = 0.1; HenonN.ar(f,mul:amp)},
			downleft = {arg f = 440, amp = 0.1; FBSineN.ar(f,mul:amp)},
			downright = {arg f = 440, amp = 0.1; GbmanN.ar(f,mul:amp)};
			env = {arg mult = 0; EnvGen.ar(Env.perc(atk+(envMul*mult),rel+(envMul*mult)),1,1,0,1,2)};


			//switch case to identify the type of stitch that has been pressed
			sw =  switch ([msg[1],msg[2]])
			{[0,0]} {{Pan2.ar(up.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[1,0]} {{Pan2.ar(upright.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[2,0]} {{Pan2.ar(right.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[3,0]} {{Pan2.ar(downright.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[4,0]} {{Pan2.ar(down.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[5,0]} {{Pan2.ar(downleft.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[6,0]} {{Pan2.ar(left.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			{[7,0]} {{Pan2.ar(upleft.(freq,amp),pan)*EnvGen.ar(Env.perc(atk,rel),1,1,0,1,2)}.play}
			//TODO: For next version, simplify the way in which these responders function, possibly changing the multiplier option in the function arguments to something more productive
			{[0,1]} {{Pan2.ar(up.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[1,1]} {{Pan2.ar(upright.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[2,1]} {{Pan2.ar(right.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[3,1]} {{Pan2.ar(downright.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[4,1]} {{Pan2.ar(down.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[5,1]} {{Pan2.ar(downleft.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[6,1]} {{Pan2.ar(left.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play}
			{[7,1]} {{Pan2.ar(upleft.(freq,amp),pan)*EnvGen.ar(Env.perc(atk*envMul,rel*envMul),1,1,0,1,2)}.play};

	},'/stitchSampler');
};
*/


//function to send commands to OSCResponder
//adjusted to handle ints
~sampleResponder = {
	arg freq = 400, amp = 0.1, atk = 0.01, rel = 0.1, pan = 0, envMul = 4;
	OSCdef(\stitchResponderSampler,
		{
			|msg, time, addr, recvPort, sw, stitch|


			var
			//synthesises different stitching combinations
			up = {arg f = 440, amp = 0.1; SinOsc.ar(f,0,amp)},
			down = {arg f = 440, amp = 0.1; SawDPW.ar(f,0,amp)},
			left = {arg f = 440, amp = 0.1, w = 0.5; PulseDPW.ar(f,w,amp)},
			right = {arg f = 440, amp = 0.1, w = 0.5; LFTri.ar(f,0,amp)},
			upleft = {arg f = 440, amp = 0.1, a = 1, b = 3, c = 0.5, d = 0.5; LatoocarfianN.ar(f,a,b,c,d,0.5,0.5,amp)},
			upright = {arg f = 440, amp = 0.1; HenonN.ar(f,mul:amp)},
			downleft = {arg f = 440, amp = 0.1; FBSineN.ar(f,mul:amp)},
			downright = {arg f = 440, amp = 0.1; GbmanN.ar(f,mul:amp)},
			env = {arg mult = 0; EnvGen.ar(Env.perc(atk+((envMul*mult)*atk),rel+((envMul*mult)*rel)),1,1,0,1,2)};


			//switch case to identify the type of stitch that has been pressed
			sw =  switch ([msg[1],msg[2]])
			{[0,0]} {{Out.ar(6,Pan2.ar(up.(freq,amp),pan)*env.(msg[2]))}.play}
			{[1,0]} {{Out.ar(6,Pan2.ar(upright.(freq,amp),pan)*env.(msg[2]))}.play}
			{[2,0]} {{Out.ar(6,Pan2.ar(right.(freq,amp),pan)*env.(msg[2]))}.play}
			{[3,0]} {{Out.ar(6,Pan2.ar(downright.(freq,amp),pan)*env.(msg[2]))}.play}
			{[4,0]} {{Out.ar(6,Pan2.ar(down.(freq,amp),pan)*env.(msg[2]))}.play}
			{[5,0]} {{Out.ar(6,Pan2.ar(downleft.(freq,amp),pan)*env.(msg[2]))}.play}
			{[6,0]} {{Out.ar(6,Pan2.ar(left.(freq,amp),pan)*env.(msg[2]))}.play}
			{[7,0]} {{Out.ar(6,Pan2.ar(upleft.(freq,amp),pan)*env.(msg[2]))}.play}
			//TODO: For next version, simplify the way in which these responders function, possibly changing the multiplier option in the function arguments to something more productive
			{[0,1]} {{Out.ar(6,Pan2.ar(up.(freq,amp),pan)*env.(msg[2]))}.play}
			{[1,1]} {{Out.ar(6,Pan2.ar(upright.(freq,amp),pan)*env.(msg[2]))}.play}
			{[2,1]} {{Out.ar(6,Pan2.ar(right.(freq,amp),pan)*env.(msg[2]))}.play}
			{[3,1]} {{Out.ar(6,Pan2.ar(downright.(freq,amp),pan)*env.(msg[2]))}.play}
			{[4,1]} {{Out.ar(6,Pan2.ar(down.(freq,amp),pan)*env.(msg[2]))}.play}
			{[5,1]} {{Out.ar(6,Pan2.ar(downleft.(freq,amp),pan)*env.(msg[2]))}.play}
			{[6,1]} {{Out.ar(6,Pan2.ar(left.(freq,amp),pan)*env.(msg[2]))}.play}
			{[7,1]} {{Out.ar(6,Pan2.ar(upleft.(freq,amp),pan)*env.(msg[2]))}.play};

	},'/stitchSampler');
};




~keyboardResponder = {
	arg freq = 100, amp = 0.1, atk = 0.4, rel = 1, pan = 0, envMul = 3;
	OSCdef(\stitchResponderKeyboard,
		{
			|msg, time, addr, recvPort, sw, stitch|


			var
			//synthesises different stitching combinations
			sine = {arg f = 100, amp = 0.1; Pan2.ar(SinOsc.ar(f,0,amp),pan)},
			env = {arg mult = 0; EnvGen.ar(Env.perc(atk+(envMul*mult),rel+(envMul*mult)),1,1,0,1,2)};


			//first index + 1 is the frequency multiplier
			//second index allows for an envelope multiplier to be used - if it is 0 it will not be used.
			stitch = [msg[1],msg[2]];
			{{Out.ar(4,sine.(freq*(msg[1]+1),amp)*env.(msg[2]))}}.play;

			~stitchHistory[~stitchHistory.size-1].add(stitch);

	},'/stitchKeyboard');
};





~dir = ["UP","DOWN","LEFT","RIGHT","UPLEFT","UPRIGHT","DOWNLEFT","DOWNRIGHT"];
~dirLong = ["UPLONG","DOWNLONG","LEFTLONG","RIGHTLONG","UPLEFTLONG","UPRIGHTLONG","DOWNLEFTLONG","DOWNRIGHTLONG"];
~randDir = {~dir.choose};
~randDirLong = {~dirLong.choose};


~clearSet = {
	arg switch = "OFF", min = 10, max = 10;
	OSCdef(\clearSet,
		{
			if ( switch == "ON",
				{
					~clearScreen.(rrand(min,max).asInt)
			});
		},\screenCleared
	);
};


OSCdef(\hostSavePattern,
	{
		~savePattern.();
	}, '/hostSave'
);

OSCdef(\hostClearPattern,
	{
		~clearPattern.();
	}, '/hostClearArray'
);

~hostPatternControl = {
	OSCdef(\hostSavePattern,
	{
		~savePattern.();
	}, '/hostSave'
);

OSCdef(\hostClearPattern,
	{
		~clearPattern.();
	}, '/hostClearArray'
);
};

~keyboardResponder.();
~sampleResponder.();
~hostPatternControl.();

)



/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/*

//plays pattern according to specified saved pattern and relevant time delay
// TODO: fix what 'long' does, figure out a good way to handle it - probably with strings
~playPatternRedundant = {
	arg pattern = 0, period = 0.1, modifier = 0, multiplier = 1, long = 0;
	Task({
		arg listNum = 0;
		var data;
		data = ~stitchHistory[pattern];
		//iterate over the data as a local variable
		data.size.do({
			|i|
			//adjusted to send two values to Processing - I think, the first 0 just queries the list.
			//Modifier in brackets to allow a negative number to be used on patterns
			~processing.sendMsg('/stitchSC',((data[i][0]+(modifier))*multiplier)%8,data[i][1]);
			data[i].postln;
			period.wait;
		});
		~noHistory = 0;
	}).play;
};

// Scratchpad goes here, for building new stuff
// a new function which goes inside of a Pbind
// doesn't really work tho
(
var index = 0, prevPattern = 0;
~newPatternFunc = {
	arg pattern = 0, modifier = 0, multiplier = 1;
	var data;
	if(prevPattern != pattern) {
	index = 0;
	};
	data = ~stitchHistory[pattern];
	~processing.sendMsg('/stitchSC',((data[index][0]+(modifier))*multiplier)%8,data[index][1]);
	index = (index + 1)%data.size;
	prevPattern = pattern;
	index.postln;
}
)

(
Ndef(\pattern,
	Pbind(\instrument,\x,\func,Pfunc({~newPatternFunc.(pattern:Pwhite(1,3)))}),\dur,0.01);
)
)

SynthDef(\x,{EnvGen.ar(Env.perc(0,0),doneAction:2)}).add


//synthDef to do stitching  - newPatternFunc
(
var index = 0, prevPattern = 0;
SynthDef(\newPatternFunc, {
	arg pattern = 0, modifier = 0, multiplier = 1;
	var data;
	if(prevPattern != pattern) {
	index = 0;
	};
	data = ~stitchHistory[pattern];
	~processing.sendMsg('/stitchSC',((data[index][0]+(modifier))*multiplier)%8,data[index][1]);
	index = (index + 1)%data.size;
	prevPattern = pattern;
	index.postln;
	EnvGen.ar(Env.perc(0,0),doneAction:2);
}
).add;
)


8%8

~newPatternFunc.(pattern:3)


~stitchHistory[3].flop[0]

[0,1,2,3,4,5,6,7].size


~stitchHistory
~newPatternFunc.(pattern:30)

*/