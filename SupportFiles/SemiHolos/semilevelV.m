N=[1024 768];
SLM_number=2;

aux=1;
for Trans=0:Tstep:100
    for Phase=0:PHstep:PHf
        [SLM2]= mapa_Holo2(Trans/100,Phase,N,SLM_number);
        imwrite(SLM2',['SLM2_T' num2str(Trans) '_ph' num2str(Phase) '.png'],'PNG');
    end
    if mod(Trans,Cstep)<=aux
        disp(['SemiHoloV: ' num2str(Trans) '% done']);
        aux=mod(Trans,Cstep);
    end
end
%display('SLM2 is done')
% imshow(SLM2')