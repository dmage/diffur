% vim: set ts=4 spelllang= :
% prologues := 1;

verbatimtex
\input{preheader}
\begin{document}
etex

beginfig(1);
	numeric u;
	u = 0.8cm;

	drawarrow (1u,0u)--(1u,7u);
	drawarrow (0u,1u)--(9u,1u);

	path g;
	g = (4.5u,6.8u)..(8.5u,6.5u)..(8.8u,3.5u)..(4.5u,0.2u)..(0.8u,0.8u)..(0.2u,3.5u)..cycle;
	draw g;
	label.top( btex \(G\) etex, point 3.3 of g );

	path r;
	r = (2u,0.5u)..(4u,4u)..(8u,6u);

	draw r withpen pencircle scaled 0.7;
	draw point 1 of r withpen pencircle scaled 0.1u;

	pair A, B, C;
	C = point 1 of r;
	A = C - 3u*unitvector( direction 1 of r );
	B = C + 3u*unitvector( direction 1 of r );
	draw A--B;

	draw (point 1 of r)--(point 1 of r + (2u, 0u));

	def draw_angle(expr A,O,B,d) =
		(O + d*unitvector(A-O))
		{ d*unitvector(A-O) rotated 90 }
		..
		{ d*unitvector(B-O) rotated 90 }
		(O + d*unitvector(B-O));
	enddef;
		
	path a;
	a = draw_angle(
		(point 1 of r + (2u, 0u)),
		(point 1 of r),
		B,
		1u
	);
	draw a;
	label.urt( btex \(\alpha\) etex, point 0.3 of a );
	
	label.lrt( btex \(M_0(x_0,y_0)\) etex, (point 1 of r)-(0.2u,0u) );
	label.rt( btex \(y = \phi(x)\) etex, point 0.4 of r );
endfig;

beginfig(2)
	numeric u;
	u = 1cm;
	
	pair d;

	drawarrow (-3u,0u)--(3u,0u);
	drawarrow (0u,-4u)--(0u,+4u);

	draw (-1u,0u) withpen pencircle scaled 0.1u;
	label.bot( btex \(-1\) etex, (-1u,0u) );
	draw (1u,0u) withpen pencircle scaled 0.1u;
	label.bot( btex \(1\) etex, (1u,0u) );
	
	path r;
	r = (-2.5u,-3.375u)..(-2u,-1u)..(-1.5u,-0.125u)..(-1u,0u)--(1u,0u)..(1.5u,0.125u)..(2u,1u)..(2.5u,3.375u);
	draw r withpen pencircle scaled 0.7;
endfig;

beginfig(3)
	numeric u;
	u = 1cm;

	drawarrow (-3u,0u)--(3u,0u);
	drawarrow (0u,-3u)--(0u,3u);

	numeric l;
	l = 2.5;

	draw (-l*u,l*u)--(l*u,-l*u);
	draw (-l*u,-l*u)--(l*u,l*u);

	path r;
	r := for x := -l step .1 until l:
		(x*u,sqrt(x**2+1)*u)..
	endfor (l*u,sqrt(l**2+1)*u);
	draw r;
	draw r rotated 90;
	draw r rotated -90;
	draw r rotated 180;

	r := for x := -l step .1 until l:
		(x*u,sqrt(x**2+2)*u)..
	endfor (l*u,sqrt(l**2+2)*u);
	draw r;
	draw r rotated 90;
	draw r rotated -90;
	draw r rotated 180;
endfig;

beginfig(4)
	numeric u;
	u = 1cm;

	drawarrow (-3u,0u)--(3u,0u);
	drawarrow (0u,-3u)--(0u,3u);

	numeric l;
	l = 2.5;

	draw (0u,0u)--(l*u,-l*u);
	draw (0u,0u)--(l*u,l*u);

	path r;
	r := for x := l step -.1 until 0:
		(x*u,sqrt(x**2+1)*u)..
	endfor (0*u,sqrt(1)*u){-1,0}..{0,-1}(-sqrt(1)*u,0u){0,-1}..{1,0}(0u,-sqrt(1)*u) for x := 0 step .1 until l:
		..(x*u,-sqrt(x**2+1)*u)
	endfor;
	draw r;
	
	r := for x := -l step .1 until l:
		(x*u,sqrt(x**2+1)*u)..
	endfor (l*u,sqrt(l**2+1)*u);
	draw r rotated -90;

	r := for x := l step -.1 until 0:
		(x*u,sqrt(x**2+2)*u)..
	endfor (0*u,sqrt(2)*u){-1,0}..{0,-1}(-sqrt(2)*u,0u){0,-1}..{1,0}(0u,-sqrt(2)*u) for x := 0 step .1 until l:
		..(x*u,-sqrt(x**2+2)*u)
	endfor;
	draw r;
	
	r := for x := -l step .1 until l:
		(x*u,sqrt(x**2+2)*u)..
	endfor (l*u,sqrt(l**2+2)*u);
	draw r rotated -90;
endfig;

end.
