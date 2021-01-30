hits=0;
trials=input('Enter a number: ');
a=0; %lower limit 
b=5; %higher limit
fx0=-2; %f(0)=-2
fx5=123; %f(5)=123
x=linspace(0,5,100); 
y=(x.^3 - 2);
plot(x,y);
hold on;
axis([0 5 -2 123]);
grid on;
for n=1:trials
    
    xr(n)=rand()*(5-0)+0;
    yr(n)=rand()*(max(-2,123)-0)+0;
    fxr(n)=(xr(n).^3 - 2);
    if yr(n)<=fxr(n)
        plot(xr(n),yr(n),'bo');
        hits=hits+1;
    else 
        plot(xr(n),yr(n),'go');
    end
end

intg=(hits/trials)*(b-a)*fx5;
disp(intg);
error = 146.25 - intg;
disp(error);