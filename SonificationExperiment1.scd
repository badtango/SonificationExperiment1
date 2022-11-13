(
r = SynthDef(\sonificate, { arg i_out = 0, attack, release, carfreq, modfreq, index, 
                           modphase, lfofreq, panpos, dur, rmsize, revdamp;
                       var bpf, in, pan2, goenv, lfo, reverb;
                     
                     goenv = EnvGen.kr(Env.perc(attack, release, 0.6), levelScale: 0.4, doneAction: 2);
                        in = PMOsc.ar(XLine.kr(index, carfreq, dur), modfreq, 
                                      XLine.kr(carfreq, index, dur), modphase, goenv);                    
                    reverb = FreeVerb.ar(in, 0.75, rmsize, revdamp);
                      pan2 = Pan2.ar(reverb, 0, 0.6);
                             Out.ar(i_out, pan2);
                             }).send(s);

~funk = ({ arg 
pentrans1 = 0, pentrans2 = 0, 
scale1 = 0, scale2 = 0, 
scale3 = 0, scale4 = 0, 
rot = 0, width = 0, 
colour1 = 0, colour2 = 0, 
rotphase1 = 0, rotphase2 = 0, 
ln = 0, ln2 = 0, 
lin = 0, lin2 = 0, 
liny = 0, liny2 = 0, 
matrix1 = 0, matrix2 = 0, time = 0;

var w, run = true, phase = 0, seed;

w = Window("sonificate", border:false);
w.view.background = Color.black;
w.onClose = { run = false; r.stop; };
w.front;
w.fullScreen;
seed = Date.seed;
w.drawHook = {
        Pen.use { 
		thisThread.randSeed = Date.seed;
		Pen.color = Color.rand(colour1, colour2);
		Pen.width = width;
		Pen.translate(pentrans1, pentrans2);
		Pen.rotate(phase * sin(phase * rotphase1 + 1pi) + rotphase2);
		Pen.scale(scale1, scale2 * sin(phase * scale3 + scale4) + rot );
		Pen.matrix = [ 1, 0, matrix2, 1, matrix1, matrix1 ];
		40.do {		
           Pen.beginPath;
           Pen.rotate(phase * sin(phase * rotphase1 + 1pi) + rotphase2);

// centre circle

			// left line
           Pen.moveTo(Point(ln2, ln2));
           Pen.lineTo(Point(ln2, ln));	
			// right line
           Pen.moveTo(Point(ln, ln2));
           Pen.lineTo(Point(ln, ln));
			// bottom line
           Pen.moveTo(Point(ln, ln));
           Pen.lineTo(Point(ln2, ln));
			// top line
           Pen.moveTo(Point(ln2, ln2));
           Pen.lineTo(Point(ln, ln2));							
			// diagonal
           Pen.moveTo(Point(ln2, ln));
           Pen.lineTo(Point(ln, ln2));	
			// diagonal opposite
           Pen.moveTo(Point(ln2, ln2));
           Pen.lineTo(Point(ln, ln));	
          
// middle circle

			// left line
           Pen.moveTo(Point(lin2, lin2));
           Pen.lineTo(Point(lin2, lin));	
			// right line
           Pen.moveTo(Point(lin, lin2));
           Pen.lineTo(Point(lin, lin));
			// bottom line
           Pen.moveTo(Point(lin, lin));
           Pen.lineTo(Point(lin2, lin));
			// top line
           Pen.moveTo(Point(lin2, lin2));
           Pen.lineTo(Point(lin, lin2));							
			// diagonal
           Pen.moveTo(Point(lin2, lin));
           Pen.lineTo(Point(lin, lin2));	
			// diagonal opposite
           Pen.moveTo(Point(lin2, lin2));
           Pen.lineTo(Point(lin, lin));	

// outer circle

			// left line
           Pen.moveTo(Point(liny2, liny2));
           Pen.lineTo(Point(liny2, liny));	
			// right line
           Pen.moveTo(Point(liny, liny2));
           Pen.lineTo(Point(liny, liny));
			// bottom line
           Pen.moveTo(Point(liny, liny));
           Pen.lineTo(Point(liny2, liny));
			// top line
           Pen.moveTo(Point(liny2, liny2));
           Pen.lineTo(Point(liny, liny2));							
			// diagonal
           Pen.moveTo(Point(liny2, liny));
           Pen.lineTo(Point(liny, liny2));	
			// diagonal opposite
           Pen.moveTo(Point(liny2, liny2));
           Pen.lineTo(Point(liny, liny));			
			
           Pen.stroke;
			
}; // end do
}; // end use
}; // end drawhook

SystemClock.sched(0.0,{ 
			
r = Routine({	

inf.do({ { while { run } { w.refresh; 0.05.rand.wait; phase = phase + 0.00004pi; } }.fork(AppClock); 

pentrans1 = 1000.rand; // horizontal screen placement
pentrans2 = 500.rand; // vertical screen placement
scale1 = 1.0; // size of whole pattern
scale2 = rrand(0.4, 0.9); // vertical width of whole pattern
scale3 = 2.0.rand; // horizontal width of whole pattern
scale4 = 2pi; // ?
rot = 10.0.rand; // zoom
width = rrand(0.01, 1.5); // pen width
colour1 = 0.0 * sin(0.05 * 0.1 + 100pi); // colour lo rand 
colour2 = 1.0 * sin(1.0 * 1.0 + 100pi); // colour hi rand
rotphase1 = 1.0.rand; // rotater1
rotphase2 = 0.005.rand; // rotater2
ln = 600.rand; // square 1 (centre circle)
ln2 = 101.rand; // square 1 (centre circle) 
lin = 100.rand; // square 2 (middle circle)
lin2 = 10.0.rand; // square 2 (middle circle) 
liny = 3400.rand; // square 3 (outer circle)
liny2 = 3052.rand; // square 3 (outer circle)
matrix1 = 50.rand;
matrix2 = 1.0.rand;
time = 13.0.rand; // master time

		if (time.coin) { seed = Date.seed; };
		if (time.coin) { w.view.background = [Color.black, Color.white].choose; };

Synth(\sonificate, [		  \attack, scale3, 
                              \release, time,
                              \carfreq, pentrans2,
                              \modfreq, pentrans1,
                              \index, matrix1,
                              \modphase, lin2,
                              \rmsize, matrix2,
                              \revdamp, scale2,                             
                              \dur, time
             
              ]);                  
                              		     		     
time.wait;	 

}); 
}).play(AppClock); 
}); 

}); 
~funk.value;
)


