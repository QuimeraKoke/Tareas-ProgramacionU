clc
clear
x = input("Ingrese la expresion: \n");
%a='(∼ (a ∧ (b)))';
a=strcat('(',x,')');
a=strrep(a, ' ','');
k = strfind(a,'(');
j = strfind(a,')');
r='';
for  i=1:1:length(j)
	k(length(k)-i+1);
	j(i);
	sub = a(k(length(k)-i+1)+1:j(i)-1);
	try
		sub = sub(1:5);
	end_try_catch
	sub
	if (strfind(sub,'∧'))
		r=and(sub(1),r);
	elseif (strfind(sub,'v'))
		r=or(sub(1),r);
	elseif (strfind(sub,'∼'))
		r=no(r);
	else
		r=strcat('(',sub,')');
	end
	r	
end
r;
r=r(2:end-1)

function z =and(x,y)
	z=strcat('(','(',x,'|',y,')','|','(',x,'|',y,')',')');
end

function z =or(x,y)
	z=strcat('(','(',x,'|',x,')','|','(',y,'|',y,')',')');
end

function z =no(x)
	z=strcat('(',x,'|',x,')');
end