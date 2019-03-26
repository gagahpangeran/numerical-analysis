function out = bisect5()
    TOL = sqrt(eps(1))
    
    x = -0.8;
    y = -0.6;
    
    bisect(@f5, x, y)
    
    x = -0.6;
    y = -0.2;
    
    bisect(@f5, x, y)
    
    x = -0.2;
    y = 0.2;
    
    bisect(@f5, x, y)
    
    x = 0.2;
    y = 0.6;
    
    bisect(@f5, x, y)

    x = 0.6;
    y = 1.2;

    bisect(@f5, x, y)
    
    x = 1.2;
    y = 2.6;
    
    bisect(@f5, x, y)
endfunction