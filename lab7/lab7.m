% exercice 1


% x = 1 : 1 : 7;

% f = [13 15 20 14 15 13 10];

% x = [0 1 2 3];

% f = [ -4 0 4 -2 ];


% m = length(x) - 1


% numer_a = (m + 1) * sum(x .* f) - sum(x) * sum(f)
% denom_a = (m + 1) * sum(x .* x) - sum(x) * sum(x)

% a = numer_a / denom_a

% numer_b = sum(x .* x) * sum(f) - sum(x .* f) * sum(x)
% denom_b = (m + 1) * sum(x .* x) - sum(x) * sum(x)

% b = numer_b / denom_b

% hold on;
% plot(x, f, '*');

% space = 0 : 0.01 : 7;
% values = a .* space + b;

% plot(space, values)


% exercice 2 

% x = [0 10 20 30 40 60 80 100];

% f = [0.0061 0.0123 0.0234 0.0424 0.0738 0.1992 0.4736 1.0133];


% linear = polyfit(x, f, 1);

% quadratic = polyfit(x, f, 2);

% approx1 = polyval(linear, 45)

% approx2= polyval(quadratic, 45)

% printf("approx error for linear is ")
% abs(approx1 - 0.095848)

% printf("approx error for square is ")
% abs(approx2 - 0.095848)

% space = 0 : 0.01 : 100;
% hold on;
% plot(x, f, "*");
% plot(space, polyval(linear, space));
% plot(space, polyval(quadratic, space));


% exercice 3) 

clf;
hold on;
grid on;
axis([0 3 0 5]);

xx = [];
ff = [];

for i=1:10

    [x, f] = ginput(1);
    plot(x,f,"*b");
    xx = [xx x];
    ff = [ff f];

endfor

quadratic = polyfit(xx, ff, 2);
space = 0 : 0.01 : 3;
plot(space, polyval(quadratic, space));







