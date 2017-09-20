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

p.clock.tempo = 2.2
p.fadeTime = 2


/*

Hellaw Newcassel!

My name is coï¿¥ï¾¡pt.

I will be making some music for you today.

s/o to hellocatfood <3

*/




/*

Start set with intermittent molecular bass
Add tone clusters

ravestabs into molecularbass
add molecular sines
end in madness

*/

(
~sines = Pbind(\instrument,\sinfb,\atk,3,\rel,3,\dur,Pseq([0,0,0,6],inf),\freq,Pseq(d[\data].melody,inf),\amp,0.1);
~sin = {SinOsc.kr(0.1).range(0.01,1.5)};
~sines.set(\fb,~sin);
)

(
l = Pbjorklund2(Pwhite(2,13),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pseq(d[\data].bass/2,inf),\dur,l,\d,0.21,\a,Pwhite(1,200),\pan,0,\amp,0.5);
)



