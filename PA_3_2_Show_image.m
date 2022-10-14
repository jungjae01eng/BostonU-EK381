% Jungjae Lee
% Boston University College of Engineering
% EK 381 Programming Assignment 1 (HW 3)


% This function takes in an n x 4096 data matrix X and an index i.
% It extracts the ith row of X and displays it as a grayscale 64 x 64 image.
function PA_3_2_Show_image(X,i)

if (nargin < 2)
    disp('No index selected. Displaying first pet.')
    i = 1;
end

colormap('gray')
shg
imagesc([reshape(X(i,:),64,64)])
axis square