function pop=Encode_Decimal(par,sig,dec)
%Bi?n v�o
%par: mm?ng hai chi?u l?u[Nxd] gi� tr? qu?n th? c?n m� h�a 
%sig:vector h�ng[1xd] l?u ch? s? c� ngh?a t??ng ?ng v?i m?i th�ng s? 
%dec:vector h�ng [1xd] l?u v? tr� d?u ch?m ch? s? th?p ph�n

if(nargin<3)
    error('Thi?u ??i s?.C� ph�p: pop=encode_decimal(par,sig,dec)');
end
if(size(sig)~=size(dec))
    error('??i S? kh�ng ph� h?p v?i nhau');
end
[N,d]=size(par);

for pop_index=1:N  %qu�t t? ??u ??n cu?i qu?n th?
    gene_index=1;
    for par_index=1:d
        %gen ??u ti�n m� h�a d?u c?a th�ng s? 
        if par(pop_index,par_index)<0
             pop(pop_index,gene_index)=0;
        else 
            pop(pop_index,gene_index)=9;
        end
         gene_index=gene_index+1;
        %c?c gien ti?p theo l� ch? s? c� ngh?a 
        temp(par_index)=abs(par(pop_index,par_index))/10^dec(par_index);
        for count=1:sig(par_index)
            temp(par_index)=temp(par_index)*10;
            pop(pop_index,gene_index)=temp(par_index)-rem(temp(par_index),1);
            temp(par_index)=temp(par_index)-pop(pop_index,gene_index);
            gene_index=gene_index+1;
        end
    end
end
end