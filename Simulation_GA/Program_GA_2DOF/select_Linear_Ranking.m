function parent=select_Linear_Ranking(pop,fitness,eta,elitism,bestchorm)
if(nargin<5) 
    error('Thi?u ??i S?');
end
N=length(fitness);%Kích th??c qu?n th?
[fitness,order]=sort(fitness); %S?p x?p t?ng d?n ?? thích nghi

for k=1:N
    p(k)=(eta+(2-eta)*(k-1)/(N-1))/N;
end

s=zeros(1,N+1);
for k=1:N
    s(k+1)=s(k)+p(k);
end
for k=1:N
    if (elitism==1)&(order(k)==bestchorm)
        %eitism=1 và NST ?ang xét là NST t?t nh?t thì NST ?ó ???c ch?n 
        parent(order(k),:)=pop(order(k),:);
    else 
        %n?u eitism==0 và NST ?ang xét không ph?i là NST t?t nh?t thì NST
        %?ó ???c ch?n xác xu?t t? l? h?ng v?i nó
        r=rand*s(N+1);
        index=find(s<r); j=index(end);
        parent(order(k),:)=pop(order(j),:);
    end
end
end
    