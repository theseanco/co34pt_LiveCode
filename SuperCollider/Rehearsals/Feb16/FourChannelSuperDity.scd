(
// configure the sound server: here you could add hardware specific options
// see http://doc.sccode.org/Classes/ServerOptions.html
s.options.numBuffers = 1024 * 16; // increase this if you need to load more samples
s.options.memSize = 8192 * 16; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
s.options.numOutputBusChannels = 4; // set this to your hardware output channel size, if necessary
s.options.numInputBusChannels = 4; // set this to your hardware output channel size, if necessary
// boot the server and start SuperDirt
s.waitForBoot {
    ~dirt = SuperDirt(4, s); // two output channels, increase if you want to pan across more channels
    ~dirt.loadSoundFiles;   // load samples (path can be passed in)
    s.sync; // wait for samples to be read
    ~dirt.start(57121, [0, 0]);   // start listening on port 57120, create two busses each sending audio to channel 0
}
)
// now you should be able to send from tidal via port 57120

s.scope

s.makeWindow

~one = {DFM1.ar(SinOsc.ar(80,0,0.1),[80,80*2,80*3,80*4],Saw.kr([0.43,0.5,0.51,0.6],9).unipolar,1,0,0.002,0.05)}

~one.clear

p.clock.tempo = 0.45;

0.6/16*12

StageLimiter.activate

~oner = {DFM1.ar(SinOsc.ar(80,0,0.1),[100,80,60,80],Saw.kr(96/60*2,80).unipolar,1,0,0.002,0.05)}

~oner.stop

~erk = {Pan4.ar(FreeVerb.ar(SinOsc.ar(TRand.kr(800,810,Dust.kr(9)),0,0.9),0.9,0.5,SinOsc.kr(0.9),SinOsc.kr(0.41)))}
~erk2 = {Pan4.ar(FreeVerb.ar(SinOsc.ar(TRand.kr(1000,1100,Dust.kr(9)),0,0.9),0.9,0.5,SinOsc.kr(0.9),SinOsc.kr(0.41)))}


~erk2.stop(40)

~erk.stop(40)

~oner.play