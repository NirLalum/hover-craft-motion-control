%% 
s = tf('s');
Wap = 3.2;
zeta = 0.75;
Vw = 5; % m/s
Vnom = 40/3.6; % m/s
Ka = 4.3;
Fth = 1500; %N
m = 1230; %Kg
G_ayr_ay = (Wap^2)/(s^2+2*zeta*Wap*s+Wap^2);

% plot real sys graphs

% figure(1)
% t = out.theta.time;
% theta = out.theta.signals.values;
% plot(t, theta,'LineWidth', 2)
% xlabel('time [sec]')
% ylabel('theta [rad]')
% %hold on
% grid on
% 
% figure(2)
% t = out.v.time;
% v = out.v.signals.values;
% plot(t, v,'LineWidth', 2)
% xlabel('time [sec]')
% ylabel('velocity [m/s]')
% %hold on
% grid on
% 
% figure(3)
% t = out.Fth.time;
% Fth = out.Fth.signals.values;
% plot(t, Fth,'LineWidth', 2)
% xlabel('time [sec]')
% ylabel('Fth [N]')
% grid on
% 
% figure(4)
% t = out.ayr.time;
% ayr = out.ayr.signals.values;
% plot(t, ayr,'LineWidth', 2)
% xlabel('time [sec]')
% ylabel('ayr [m/s^2]')
% grid on



% figure(3)
% t = out.x.time;
% x = out.x.signals.values;
%plot(t, x)
% xlabel('time [sec]')
% ylabel('x pos [m]')
 grid on
% 
% figure(4)
% t = out.y.time;
% y = out.y.signals.values;
 %plot(t, y)
% xlabel('time [sec]')
% ylabel('y pos [m]')
% grid on
% 
% figure(5)
%  plot(y,x, '--' ,'LineWidth', 2)
%  xlabel('y pos [m]')
%  ylabel('x pos [m]')
%  grid on
%  hold on

%% linear model
s = tf('s');
Wap = 3.2;
zeta = 0.75;
Vw = 5; % m/s
Ka = 4.3;
Fth = 1500; %N
m = 1230; %Kg
Vnom = 40/3.6; % m/s
G_ayr_ay = (Wap^2)/(s^2+2*zeta*Wap*s+Wap^2);
P_v = (1/(2*Ka*Vnom))/((m/(2*Ka*Vnom))*s+1);
P_theta = G_ayr_ay*(1/s);

% planning controllers to p_v and p_theta
figure(1)
bode(P_v)
grid on
figure(2)
bode(P_theta)
grid on


[Gm_v,Pm_v,Wcg_v,Wcp_v] = margin(P_v);
[Gm_theta,Pm_theta,Wcg_theta,Wcp_theta] = margin(P_theta);

C_v = 1/s;
C_theta_tilda = 0.5;

figure(3)
bode(C_v*P_v);
grid on
figure(4)
margin(C_theta_tilda*P_theta);
grid on

[Gm_v,Pm_v,Wcg_v,Wcp_v] = margin(C_v*P_v);
[Gm_theta,Pm_theta,Wcg_theta,Wcp_theta] = margin(C_theta_tilda*P_theta);


% plot linear model theta and v

% figure(1)
% t = out.theta.time;
% theta = out.theta.signals.values;
% plot(t, theta)
% xlabel('time [sec]')
% ylabel('theta [rad]')
% grid on
% 
% figure(2)
% %t = out.v.time;
% %v = out.v.signals.values;
% plot(t, v)
% xlabel('time [sec]')
% ylabel('velocity [m/s]')
% grid on
% 
% hold on
% %t1 = out.v1.time;
% %v1 = out.v1.signals.values;
% plot(t1, v1)
% xlabel('time [sec]')
% ylabel('velocity [m/s]')
% grid on


figure(3)
t = out.x.time;
x = out.x.signals.values - x(1);
plot(t, x)
xlabel('time [sec]')
ylabel('x pos [m]')
grid on

figure(4)
t = out.y.time;
y = out.y.signals.values;
plot(t, y)
xlabel('time [sec]')
ylabel('y pos [m]')
grid on

figure(5)
plot(y,x)
xlabel('y pos [m]')
ylabel('x pos [m]')
grid on














