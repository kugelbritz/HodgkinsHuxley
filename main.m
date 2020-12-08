main
% a) soln' dv/dt
 
[t1,V1] = ode45(@variableHolder1,[0,0.5],0);
[t2,V2] = ode45(@variableHolder2,[0.5,0.55],0);
[t3,V3] = ode45(@variableHolder1,[0.55,10],0);
t = [t1; t2; t3];
V = [V1; V2; V3];
figure(1)
plot(t,V)
xlabel('t (msec)')
ylabel('V (mV)')
title('V(t)')


function 1
function dV = variableHolder1(t, Vm)
Cm = 1;
gNa = 120;
ENa = 115;
gK = 36;
EK = -12;
gL = 0.3;
EL = 10.6;
 
am = ((25-Vm)./10)./(-1+exp((25-Vm)./10));
Bm = 4*exp(-Vm./18);
m = am./(am+Bm);
ah = 0.07.*exp(-Vm./20);
Bh = 1./(1+exp(30-Vm)./10);
h = ah./(ah+Bh);
INa = gNa.*m.^3.*h.*(Vm-ENa);
 
an = ((9.5-Vm)./100)./(-1+exp((9.5-Vm)./10));
Bn = 0.125.*exp(-Vm./80);
n = an./(an+Bn);
IK = gK.*n.^4.*(Vm-EK);
 
IL = gL*(Vm-EL);
 
Istim = 0;
 
dV = -(INa+IK+IL-Istim)/Cm;


function 2
function dV = variableHolder2(t, Vm)
Cm = 1;
gNa = 120;
ENa = 115;
gK = 36;
EK = -12;
gL = 0.3;
EL = 10.6;
 
%Vm = -100:1:100;
 
am = ((25-Vm)./10)./(-1+exp((25-Vm)./10));
Bm = 4*exp(-Vm./18);
m = am./(am+Bm);
ah = 0.07.*exp(-Vm./20);
Bh = 1./(1+exp(30-Vm)./10);
h = ah./(ah+Bh);
INa = gNa.*m.^3.*h.*(Vm-ENa);
 
an = ((9.5-Vm)./100)./(-1+exp((9.5-Vm)./10));
Bn = 0.125.*exp(-Vm./80);
n = an./(an+Bn);
IK = gK.*n.^4.*(Vm-EK);
 
IL = gL*(Vm-EL);
 
Istim = 200;
 
dV = -(INa+IK+IL-Istim)/Cm;

