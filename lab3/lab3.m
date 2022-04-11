function Y=Lagrange(x, y, x_in)
  %x - input points
  %y - corrseponding points
  %x_in - test input for result
  %Y - result 
  
  n = length(x);
  A = [];
  for i = 1:n
    difference = x(i) - x;
    A = [A, 1/(prod(difference(1 : i - 1)) * prod(difference(i + 1: end)))];
  endfor
  
  Y = sum(A.* y ./ (x_in' - x), 2) ./ sum(A ./ (x_in' - x), 2);
  
endfunction

% exercice 1

x = [1930 1940 1950 1960 1970 1980];
y = [123203 131669 150697 179323 203212 226505];
x_in = [1955 1995];

y_out = Lagrange(x, y, x_in)

% exercice 2

x = [100 121 144]
y = [10 11 12]
x_in = [115]

y_out = Lagrange(x, y, x_in)

% exercice 3

X = [0:0.01:10];
x = 0 : 0.5 : 10;

f = @(x) (1 + cos(pi * x)) ./ (1 + x);

y = Lagrange(x, f(x), X);

hold on;
plot(X, f(X))
plot(X, y')

% exercice 4

function Y=Lagrange(x, y, x_in)
  %x - input points
  %y - corrseponding points
  %x_in - test input for result
  %Y - result 
  
  n = length(x);
  A = [];
  for i = 1:n
    difference = x(i) - x;
    A = [A, 1/(prod(difference(1 : i - 1)) * prod(difference(i + 1: end)))];
  endfor
  
  Y = sum(A.* y ./ (x_in' - x), ind=2) ./ sum(A ./ (x_in' - x), ind=2);
  
endfunction

n_s = [2 4 6 8];

f = @(x) 1 ./ ( 1 + x .^ 2);

j = 0 : 1 : 100;
yi = j ./ 10  - 5;

f_yi = f(yi);

for n=n_s
  
  i = 0: 1: n;

  xi = i .* 10 ./ n -5;

  yy = Lagrange(xi, f(xi), yi);

  maxes = max(abs(f_yi - yy'))

endfor


