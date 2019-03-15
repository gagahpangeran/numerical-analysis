function ret = lu_no_pivot(m)
    [n n] = size(m);
    l = diag(ones(n,1), n, n);
    u = m;
    for i = 1:n-1
        for j = i+1:n
            l(j,i) = u(j,i)/u(i,i);
            for k = i:n
                u(j,k) = u(j,k) - l(j,i) * u(i, k);
            endfor;
        endfor;
    endfor;
    ret = struct("l", l, "u", u);
endfunction;