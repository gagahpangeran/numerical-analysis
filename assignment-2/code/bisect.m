function out = bisect(func, x, y)
    TOL = sqrt(eps(1));

    while (abs(x-y) > TOL)
        
        if(func(x) < 0)
            mid = (x+y)/2;
            if(func(mid) < 0)
            x = mid;
            else
            y = mid;
            endif
        else
            mid = (x+y)/2;
            if(func(mid) < 0)
            y = mid;
            else
            x = mid;
            endif
        endif
    endwhile
    
    sol = (x+y)/2
    func(sol)
endfunction