function J = validate(theta, X, y)

J = 0;
m = length(y);
%Regression data
err = X * theta;

J = 1/(2*m) * (err - y)' * (err - y);

end
