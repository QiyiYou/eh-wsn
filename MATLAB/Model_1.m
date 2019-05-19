clc;
close all;
clear all;
d=1:0.5:100;
freq=input('Enter the operational frequency in MHz');
lambda=(3*10^8)/(freq*10^6);%considered frequency=2.4 GHz
L=1;%Isotropic antenna
a=-1;b=1;
h=0.125;%Height from ground=0.25m
Pt=1;%Transmitted power=0dB=1watt
%Pr=zeros(length(d));

%% Following code for single iteration



% f=randn(1,length(d));%fading coefficient and for each Tx-Rx separation 
% %the fading coeff will be different
% r= (b-a).*rand(1,length(d))+a;%reflection coeff
% 
%Free space
Pr=Pt*((lambda./(4.*pi.*d)).^2); %Equation 4a
% 
% %Free space+Ground reflection
% %ph=zeros(length(d));
% dl=rand(1,length(d)).*d;
% ph=(2*pi*2*h)./(lambda.*dl);
% Pr1=Pt*((lambda./(4.*pi.*d)).^2).*(1+r.^2+2*r.*cos(ph));%Equation 4b
% 
% %Free space+Ground reflection+ Rayleigh Fading
% Pr2=Pt*((lambda./(4.*pi.*d)).^2).*(1+r.^2+2*r.*cos(ph)).*(f.^2);%Equation 4c
% 
% %Free space+Ground reflection+ Rayleigh Fading+Diffraction
% d_b=sqrt(((lambda/4+4*h/lambda)^2)-((2*h)^2));
% d_c=sqrt(((lambda/12.5+12.5*h/lambda)^2)-((2*h)^2));
% Pr3=zeros(1,length(d));
% for i=1:length(d)
% d1=d(i);
% f1=f(i);
% if (d1<d_b)
%     %PL(i)=-32.44+ 10*log (Pt)+ 20*log (freq) + 20*log (d1) + 10*log (f1^2);
% Pr3(i)=Pt*((lambda/(4*pi*d1))^2)*(f1^2);
% else if (d_b < d1)&&(d1 < d_c)
%     Pr3(i)=Pt*((lambda/(4*pi*d1))^2)*(1+r(i)^2+2*r(i)*cos(ph(i)))*f1^2;
%         %PL(i)=-32.44+ 10*log (Pt)+ 20*log (freq) + 20*log (d1) + 10*log (f1^2)+ 10*log(1+r(i)^2+r(i)*cos(ph(i)));
%     else
%     %PL(i)=-32.44+ 10*log (Pt)+ 20*log (freq) + 20*log (d1) + 10*log (f1^2)+ 10*log(1+r(i)^2+r(i)*cos(ph(i)))+20*log(0.5+(1.75*h/sqrt(d1*lambda)));
%     Pr3(i)=Pt*((lambda/(4*pi*d1))^2)*(1+r(i)^2+2*r(i)*cos(ph(i)))*f1^2*(0.5+(1.75*h/sqrt(d1*lambda)))^2;
%     end
% end
% end
% %converting to dBm
Pr_dBm=10.*log(Pr.*1000);
% Pr1_dBm=10.*log(Pr1.*1000);
% Pr2_dBm=10.*log(Pr2.*1000);
% Pr3_dBm=10.*log(Pr3.*1000);
% plot(d,Pr_dBm,'-b');
% Pr_diff=Pr_dBm-Pr3_dBm;
% hold on;
% % plot(d,Pr1_dBm,'-r');
% plot(d,Pr2_dBm,'-g');
% plot(d,Pr3_dBm,'-magenta');
% %plot(d,Pr_diff,'-magenta');
% xlabel('distance between the Tx and Rx(m)');
% ylabel('Pr(d)in dBm');
% grid on;
% %legend('FS','FS+GR','FS+GR+Fad','Complete model');
% legend('FS','FS+GR+Fad','Complete model');
% 
%% Montecarlo simulation

% This section will be utilized in the code whenever energy beamforming
% will be utilized after clustering for the energy deficient node
%It is Monte Carlo Simulation

numitr=10000;
Pr_monte=zeros(numitr,length(d));
Pr1_monte=zeros(numitr,length(d));
Pr2_monte=zeros(numitr,length(d));
Pr3_monte=zeros(numitr,length(d));
for m=1:numitr
    
f=randn(1,length(d));%fading coefficient and for each Tx-Rx separation 
%the fading coeff will be different
r= (b-a).*rand(1,length(d))+a;%reflection coeff (Ground Reflection)

%Free space
Pr=Pt*((lambda./(4.*pi.*d)).^2); %Equation 4a
Pr_monte(m,:)=Pr;
%Free space+Ground reflection
%ph=zeros(length(d));
dl=rand(1,length(d)).*d;
ph=(2*pi*2*h)./(lambda.*dl);
Pr1=Pt*((lambda./(4.*pi.*d)).^2).*(1+r.^2+2*r.*cos(ph));%Equation 4b
Pr1_monte(m,:)=Pr1;
%Free space+Ground reflection+ Rayleigh Fading
Pr2=Pt*((lambda./(4.*pi.*d)).^2).*(1+r.^2+2*r.*cos(ph)).*(f.^2);%Equation 4c
Pr2_monte(m,:)=Pr2;
%Free space+Ground reflection+ Rayleigh Fading+Diffraction
d_b=sqrt(((lambda/4+4*h/lambda)^2)-((2*h)^2));
d_c=sqrt(((lambda/12.5+12.5*h/lambda)^2)-((2*h)^2));
Pr3=zeros(1,length(d));
for i=1:length(d)
d1=d(i);
f1=f(i);
if (d1<d_b)
    %PL(i)=-32.44+ 10*log (Pt)+ 20*log (freq) + 20*log (d1) + 10*log (f1^2);
Pr3(i)=Pt*((lambda/(4*pi*d1))^2)*(f1^2);
Pr3_monte(m,i)=Pr3(i);
else if (d_b < d1)&&(d1 < d_c)
    Pr3(i)=Pt*((lambda/(4*pi*d1))^2)*(1+r(i)^2+2*r(i)*cos(ph(i)))*f1^2;
        %PL(i)=-32.44+ 10*log (Pt)+ 20*log (freq) + 20*log (d1) + 10*log (f1^2)+ 10*log(1+r(i)^2+r(i)*cos(ph(i)));
    Pr3_monte(m,i)=Pr3(i);
    else
    %PL(i)=-32.44+ 10*log (Pt)+ 20*log (freq) + 20*log (d1) + 10*log (f1^2)+ 10*log(1+r(i)^2+r(i)*cos(ph(i)))+20*log(0.5+(1.75*h/sqrt(d1*lambda)));
    Pr3(i)=Pt*((lambda/(4*pi*d1))^2)*(1+r(i)^2+2*r(i)*cos(ph(i)))*f1^2*(0.5+(1.75*h/sqrt(d1*lambda)))^2;
    Pr3_monte(m,i)=Pr3(i);
    end
end
end
end
%converting to dBm
P=(sum(Pr_monte,1))./numitr;
P1=(sum(Pr1_monte,1))./numitr;
P2=(sum(Pr2_monte,1))./numitr;
P3=(sum(Pr3_monte,1))./numitr;
Prm_dBm=10.*log(P.*1000);
Pr1_dBm=10.*log(P1.*1000);
Pr2_dBm=10.*log(P2.*1000);
Pr3_dBm=10.*log(P3.*1000);
plot(d,Prm_dBm,'-b');
%Pr_diff=Pr_dBm-Pr3_dBm;
 hold on;
% plot(d,Pr1_dBm,'-r');
plot(d,Pr2_dBm,'-g');
plot(d,Pr3_dBm,'-magenta');
%plot(d,Pr_diff,'-magenta');
xlabel('distance between the Tx and Rx(m)');
ylabel('Pr(d)in dBm');
grid on;
%legend('FS','FS+GR','FS+GR+Fad','Complete model');
legend('FS','FS+GR+Fad','Complete model');