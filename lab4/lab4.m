% ex 1

function Y = Newton(x, y, value)
    %x - input points
    %y - corrseponding points
    %xx - test input for result
    %Y - result

    n = length(x);

    p = 1;

    result = y(1);

    for i=2:n
        p = p * (value - x(i-1));

        result = result + p * div_diff(x(1:i), y(1:i));

    endfor

    Y = result;

endfunction
 


x = [1 1.5 2 3 4];
y = [0 0.17609 0.30103 0.47712 0.60206];
value = 2.5;

yy = Newton(x,y,value)

value = 3.5;

yy = Newton(x,y,value)

% ----------------------

i = 10 : 1 : 35;

y_i = i /10;

maxim = -10000;

for i=y_i

    maxim = max(maxim, log10(i) - Newton(x, y, i));

endfor

maxim

% ex 2 -----------------

x = [1 2 3 4 5]
y = [22 23 25 30 28]

yy = Newton(x, y, 2.5)

% b --------------------


xx = 1 : 0.2 : 5;

yy = [];

for val=xx

    yy = [yy Newton(x,y,val)];

endfor

yy;

hold on;
plot(x, y)
plot(xx, yy)


% ex 3 -----------------

f = @(x) exp(sin(x));

x = 0: .5 : 6;

y = f(x);

xx = 0 : 0.2 : 6;

yy = [];

for val=xx

    yy = [yy Newton(x,y,val)];

endfor

yy;

hold on;
fplot(f, [0,6])
plot(xx, yy)

% ex 4 -----------------

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
    endfor
  endfor
  
  A = f;
endfunction

x = [81 100 121 144 169];
y = sqrt(x);

[n, m] = size(x);

approx = Aitken(x, y, 115);


% ex5 ------------------

function retval=neville(x, x_vals, f_vals)
  m = length(x_vals);
  table = zeros(m, m);
  table(:, 1) = f_vals;
 
  for i=2:m
    for j=2:i
      table(i, j) = ((x_vals(i) - x) * table(i-1, j-1) + (x-x_vals(i-j+1))*table(i, j-1))/(x_vals(i)-x_vals(i-j+1));   
    endfor
   endfor

   retval = table;
endfunction

% a --------------------

f1 = @(x) 3 .^ x;

x = [-2 -1 0 1 2];

y = f1(x);

yy = neville(1/2, x, y);

% b --------------------

x = [0 1 2 4 5];

f2 = @(x) sqrt(x);

y = f2(x);

yy = neville(5, x, y)
