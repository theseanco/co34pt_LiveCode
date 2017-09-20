("/home/smc/src/github/howto_co34pt_liveCode/Setup/Setup.scd").load


(
// running this block will take some time!

var whole, whole_text;

d[\data] = ();

whole=FileReader.read("/home/smc/Documents/Data/AlgoraveData/data/androgen-receptor/st1/trajectory.pdb", skipBlanks:true);


whole = whole.select{|itm, i| itm[2] == "CA" }; // find the CA as this is the centre position of each 'element(?)'
whole = whole.collect{|itm, i| itm = itm[1..8]; }; // just keep the useful bits of the data

whole_text = whole.collect{|itm, i| itm[2..3]}; // new array with just the text columns

whole = whole.collect{|itm, i| itm[3..].asFloat }; // new array with just the numerical data converted to floats

whole = whole.collect{|itm, i| itm = itm.insert(0, whole_text[i]); }; // put the text back into the float array

whole = whole.clump(251); // group the data by frame

d[\data].x_model = whole[0].collect{|itm| itm[3] }; // make a new array which is only the x coordinates of the whole model in the first frame
d[\data].x_traj = whole.flop[0].collect{|itm| itm[3] }; // make a new array which is only the x coordinates of the first residue over time
)

d[\data].bass = d[\data].x_model.linlin(d[\data].x_model.minItem, d[\data].x_model.maxItem, 40, 200);  // map the data to a good range for pitch values
d[\data].melody = d[\data].x_model.linlin(d[\data].x_model.minItem, d[\data].x_model.maxItem, 100, 2000);  // map the data to a good range for pitch values

p.clock.tempo = 2.4
p.fadeTime = 2


/*

Hellaw Newcassel!

My name is coï¿¥ï¾¡pt.

I will be making some music for you today.

s/o to hellocatfood <3

*/




/*

END SET

ravestabs into molecularbass
add molecular sines
end in madness

*/


(
l = Pbjorklund2(Pwhite(1,10),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/2,inf),\dur,l,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.9);
~ring2 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/4,inf),\dur,l,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.9);
~ring3 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass,inf),\dur,l,\d,0.22,\a,Pexprand(1,400),\pan,0,\amp,0.9);

)

~ring3.play

p.clock.tempo = 2.3

~ring1.play

//rlpfd
~rlpfdSend = {Mix.ar([~ring1])};
~rlpfd = {arg speed = 0.1, min = 800, max = 4000, res = 0.8, dist = 0.2; XFade2.ar(~ring1, RLPFD.ar(NumChannels.ar([~rlpfdSend]),SinOsc.kr(speed).range(min,max),res,dist,3),0.9,2)};
~rlpfd.play;



