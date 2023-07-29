clc;
close all;
clear all
rand('state',sum(100*clock));

%% Khai báo các bi?n 
%?i?u ki?n d?ng: GA d?ng khi ?ã ch?y ???c 200 th? h? ho?c
%Trong  50 th? h? liên ti?p có hàm thích nghi thay ??i không quá 0.0001
max_generation=200;
max_stall_generation=50;
eplilon=0.0001;
N=20;           %kích th??c qu?n th?
npar=6;         %Có 6 thông s? c?n ?i?u ch?nh Kp1,Kp2; Ki1,Ki2; Kd1,kd2
range=[ 0   0    0  0   0  0;...
        100 100  100  100  100  100];   %t?m kh?i ??ng giá tr? thông s? ban ??u 
dec=[2 2 2 2 2 2]; %V? trí s? th?p phân 2 
sig=[5 5 5 5 5 5]; %có 5 ch? s? có ngh?a, v? trí d?u ch?m th?p phân là 2
Pc=0.8;         %Xác xu?t lai ghép là 0.9
Pm=0.2;         %Xác xu?t ??t bi?n là 0.1
elitism=1;      %L?u tr? cá th? t?t nh?t trong quá trình ti?n hóa 
%% Kh?i ??ng ng?u nhiên th? h? ??u tiên 
par=Init(N,npar,range);

terminal=0;             %c? báo ch?a k?t thúc thu?t toán
generation=0;           %Bi?n ??m s? th? h?
stall_generation=0;     %Bi?n ??m s? th? h? hàm thích nghi không ??i 
for pop_index=1:N
    Kp1=par(pop_index,1);
    Ki1=par(pop_index,2);
    Kd1=par(pop_index,3);
    Kp2=par(pop_index,4);
    Ki2=par(pop_index,5);
    Kd2=par(pop_index,6);
    sim('GA_PID_2DOF');
     if length(e1)>4000
        J=(e1'*e1)+(e2'*e2);
        fitness(pop_index)=1/(J+eps);
     else
         J=10^100;
         fitness(pop_index)=1/(J+eps);
     end
end
%%
[bestfit0,bestchorm]=max(fitness);
while~terminal      % ch?y ??n khi ?i?u ki?n d?ng th?a mãn
    generation=generation+1;
    disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);
    %Mã hóa th?p phân 
    pop=Encode_Decimal(par,sig,dec);
    
    %Ch?n l?c x?p h?ng tuy?n tính ?
    parent=select_Linear_Ranking(pop,fitness,0.5,elitism,bestchorm);
    %Lai ghép hai ?i?m
    child=Cross_Twopoint(parent,Pc,elitism,bestchorm);
    %??t bi?n ??u
    pop=Mutata_Uniform(child,Pm,elitism,bestchorm);
    %Gia ma
    par=Decode_Decimal(pop,sig,dec);
    % ?ánh giá l?i ?? thích nghi
    for pop_index=1:N 
        Kp1=par(pop_index,1);
        Ki1=par(pop_index,2);
        Kd1=par(pop_index,3);
        Kp2=par(pop_index,4);
        Ki2=par(pop_index,5);
        Kd2=par(pop_index,6);
        sim('GA_PID_2DOF');
        if length(e1)>4000
        J=(e1'*e1)+(e2'*e2);
        fitness(pop_index)=1/(J+eps);
        else
         J=10^100;
         fitness(pop_index)=1/(J+eps);
        end
    end
   [bestfit(generation),bestchrom]=max(fitness);
   % Ki?m tra ?i?u ki?n d?ng 
   if generation == max_generation
        terminal = 1;
   elseif generation>1
    if abs(bestfit(generation)-bestfit(generation-1))<eplilon,
        stall_generation=stall_generation+1;
        if stall_generation == max_stall_generation, terminal = 1;end
    else
        stall_generation=0;
     end
   end
end %While
%%
plot(1./bestfit) %% v? ?? th? hàm thích nghi

Kp1=par(bestchrom,1) %% hi?n th? các NST sau khi ch?nh ??nh
Ki1=par(bestchrom,2)
Kd1=par(bestchrom,3)
Kp2=par(bestchrom,4) %% hi?n th? các NST sau khi ch?nh ??nh
Ki2=par(bestchrom,5)
Kd2=par(bestchrom,6)
sim('GA_PID_2DOF');
