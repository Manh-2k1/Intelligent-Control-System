function newpop=Mutata_Uniform(pop,Pm,elitism,bestchorm)
if(nargin<4) 
    error('Thi?u ??i S?');
end
   [N,L]=size(pop);
   newpop=pop;
   for pop_index=1:N
       if(elitism==0)||(elitism==1&&pop_index~=bestchorm)
           for gene_index=1:L
               if Pm>rand
                   rand_gene=rand*10;
                   while(pop(pop_index,gene_index)==...
                           rand_gene-rem(rand_gene,1)||rand_gene==10)
                       rand_gene=rand*10;
                   end
                   newpop(pop_index,gene_index)=rand_gene-rem(rand_gene,1);
               end
           end
       end
   end              
end