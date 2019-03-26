function [] = plot_from_theta(theta)
    px1 = 5
    px2 = 0
    px3 = 0
    py1 = 0
    py2 = 6
    py3 = 0
    L1 = L3 = 3
    L2 = 3*sqrt(2)
    gamma = pi/4
    p1 = p2 = 5
    p3 = 3
    
    A2 = L3*cos(theta) - px1
    B2 = L3*sin(theta)
    A3 = L2*cos(theta + gamma) - px2
    B3 = L2*sin(theta + gamma) - py2
    
    N1 = B3*((p2)^2 - (p1)^2 - (A2)^2 - (B2)^2) - B2*((p3)^2 - (p1)^2 - (A3)^2 - (B3)^2)
    N2 = -(A3)*((p2)^2 - (p1)^2 - (A2)^2 - (B2)^2) + A2*((p3)^2 - (p1)^2 - (A3)^2 - (B3)^2)
    
    D = 2*((A2)*(B3) - (B2)*(A3))
    
    x1 = N1/D
    y1 = N2/D
    
    x2 = x1 + (L3) * cos(theta)
    y2 = y1 + (L3) * sin(theta)
    
    x3 = x1 + (L2) * cos(theta + gamma)
    y3 = y1 + (L2) * sin(theta + gamma)
    
    plot([x1 x2 x3 x1], [y1 y2 y3 y1], 'r'); hold on
    plot([x1 x2 x3 x1], [y1 y2 y3 y1], 'r0'); hold on
    plot([px1 px2 px3], [py1 py2 py3], 'bo'); hold on
    plot([px3 x1], [py3 y1], 'b'); hold on
    plot([px1 x2], [py1 y2], 'b'); hold on
    plot([px2 x3], [py2 y3], 'b');
endfunction