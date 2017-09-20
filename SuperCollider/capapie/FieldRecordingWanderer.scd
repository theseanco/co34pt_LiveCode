

(
~one = {PlayBuf.ar(2,d["k"][0],1,1,0,1,0) * ~oneM.kr};
~two = {PlayBuf.ar(2,d["s"][1],1,1,0,1,0) * ~twoM.kr};
~three = {PlayBuf.ar(2,d["ch"][2],1,1,0,1,0) * ~threeM.kr};
~four = {PlayBuf.ar(2,d["sfx"][3],1,1,0,1,0) * ~fourM.kr};
)


~one.play;~two.play;~three.play;~four.play;

~four.play

~oneM = {LFNoise1.kr(0.1).abs.exprange}
~twoM = {LFNoise1.kr(0.1).abs.exprange}
~threeM = {LFNoise1.kr(0.1).abs.exprange}
~fourM = {LFNoise1.kr(0.1).abs.exprange}

