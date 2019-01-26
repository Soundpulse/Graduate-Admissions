%Dimensions List:
%GRE SCORE - 1
%TOEFL SCORE - 2
%UNIVERSITY RANKING - 3
%Personal Statement - 4
%Recommendation Letters - 5 
%CGPA - 6
%Did research - 7

%Output
%Admission Chance

%free up workspace
clear;

%Read from csv
M = csvread('Admission_Predict.csv',1,1);

%Initialize matrices
train_input = zeros(size(M,1) * 0.8, size(M,2) - 1);
test_input = zeros(size(M,1) * 0.2, size(M,2) - 1);

train_len = size(M,1) * 0.8;

%Normalize Marks to Percentages
M(:,1) = M(:,1)./ 340;
M(:,2) = M(:,2)./ 120;

%Split into test and train data
train_input(:,1:7) = M(1:train_len,1:7);
test_input(:,1:7) = M(train_len + 1: size(M,1), 1:7);

train_output = M(1:train_len,8);
test_output = M(train_len + 1: size(M,1), 8);

%Apply linear Regression
theta = normalizeRegression(train_input, train_output);
cost = validate(theta, test_input, test_output);
fprintf("Cost: %6f\n",cost);

fprintf('Program paused. Press enter to continue.\n');
pause;

%plot GRE histrograms with retrospective to rankings
plotGRE(train_input);

fprintf('Program paused. Press enter to continue.\n');
pause;

%plot histrograms
plotHistogram(M(:,1:7),M(:,8));

fprintf('Program paused. Press enter to continue.\n');
pause;

%Admission with retrospective to did research (0 or 1)
meanResearch = 0;
countR = 0;
meanNoResearch = 0;
countNR = 0;

for i = 1:size(train_input,1)  
    if M(i,7) == 1
        meanResearch = meanResearch + train_output(i);
        countR = countR + 1;
    else
        meanNoResearch = meanNoResearch + train_output(i);
        countNR = countNR + 1;
    end
end

meanResearch = meanResearch / countR;
meanNoResearch = meanNoResearch / countNR;

%Printout statements
fprintf("Chance of Admission (Research = 1): %6f\n",meanResearch);
fprintf("Chance of Admission (Research = 0): %6f\n",meanNoResearch);
fprintf("Average number of recommendation letters: %2f\n", mean(M(:,5)));
fprintf("======================================\n");
fprintf("*: Admission Rate >= 0.5\n");
fprintf("-: Admission Rate < 0.5\n");
fprintf("Average percentage (GRE): %6f\n", mean(M(:,1)));
fprintf("Average percentage (GRE*): %6f\n", mean(M(M(:,8) >= 0.5, 1)));
fprintf("Average percentage (GRE-): %6f\n", mean(M(M(:,8) < 0.5, 1)));
fprintf("Average percentage (TOEFL): %6f\n", mean(M(:,2)));
fprintf("Average percentage (TOEFL*): %6f\n", mean(M(M(:,8) >= 0.5, 2)));
fprintf("Average percentage (TOEFL-): %6f\n", mean(M(M(:,8) < 0.5, 2)));
fprintf("Average CGPA: %6f\n", mean(M(:,6)));
fprintf("Average CGPA*:  %6f\n", mean(M(M(:,8) >= 0.5, 6)));
fprintf("Average CGPA-:  %6f\n", mean(M(M(:,8) < 0.5, 6)));


