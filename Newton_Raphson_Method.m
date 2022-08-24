%Name -- Akash Chandra Behera
%Roll No. 19MS126
xi=1.5;
xj=xi+2;  %This value just start the while loop
k=0;
table=["h" "x_n" "f(x_n)" "x_n-x_n-1" "a-x_n"];

tolerance=0.001;

x=1:1/2000:2;
y=f(x);

while abs(xi-xj)>tolerance
   
    xj=xi;
    
    %update xi
    xi=xi-(f(xi)/g(xi));
    %update counter
    k=k+1;
    %update the table array
    table(k,:)=[k xi f(xi) (xi-xj) (1.134724138-xj)];
    
    
    %plot iteration points
    hold on
    plot(xi,f(xi),'o')

end
disp(xi)
disp(table)


xlabel('x')
ylabel('f(x)')
plot(x,y)
%%%%%%% This part writes the formatted output to the txt file
fileID = fopen('Formatted_Output.txt','w');
fprintf(fileID,'%6s %12s %12s %12s %12s\n',"h","x_n","f(x_n)","x_n-x_n-1","a-x_n");
fprintf(fileID,'%6.0f  %12.7f %12.7f %12.7f %12.7f\n',table(1:end,:).');
fclose(fileID);
