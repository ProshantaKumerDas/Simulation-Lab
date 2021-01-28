%%Single Server Queue (SJF)

function ED=SSQSJF(n,pa,ps)
rand('state',0); % produce same sequence of random numbers every time you run the code..
disp('This is a single server queue(SJF): ');
ArrivalTime=[];
time=10;
pre_arr_time=0;

ED = [];  %Average delay 
EQ = [];  %Expected number of customer in queue
EU = [];  %Server Utilization
    
for i=1:time
    inter_arr_time=geometric(pa);
    cur_arr_time=inter_arr_time+pre_arr_time;
    ArrivalTime=[ArrivalTime cur_arr_time];
    pre_arr_time=cur_arr_time;
end

for s_time=1:time
    serverBusy = 0;
    delay = 0; 
    customersServed = 0; 
    Queue = [];
    QueueST = [];
    top = 0;
   
    i = 1;
    nextArrival = ArrivalTime(i);
    nextDeparture = realmax;
    currentTime = 0;
    ex_number = 0;
    ut = 0;
    while(customersServed < n)

        if currentTime == nextArrival
            if serverBusy == 0
                customersServed = customersServed + 1;
                serverBusy = 1;
                temp = geometric(ps);
                nextDeparture = currentTime + temp;
            elseif serverBusy == 1
                top = top + 1;
                Queue(top) = nextArrival;
                QueueST(top) = geometric(ps);  
                [~,QueueSTsort] = sort(QueueST,'descend');
                Queue = Queue(QueueSTsort);
                QueueST = sort(QueueST,'descend');
            end
            if(i < n)
                i = i + 1;
                nextArrival = ArrivalTime(i);
            else
                nextArrival = realmax;
            end
        else
            if top == 0
                serverBusy = 0;
                nextDeparture = realmax;
            elseif top > 0
                temp = QueueST(top);
                
                delay = delay + (currentTime - Queue(top));
                Queue(top) = [];
                QueueST(top) = [];
                
                top = top - 1;
                customersServed = customersServed + 1;
                serverBusy = 1;
                nextDeparture = currentTime + temp;
               
            end
        end
        oldtime = currentTime;
        if(nextDeparture <= nextArrival)
            currentTime = nextDeparture;
        else 
            currentTime = nextArrival;
        end
        ex_number = ex_number + (currentTime - oldtime) * top;
        ut = ut + (currentTime - oldtime) * serverBusy;
    end
   
    ED(s_time) = delay./n;
    EQ(s_time) = ex_number/time;
    EU(s_time) = ut/time;
    s_time = s_time + 1;
end

disp('Average Delay:');
disp(ED);

disp('Expected Number of Customers in Queue:');
disp(EQ);

disp('Utilization of the Server: ');
disp(EU);

cla;
n=[5 10 15 20 25 30 35 40 45 50];
plot(n,ED,n,EQ,n,EU);
title('Shortest Job First(SJF)');
xlabel('SJF: Number of Customers');
ylabel('SJF: ED, EQ, EU');
axis([0 55 0 6]);
legend({'N vs ED','N vs EQ','N vs EU'});
hold on;
pause(3);


end