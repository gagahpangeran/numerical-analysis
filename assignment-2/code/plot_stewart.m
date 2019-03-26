function [] = plot_stewart(x1, x2, x3, y1, y2, y3)
    % hard coded => titik tumpu pada sumbu x dan y
    tx1 = 0;
    ty1 = 0;
    tx2 = 4;
    ty2 = 0;
    tx3 = 0;
    ty3 = 4;
    
    plot([x1 x2 x3 x1], [y1 y2 y3 y1], 'r'); hold on
    plot([x1 x2 x3 x1], [y1 y2 y3 y1], 'ro'); hold on
    plot([tx1 tx2 tx3], [ty1 ty2 ty3], 'bo'); hold on
    plot([tx1 x1],[ty1 y1], 'b'); hold on
    plot([tx2 x2], [ty2 y2], 'b'); hold on
    plot([tx3 x3], [ty3 y3], 'b'); 
endfunction