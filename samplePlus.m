function [m,Rp] = samplePlus(X,cp)
% cp: So cum vuot qua
[n,p]=size(X);    %n: so hang, p: so cot -  so thuoc tinh 

m=ones(cp,1);  %ma tran cp hang 1 cot, cp: so cum 
d=distance2(X(1,:),X)'; %Khoang cach diem dau tien voi tat ca cac diem trong tap du lieu 
Rp(:,1)=d;  
for t=2:cp,
    d=min(d,Rp(:,t-1));
    [~,m(t)]=max(d);
    Rp(:,t)=distance2(X(m(t),:),X)';
end;