function ret = lu_partial_pivot(m)
    [n n] = size(m);
    l = diag(ones(n,1), n, n);
    p = l;
    u = m;
    
    for i = 1:n-1
        % find pivot
        cur = abs(u(i,i));
        pos_tukar = i;

        for j = i+1:n
            if(cur < abs(u(j,i)))
                cur = abs(u(j,i));
                pos_tukar = j;
            endif;
        endfor;

        if(i != pos_tukar)
            for j = i:n
                tmp = u(i,j);
                u(i,j) = u(pos_tukar,j);
                u(pos_tukar, j) = tmp;
            endfor;

            for j = 1:i-1
                tmp = l(i,j);
                l(i,j) = l(pos_tukar,j);
                l(pos_tukar,j) = tmp;
            endfor;

            for j = 1:n
                tmp = p(i,j);
                p(i,j) = p(pos_tukar, j);
                p(pos_tukar, j) = tmp;
            endfor;
        endif;
        % endfind pivot
        
        for j = i+1:n
            l(j,i) = u(j,i)/u(i,i);
            for k = i:n
                u(j,k) = u(j,k) - l(j,i) * u(i, k);
            endfor;
        endfor;
    endfor;

    ret = struct("l", l, "u", u, "p", p);
endfunction;