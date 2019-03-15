function ret = generate_matrix(n)
    matrix = rand(n,n);
    solusi = rand(n,1);
    hasil = matrix*solusi;
    ret = struct("matrix", matrix, "solusi", solusi, "hasil", hasil);
endfunction