% function[]=delipse(S0,S1,S2,S3)

% Entren les componets complexes (x,y) del camp. Est� pensat per 16x16.
% Selecciona els 8x8 de la part central.
% Np �s el nombre de punts en que dibuixa cada el�lipse.

close all
Np=30;
N=9;
Nim=max(size(S0));
s0=zeros(N,N);s1=s0;s2=s0;s3=s0;

for i=1:N
    for j=1:N
        s0(i,j)=mean(mean(S0((i-1)*Nim/N+1:i*Nim/N,(j-1)*Nim/N+1:j*Nim/N)));%S0(round((i-0.4)*Nim/N),round((j-0.4)*Nim/N));%
        s1(i,j)=mean(mean(S1((i-1)*Nim/N+1:i*Nim/N,(j-1)*Nim/N+1:j*Nim/N)));%0.6*S1(round((i-0.4)*Nim/N),round((j-0.4)*Nim/N));%
        s2(i,j)=mean(mean(S2((i-1)*Nim/N+1:i*Nim/N,(j-1)*Nim/N+1:j*Nim/N)));%0.6*S2(round((i-0.4)*Nim/N),round((j-0.4)*Nim/N));%
        s3(i,j)=mean(mean(S3((i-1)*Nim/N+1:i*Nim/N,(j-1)*Nim/N+1:j*Nim/N)));%S3(round((i-0.4)*Nim/N),round((j-0.4)*Nim/N));%
    end
end
     
% L=sqrt(s1.^2+s2.^2);
A0=(s0+s1);%sqrt((s0+L)/2);
B0=(s0-s1);%sqrt((s0-L)/2);
theta=atan2(s2,s1)/2;
M=max(max(max(A0)),max(max(B0)));
A=A0/max(max(M))/2.25;
B=B0/max(max(M))/2.25;
Cph=s2./(sqrt(s0.^2-s1.^2-s2.^2));
Sph=s3./sqrt(s0.^2-s1.^2-s2.^2);
ph=acos(Cph);
phs=asin(Sph);



figure;
for ii=1:N;
    for jj=1:N;
        for t1=1:Np;
            t=t1*2*pi/Np;
%             x=ii+A(ii,jj)*cos(t)*cos(theta(ii,jj))-B(ii,jj)*sin(t)*sin(theta(ii,jj));
%             y=jj+A(ii,jj)*cos(t)*sin(theta(ii,jj))-B(ii,jj)*sin(t)*cos(theta(ii,jj));
            x=ii+A(ii,jj).*cos(t);
            y=jj+B(ii,jj).*cos(t+ph(ii,jj));
            hold on;
            plot(x,y,'.k','MarkerSize',8);
%              axis([5 15 5 15])
            axis([0 N+1 0 N+1]);
            %axis off;
            hold off;
        end
    end
end