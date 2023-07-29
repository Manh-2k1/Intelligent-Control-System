clc;
close all;
clear all
rand('state',sum(100*clock));

%% Khai b�o c�c bi?n 
%?i?u ki?n d?ng: GA d?ng khi ?� ch?y ???c 200 th? h? ho?c
%Trong  50 th? h? li�n ti?p c� h�m th�ch nghi thay ??i kh�ng qu� 0.0001
max_generation=200;
max_stall_generation=50;
eplilon=0.0001;
N=20;           %k�ch th??c qu?n th?
npar=6;         %C� 6 th�ng s? c?n ?i?u ch?nh Kp1,Kp2; Ki1,Ki2; Kd1,kd2
range=[ 0   0    0  0   0  0;...
        100 100  100  100  100  100];   %t?m kh?i ??ng gi� tr? th�ng s? ban ??u 
dec=[2 2 2 2 2 2]; %V? tr� s? th?p ph�n 2 
sig=[5 5 5 5 5 5]; %c� 5 ch? s? c� ngh?a, v? tr� d?u ch?m th?p ph�n l� 2
Pc=0.8;         %X�c xu?t lai gh�p l� 0.9
Pm=0.2;         %X�c xu?t ??t bi?n l� 0.1
elitism=1;      %L?u tr? c� th? t?t nh?t trong qu� tr�nh ti?n h�a 
%% Kh?i ??ng ng?u nhi�n th? h? ??u ti�n 
par=Init(N,npar,range);

terminal=0;             %c? b�o ch?a k?t th�c thu?t to�n
generation=0;           %Bi?n ??m s? th? h?
stall_generation=0;     %Bi?n ??m s? th? h? h�m th�ch nghi kh�ng ??i 
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
while~terminal      % ch?y ??n khi ?i?u ki?n d?ng th?a m�n
    generation=generation+1;
    disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);
    %M� h�a th?p ph�n 
    pop=Encode_Decimal(par,sig,dec);
    
    %Ch?n l?c x?p h?ng tuy?n t�nh ?
    parent=select_Linear_Ranking(pop,fitness,0.5,elitism,bestchorm);
    %Lai gh�p hai ?i?m
    child=Cross_Twopoint(parent,Pc,elitism,bestchorm);
    %??t bi?n ??u
    pop=Mutata_Uniform(child,Pm,elitism,bestchorm);
    %Gia ma
    par=Decode_Decimal(pop,sig,dec);
    % ?�nh gi� l?i ?? th�ch nghi
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
plot(1./bestfit) %% v? ?? th? h�m th�ch nghi

Kp1=par(bestchrom,1) %% hi?n th? c�c NST sau khi ch?nh ??nh
Ki1=par(bestchrom,2)
Kd1=par(bestchrom,3)
Kp2=par(bestchrom,4) %% hi?n th? c�c NST sau khi ch?nh ??nh
Ki2=par(bestchrom,5)
Kd2=par(bestchrom,6)
sim('GA_PID_2DOF');
