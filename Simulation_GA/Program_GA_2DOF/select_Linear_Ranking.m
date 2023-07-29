function parent=select_Linear_Ranking(pop,fitness,eta,elitism,bestchorm)
if(nargin<5) 
    error('Thi?u ??i S?');
end
N=length(fitness);%K�ch th??c qu?n th?
[fitness,order]=sort(fitness); %S?p x?p t?ng d?n ?? th�ch nghi

for k=1:N
    p(k)=(eta+(2-eta)*(k-1)/(N-1))/N;
end

s=zeros(1,N+1);
for k=1:N
    s(k+1)=s(k)+p(k);
end
for k=1:N
    if (elitism==1)&(order(k)==bestchorm)
        %eitism=1 v� NST ?ang x�t l� NST t?t nh?t th� NST ?� ???c ch?n 
        parent(order(k),:)=pop(order(k),:);
    else 
        %n?u eitism==0 v� NST ?ang x�t kh�ng ph?i l� NST t?t nh?t th� NST
        %?� ???c ch?n x�c xu?t t? l? h?ng v?i n�
        r=rand*s(N+1);
        index=find(s<r); j=index(end);
        parent(order(k),:)=pop(order(j),:);
    end
end
end
    