%Carecterize the beam after the Mach-Zehnder interferometer
INTERFERENCE_1=double(imread('REF_PHASE1_CCD.png'))'; %1/4wave + Analizer
[DRn_IF,DRt_IF]=dynamic_range(INTERFERENCE_1);
INTERFERENCE_2=double(imread('REF_PHASE2_CCD.png'))'; %1/4wave + Analizer(+45º)
[DRn_IF2,DRt_IF2]=dynamic_range(INTERFERENCE_2);
ARM_1=double(imread('REF_ARM1_CCD.png'))'; %Just the first ARM
[DRn_A1,DRt_A1]=dynamic_range(ARM_1);
ARM_2=double(imread('REF_ARM2_CCD.png'))'; %Just the secon ARM
[DRn_A2,DRt_A2]=dynamic_range(ARM_2);
INTENSITY=(ARM_1+ARM_2)*2;  %INTENSITY profile
[DRn_ITY,DRt_ITY]=dynamic_range(INTENSITY);
PHASE=normalize_phase(INTERFERENCE_1,INTERFERENCE_2,INTENSITY); %Phase definition from the images
[DRn_PH,DRt_PH]=dynamic_range(PHASE);
PHASE=rotate_CCD(PHASE); %Returns a (square) 90º rotated for SLM_1(and NOT flipped image) [0 2pi]
ARM_1=rotate_CCD(ARM_1);
ARM_2=rotate_CCD(ARM_2);
CCD_size=size(PHASE); %New size of image