function plotHistogram(input,output)

%CGPA vs chanceOfAdmission
[x,index] = sort(input(:,6));
y = output(index);
scatter(x,y);

fprintf('Program paused. Press enter to continue.\n');
pause;

% GRE Histogram
histfit(input(:,1));
xlabel('Percentage of Mark (GRE)');
ylabel('Count');
fprintf('Program paused. Press enter to continue.\n');
pause;

% TOEFL Histogram
histfit(input(:,2));
xlabel('Percentage of Mark (TOEFL)');
ylabel('Count');

end