%Returns a (square) 90º rotated for SLM_1(and flipped?)
function[im_out]=rotate(im_in)
N=size(im_in);
% imin=normalize_2D(imin);
if N(1)==N(2)%Padding to make an square
    M=N(1);
elseif N(1)>N(2)
    M=N(1);
    im_in(1:N(1),N(2):N(1))=1;
else
    im_in(N(1):N(2),1:N(2))=1;
    M=N(2);
end
AD=zeros(M,M);

for i=1:M
    for j=1:M
        if i+j==M
            AD(i,j)=1;
        end
    end
end

im_out=(im_in*AD)'*AD;