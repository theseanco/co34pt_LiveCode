/*
                     *  .  *
                   . _\/ \/_ .
                    \  \ /  /             .      .
      ..    ..    -==>: X :<==-           _\/  \/_
      '\    /'      / _/ \_ \              _\/\/_
        \\//       '  /\ /\  '         _\_\_\/\/_/_/_
   _.__\\\///__._    *  '  *            / /_/\/\_\ \
    '  ///\\\  '                           _/\/\_
        //\\                               /\  /\
      ./    \.             ._    _.       '      '
      ''    ''             (_)  (_)                  <> \  / <>
                            .\::/.                   \_\/  \/_/
           .:.          _.=._\\//_.=._                  \\//
      ..   \o/   ..      '=' //\\ '='             _<>_\_\<>/_/_<>_
      :o|   |   |o:         '/::\'                 <> / /<>\ \ <>
       ~ '. ' .' ~         (_)  (_)      _    _       _ //\\ _
           >O<             '      '     /_/  \_\     / /\  /\ \
       _ .' . '. _                        \\//       <> /  \ <>
      :o|   |   |o:                   /\_\\><//_/\
      ''   /o\   ''     '.|  |.'      \/ //><\\ \/
           ':'        . ~~\  /~~ .       _//\\_
jgs                   _\_._\/_._/_      \_\  /_/
                       / ' /\ ' \                   \o/
       o              ' __/  \__ '              _o/.:|:.\o_
  o    :    o         ' .'|  |'.                  .\:|:/.
    '.\'/.'                 .                 -=>>::>o<::<<=-
    :->@<-:                 :                   _ '/:|:\' _
    .'/.\'.           '.___/*\___.'              o\':|:'/o
  o    :    o           \* \ / */                   /o\
       o                 >--X--<
                        /*_/ \_*\
                      .'   \*/   '.
                            :
                            '

*/




/*

THANKS TO:

JarredGibb
Robinhood76
schafferdavid
daveincamas
YleArkisto

Samples:
jingle
xmasband
trafficlight
reindeer


*/

//hello everyone.

//I am currently having a few issues streaming.

//give me a moment.

//as the stream keeps dropping to WPC, this will be a CLR-only radio stream

//For those of you watching in the future, I am going to be playing a set that is comprised only of sounds taken from Freesound.org when I searched for christmas terms such as 'Christmas' 'Sleigh Bell' and 'Reindeer'. I also have some visual surprises for you at some point, which I may or may not remember to show.

//Happy holidays.

p.fadeTime=4

~warp1 = {Warp1.ar(2,d["jingle"][0],LFNoise1.kr(0.1).range(0.5,0.55),1,0.8)}

~warp2 = {Warp1.ar(2,d["jingle"][0],LFNoise1.kr(0.1).range(0.5,0.55),0.9,0.6,interp:4)}

~buffer2 = {PlayBuf.ar(2,d["xmasband"][0],SinOsc.kr(0.01).range(0.7,1),1,d["xmasband"][0].numFrames/2,1) * 0.4}

(
~warp1.clear;
~warp2.clear;
~buffer2.play;
)

(
Tdef(\jinglealltheway, {
	loop {
		{PlayBuf.ar(2,t,rrand(0.01,0.1),1,0,0,2) * rrand(0.3,1.9)}.play;
		rrand(10,400).wait;
		["jingle all the way".postln,"".post!4].flat.choose;
}};
)
)

//a christmas nightmare.

q.play

~buffer.stop(20)


~buffer = {PlayBuf.ar(2,q,LFNoise0.kr(0.1),1,0,1,0)}

~verb.play

~verb = {FreeVerb.ar(~buffer2.ar,0.9,0.9,0.4)}

~verb.play



q.play

q = Buffer.read(s,"/home/smc/Downloads/188292__schafferdavid__blindtrafficlight.wav")
Tdef(\jinglealltheway).play

q = Buffer.read(

~buffer.play


~warp2.play







/*


                          _...--...
                       .8"        88-.
                     ,888888     88888\
                   ,888888888-=.8888888)
                 ,'    `~88'    )888888)
               ,'       ,'     ,:.    /
             ,888888888'     ,88888 ,'
           ,888888888'       (888888
         ,888888888'          "-887
       ,'       ,'
     ,'       ,'
   ,888888888'
 ,888888888'
(88888888'
 "-.  ,'
    "~


*/











/*





                                                 zr
                                              Yt$$$.
                                           .,e$$$$$F'
                         4e r               $$$$$$$.
                         d$$br            _z$$$$$$$F`
                          ?$$b._          ^?$$$$$$$
                           4$$$"     -eec.  ""JP" ..eee$%..
                           -**N #c   -^***.eE  ^z$P$$$$$$$$$r-
                  .ze$$$$$eu?$eu '$$$$b $=^*$$ .$$$$$$$$$$"
               --."?$$$$$$$$$c"$$c .""" e$K  =""*?$$$P""""
   ueee. `:`  $E !!h ?$$$$$$$$b R$N'~!! *$$F J"""C.  `
  J  `"$$eu`!h !!!`4!!<?$$$$$$$P ?".eee-z.ee" ~$$e.br
  'j$$Ne`?$$c`4!~`-e-:!:`$$$$$$$ $$**"z $^R$P  3 "$$$bJ
   4$$$F".`?$$c`!! \).!!!`?$$$$F.$$$# $u$% ee*"^ :4`"$"?$q
    ""`,!!!:`$$N.4!!~~.~~4 ?$$F'$$F.@.* -L.e@$$$$ec.      "
    "Rr`!!!!h ?$$c`h: `# !! $F,r4$L***  e$$$$$$$$$$$$hc
      #e'4!!!!L`$$b'!.:!h`~~ .$F'"    d$$$$$$$$$$$$$$$$$h,
       ^$.`!!!!h $$b`!. -    $P /'   .$$$$$$$$$$$$$$$$$$$$$c
         "$c`!!!h`$$.4~      $$$r'   <$$$$$$$$$$$$$$$$$$$P"""
           ^te.`~ $$b        `Fue-   `$$$$$$$$$$$$$$P".:  !! "<
              ^"=4$P"     .,,,. -^.   ?$$$$$$$$$$"?:. !! :!!~ ,,ec..
                    ..z$$$$$$$$$h,    `$$$$$$P"..`!f :!f ~)Lze$$$P""""?i
                  ud$$$$$$$$$$$$$$h    `?$$F <!!'<!>:~)ue$$P*"..:!!!!! J
                .K$$$$$$$$$$$$$$$$$,     P.>e'!f !~ ed$$P".:!!!!!!!!`.d"
               z$$$$$$$$$$$$$$$$$$$$      4!!~\e$$$P`:!!!!!!!!!!'.eP'
              -*". . "??$$$$$$$$$$$$       ~ `z$$$F".`!!!!!!!!!!',dP"
            ." ):!!h i`!- ("?$$$$$$f        ,$$P":! ). `'!!!!`,d$F'
       .ueeeu.J`-^.!h <-  ~`.. ??$$'       ,$$ :!!`e$$$$e `,e$F'
    e$$$$$$$$$$$$$eeiC ")?:-<:%':^?        ?$f !!! ?$$$$",F"
   P"....```""?$$$$$$$$$euL^.!..` .         "Tu._.,``""
   $ !!!!!!!!!!::.""??$$$$$$eJ~^=.            ````
   ?$.`!!!!!!!!!!!!!!:."??$$$$$c'.
    "?b.`!!!!!!!!!!!!!!!!>."?$$$$c
      ^?$c`'!!!!!!!!!!!',eeb, "$$$k
         "?$e.`'!!!!!!! $$$$$ ;.?$$
            "?$ee,``''!."?$P`i!! 3P
                ""??$bec,,.,ceeeP"
                       `""""""




*/








/*



                    |

       \            |              /
          \                     /
                 .  ::  .
              .: `      ` :.
             ..            ..
             ..     )\     ..
  --  --     ..    (  )    ..     --  --
               : . _\/_ . :
                 `()()()`
                  ||'`'|
                  || G |
                  || E |   .::
                  || n |   `` ::
                  || i |       ::
       ...        || e |       ::
      :   ':::.   ||   |  ....::"
            ``:::::::::::::".``  R. Nykvist (Chuckles)
                :::::::::::`
              Season Greetings


*/


