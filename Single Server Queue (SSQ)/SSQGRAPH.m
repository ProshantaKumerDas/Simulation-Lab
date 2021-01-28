ps = 0.4;
n = 10 ; 
pa = [0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.1];

ED1=SSQFIFO(6,0.2,0.3);
ED2=SSQLIFO(6,0.2,0.3);
ED3=SSQSJF(6,0.2,0.3);

cla;
plot(pa,ED1,pa,ED2,pa,ED3);
title('FIFO, LIFO, SJF');
xlabel('pa');
ylabel('ED');
axis([-1 2 0 15]);
legend({'FIFO: pa vs ED','LIFO: pa vs ED','SJF: pa vs ED'});
pause(2);