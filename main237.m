clear all
clc

yy10 = [5 5 0 0];  % initial condition [x y xd yd]

m = 1;          % mass [kg]
k = 750;        % spring constant [N/m]
c = 20;        % damping coefficient [Ns/m]


% Motor Position
r2 = [0 0]';
r3 = [10 0]';
r4 = [10 10]';
r5 = [0 10]';

dt = 0.02;      % Time step [sec]
Tf = 5;         % Final Time Step [sec]

options = odeset('reltol',1.e-10,'abstol',1.e-10);
[T,Y] = ode45(@(t,yy)eomsolver237(t,yy,m,c,k,r2,r3,r4,r5),0:dt:Tf,yy10,options);

%% Plot

for i = 1:length(T)
    figure(1)
    plot(Y(i,1),Y(i,2),'*r',r2(1),r2(2),'*k',r3(1),r3(2),'*k',r4(1),r4(2),'*k',r5(1),r5(2),'*k',...
         [Y(i,1) r2(1)],[Y(i,2) r2(2)],'--k',[Y(i,1) r3(1)],[Y(i,2) r3(2)],'--k',...
         [Y(i,1) r4(1)],[Y(i,2) r4(2)],'--k',[Y(i,1) r5(1)],[Y(i,2) r5(2)],'--k');
    grid on
    axis equal
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
%     view([0,90])
    axis([0 10 0 10])
    pause(0.05)
    T(i)
end
%%

% x-axis
figure()
plot(T,Y(:,1))
grid on

% y-axis
figure()
plot(T,Y(:,2))
grid on