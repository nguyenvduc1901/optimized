function [ RiVAT,smp ] = siVAT( x, cp, ns )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[n,p]=size(x);


%m: So dinh dai dien, rp: ma tran khoang cach cua cac diem dai dien so voi
%cac diem con lai 
[m,rp]=samplePlus(x,cp);

[~,i]=min(rp,[],2);  % returns the smallest elements along dimension dim. For example, if A is a matrix, then min(A,[],2) is a column vector containing the minimum value of each row.

smp=[]; % Ma tran chua chi so cac diem sample duoc chon 
for t=1:cp,
    s = find(i==t);
    nt = ceil(ns*length(s)/n);
    ind = ceil(rand(nt,1)*length(s));
    smp=[smp; s(ind)];
end;
[RiVAT,~, ~] = iVAT(distance2(x(smp,:),x(smp,:)));
smp = x(smp,:);

%
%     figure;
%     plot(x(smp,1),x(smp,2),'.');

end

