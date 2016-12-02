function sqDmat = calcSqDistances(X, Kmus)

N=size(X, 1);
K=size(Kmus, 1);

XX = repmat(sum(X .^ 2, 2), 1, K);
YY = repmat(sum(Kmus .^ 2, 2)', N, 1);
XY = X * Kmus';

sqDmat = XX + YY - 2 .* XY;