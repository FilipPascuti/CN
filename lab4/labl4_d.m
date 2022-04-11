function A = Aitken(x, y, xx)
  %x - input points
  %y - corrseponding points
  %xx - test input
  %A - result of Aitken's algorithm
  [n, m] = size(x);
  f = [y'];
  for i = 0:m-1
    for j = 0:i-1
      d = det([f(j + 1, j + 1), x(j + 1) - xx; f(i + 1, j + 1), x(i + 1) - xx]);
      f(i + 1, j + 2) = 1 / (x(i + 1) - x(j + 1))* d;
    end
  end
  
  A = f;
end

function Y = Newton(x, y, xx)
  %x - input points
  %y - corrseponding points
  %xx - test input for result
  %Y - result
  
  [m, n] = size(x);
  A = x';
  A = [(0 : n - 1)', A, y'];
  
  for i = 1 : n-1
    A = [A, [(A(2: (end - i + 1), end) - A(1: end - i, end))./(A(i + 1: end, 2) 
    .- A(1: end - i, 2)); NaN(i, 1)]];
  endfor
 
 A = A(1, 3: end);
 
 Y = A * [ones(size(xx')), cumprod(xx' - x(1 : end - 1), dim=2)]';

endfunction

% ex 1 ------------------------

x = [1 1.5 2 3 4];
y = [0 0.17609 0.30103 0.47712 0.60206];
xx = [2.5 3.25];

yy = Newton(x, y, xx);

printf("Approximation of lg(2.5) = %f, approximation of lg(3.25) = %f \n",
yy(1), yy(2));

y_i = [10:35] ./ 10;

printf("Maximum interpolation error is %f \n",
max(abs(log10(y_i) - Newton(x, y, y_i))))

%ex 2 ------------------------

x = [1 2 3 4 5];
y = [22 23 25 30 28];
xx = [2.5];

yy = Newton(x, y, xx);

printf("Pounds of potatoes for 2.5 pounds fertilizer = %f\n", yy(1));

xx = [1: 0.01 : 5];
yy = Newton(x, y, xx);


plot(x, y, 'x', 'Color', 'b');
hold on
plot(xx, yy, 'Color', 'r');

% ex 3 ------------------------

X = [0 : 0.01 : 6];
lambda_f = @(x) exp(sin(x));

plot(X, lambda_f(X), 'Color', 'r'); 

x = linspace(0, 6, 13);
y = Newton(x, lambda_f(x), X);

hold on

plot(X, y', 'Color', 'b')

plot(x, lambda_f(x), 'x', 'Color', 'k')

legend('e^(sinx)', 'newton', 'interp points');


% ex 4 ------------------------

x = [1: 2: 115];
y = sqrt(x);

[n, m] = size(x);

approx = Aitken(x, y, 115);

printf("Approximation of sqrt(115) using Aitken's algorithm = %f \n",
approx(m, m));



