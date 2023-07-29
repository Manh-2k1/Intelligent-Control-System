function par=Init(N,d,range)
%Bi?n vào 
%N: Kích th??c qu?n th?
%d: s? thông s? c?a hàm c?c tr? c?n tìm
%range: M?ng 2 chi?u [2xd] l?u mi?n giá tr? c?a thông s?:
% bi?n ra 
%par: m?ng hai chi?u l?u[Nxd] giá tr? qu?n th? ??u tiên 
for pop_index=1:N
    for par_index=1:d
        par(pop_index,par_index)=...
            (rand-0.5)*(range(2,par_index)-range(1,par_index))+...
            (0.5)*(range(2,par_index)+range(1,par_index));
        
    end
end
end