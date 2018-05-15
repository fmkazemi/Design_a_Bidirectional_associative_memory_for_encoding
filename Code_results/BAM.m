function BAM(L,noise_bit_no,X,W)
x_length = 49;
y_length = 63;
iter_no = 20;
index = randi(L);
noisy_x = zeros(x_length,iter_no);
%noisy_x(:,1) = X(:,index);
noisy_x(:,1) = X(index,:);
for i = 1:noise_bit_no
    n = randi(x_length);
    noisy_x(n,1) = -noisy_x(n,1);
end
temp_y = zeros(y_length,iter_no);
temp_y(:,1) = randi([0 1],y_length,1);
for i = 1:y_length
    if temp_y(i,1)==0
        temp_y(i,1) = -1;
    end
end
%%
net_x = zeros(x_length,1);
net_y = zeros(y_length,1);
% k = 1;
for k = 1:iter_no-1
    % while (true)
    y = temp_y';
    E(k) = -(sum(sum(y(k,:)*W*noisy_x(:,k))));
    for i = 1:y_length
        for j = 1:x_length
            net_y(i,1) = net_y(i,1)+W(i,j)*noisy_x(j,k);
        end
        if net_y(i,1)>0
            temp_y(i,k+1) = 1;
        elseif net_y(i,1)<0
            temp_y(i,k+1) = -1;
        else
            temp_y(i,k+1) = temp_y(i,k);
        end
    end
    for j = 1:x_length
        for i = 1:y_length
            net_x(j,1) = W(i,j)*temp_y(i,k);
            if net_x(j,1)>0
                noisy_x(j,k+1) = 1;
            elseif net_x(j,1)<0
                noisy_x(j,k+1) = -1;
            else
                noisy_x(i,k+1) = noisy_x(i,k);
            end
        end
    end
    %     y = temp_y';
    %     E(k) = -(sum(sum(y(k,:)*W*noisy_x(:,1))));
    if k>1
        if noisy_x(:,k)==noisy_x(:,k-1)
            if temp_y(:,k)==temp_y(:,k-1)
                k
                break;
            end
        end
    end
    k = k+1;
end
plot(E);
% axis([-1 5 -700 8]);
s1 = int2str(L);
s2 = int2str(noise_bit_no);
s3 = strcat('Energy Function when Number of noisy bits =  ',s2);
title(s3);

s4 = strcat(s3,'.jpg');
hgsave(s3);
figure;
end