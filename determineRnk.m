function Rnk = determineRnk(sqDmat)

[M,I] = min(sqDmat, [], 2);

Rnk = full(ind2vec(I'))';