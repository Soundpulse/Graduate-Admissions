function theta = normalizeRegression(X,y)

theta = pinv(X)*pinv(X')*X'*y;

end