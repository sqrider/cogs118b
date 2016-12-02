function Kmus = recalcMus(X, Rnk)

m = Rnk' * X;
s = repmat(sum(Rnk)', 1, (size(X, 2)));

Kmus = m ./ s;