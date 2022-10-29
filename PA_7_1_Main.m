% Read Data from csv
benignData = readmatrix("benignfull.csv");
malignantData = readmatrix("malignantfull.csv");

% Given that the column 2 is texture and column 3 is perimeter
% Scatter of Benign and Malignant
scatter(benignData(:,2), benignData(:,3), "filled", "b");
hold
scatter(malignantData(:,2), malignantData(:,3), "filled", "r");

gaussiancontour(benignData(:,2), benignData(:,3));
gaussiancontour(malignantData(:,2), malignantData(:,3), "r");

% Labels for the plot
xlabel('x: texture');
ylabel('y: perimeter');
title('texture vs perimeter');
legend('benign data', 'malignant data');


% [benign_2d malignant_2d] = visualize2d(benignData(:,1:2), malignantData(:,1:2));


ones = readmatrix("MNISTones.csv");
zeros = readmatrix("MNISTZEROS.csv");