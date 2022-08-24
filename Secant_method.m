%Name -- Akash Chandra Behera
%Roll No. 19MS126
format long
x=[1 2];  %Define initialize array
k=0;
j=2;   %Counter for array x


tolerance=0.001;



while abs(x(end)-x(end-1))>tolerance
    
    xj=x(end);
    xi=x(end-1);
    j=j+1;
    %update xi
    x(j)=double(xi-(xj-xi)*(f(xi)/(f(xj)-f(xi))));  %i was tring to increase the decimal points in table but was unable
 
    %update counter
    k=k+1;
    %update the table array
    table(k,:)=[k double(x(end)) f(x(end)) (x(end)-x(end-1)) (1.134724138-x(end))];
    
    
    %plot iteration points
    hold on
    plot(xi,f(xi),'o')

end
disp(x)
disp(table)



x_plot=0:1/2000:2;
y_plot=f(x_plot);

xlabel('x')
ylabel('f(x)')
plot(x_plot,y_plot)


%%%%%%% This part writes the formatted output to the txt file
fileID = fopen('Formatted_Output_Day3.txt','w');
fprintf(fileID,'%6s %12s %12s %12s %12s\n',"h","x_n","f(x_n)","x_n-x_n-1","a-x_n");
fprintf(fileID,'%6.0f  %12.7f %12.7f %12.7f %12.7f\n',table(1:end,:).');
fclose(fileID);


