%Proshanta Kumer Das ID:011 171 239
i=1;
p=11;  
q=19;
w_size=4;
n=41;
m=p*q;
x(i)=3;  %seed
count=0;

fprintf('i\tp\t\tq\t   m=p*q\tXi\t\tBi\n');
fprintf('--------------------------------------\n');

fprintf('1\t');
fprintf('%d\t\t',p);
fprintf('%d\t\t',q);
fprintf('%d\t\t',m);
fprintf('%d\t\t',x(1));
fprintf(' -');
fprintf('\n');

for i=2:n
    x(i)=mod(x(i-1).^2,m);
    binary = dec2bin(x(i));
    len=length(binary);
    for j=1:len
        bin=bin2dec(binary(j));
        if bin==1
            count=count+1;
        end
    end
    if(mod(count,2)==0)
        b(i-1)='0';
    else
        b(i-1)='1';
    end
    count=0;
    fprintf('%d\t\t\t\t\t\t  ',i); fprintf('  %d\t\t',x(i)); fprintf(' %s ',b(i-1));
    fprintf('\n');
    
end

fprintf("-----------------------------------------\n");
len=length(b);
i=1;
fprintf("The length of binary string: %d \n",len);
fprintf("The binary value: %s \n",b);
fprintf("The Random Decimal Number: ");

while i<len
    clear de;
    for j=i:(i+w_size-1)
        de(j)=b(j);
    end
    decimal=bin2dec(de);
    fprintf('%d  ',decimal);
    i=i+w_size;
end
fprintf("\n");
