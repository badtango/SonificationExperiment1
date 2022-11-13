(
var w, run = true, phase = 0, rot = 0.05.rand, rotopp = -0.05.rand, 
ln = 600.rand, ln2 = 152.rand, ln3 = 152.rand, 
lin = 100.rand, lin2 = 10.0.rand, lin3 = 10.0.rand, 
liny = 3600.rand, liny2 = 3152.rand, liny3 = 3152.rand;

w = Window("Basic Rotation 3");
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;
w.fullScreen;
w.drawHook = {
	Pen.use { 
		Pen.color = Color.rand;
		Pen.width = 2.0.rand;
		Pen.translate(630, 375);
		Pen.rotate(phase * sin(phase * 1.0 + 1pi) + 0.005);
		Pen.scale(1, 0.7 * sin(phase * 2.0 + 2pi) + rot );
		40.do {			
			Pen.beginPath;
			// left line
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(ln2, ln3));
			Pen.lineTo(Point(ln2, ln));	
			// right line
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(ln, ln3));
			Pen.lineTo(Point(ln, ln));
			// bottom line
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(ln, ln));
			Pen.lineTo(Point(ln2, ln));
			// top line
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(ln2, ln3));
			Pen.lineTo(Point(ln, ln3));							
			// diagonal
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(ln2, ln));
			Pen.lineTo(Point(ln, ln2));	
			// diagonal opposite
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(ln3, ln2));
			Pen.lineTo(Point(ln, ln));	
          
           // inner circle
			// left line
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(lin2, lin3));
			Pen.lineTo(Point(lin2, lin));	
			// right line
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(lin, lin3));
			Pen.lineTo(Point(lin, lin));
			// bottom line
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(lin, lin));
			Pen.lineTo(Point(lin2, lin));
			// top line
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(lin2, lin3));
			Pen.lineTo(Point(lin, lin3));							
			// diagonal
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(lin2, lin));
			Pen.lineTo(Point(lin, lin2));	
			// diagonal opposite
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(lin3, lin2));
			Pen.lineTo(Point(lin, lin));	

           // outer circle
			// left line
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(liny2, liny3));
			Pen.lineTo(Point(liny2, liny));	
			// right line
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(liny, liny3));
			Pen.lineTo(Point(liny, liny));
			// bottom line
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(liny, liny));
			Pen.lineTo(Point(liny2, liny));
			// top line
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(liny2, liny3));
			Pen.lineTo(Point(liny, liny3));							
			// diagonal
			Pen.rotate(phase * rotopp);
			Pen.moveTo(Point(liny2, liny));
			Pen.lineTo(Point(liny, liny2));	
			// diagonal opposite
			Pen.rotate(phase * rot);
			Pen.moveTo(Point(liny3, liny2));
			Pen.lineTo(Point(liny, liny));		
		
			Pen.stroke;
			
		};
	};
};

{ while { run } { w.refresh; 0.04.rand.wait; phase = phase + 0.0025pi;} }.fork(AppClock)

)
