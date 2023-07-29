function par=Decode_Decimal(pop,sig,dec)
if(nargin<3)
    error('Thi?u ??i s?.Cú pháp: pop=encode_decimal(par,sig,dec)');
end
if(size(sig)~=size(dec))
    error('??i S? không phù h?p v?i nhau');
end
[N,L]=size(pop);
d=length(sig);
if L~=sum(sig)+d
    error('chi?u dài chu?i NST không phù h?p v?i sig');
end
par=zeros(N,d);
for pop_index=1:N
    start_gene=1;
    for par_index=1:d
        for count=1:sig(par_index)
            gene_index=start_gene+count;
            weight=dec(par_index)-count;
            par(pop_index,par_index)=par(pop_index,par_index)+...
                (pop(pop_index,gene_index))*10^weight;
        end
        
        if pop(pop_index,start_gene)<5
            par(pop_index,par_index)=-par(pop_index,par_index);
        end
        start_gene=start_gene+1+sig(par_index);
    end
end
end