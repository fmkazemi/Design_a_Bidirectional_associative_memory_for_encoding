clc;
clear all;
close all;
XX=[1  0  0  0  0  1  1  1  1  0  1  1  0  0  1  1  0  1  0  0  1  1  1  0  1  1  1  0  1  1  1  0  1  0  0  1  1  0  1  1  1  1  1  1  0  1  1  1  0;        
   1  0  0  1  0  0  0  1  1  0  1  0  0  1  1  1  0  1  1  0  0  1  1  0  1  1  0  0  1  1  0  0  0  0  1  1  1  1  0  0  1  0  1  1  1  1  0  0  1;        
   1  0  0  1  1  0  0  1  1  0  0  1  0  1  1  1  1  0  1  1  1  1  1  0  1  0  0  1  1  1  1  0  0  1  1  1  1  0  1  0  1  1  1  1  1  1  0  0  1;        
   1  0  0  1  0  1  1  1  1  0  0  1  0  1  1  1  0  1  1  1  0  1  1  1  0  0  1  1  1  1  1  0  1  0  0  1  1  0  0  0  0  1  1  1  1  0  0  1  0]        

YY=[1	0	1	0	0	0	0	1	1	1	0	0	1	0	1	1	0	0	1	0	1	1	1	1	0	0	1	1	1	1	0	1	0	0	1	1	1	0	0	1	0	0	1	1	0	0	1	0	1	1	1	0	1	1	1	0	1	1	1	0	1	0	0;
    1	0	0	0	1	1	0	1	1	0	1	0	0	1	1	1	1	0	0	1	0	1	1	1	0	0	1	1	1	1	1	0	1	0	0	1	0	0	1	1	0	0	1	1	0	0	0	0	1	1	1	0	0	1	0	0	1	1	1	1	0	0	1;
    1	0	1	0	0	1	1	1	1	1	0	1	1	1	1	1	0	0	1	0	1	1	1	0	0	1	0	1	1	1	1	0	1	0	0	1	0	0	0	1	1	1	1	1	0	1	0	0	1	1	1	1	0	0	1	0	1	1	0	1	1	0	0;
    1	0	0	0	1	1	1	1	1	0	0	1	0	1	1	1	0	1	1	1	0	1	1	1	0	1	0	0	1	1	0	1	1	0	0	1	1	0	0	1	0	1	1	1	0	1	1	0	1	1	1	0	0	0	0	1	1	1	0	1	1	1	0]
XX=XX.';
YY=YY.';
%x_length = 30;
%y_length = 20;
x_length = 49;% number of neurons in the input layer
y_length = 63;% number of neurons in the input layer
L = [1];%------------------------
noise_bit_no = [1 2 5 10];
[k, n] = size(L);
[k m] = size(noise_bit_no);
W = zeros(y_length,x_length);

for p = 1:n
    X = XX(:,p);%--------------
    Y = YY(:,p);%---------------
    for i = 1:x_length
        for j = 1:1
            if X(i,j)==0
                X(i,j) = -1;
            end
        end
    end
    for i = 1:y_length
        for j = 1:1
            if Y(i,j)==0
                Y(i,j) = -1;
            end
        end
    end
    W = Y*(X');
    E_min = -(sum(sum(abs(W))))
    for q = 1:m
        BAM(L(1,p),noise_bit_no(1,q),X,W);
    end
end


