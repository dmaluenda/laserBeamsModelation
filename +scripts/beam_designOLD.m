%Returns tha amplitude of X and Y components and the phase between both. 
%Beam_type is the label of the designed beam

function[E_x,E_y,Ph_x,Ph_y]=beam_designOLD(SLM_size,beam_type)
% close all;
% clear all
% SLM_size=[1024 768];
% beam_type=19;


disp('Designing the beam:');
[y,x]=meshgrid(SLM_size(2)/2:-1:-SLM_size(2)/2+1,-SLM_size(1)/2+1:SLM_size(1)/2);
theta=mod(atan2(y,x),2*pi); %[0 2pi]

switch beam_type

case 24

    
    
    case 23
        R=100/sqrt(2);f0=2;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y); 
    
    case 22
        R=100/sqrt(2);f0=1.5;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y); 
    
    case 21
        R=100/sqrt(2);f0=1;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y); 
    
    
    case 20
        R=100/sqrt(2);f0=0.8;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y); 
    
    case 19
        R=100/sqrt(2);f0=0.6;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
    
    case 18
        R=100/sqrt(2);f0=0.4;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
    
    case 17
        R=100/sqrt(2);f0=0.2;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
        g=exp(-(rho/f0).^2);        
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi).*g;
        E_y=1i*cos(theta2).*cos(phi)+sin(phi).*g;
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
        
    case 16
        R=100/sqrt(2);
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        theta2=asin(rho);
            
        E_x=-1i*cos(theta2).*sin(phi)+cos(phi);
        E_y=1i*cos(theta2).*cos(phi)+sin(phi);
        pp=rho>1;
        E_x(pp)=0;E_y(pp)=0;
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
        
%-------------------------------------        
        
    
    case 4 %LG01
        disp('beam_type=LG01');
        R_x=(abs(cos(theta)));
        R_y=(abs(sin(theta)));
        R_Phx=angle(cos(theta));
        R_Phy=angle(sin(theta));
%       R_Ph=((theta>pi/2&theta<pi)|(theta<0&theta>-pi/2))*pi;%zeros(SLM_size);
%       case 'A'  %Azimutal-polarized beam
        A_x=(abs(sin(theta)));
        A_y=(abs(cos(theta)));
        A_Phx=angle(sin(theta));
        A_Phy=angle(cos(theta))+pi;

        R=70;
        rho=2*(x.^2+y.^2)/R^2;
%       Gaussian=exp(-rho/2);
%       D=rho.*cos(theta).^2.*exp(-rho) + ... 
%         rho.^2.*cos(2*(theta+2*pi/4)).^2.*exp(-rho);% + ...
       % rho.^3.*cos(3*(theta+2*pi/12)).^2.*exp(-rho);
        D=abs((-rho+1).*exp(-rho/2));
        core=((x).^2+(y).^2<(512-462)^2).*1;
        clad=1-core;


        E_x=D.*core.*R_x+D.*clad.*A_x*2.5;%Gaussian;
        E_y=D.*core.*R_y+D.*clad.*A_y*2.5;%Gaussian;
        Ph_x=core.*R_Phx+clad.*A_Phx;
        Ph_y=core.*R_Phy+clad.*A_Phy;

    
    case 5 %O1
        disp('beam_type=O1');
        R=70;
        rho=2*(x.^2+y.^2)/R^2;
        A_0=sqrt(rho.^2.*exp(-rho));
        A_0=A_0/max(max(A_0));
        k=0;l=1;theta_amp=pi/4;theta_ph=7*pi/4;
        E_x=cos(theta*k+theta_amp);
        E_y=sin(theta*k+theta_amp);
        %Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=A_0.*abs(E_x);E_y=A_0.*abs(E_y);
    
        Ph=mod(l*theta+theta_ph,2*pi);
        Ph_x=zeros(SLM_size);
        px=find(Ph>pi);
        Ph_x(px)=-Ph(px);
        Ph_y=zeros(SLM_size);
        py=find(Ph<=pi);
        Ph_y(py)=Ph(py);
    
    case 6 %O2
        disp('beam_type=O2');
        R=70;
        rho=2*(x.^2+y.^2)/R^2;
        A_0=sqrt(rho.^2.*exp(-rho));
        A_0=A_0/max(max(A_0));
        k=1;l=1;theta_amp=0;theta_ph=0;
    
        E_x=cos(theta*k+theta_amp);
        E_y=sin(theta*k+theta_amp);
        %Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=A_0.*abs(E_x);E_y=A_0.*abs(E_y);
    
        %Ph=mod(l*theta+theta_ph,2*pi);
        Ph_x=theta+pi/2;
        px=find(theta>pi/4);
        Ph_x(px)=pi-theta(px);
        px=find(theta>3*pi/4);
        Ph_x(px)=-pi/2+theta(px);
        px=find(theta>5*pi/4);
        Ph_x(px)=-theta(px);
        px=find(theta>7*pi/4);
        Ph_x(px)=pi/2+theta(px);
    
        Ph_y=pi/2-theta;
        py=find(theta>pi/4);
        Ph_y(py)=theta(py);
        py=find(theta>3*pi/4);
        Ph_y(py)=-pi/2-theta(py);
        py=find(theta>5*pi/4);
        Ph_y(py)=pi+theta(py);
        py=find(theta>7*pi/4);
        Ph_y(py)=pi/2-theta(py);
    
    case 7 %O1 well done
        disp('beam_type=O1 well done');
        R=70;
        rho=2*(x.^2+y.^2)/R^2;
        A_0=sqrt(rho.^2.*exp(-rho));
        A_0=A_0/max(max(A_0));
        k=1/2;l=1;theta_amp=0;theta_ph=0;
    
        E_x=abs(sin(theta*k+theta_amp));
        E_y=abs(cos(theta*k+theta_amp));
        %Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=A_0.*abs(E_x);E_y=A_0.*abs(E_y);
    
        Ph_x=zeros(size(theta));
        Ph_x(l*theta<pi)=l*theta(l*theta<pi);
        Ph_x(l*theta>pi)=pi;
    
        Ph_y=zeros(size(theta));
        Ph_y(l*theta>pi)=l*theta(l*theta>pi)+pi;
        Ph_y(l*theta<pi)=pi;
    
    case 8 %O2 wrong done
        disp('beam_type=O2 wrong done');
        R=70;
        rho=2*(x.^2+y.^2)/R^2;
        A_0=sqrt(rho.^2.*exp(-rho));
        A_0=A_0/max(max(A_0));
        k=1;l=1;theta_amp=0;theta_ph=0;
    
        E_x=cos(theta*k+theta_amp);
        E_y=sin(theta*k+theta_amp);
        %Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=A_0.*abs(E_x);E_y=A_0.*abs(E_y);
    
        %Ph=mod(l*theta+theta_ph,2*pi);
        Ph_x=zeros(size(theta));
        px=find(theta>pi/2);
        Ph_x(px)=2*theta(px)-pi;
        px=find(theta>3*pi/4);
        Ph_x(px)=-2*theta(px);
        px=find(theta>pi);
        Ph_x(px)=0;
        px=find(theta>3*pi/2);
        Ph_x(px)=2*theta(px)-pi;
        px=find(theta>7*pi/4);
        Ph_x(px)=-2*theta(px);
    
        Ph_y=2*theta;
        py=find(theta>pi/4);
        Ph_y(py)=-2*theta(py)+pi;
        py=find(theta>pi/2);
        Ph_y(py)=0;
        py=find(theta>pi);
        Ph_y(py)=2*theta(py);
        py=find(theta>5*pi/4);
        Ph_y(py)=-2*theta(py)+pi;
        py=find(theta>3*pi/2);
        Ph_y(py)=0;
    
    case 9 %O3 wrong done
        disp('beam_type=O3 (wrong done)');
        R=70;
        rho=2*(x.^2+y.^2)/R^2;
        A_0=sqrt(rho.^2.*exp(-rho));
        A_0=A_0/max(max(A_0));
        k=1;l=1;theta_amp=0;theta_ph=0;
    
        E_x=1;
        E_y=1;
        %Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=A_0.*abs(E_x);E_y=A_0.*abs(E_y);
    
        %Ph=mod(l*theta+theta_ph,2*pi);
        Ph_x=2*theta+pi/2;
        px=find(theta>pi/4);
        Ph_x(px)=0;
        px=find(theta>3*pi/4);
        Ph_x(px)=2*theta(px)+5*pi/2;
        px=find(theta>5*pi/4);
        Ph_x(px)=0;
        px=find(theta>7*pi/4);
        Ph_x(px)=2*theta(px)+pi/2;
    
        Ph_y=zeros(size(theta));
        py=find(theta>pi/4);
        Ph_y(py)=-2*theta(py)+pi/2;
        py=find(theta>3*pi/4);
        Ph_y(py)=0;
        py=find(theta>5*pi/4);
        Ph_y(py)=-2*theta(py)+pi/2;
        py=find(theta>7*pi/4);
        Ph_y(py)=0;
    
    case 10 %O3 Well done
        disp('beam_type=O3 (well done)');
    
        R=70;
        rho=2*(x.^2+y.^2)/R^2;
        A_0=sqrt(rho.^2.*exp(-rho));
        A_0=A_0/max(max(A_0));
        k=1;l=1;theta_amp=0;theta_ph=0;
    
        E_x=1;
        E_y=1;
        %Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=A_0.*abs(E_x);E_y=A_0.*abs(E_y);
    
        %Ph=mod(l*theta+theta_ph,2*pi);
        Ph_x=-theta+3*pi/4;
        px=find(theta>3*pi/4);
        Ph_x(px)=theta(px)-3*pi/4;
        px=find(theta>7*pi/4);
        Ph_x(px)=-theta(px)+3*pi/4;
    
        Ph_y=theta+pi/4;
        py=find(theta>3*pi/4);
        Ph_y(py)=-theta(py)-pi/4;
        py=find(theta>7*pi/4);
        Ph_y(py)=theta(py)+pi/4;
    
    case 11 %Elliptical
        disp('beam_type=Elliptical');
        a1=100;b1=50;
        a2=80*2;b2=20*2;R=200;
        k=1;l=0;theta_amp=0;theta_ph=0;
    
        A_0=((x/a1).^2+(y/b1).^2<1)*1.;
        A_0=A_0.*exp(-(x/a2).^2-(y/b2).^2);
    
        E_x=cos(theta*k+theta_amp);
        E_y=sin(theta*k+theta_amp);
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
    
        rho=sqrt(x.^2+y.^2);
        gaussian=exp(-rho.^2/R.^2);
    
        E_x=A_0.*E_x.*gaussian;E_y=A_0.*E_y.*gaussian;
    
    
    
    case 12 %Hermite_Gauss 21
        disp('beam_type=Hermite-Gauss 21');
        theta=mod(theta,2*pi);
        R=60;
        rho=sqrt(x.^2+y.^2);
        E_x=(8*x.^2/R^2-2).*sqrt(8)./R.*y.*exp(-rho.^2/R^2);
        E_x=E_x/max(max(E_x));
        E_y=(8*x.^2/R^2-2).*sqrt(8)./R.*y.*exp(-rho.^2/R^2);
        E_y=E_y/max(max(E_y));
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
    
        Z1=zeros(SLM_size);Z2=zeros(SLM_size);
        Z3=zeros(SLM_size);Z4=zeros(SLM_size);
        Z5=zeros(SLM_size);Z6=zeros(SLM_size);
        Z1(1:477,1:385)=1;Z2(1:477,386:end)=1;
        Z3(478:547,1:385)=1;Z4(478:547,386:end)=1;
        Z5(548:end,1:385)=1;Z6(548:end,386:end)=1;
        Ph_x=zeros(SLM_size);Ph_y=zeros(SLM_size);
        Ph_x=-Z3*pi/2-Z1*pi;Ph_y=Z6*pi-Z4*pi/2;
  
        
    case 14
        rho=sqrt(x.^2+y.^2);
        factor=251.25/4;
        Di=factor*1;%mida en milimetres
        Gr=2;
        Rout=round(Di/2+Gr);Rin=round(Di/2-Gr);
        Circ1=(rho<Rout).*1;
        Circ2=(rho<Rin).*1;
        Anell=Circ1-Circ2;
        E_x=Anell;
        E_y=zeros(SLM_size);
        Ph_x=E_y;Ph_y=E_y;
        
        
    case 15
        R=100;
        rho=(x.^2+y.^2)/R^2;
        phi=theta;
        R0=R/300;
            
        E_x=rho.*cos(phi).*exp(-rho.^2/R0^2);
        E_y=rho.*sin(phi).*exp(-rho.^2/R0^2);
        Ph_x=angle(E_x);Ph_y=angle(E_y);
        E_x=abs(E_x);E_y=abs(E_y);
        
      
    otherwise
        if beam_type==1 %Radial
            disp('beam_type=Radial');
            k=1;l=0;theta_amp=0;theta_ph=0;
        elseif beam_type==2 %Azimuthal
            disp('beam_type=Azimuthal');
            k=1;l=0;theta_amp=-pi/2;theta_ph=0;
        elseif beam_type==3 %Star-like
            disp('beam_type=Star-like');
            k=4;l=0;theta_amp=0;theta_ph=0;
        end
    
    E_x=cos(theta*k+theta_amp);
    E_y=sin(theta*k+theta_amp);
    Ph_x=angle(E_x);Ph_y=angle(E_y);
%     p=find(xor(E_x<0,E_y<0));
    E_x=abs(E_x);E_y=abs(E_y);
%     Ph=l*theta+theta_ph;
%     Ph(p)=Ph(p)+pi;

end


Ph_x=mod(Ph_x,2*pi);
Ph_y=mod(Ph_y,2*pi);

% 
% 
% 
% I=(abs(E_x)).^2+(abs(E_y)).^2;
% I=I/max(max(I));
% 
% imagesc(I')
% title I
% figure
% imagesc(E_x')
% title Ex
% figure
% imagesc(E_y')
% title Ey
% figure
% imagesc(Ph_x') 
% title Ph_x
% figure
% imagesc(Ph_y') 
% title Ph_y
% figure
% Ph=mod(Ph_y-Ph_x,2*pi);
% Ph=Ph_y-Ph_x;
% imagesc(Ph',[0 2*pi]) 
% title Ph

% [s0,s1,s2,s3]=stokes(E_x.*exp(1i*Ph_x),E_y.*exp(1i*Ph_y));
% imagesc(abs(s0'))
% figure
% imagesc(abs(s1'))
% figure
% imagesc(abs(s2'))
% figure
% imagesc(abs(s3'))
% figure
% imagesc(ctl')
