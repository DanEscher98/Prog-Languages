function y=oct(x)
s = size(x);
for j=1:s(2),
  if x(j)<=0,
    y(j)=-2*x(j);
  else
    y(j)=sin(x(j));
  end
end
endfunction