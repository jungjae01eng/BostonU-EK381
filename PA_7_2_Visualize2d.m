% Jungjae Lee
% Boston University College of Engineering
% EK 381 Programming Assignment 3 (HW 7)


%This function takes in two datasets (which must have the same number of
%columns), and reduces them down to a two-dimensional representation via
%Principal Component Analysis. It outputs the reduced datasets and
%generates a two-dimensional scatter plot.
function [dataset0_2d, dataset1_2d] = PA_7_2_Visualize2d(dataset0, dataset1)

% Stack dataset0 and dataset2 into a single data matrix X
X = [dataset0; dataset1];
muX = mean(X);
sigmaX = cov(X);

% Compute the eignvenctors and eigenvalues
[V D] = eig(sigmaX);

% Determine the i and j for the largest and second largest eigenvalues
temp = sort(D);

i = temp(end);      % Largest eigenvalue
j = temp(end-1);    % second largest eigenvalue

% Find vi and vj corresponding to the largest and second largest eignvalues
temp1 = find(D==i);     % "find" returns a vector containing the linear indices in array
temp2 = find(D==j);

vi = V(temp1);
vj = V(temp2);

% Display all of the variables
disp(temp);
disp(temp1);
disp(temp2);
disp(vi);
disp(vj);

% Create two-demensional representations
for k = 1:length(X(:,1))
    Z(k,:) = (X(k,1:2)-muX).*[vi vj];      % (X - meanX) * [vi vj] equation given in worksheet
end

scatter(Z(1:200,1), Z(1:200,2),'b');
hold

scatter(Z(201:400,1), Z(201:400,2),'r');
dataset0_2d = Z(1:200,:);
dataset1_2d = Z(201:400,:);
end