i=1;
m=16;
a=5;
c=3;
z(i)=7;
n=11;
fprintf('i\t  Zi\t\t Ui\n');
fprintf('----------------------\n');

fprintf('1\t');
fprintf('  %d\t\t\t ',z(1));
fprintf(' -');
fprintf('\n');

for i=2:n
    z(i)=mod((a*z(i-1)+c),m);
    u(i)=z(i)./m;
   fprintf('%d\t',i); fprintf('  %d \t',z(i)); fprintf('  %.4f ',u(i));
   fprintf('\n');
end