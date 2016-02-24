(
// configure the sound server: here you could add hardware specific options
// see http://doc.sccode.org/Classes/ServerOptions.html
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 16;
// boot the server and start SuperDirt
s.waitForBoot {
    d = SuperDirt(2, s); // two output channels
    d.loadSoundFiles;   // load samples (path can be passed) mono is assumed.
    s.sync; // wait for samples
    d.start([57121, 57122]);        // start listening on port 57120 and 57121
}
)

(
Server.local.options.memSize * 128;
s.options.numBuffers=4000;
s.boot;
p = ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo=1;
)

~in = {Saw.ar(1)}

~one = {DFM1.ar(~in.ar,freq:1000,res:0.1,inputgain:1,type:0,noiselevel:0.0003,mul:0.1)}

~one.clear

~one.play
