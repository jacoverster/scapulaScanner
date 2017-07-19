function new=adt_medfilt(old,n,t);
ifi=n;jf=n;
[io,jo]=size(old);
new=old*0;
if2=floor( ifi/2 );

if if2 == 0;
    if2=1;
end;

jf2=floor( jf/2 );

if jf2 == 0;
    jf2=1;
end;

imin=if2+1;imax=io-if2;
jmin=jf2+1;jmax=jo-jf2;
fl=(if2*2+1)*(jf2*2+1);

for i=imin:imax;
	for j=jmin:jmax; 
		col_vec = reshape(old(i-if2:i+if2,j-jf2:j+jf2),fl,1);
		sigma = std(col_vec);
		sigma_mat(i,j)=sigma;
		if(sigma > t)
			scratch=median(col_vec);
			new(i,j)=scratch;
		else
			new(i,j)=old(i,j);
		end
	end
end