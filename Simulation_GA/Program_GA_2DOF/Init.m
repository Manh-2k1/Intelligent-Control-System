function par=Init(N,d,range)
%Bi?n v�o 
%N: K�ch th??c qu?n th?
%d: s? th�ng s? c?a h�m c?c tr? c?n t�m
%range: M?ng 2 chi?u [2xd] l?u mi?n gi� tr? c?a th�ng s?:
% bi?n ra 
%par: m?ng hai chi?u l?u[Nxd] gi� tr? qu?n th? ??u ti�n 
for pop_index=1:N
    for par_index=1:d
        par(pop_index,par_index)=...
            (rand-0.5)*(range(2,par_index)-range(1,par_index))+...
            (0.5)*(range(2,par_index)+range(1,par_index));
        
    end
end
end