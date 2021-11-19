#12/Nov/2020
use Math::Utils qw(:utility);

sub integral(Int $a, Int $b){
	my $n = int((b-a)/0.0001);
	my $delta_x = (b-a)/n;
	my $sum = 0;
	for my $i (1..n){
		$x_i = a + ($i-0.5)*delta_x;
		sum += f($x_i)*delta_x;
	}
	return $sum;
}

sub f($x){return sin($x);}

sub run{
	my $a = prompt 'Enter a: ';
	my $b = prompt 'Enter b: ';
	my $ans = integral($a, $b);
	print "I[f(x)] with";
	print "\na = ", $a;
	print "\nb = ", $b;
	print "\nis equal to: ", $ans,"\n";
}

run();