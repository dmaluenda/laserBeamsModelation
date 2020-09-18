function[im_out]=IntensityProfiler(im_in,Q)
Im=fftshift(fft2(im_in));
[x,y]=meshgrid(-1024/2:1024/2-1,-768/2:768/2-1);
circ=(x.^2+y.^2<Q^2).*1;
IM=Im.*circ;
imshow(abs(IM)/max(max(IM))*10)
im_out=ifft2(fftshift(IM));