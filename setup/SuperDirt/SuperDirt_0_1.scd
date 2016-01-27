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