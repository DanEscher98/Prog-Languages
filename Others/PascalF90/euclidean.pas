program EuclideanAlgorithm(input, output);
var
	a, b, c, d, r: integer;

begin
	writeln('MCD de a y b');
	write('a = '); read(a);
	write('b = '); read(b);
	r := a mod b;
	d := b;
	while r>0 do 
		begin
			c := d;
			d := r;
			r := c mod d
		end;
	writeln('El MCD de ',a:0,' y ',b:0,' es ',d:0);
end.