% ex 1

% a)

% x = [0 pi/2 pi 3*pi/2 2*pi]
x = [0 pi/6 pi/4 pi/3 pi/2]
f = @(x) sin(x)

y = f(x)

clapp = spline(x, [1, y, 0]);
natur = spline(x, y);
ppval(natur, pi/7)
sin(pi/7)

% b)

space = 0 : 0.1 : pi/2;

naturlih = ppval(natur, space);
clapped = ppval(clapp, space);

hold on;
plot(space, naturlih)
plot(space, clapped)
fplot(f, [0, pi/2])

% ex 2

% [x, y, button] = ginput(5);

% space = 0 : 0.1 : 1;
natur = spline(x, y);
naturlih = ppval(natur, space);

% hold on;
% plot(x,y,"-r");
% plot(space,naturlih);

clf;
hold on;
axis equal;
grid on;
axis([0 1 0 1]);

xx = []
yy = []

[x, y] = ginput(1);
xx = [xx x]
yy = [yy y]
n = 1;


while ~ isempty([x,y])

    plot(x,y,"ok");
    text(x+0.05, y+0.05, num2str(n), "fontsize", 15);
    [x, y] = ginput(1);
    xx = [xx x];
    yy = [yy y];
    n = n + 1 ;
endwhile

n = length(xx);

t = linspace(0, 1, n)

space = 0: 0.01: 1;

sx = spline(t, xx);
sy = spline(t, yy);


sx_plot= ppval(sx, space)
sy_plot = ppval(sy, space)

plot(sx_plot, sy_plot);

% ex 3)

x = [8 13];
y = [623 993];

clapp = spline(x, [74, y, 72]);

der = polyder(clapp.coefs);

polyval(der, 10);



    


