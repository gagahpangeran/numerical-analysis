function out = bisect4()
    TOL = sqrt(eps(1))
    
    x = -1;
    y = -0.5;
    
    bisect(@f4, x, y)
    x = -0.5;
    y = 0;
    
    bisect(@f4, x, y)
    
    x = 1;
    y = 1.5;
    
    bisect(@f4, x, y)
    
    x = 2;
    y = 2.5;
    
    bisect(@f4, x, y)
    
endfunction