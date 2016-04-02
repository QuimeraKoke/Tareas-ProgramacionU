clear
clc

matrixSize = 1000;
h=10;

circularLimit=round(matrixSize/(2*h));

radio =200/h;
a=0.850*radio;
b=0.850*radio;

matrix =zeros(matrixSize/h);

center  = matrixSize/(2*h);

Y =zeros(1000/h);
for i = 1:1:1000/h
     Y(i,:) = i;
end

X =zeros(1000/h);
for i = 1:1:1000/h
     X(:,i) = i;
end

for x = center-circularLimit+2:1:center+circularLimit+1-3
	for  y = center-circularLimit+2:1:center+circularLimit-2
        xComp = ((x-center)^2)/a^2;
        yComp = ((y-center)^2)/b^2;
		if ( xComp+yComp<1 )
			if y<=center
				matrix(y,x) = 1000;
			else
				matrix(y,x) = -1000;
			end
        else if ((x-center)^2 + (y-center)^2) < 50^2
                matrix(y,x) = 500;
            end
        end
                
	end
end

w = 4 / ( 2 + sqrt(4 - (cos(pi/(1000/h - 1))+cos(pi/(1000/h - 1)) )   ));
r = 1;
e =10E-10;
while (r>e)
    
    for x = center-circularLimit+2:1:center+circularLimit-2
        for  y = center-circularLimit+2:1:center+circularLimit-2
                r = (matrix(x+1,y) + matrix(x-1,y) + matrix(x,y-1) + matrix(x,y+1) - 4*matrix(x,y))/4;
                matrix(x,y) = matrix(x,y)+r*w;
                
        end
    end
    
    for x = center+circularLimit-2:-1:center-circularLimit+2
        for  y = center+circularLimit-2:-1:center-circularLimit+2
            
                r = (matrix(x+1,y) + matrix(x-1,y) + matrix(x,y-1) + matrix(x,y+1) - 4*matrix(x,y))/4;
                matrix(x,y) = matrix(x,y)+r*w;
                
        end
    end
end

% surf(matrix);
% axis equal;
% hold on
% figure
% contour(X,Y,matrix);
hold on
[DX,DY] = gradient(matrix,1,1);
quiver(X,Y,-1*DX,-1*DY);