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
A = zeros(N-1, N-1);   % Au ≈ d^2u/dx^2
range = linspace(0, 1, N-1);
 
write_obj = VideoWriter('outw1.avi');
write_obj.FrameRate = 10;
open(write_obj);
 
nframe=M;
mov(1:nframe) = struct('cdata', [], 'colormap', []);
set(gca, 'nextplot', 'replacechildren')
 


for n=1:N-1 % slinga med rumssteg för att bilda begynnelsedata och A 
   A(n,n) = -2*N^2; 
   A(n+1,n) = N^2; 
   A(n,n+1) = N^2; 
end
% bilda A på randen

X = linspace(0, 1, N-1);
u(:,1) = sin(10*X); % initialvärde för u(x,0) = g(x)
A = A(1:N-1, 1:N-1); %Ta bort sista termerna A(n,n+1) och A(n+1,n)

A(1,1) = -N^2;
A(N-1,N-1) =-N^2;

for m=1:M % tidstegning med symplektiska Euler
    p(:,m+1) =  p(:,m) + dt*(A*u(:,m));
    u(:,m+1) =  u(:,m) + dt*p(:,m+1);
    plot(range,u(:,m));
    title('neumann randvillkor')

    mov(m) = getframe(gcf);
end
writeVideo(write_obj,mov);
close(write_obj);