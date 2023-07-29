function child=Cross_Twopoint(parent,Pc,elitism,bestchorm)
   if(nargin<4) 
    error('Thi?u ??i S?');
   end
   [N,L]=size(parent);
   
   for p1=1:N
       %n?u c? elitimi=1 và p1 là cá th? siêu vi?t thì không lai ghép
       if(elitism==1)&(p1==bestchorm)
           child(p1,:)=parent(p1,:);
       else
            if Pc>rand        %Lai ghép x?y ra v?i xác xu?t Pc
                p2=p1;        %ch?n ng?u nhiên cá th? cha m? 2
                while p2==p1   %khác cá th? cha m? 1
                    p2=rand*N;
                    p2=p2-rem(p2,1)+1;
                end
                k1=rand*(L-1);      %ch?n ng?u nhiên ?i?m lai ghép 1
                k1=k1-rem(k1,1)+1;
                k2=k1;
                while k2==k1
                    k2=rand*(L-1);      %ch?n ng?u nhiên ?i?m lai ghép 1
                    k2=k2-rem(k2,1)+1;
                end
                %n?u k2<k1 thì chuy?n ??i k1 và k2 ?? ??m b?o r?ng k1<k2
                if k1>k2, t=k2;k2=k1;k1=t; end
                   
                %cá th? con th?a h??ng gien cha m? 
                child(p1,1:k1)=parent(p1,1:k1);
                child(p1,k1+1:k2)=parent(p2,k1+1:k2);
                child(p1,k2+1:L)=parent(p1,k2+1:L);
            else
            child(p1,:)=parent(p1,:);
            end
       end
   end 
end
    