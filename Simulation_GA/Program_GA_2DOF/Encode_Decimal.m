function pop=Encode_Decimal(par,sig,dec)
%Bi?n vào
%par: mm?ng hai chi?u l?u[Nxd] giá tr? qu?n th? c?n mã hóa 
%sig:vector hàng[1xd] l?u ch? s? có ngh?a t??ng ?ng v?i m?i thông s? 
%dec:vector hàng [1xd] l?u v? trí d?u ch?m ch? s? th?p phân

if(nargin<3)
    error('Thi?u ??i s?.Cú pháp: pop=encode_decimal(par,sig,dec)');
end
if(size(sig)~=size(dec))
    error('??i S? không phù h?p v?i nhau');
end
[N,d]=size(par);

for pop_index=1:N  %quét t? ??u ??n cu?i qu?n th?
    gene_index=1;
    for par_index=1:d
        %gen ??u tiên mã hóa d?u c?a thông s? 
        if par(pop_index,par_index)<0
             pop(pop_index,gene_index)=0;
        else 
            pop(pop_index,gene_index)=9;
        end
         gene_index=gene_index+1;
        %c?c gien ti?p theo là ch? s? có ngh?a 
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