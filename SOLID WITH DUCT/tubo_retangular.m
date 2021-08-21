% Problema de condu��o em regime estacionario - Tubo retangular 

k = 10;     %Coeficiente de condu��o - W/m K
L = 0.04;   %Comprimento da barra - m
e = 5e+5;   %Taxa de gera��o de energia - m^2
ta = 20;    %Temperatura superficie  - �C
tb = 100;   %Temperatura Interior  - �C
n = 8;      % pontos
p = 1e-6;   %Precis�o
T = zeros(n,1);

%Condi��es de contorno e gera��o de calor
T(1) = ta;
T(2) = ta;
T(3) = ta;
T(6) = tb;
T(8) = tb;
T(4) = (e*L^2)/k;
T(5) = (e*L^2)/k;
T(7) = (e*L^2)/k;
T=T';

%Equacionamento
M = [1,0,0,0,0,0,0,0
     0,1,0,0,0,0,0,0
     0,0,1,0,0,0,0,0
     -1,0,0,4,-2,0,-1,0
     0,-1,0,-1,4,-1,0,-1
     0,0,0,0,0,1,0,0
     0,0,0,-2,0,0,4,-2
     0,0,0,0,0,0,0,1];

 %Solu��o
[x,k]=gauss_sid(M,T,p);

%Tratamento dados
R = x(1:3)';
R(2,:) = x(4:6)';
R(3,1:2) = x(7:8)';
R(3,3) = 100;
R2 = fliplr(R);
R2(:,1)=[];
R3 = [R R2];
R4 = flipud(R3);
R4(1,:)=[];
RR = [R3;R4];

%Plot
RR
surface(RR,'FaceColor','interp')
colorbar






