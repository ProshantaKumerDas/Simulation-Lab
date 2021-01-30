
num_row_col=5;      %Size of Row & Column
num_of_gen=3;       %Number of Iteration/Generation
%Below line Initial Generation
generation = [0 0 0 0 0;0 0 1 1 1;0 1 1 1 0;0 0 0 0 0;0 0 0 0 0]; 

axis([-num_row_col num_row_col -num_row_col num_row_col])
cla;        %Clear
spy(generation,'bx')     %Plot Generation where value is 1
grid on
pause(1.5)   %Pause for 1.5 second

fprintf('Generation: 1\n');  %Print Generation:1
disp(generation);            %Display Initial Generation Matrix
    
for index=1:num_of_gen-1
    live_cell=generation;    
    for m=1:num_row_col
        x = m-1;
        y = m+1;
        k=1;
        for i=x:y
            vi(k)=i;
            k=k+1;
        end 
        len=length(vi);
        for i=1:len
            if vi(i)==0
                vi(i)=num_row_col;
            end
        end
        for i=1:len
            if vi(i)==num_row_col+1
                vi(i)=1;
            end
        end

        for n=1:num_row_col
            u = n-1;
            v = n+1;
            z=1;
            for i=u:v
                vj(z)=i;
                z=z+1;
            end 
            len2=length(vj);
            for i=1:len2
                if vj(i)==0
                    vj(i)=num_row_col;
                end
            end
            for i=1:len2
                if vj(i)==num_row_col+1
                    vj(i)=1;
                end
            end
            live_neighbor = sum(sum(generation(vi,vj)))-generation(m,n);
              if generation(m,n)
                  if live_neighbor < 2 
                     live_cell(m,n) = 0;
                  end

                  if live_neighbor == 2
                     live_cell(m,n) = 1;
                  end

                  if live_neighbor > 3
                      live_cell(m,n) = 0;
                  end
              else
                  if live_neighbor == 3
                      live_cell(m,n) = 1;
                  end
              end
          
        end
    end
    fprintf('Generation: %d\n',index+1);
    disp(live_cell);  %Print Generations Matrix
    generation = live_cell;
    axis([-num_row_col num_row_col -num_row_col num_row_col])
    cla;        %Clear
    spy(generation)     %Plot Generation where value is 1
    grid on
    pause(1.5)   %Pause for 1.5 second
end
