
M=input('Enter Stock Limitation: ');
N=input('Enter Reordering Point: ');
beg_inventory=3;
ord_quantity=8;
ord_arrive=1;
short=0;
total_end_inv=0;
count=0;
fprintf('Cycle Days BegInven RanDemand Demand EndInven Short OrdQuant RandLTime ArvDays\n');

for n=1:N
    for m=1:N
        rand_demand = randi(100,1);
        rand_time = randi(9,1);
        if m==5
            fprintf('%d',n);
            fprintf('\t  |%d| \t',m); 
        else
            fprintf('\t  |%d| \t',m);
        end
        fprintf('| %d | \t',beg_inventory);  
        fprintf('| %d |\t',rand_demand);
    
        if (rand_demand >=1) && (rand_demand<=10)
            demand=0;
        elseif (rand_demand >=11) && (rand_demand<=35)
            demand=1;
        elseif (rand_demand >=36) && (rand_demand<=70)
            demand=2;
        elseif (rand_demand >=71) && (rand_demand<=91)
            demand=3;
        elseif (rand_demand >=92) && (rand_demand<=100)
            demand=4;
        end
        
        if beg_inventory<demand
            en_inventory=0;
            short = short + (demand-beg_inventory);
            count=count+1;
        else
            en_inventory = beg_inventory-demand-short;
            short=0;
        end
        
        total_end_inv=total_end_inv+ en_inventory;
        beg_inventory=en_inventory;
        fprintf('\t|%d|\t\t',demand); 
        fprintf('|%d|\t\t',en_inventory); 
        fprintf('|%d|\t\t',short);
        if m==N 
            ord_quantity = M-en_inventory;
            if rand_time==0 
                ord_arrive=3;
            elseif rand_time>=1 && rand_time<=6
                ord_arrive=1;
            elseif rand_time>=7 && rand_time<=9 
                ord_arrive=2;
            end
            fprintf('%d\t\t',ord_quantity);
            fprintf('%d\t\t',rand_time);
        else
            fprintf('-\t\t');
            fprintf('-\t\t');
        end
        if ord_arrive<0
            fprintf('-\t');
        else
            fprintf('%d\t', ord_arrive);
        end
        fprintf('\n');
        ord_arrive=ord_arrive-1;
        if ord_arrive==-1
            beg_inventory= beg_inventory+ord_quantity;
        end

    end
    
end
avg_end_inv=total_end_inv./25;
avg_s_days=count./25;
fprintf('Average Ending Inventory= %d\n',avg_end_inv);
fprintf('Average No of Days during Shortage= %d\n',avg_s_days);
