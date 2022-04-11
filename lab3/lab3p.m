function Y=Lagrange(x, y, xx)
  %x - input points
  %y - corrseponding points
  %xx - test input for result
  %Y - result 
  
  [m, n] = size(x);
  A = [];
  for i = 1:n
    difference = x(i) - x;
    A = [A, 1/(prod(difference(1 : i - 1)) * prod(difference(i + 1: end)))];
  end
  
  Y = sum(A.* y ./ (xx' - x), ind=2) ./ sum(A ./ (xx' - x), ind=2);
  
end

x = [1930 1940 1950 1960 1970 1980];
y = [123203 131669 150697 179323 203212 226505];
xx = [1955 1995];

yy = Lagrange(x, y, xx);

printf("Approximate value of f(1955) = %f, approximate value of f(1995) = %f \n"
, yy(1), yy(2));

x = [64 81 121];
y = [8 9 11];
xx = [115];

yy = Lagrange(x, y, xx);

printf("Approximate value of sqrt(115) = %f \n", yy(1));

X = [0:0.001:10];
lambda_f = @(x) (1 + cos(pi * x)) ./ (1 + x);

plot(X, lambda_f(X), 'Color', 'r')

x = linspace(0, 10, 21);
y = Lagrange(x, lambda_f(x), X);

hold on

plot(X, y', 'Color', 'b')

legend('(1+cos(pi*x))/(1 + x)', 'lagrange')


