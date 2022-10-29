% Jungjae Lee
% Boston University College of Engineering
% EK 381 Programming Assignment 3 (HW 7)


%This function takes in two datasets (which must have the same number of
%columns), and reduces them down to a two-dimensional representation via
%Principal Component Analysis. It outputs the reduced datasets and
%generates a two-dimensional scatter plot.
function [dataset0_2d dataset1_2d] = visualize2d(dataset0,dataset1)

X = [dataset0; dataset1];
muX = mean(X);
sigmaX = cov(X);
%Your code starts here.
[V D] = eig(sigmaX);
temp = sort(D);

i = temp(end);
j = temp(end-1);

disp(temp);

temp1 = find(D==i);
temp2 = find(D==j);

disp(temp1);
disp(temp2);

vi = V(temp1);
vj = V(temp2);

disp(vi);
disp(vj);

for k = 1:length(X(:,1))
    Z(k,:) = (X(k,1:2)-muX).*[vi vj];      % (X - meanX) * [vi vj] equation given in worksheet
end

scatter(Z(1:200,1), Z(1:200,2),'b');
hold

scatter(Z(201:400,1), Z(201:400,2),'r');
dataset0_2d = Z(1:200,:);
dataset1_2d = Z(201:400,:);
end