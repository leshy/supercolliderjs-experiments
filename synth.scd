
SynthDef("roboPiano", {arg out = 0, freq = 440, amp = 0.2, pan = 0.5;
	var snd, env;
	env = Env.perc(0.02, 0.4).kr(doneAction: 2);
	snd = Mix(LFPulse.ar(
		freq: freq * [1, 5/2],
		iphase: 0.0,
		width: 0.5,
		mul: amp));
	snd = snd * env ;
	Out.ar(out, Pan2.ar(snd, pan));
}).add;


SynthDef("spaceSin", { arg out = 0, freq = 440, amp = 1, gate = 1, cutoff = 100, rq = 0.1, att = 0.1, dec = 0, sus = 1, rel = 0;
	var env;
	env = EnvGen.ar(
		envelope: Env.adsr(0.3, 0, 1, 0.3),
		gate: gate,
		doneAction: 2);
	Out.ar(out, Pan2.ar(
		Mix(SinOsc.ar( [ freq / env, freq / env * 2, freq / env * 4 ], mul: amp * env * 0.3))
	));
}).add;
