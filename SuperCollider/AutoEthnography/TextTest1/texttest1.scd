f = File.new("codeExecuted.txt","a")
this.codeDump = { |str| f.write(str); str.postln; }

{SinOsc.ar(440,0,0.1)}.play;
{RR{} }}.play;