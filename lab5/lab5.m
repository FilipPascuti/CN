function ret = repelem(X, m)
  n = length(X);
  R = [[1:n]; m * ones(1, n)];
  ret = repelems(X, R);
end

function f = diff_table(x, dy)
    
    %x - node values
    %dy derivative table, falues for f^(i) are on line i
    
    n = 2 * length(x);
    f = ones(n);
    double_nodes = repelem(x, 2);
    f(:, 1) = repelem(dy(1,:), 2);
    f(1:2:end-1, 2) = dy(2,:);
    f(2:2:end-2, 2) = diff(dy(1,:))'./ diff(x)';
    for j = 3:n
        for i = 1:n-j+1
            f(i, j) = (f(i+1, j-1) - f(i, j-1)) ./ (double_nodes(i+j-1) - double_nodes(i));
        end
    end
end


function [X, Y] = Hermite(nodes, dy, x)
  
    f = diff_table(nodes, dy)
    coefs = f(1,:)
    double_nodes = repelem(nodes, 2)
    X = coefs(1)
    Y = 0;
    p = 1;
    der_p = 0;
    for k = 2:length(coefs)
        der_p = der_p .* (x - double_nodes(k - 1)) + p;
        p = p .* (x - double_nodes(k - 1));
        X = X + coefs(k) .* p;
        Y = Y + coefs(k) .* der_p;
    end
end


% ex1

Time = [0 3 5 8 13];
Distance = [0 225 383 623 993];
Speed = [75 77 80 74 72];

[D, S] = Hermite(Time, [Distance; Speed], [10]); %symbolic Hermite polynomial


printf("Distance at time T=10 is %f, speed at time T = 10 is %f \n", D, S);

% ex2

x = [1, 2];
f = [0, 0.6931];
df = [1, 0.5];

[approx_value,_] = Hermite(x, [f; df], [1.5]);

true_value = log(1.5);

printf("Absolute error for ln(1.5) = %f \n", abs(true_value - approx_value));

% ex3

X = [-5: 0.01: 5];

lambda_f = @(x) sin(2*x);
lambda_df = @(x) 2*cos(2*x);

plot(X, lambda_f(X), 'Color', 'r');

hold on

x = linspace(-5, 5, 15);
f = lambda_f(x);
df = lambda_df(x);

plot(x, f, 'x', 'Color', 'k');


[y,_] = Hermite(x, [f; df], X);



plot(X, y, 'Color', 'b');

legend('sin(2*x)', 'interp points','hermite');

