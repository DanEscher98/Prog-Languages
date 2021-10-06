program Fibonacci(input, output);
var
	i, n, Fib, Last, NextToLast, Temp: integer;

begin
	write('Set n: '); read(n);
	if n=0 then
		Fib := 0;
	if n=1 then
		Fib := 1;
	if n>=2 then
		begin
			Last := 1;
			NextToLast := 0;
			for i:=2 to n do 
				begin
					Temp := Last;
					Last := Last + NextToLast;
					NextToLast := Temp;
				end;
			Fib := Last;
		end;
	writeln('Fib(',n,') = ',Fib);
end.