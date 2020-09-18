function[DR,ratio]=dynamic_range(image)
%im=imread(image);
im=image;

N=size(im);
count0=0;
count255=0;

DR=[min(min(im)) max(max(im))];

for i=1:N(1)
    for j=1:N(2)
        if im(i,j)<=DR(1)
            count0=count0+1;
        elseif im(i,j)>=DR(2)
            count255=count255+1;
        end
    end
end

%count0;
%count255;
ratio0=count0/N(1)/N(2);
ratio255=count255/N(1)/N(2);

ratio=[ratio0 ratio255];