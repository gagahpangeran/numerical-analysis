function ret = residu(b, a, x)
    ret = norm(b-a*x, "inf");
endfunction