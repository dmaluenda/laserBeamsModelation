%David Maluenda Niubó - Applied Physics and Optics (UB) [2013]
%Hologram generator for a Mach-Zehnder interferometer with
%orthogonal-polarized arms. (2012)
function[]=generator(handles)
%clear all; close all
PATH=cd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%TO MAKE THE GENERAL PATTERNS for the LabView PROGRAM%%%
% cd SupportFiles
% TestPaternsGenerator
% cd ..
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%AD=[0 1;1 0];  %90Degrees Rotation Matrix for vectors

%---Label of the beam (1:Radial,2:Athimutal,3-Star,...)
% beam_types=str2double(get(handles.Beam_type,'value')) %

%---Aditional-options: (0)NO - (else)YES  --------- 
macropixel=get(handles.Macropixel,'value'); % (0) for a simple Arizon's procedure and (1) for amplied 
makeDesign=get(handles.MakeDesign,'value'); %makes the design instead just taking a given file
designINfile=get(handles.DesignFile,'value'); %writes the design in a file
simulation=get(handles.Simulate,'value'); %simulates the reconstructed paraxial beam
stokes=get(handles.Stokes,'value'); %gets the stokes images of the simulated beam
corrected=get(handles.Correct,'value'); %adds a phase map to correct the beam (Not aviable yet!!)
beam_types=str2double(get(handles.Beam_type,'string')); %
hologram=get(handles.Hologram,'value');


%---Parameters----------------------
SLM_size=[1024 768];
D_SLM=250; %Spot's Diameter at SLM [px]
A=[500 14];B=[892 378]; %CCD Key Points [px]
C=[480 770];D=[98 392]; %Just for a corrected holograms
options='';%empty sting to initialize or any other option to add
T_max=0.4; %Max transmittance 


for beam_type=beam_types
tic
[~,count]=max(beam_types==beam_type);
set(handles.Status,'String',['The simulation(s) has been started (' num2str(count) ...
    '/' num2str(max(size(beam_types))) ')'])

%---Creating/Importing the beam's design-------
if(makeDesign==1)
    [h_T1,h_T2,h_ph1,h_ph2]=scripts.beam_design(SLM_size,beam_type,designINfile);
else
    h_T1=dlmread(['Designs/design' num2str(beam_type) '_Ex.dat']);
    h_T2=dlmread(['Designs/design' num2str(beam_type) '_Ey.dat']);
    h_ph1=dlmread(['Designs/design' num2str(beam_type) '_Phx.dat']);
    h_ph2=dlmread(['Designs/design' num2str(beam_type) '_Phy.dat']);
end

%---GENERATE-the-HOLOGRAM------------------------------------------------
if corrected~=0%Option:----correcting-beam--- (NOT aviable yet!)
    % scripts.beam_caracterizer; %Produce: ARM_1, ARM_2 [0 255] and PHASE [0 2pi]
    % scripts.CCD2SLM; %Produce: A_1, A_2 [0 255] and intrinsic_phase [0 2pi]
    % Phase_c=mod(-intrinsic_phase,2*pi); %[0 2pi]
    % [c_T1,c_T2]=scripts.amplitude_corrector(A_1,A_2); %[0 1] %
    % Amp1_c=ones(SLM_size);Amp2_c=ones(SLM_size);
    c_T1=1;c_T2=1;c_ph1=1;c_ph2=1;
    h_T1=h_T1.*c_T1;h_T2=h_T2.*c_T2;h_ph1=h_ph1.*c_ph1;h_ph2=h_ph2.*c_ph2;
    options=strcat(options,'_c');
end

if hologram~=0
if macropixel==0
    [hologram_SLM1,hologram_SLM2]=scripts.mapa_Holo(h_T1,h_T2,h_ph1,h_ph2,handles);
else
    [hologram_SLM1,hologram_SLM2]=scripts.mapa_Holo(h_T1,h_T2,h_ph1,h_ph2,handles);
    options=strcat(options,'_M4');
end
% %just for check matrix
% [DRn_Hol1,DRt_Hol1]=scripts.dynamic_range(hologram_SLM1);
% [DRn_Hol2,DRt_Hol2]=scripts.dynamic_range(hologram_SLM2);
%---SAVES-the-holograms------------------------------------------
imwrite(hologram_SLM1',[PATH '\Holograms\Hologram1_'...
    num2str(beam_type) options '.bmp'],'bmp')
imwrite(hologram_SLM2',[PATH '\Holograms\Hologram2_'...
    num2str(beam_type) options '.bmp'],'bmp')
end
%--------------------------------------------------------------------------

%Option:---Simulates-the-reconstructed-paraxial-beam---
if simulation==1
    [Esim_x,Esim_y]=scripts.holo_simulator(hologram_SLM1,hologram_SLM2);
    %cd Simulations
    imwrite(scripts.normalize_2D(abs(Esim_x))',...
        [PATH '\Simulations\Sim_Ex_' num2str(beam_type) options '.png'],'png')
    imwrite(scripts.normalize_2D(abs(Esim_y))',...
        [PATH '\Simulations\Sim_Ey_' num2str(beam_type) options '.png'],'png')
    imwrite(scripts.normalize_2D(mod(angle(Esim_x),2*pi))',...
        [PATH '\Simulations\Sim_Phx_' num2str(beam_type) options '.png'],'png')
    imwrite(scripts.normalize_2D(mod(angle(Esim_y),2*pi))',...
        [PATH '\Simulations\Sim_Phy_' num2str(beam_type) options '.png'],'png')
    sim_ph=mod(angle(Esim_y),2*pi)-mod(angle(Esim_x),2*pi);
    imwrite(scripts.normalize_2D(mod(sim_ph,2*pi))',...
        [PATH '\Simulations\Sim_Ph_' num2str(beam_type) options '.png'],'png')
    %cd ..
%Option:---gets-the-stokes-images-of-the-simulated beam---
    if stokes==1
        [s0,s1,s2,s3]=scripts.stokes(Esim_x,Esim_y);
        cd Simulations
        imwrite(normalize_2D(s0)',...
            ['S0_' num2str(beam_type) options '.png'],'png')
        imwrite(normalize_2D(s1)',...
            ['S1_' num2str(beam_type) options '.png'],'png')
        imwrite(normalize_2D(s2)',...
            ['S2_' num2str(beam_type) options '.png'],'png')
        imwrite(normalize_2D(s3)',...
            ['S3_' num2str(beam_type) options '.png'],'png')
        cd ..
    end
end
    
toc    
end
