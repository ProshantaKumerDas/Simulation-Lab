%Single Server Queue (FIFO)

function ED=SSQFIFO(n,pa,ps)
rand('state',0); % produce same sequence of random numbers every time you run the code..
disp('This is a single server queue(FIFO): ');
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
    serverBusy = 0; % whether the server is busy or not
    cDelay = 0;  % delay
    customersServed = 0; % customers served
    Queue = []; % the queue which is initially empty
    top = 0;
   
    i = 1;
    nextArrival = ArrivalTime(i);
    nextDeparture = realmax;
    currentTime = nextArrival; % simulation time 
    ex_number = 0;
    ut = 0;
    while(customersServed < n)
        % decide the next event
        if nextArrival<nextDeparture
            currentTime = nextArrival;
        else
            currentTime = nextDeparture;
        end

        if currentTime == nextArrival % next event arrival
            if serverBusy == 0
                customersServed = customersServed + 1;  %Served New Customer
                serverBusy = 1;   %Server Busy
                temp = geometric(ps); %service_time
                nextDeparture = currentTime + temp;
            elseif serverBusy == 1
                top = top + 1;
                Queue(top) = nextArrival;
            end
            if(i < n)
                i = i + 1;
                nextArrival = ArrivalTime(i);
            else
                nextArrival = realmax;
            end
        else
            if top == 0  %queue Empty
                serverBusy = 0;  %Server idle
                nextDeparture = realmax;
            elseif top > 0
                temp = geometric(ps); %service_time
                nextDeparture = currentTime + temp;
                cDelay = cDelay + (currentTime - Queue(1));
                top = top - 1;
                customersServed = customersServed + 1;
                serverBusy = 1;
            end
        end
        oldtime = currentTime;
        if(nextDeparture <= nextArrival)
            currentTime = nextDeparture;
        else 
            currentTime = nextArrival;
        end
        ex_number = ex_number + (currentTime - oldtime) * top; %expected number of customer in queue
        ut = ut + (currentTime - oldtime) * serverBusy;  %Utilization
    end
   
    ED(s_time) = cDelay./n;
    EQ(s_time) = ex_number/time;
    EU(s_time) = ut/time;
    s_time = s_time + 1;
end

disp('Average Delay:');
disp(ED);

disp('Expected Number of Customers in Queue:');
disp(EQ);

disp('Utilization of the Server:');
disp(EU);

cla;
n=[5 10 15 20 25 30 35 40 45 50];
plot(n,ED,n,EQ,n,EU);
title('First in First Out(FIFO)');
xlabel('FIFO: Number of Customers');
ylabel('FIFO: ED, EQ, EU');
axis([0 55 0 12]);
legend({'N vs ED','N vs EQ','N vs EU'});
hold on;
pause(3);



end