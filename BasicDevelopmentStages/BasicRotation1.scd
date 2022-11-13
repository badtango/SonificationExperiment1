(
var w, run = true, phase = 0, rot = 0.05.rand, 
ln = 600, ln2 = 152, lin = 700, lin2 = 250;
w = Window("Basic Rotation 1");
w.view.background = Color.black;
w.onClose = { run = false; };
w.front;
w.fullScreen;
w.drawHook = {
       Pen.use { 
		Pen.translate(640, 375);
		Pen.scale(0.35, 0.45 * sin(phase * 0.7 + 2.0) );
		Pen.rotate(phase * 4.0);
		Pen.color = Color.rand(0.3, 1.0);
		Pen.width = 1.0;
		40.do {		
           Pen.beginPath;
            Pen.rotate(phase * 1.0);        
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
			
			// second square
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
			
			// diagonal points
			// bottom left
			Pen.moveTo(Point(ln2, ln));
			Pen.lineTo(Point(lin2, lin));	
			// bottom right 
			Pen.moveTo(Point(ln, ln));
			Pen.lineTo(Point(lin, lin));
			// top left
			Pen.moveTo(Point(ln2, ln2));
			Pen.lineTo(Point(lin2, lin2));
			// top right
			Pen.moveTo(Point(ln, ln2));
			Pen.lineTo(Point(lin, lin2));			
			
			Pen.stroke;
			
}; // end do
}; // end use
}; // end drawhook

{ while { run } { w.refresh; 0.05.rand.wait; phase = phase + 0.0009pi;} }.fork(AppClock)

)

