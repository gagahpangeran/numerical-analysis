function ret = accuracy(x_topi, x)
    ret = norm(x_topi-x, "inf")/norm(x,"inf");
endfunction