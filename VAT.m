% updated 10.11.2010

function [RV,C,I,RI,cut]=VAT(R);
% Example function call: [DV,I] = VAT(D);
%
% *** Input Parameters ***
% @param R (n*n double): Dissimilarity data input
% 
% *** Output Values ***
% @value RV (n*n double): VAT-reordered dissimilarity data
% @value C (n int): Connection indexes of MST
% @value I (n int): Reordered indexes of R, the input data
% @value cut (n double): MST link cut magnitude

[N,M]=size(R);

K=1:N;  % L?u m?ng ch?a các ??nh 
J=K;    % 
%P=zeros(1,N);

%max: , returning a row vector containing the maximum element from each column.
%max s? ??i x? v?i m?i c?t c?a arr nh? m?t vector, tr? v? m?t hàng ch?a các
%ph?n t? l?n nh?t c?a t?ng c?t 

[y,i]=max(R);  %y: hàng ch?a các ph?n t? l?n nh?t c?a m?i c?t, i ch?a ch? s? c?a ph?n t? l?n nh?t trong c?t 
[y,j]=max(y);
I=i(j);  % I ch?a ??nh ???c duy?t qua có kho?ng cách max 
J(I)=[]; % J ch?a ??nh ch?a duy?t 
[y,j]=min(R(I,J));  
I=[I J(j)];
J(J==J(j))=[];
C(1:2)=1;
cut=zeros(N,1);
cut(2)=y;

for r=3:N-1,
    [y,i]=min(R(I,J));
    [y,j]=min(y);
    I=[I J(j)];
    J(J==J(j))=[];
    C(r)=i(j);
    cut(r)=y;
end;
[y,i]=min(R(I,J));
I=[I J];
C(N)=i;
cut(N)=y;

for r=1:N,
    RI(I(r))=r;
end;

RV=R(I,I);

%{
M, N = R.shape
K = np.arange(0,N, dtype=int)
J = K
y, i = R.max(0), R.argmax(0)
y, j = y.max(0), y.argmax(0)
I = i[j]
J= K[K != I]
y, j = R[I,J].min(0), R[I,J].argmin(0)
I = np.append(I, J[j])
J= J[J != J[j]]
#C
cut = np.zeros((N,1), dtype = float)
cut[1] = y
for r in range(2, N-1):
    y, i = R[I,J].min(0), R[I,J].argmin(0)
    y, j = y.max(0), y.argmax(0)
    I = np.append(I, J[j])
    J= J[J != J[j]]
    cut[r] = y

y, i = R[I,J].min(0), R[I,J].argmin(0)
I = np.append(I, J)
cut[N-1] = y 
%}


