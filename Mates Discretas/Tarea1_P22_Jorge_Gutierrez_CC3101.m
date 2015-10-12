clc
clear
y=1;
x(1:5,1:24) = 0;
for i=1:1:5
	temp=x(i,:);
	if (sum(temp'))>2
		y=0;
	end
end
for i=1:1:20
	if (sum(x(:,i))+sum(x(:,i+1))+sum(x(:,i+2))+sum(x(:,i+4)))<1
		y=0;
	end
end
if (sum(x(:,17))+sum(x(:,18))+sum(x(:,19))+sum(x(:,20)))<3
	y=0;
elseif ( sum(x(:,7))+sum(x(:,8))+sum(x(:,9))+sum(x(:,10))+sum(x(:,11)))<2
	y=0;
elseif ( sum(x(:,1))+sum(x(:,2))+sum(x(:,3))+sum(x(:,4))+sum(x(:,5))+sum(x(:,6)))<2
	y=0;
end
display(y)