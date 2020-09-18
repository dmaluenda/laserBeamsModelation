function[OUT]=resizer(IN)
%resize IN of N1xN2 in OUT of M1xM2 erasing the trivial components

p=find(IN,1,'last');
OUT=IN(1:p);
