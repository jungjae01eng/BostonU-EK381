% Jungjae Lee
% Boston University College of Engineering
% EK 381 Programming Assignment 1 (HW 3)


% This function takes in the column vectors of cat and dog test guesses and outputs the corresponding fractions of misclassified images.
% Specificallly, cat_error_rate is the fraction of 1's in cats_test_guesses and dog_error_rate is the fraction of 0's in dogs_test_guesses.

function [cat_error_rate, dog_error_rate] = PA_3_6_Error_rate(cats_test_guesses,dogs_test_guesses)
    cat_error_rate = sum(cats_test_guesses) / length(cats_test_guesses);
    dog_error_rate = sum(1-dogs_test_guesses) / length(dogs_test_guesses);


if (cat_error_rate < 0 | cat_error_rate > 1) 
    error("The variable cat_error_rate is not between 0 and 1.")
end
if (dog_error_rate < 0 | dog_error_rate > 1) 
    error("The variable dog_error_rate is not between 0 and 1.")
end
