function result = lennard_jones(x, y, z)
    % x vektor x1, x2, .., x6
    % y vektor y1, y2, .., y6
    % z vektor z1, z2, .., z6
    result = 0;
    for i= 1 : 6
        for j= i + 1 : 6
            rr = ((- x(j) + x(i)) ^ 2 + (- y(j) + y(i)) ^ 2 + (- z(j) + z(i)) ^ 2);
            rr3 = rr ** 3;
            rr6 = rr ** 6;
            result += (1 - (2 * rr3)) / rr6;
        endfor
    endfor
endfunction