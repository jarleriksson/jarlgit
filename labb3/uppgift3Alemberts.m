% Vågekvationen med homogena dirichletvillkor och c=1
clear
close all
 
N = 300; % antal intervall
x_interval = 1.0; % 0 < x < 1
t_end = 10; % 0 < t < 10
h = x_interval/N; % steglängd
dt = h/2; % tidssteg
M = fix(t_end/dt); % antal tidssteg
axis([0 1 -2.2 2])
 
% allokering av minne
u = zeros(N-1, M+1);   % u(n,m) -> utböjning vid t = (m-1)*dt och x = n*dx
p = zeros(N-1, M+1);   % p = u' hastighet
range = linspace(0, 1, N-1);
 
write_obj = VideoWriter('outw1.avi');
write_obj.FrameRate = 10;
open(write_obj);
 
nframe=M;
mov(1:nframe) = struct('cdata', [], 'colormap', []);
set(gca, 'nextplot', 'replacechildren')
 



X = linspace(0, 1, N-1);
u(:,1) = sin(10*X); % initialvärde för u(x,0) = g(x)


for m=1:M % tidstegning med symplektiska Euler
    for n = 1:N-1
        u(n,m) =  sin(10*(X(n)+(m-1)*dt)) + sin(10*(X(n)-(m-1)*dt));   
    end
    plot(range,u(:,m));
    title 'dtAlemberts lösningsformel'
    mov(m) = getframe(gcf);
end
writeVideo(write_obj,mov);
close(write_obj);