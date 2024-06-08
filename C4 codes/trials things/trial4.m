X = [];
for j = 1 : 1000
    i = 0;    lambda = 1;    a = exp(-lambda);    F = a;
    for i=1 :1000
        if rand(1) < F
            x = i;
            break;
        else
            a = lambda * a / (i + 1);
            F = F + a;
        end
    end
    X = [X, x];
end
histogram(X)