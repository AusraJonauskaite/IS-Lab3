%Darba atliko AKSfm-21 gr. stud. Aušra Jonauskaitė
clc;
clear all;
close all;
% Pagrindinė užduotis
%Duomenu paruosimas
%įėjime paduodamas vektorius x
x =[0:1/22:1];
%vienas išėjimas 
d = ((1 + 0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;
figure(1)
plot(x,d,'k')
grid on;
%centru c ir spinduliu r reiksmes
%c pasirenkame ekstremumus is grafiko
c1 = 0.20;
c2 = 0.91;
r1 = 0.15;
r2 = 0.15;
%isejimo sluoksnio rysio svoriu parinkimas
w1 = rand(1)*0.1;
w2 = rand(1)*0.1;
b = rand(1)*0.1;
n = 0.1;
%Tinklo apmokymas
for i = 1:1000
    for index = 1:length(x)
        F1 = exp(-(((x(index)-c1)^2)/(2*r1^2)));
        F2 = exp(-(((x(index)-c2)^2)/(2*r2^2)));
        y = F1*w1 + F2*w2 + b;
        e = d(index) - y;
        % Svorių atnaujinimas
        w1 = w1 + n*e*F1;
        w2 = w2 + n*e*F2;
        b = b + n*e;
    end
end
X = [0:1/22:1];
Y = zeros(1, length(X));
for index=1:length(X)
    F1=exp(-(((X(index)-c1)^2)/(2*r1^2)));
    F2=exp(-(((X(index)-c2)^2)/(2*r2^2)));
    y=F1*w1+F2*w2+b;
    Y(index)=y;
end
hold on 
plot(X,Y,'rx')
hold off