%Proshanta Kumer Das ID:011 171 239
i=1;
n=10;
z(i)=7182;
z_sq(i)=(z(i)).^2;

fprintf('i\t\t Zi\t\t\t Ui\t\t\tZi^2\n');
fprintf('--------------------------------------\n');

fprintf('1\t\t');
fprintf('%d\t\t  ',z(1));
fprintf('-\t\t');
fprintf('  %d ', z_sq(1));
fprintf('\n');
for i=2:n
    zs=num2str(z_sq(i-1),'%08d');
    len=length(zs);
    digit=(len-4)./2;
    x=digit+1;
    y=len-digit;
    z(i)= sscanf(zs(x:y), '%d');
    u(i)=z(i)/10000;
    z_sq(i)=z(i).^2;
    
    fprintf('%d\t\t',i); fprintf('%d\t',z(i)); fprintf('  %.4f\t',u(i)); fprintf('  %d', z_sq(i));
    fprintf('\n');
end