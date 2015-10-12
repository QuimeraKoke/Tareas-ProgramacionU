clc
clear
%x = input("Ingrese la expresion: \n");
clc
clear
x='∼ (a ∧ (b))';
a=strcat('(',x,')');
a=strrep(a, ' ','')
k = strfind(a,'(');
j = strfind(a,')');
k=fliplr( strfind(a,'('));
r=1;
while ( fliplr( strfind(a,'(')) & strfind(a,')') )
	k=fliplr( strfind(a,'('));
	j=strfind(a,')');
	k(1);
	j(1);
	sub =a(k(1):j(1));
	if (strfind(sub,'∧'))
		r=and(1,r);
		display('and');
	elseif (strfind(sub,'v'))
		r=or(1,r);
		display('or');
	elseif (strfind(sub,'∼'))
		r=no(r);
		display('no');
	end
	a(k(1))=int2str(r);
	a(k(1)+1:j(1))=[] ;	
end

if r
	display('Satisfactible');
else
	display('Insatisfactible');
end




function z =and(x,y)
	z=x&y;
end

function z =or(x , y)
	if (x==1)
		z=1;
	elseif (y ==1)
		z=1;
	else
		z=0;
	end
end

function z =no(x)
	z=~x;
end