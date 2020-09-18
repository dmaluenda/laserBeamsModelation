function[out]=normalize_2D(in)
m=min(in(:));
out=in-m;
M=abs(max(out(:)));
out=out/M;