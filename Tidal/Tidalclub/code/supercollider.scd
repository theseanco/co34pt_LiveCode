SuperDirt.start

(
// configure the sound server: here you could add hardware specific options
// see http://doc.sccode.org/Classes/ServerOptions.html
s.options.numBuffers = 1024 * 16; // increase this if you need to load more samples
s.options.memSize = 8192 * 16; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
s.options.numInputBusChannels = 2; // set this to your hardware input channel size, if necessary
// boot the server and start SuperDirt
s.waitForBoot {
	~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
	~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
	// for example: ~dirt.loadSoundFiles("/Users/myUserName/Dirt/samples/*");
	//~dirt.loadSoundFiles("/home/smc/Documents/Samples/copyleft/tidal-extra-samples/extra-samples/*");
	~dirt.loadSoundFiles("/home/smc/Documents/Samples/TidalSamples/*");
	//~dirt.loadSoundFiles("/home/smc/Documents/Samples/pre-feb2017/BoardsOfCanada/BOC");
	s.sync; // wait for samples to be read
	~dirt.start(57120, [0, 0]);   // start listening on port 57120, create two orbits, each sending audio to channel 0. You can direct sounds to the orbits from tidal e.g. by: `# orbit "0 1 1"
}
)
// now you should be able to send from tidal via port 57120

[ /play2, cps, 0.10000000149012, delta, 1.25, cycle, 13.375, s, buchla ]
// play2, cps, delta is length of event, cycle is the number of cycles elapsed

OSCFunc.trace



(
~dirt.orbits.do { |x|
	var event = x.defaultParentEvent;
	var pitchEvent = Event.partialEvents.pitchEvent.copy;
	[\freq, \midinote, \octave].do(event.removeAt(_));
	event.parent = pitchEvent;
};
)


// if we want to pick scales and tunings by name
// this works only when synths use \freq as argument
(
~dirt.orbits.do { |x|
	var event = x.defaultParentEvent;
	var pitchEvent = Event.partialEvents.pitchEvent.copy;
	var scale, tuning;
	pitchEvent.use {
		~freq = {
			if(~n != 0) { ~note = ~n }; // interpret n as note (might be also degree)
			~scaleName !? {
				scale = Scale.at(~scaleName);
				scale !? {
					~scale = scale;
					~tuningName !? {
						tuning = Tuning.at(~tuningName);
						tuning !? { ~scale = ~scale.copy; ~scale.tuning = tuning };
					}
				}
			};
			(~midinote.value + ~ctranspose).midicps * ~harmonic;
		};

		[\freq, \midinote, \octave].do(event.removeAt(_));

		event.parent = pitchEvent;
	}
};
)