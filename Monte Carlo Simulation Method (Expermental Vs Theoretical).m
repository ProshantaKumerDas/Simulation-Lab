%Compare the experimental value of pi with the theoretical one.

hits=0;
r=10.2;
trials=10;

for n=1:trials
    
    xr(n)=rand()*(10.2+10.2)-10.2;  %random value generation
    yr(n)=rand()*(0+10.2)-10.2;     %random value generation
    
    d = sqrt(xr(n).^2+yr(n).^2);    %distance 
    
    if d<=r                         %comparing radius & distance
        hits=hits+1;                %increasing hits value by 1
    end
    pi=((hits/trials)*(20.4*10.2)*2)/(r.^2); %finding pi value
    error = 3.1416-pi;                       %fining error;
    err(n)=error;
    tr(n)=n;
    hits=0;
end
disp(err);
plot(tr,err);                       %plotting graph trials vs error
hold on;
axis([0 trials 0 3.1416]);

