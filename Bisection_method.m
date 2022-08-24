%Name -- Akash Chandra Behera
%Roll No. 19MS126
% Intial guess set to 1 and 2
a=1;
b=2;

%for plot
x = a:1/1000:b;
y=f(x);

%define c
c=(a+b)/2;
k=0; %counter variabe
error=[];  %records the error
table=[k a b c b-c f(c)];  %for table

%%% This looop implements the bisection method
while abs(b-c)>0.001
    if sign(f(b))*sign(f(c))<0 
        a=c;
        
    else  
        b=c;
        
    end 
    c=(a+b)/2;
    k=1+k;
    
    
    %%%%%%% Plots the (c,f(c)) for every iteration
    hold on
    plot(c,f(c),'o')
    table=[table; k a b c b-c f(c)];
    error=[error; abs(b-c)];
end

xlabel('x')
ylabel('f(x)')
title('Plot of x vs f(x)')
plot(x,y)

%%%%%%% This part writes the formatted output to the txt file
fileID = fopen('Formatted_Output.txt','w');
fprintf(fileID,'%6s %12s %12s %12s %12s %12s\n',"n","a","b","c","b-c","f(c)");
fprintf(fileID,'%6.0f  %12.4f %12.4f %12.4f %12.4f %12.4f\n',table.');
fclose(fileID);


%%%%%%% Uncomment this part for plotting log of error
%kk=1:k;
%error=log(error);
%plot(kk,error)


