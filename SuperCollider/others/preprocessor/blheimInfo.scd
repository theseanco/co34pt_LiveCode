//will post hello world every time code is executed
thisProcess.interpreter.preProcessor = { |str| "\'hello world\'.postln;"++ str }


//replaces SO with SinOsc
thisProcess.interpreter.preProcessor = { |str| str.replace("SO", "SinOsc")}
{SO.ar(440)}.play;
