filename='TEM10.gif';
x=820;y=550;
Analizer=imrotate(1-im2double(imread('analizer.PNG')),45);
Analizer=Analizer(:,:,1);
letters=im2double(imread('analizer_letters.PNG'));
letters=letters(:,:,1);
Letters(1:33,1:8)=1;
Letters(1:33,9:139+9)=letters;
Letters(1:33,139+10:157)=1;
im=imrotate(im2double(imread('0.png')),180);
im=im(:,:,1);
im(y:y+156,x:x+156)=1-Analizer;
im(y+157:y+157+32,x:x+156)=Letters;
imwrite(im*255,GRAY,filename,'GIF','Loopcount',inf)
for i=10:10:170
    A=imrotate(Analizer,i,'crop');
    im=imrotate(im2double(imread([num2str(i) '.png'])),180);
    im(y:y+156,x:x+156)=1-A;
    im(y+157:y+157+32,x:x+156)=Letters;
    imshow(im)
    imwrite(im*255,GRAY,filename,'GIF','Writemode','append','DelayTime',0.5)
end
