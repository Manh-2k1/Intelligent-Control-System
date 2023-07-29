%% Chuong trinh mang neural khop 1
K = length(u);
X = [e(2:K)'; de(2:K)'; u(1:K-1)'];     %vecto dau vao
D = [u(2:K)'];                          %vecto ket qua
N = 20;                                 %so lop an
mynet = newff(minmax(X),[N 5 1] ,{'tansig' 'logsig' 'purelin'},'trainrp'); %ham tong hop va ham tac dong
mynet.trainparam.show = 50;
mynet.trainparam.epochs=200000;            %so lan chay
mynet.trainparam.lr=0.05; 
mynet.trainparam.goal=1e-7;
Mynet = train(mynet,X,D); %hinh thanh mang neuron
gensim(Mynet);  
a=sim(Mynet,X);
%%
plot(a)
%% Chuong trinh mang neural khop 2
K1 = length(u1);
X1 = [e1(2:K1)'; de1(2:K1)'; u1(1:K1-1)'];    %vecto dau vao
D1 = [u1(2:K1)'];                             %vecto ket qua
N1 = 20;                                      %so lop an
mynet1 = newff(minmax(X1),[N1 5 1] ,{'tansig' 'logsig' 'purelin'},'trainrp');  %ham tong hop va ham tac dong
mynet1.trainparam.show = 50;                             
mynet1.trainparam.epochs=200000;            %so lan chay
mynet1.trainparam.lr=0.05;                %he so hoc
mynet1.trainparam.goal=1e-7;               
Mynet1 = train(mynet1,X1,D1);                %hinh thanh mang neuron            
gensim(Mynet1);
%%
a1=sim(Mynet1,X1);
plot(a1)
