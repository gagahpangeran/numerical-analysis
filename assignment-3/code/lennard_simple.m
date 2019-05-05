function ret = lennard_simple(k)
    ret = 3 * (1 / (4 * k ^ 2) ^ 6 - 2 / (4 * k ^ 2) ^ 3) + 12 ...
    * (1 / ( 2 * k ^ 2) ^ 6 - 2 / (2 * k ^ 2) ^ 3);
endfunction