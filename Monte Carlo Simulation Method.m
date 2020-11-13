%Find the value of pi using Monte Carlo Simulation method through Simulation

hits=0;
r=10.2;
trials=input('Enter a number: ');
x=linspace(-10.2,10.2,100);
y=-sqrt(r.^2-x.^2);
plot(x,y);
hold on;
axis([-10.2 10.2 -10.2 0]);
grid on;
for n=1:trials
    
    xr(n)=rand()*(10.2+10.2)-10.2;
    yr(n)=rand()*(0+10.2)-10.2;
    
    for m=1:trials
        d = sqrt(xr(m).^2+yr(m).^2);
    
        if d<=r
            plot(xr(m),yr(m),'bo');
            hits=hits+1;
        else 
            plot(xr(m),yr(m),'ro');
        end
    end
end

pi=((hits/trials)*(20.4*10.2)*2)/(r.^2)
