fid = fopen('+scripts\design_kinds.txt');

tline = fgetl(fid);
i=1;
while ischar(tline)
    disp(tline)
    names[i]=tline;
    tline = fgetl(fid);
    i=i+1;
end

fclose(fid);