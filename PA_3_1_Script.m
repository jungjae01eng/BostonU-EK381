% Jungjae Lee
% Boston University College of Engineering
% EK 381 Programming Assignment 1 (HW 3)


% read cats and dogs data.
[cats, dogs] = PA_3_3_Read_cats_dogs;
num_cats = size(cats,1);
num_dogs = size(dogs,1);

% split dataset into training and test data.
cats_train = cats(1:floor(num_cats/2),:);
cats_test = cats(floor(num_cats/2)+1:num_cats,:);
dogs_train = dogs(1:floor(num_dogs/2),:);
dogs_test = dogs(floor(num_dogs/2)+1:num_dogs,:);
num_cats_test = size(cats_test,1);
num_dogs_test = size(dogs_test,1);

%% Problem 3.4(a)
% calculate average cat and dogs images on the training data.
avg_cat = PA_3_5_Vector_average(cats_train);
avg_dog = PA_3_5_Vector_average(dogs_train);
figure(1)
PA_3_2_Show_image(avg_cat,1);
title('Average Cat')
figure(2)
PA_3_2_Show_image(avg_dog,1);
title('Average Dog')

%% Problem 3.4(b)
% classify test images.
cat_test_guesses = zeros(num_cats_test,1);
dog_test_guesses = zeros(num_dogs_test,1);
for i = 1:num_cats_test
    current_cat = cats_test(i,:);
    cat_test_guesses(i) = PA_3_4_Classifier(current_cat,avg_cat,avg_dog);
end

for i = 1:num_dogs_test
    current_dog = dogs_test(i,:);
    dog_test_guesses(i) = PA_3_4_Classifier(current_dog,avg_cat,avg_dog);
end

%% Problem 3.4(c)
% calculate the fraction of cat and dog images that are misclassified by our simple "closest-average" classifier.
[cat_error_rate, dog_error_rate] = PA_3_6_Error_rate(cat_test_guesses,dog_test_guesses);

% print fractions to the display.
catstring = sprintf('The fraction of cat images misclassified by the closest average is %.2g.',cat_error_rate);
disp(catstring)
dogstring = sprintf('The fraction of dog images misclassified by the closest average is %.2g.',dog_error_rate);
disp(dogstring) 
