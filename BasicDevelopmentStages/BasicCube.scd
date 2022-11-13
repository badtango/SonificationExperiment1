(
var w, 
ln = 600, ln2 = 152, lin = 700, lin2 = 250;
w = Window("Cube");
w.view.background = Color.white;
w.front;
w.fullScreen;
w.drawHook = {
       Pen.use { 
		Pen.translate(240, -35);
		Pen.color = Color.black;
		Pen.width = 1.5;
                
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
			
}; // end use
}; // end drawhook

)

