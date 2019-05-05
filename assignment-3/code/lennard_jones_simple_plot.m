function lennard_jones_simple_plot(k, count)

    plot3(0,0,0, "o")
    hold on;
    plot3(0,0,2*k, "o")
    hold on;
    plot3(0,k,k, "o")
    hold on;
    plot3(0,-k,k, "o")
    hold on;
    plot3(k,0,k, "o")
    hold on;
    plot3(-k,0,k, "o")
    hold on;
    title(sprintf("iterasi ke - %d", count))
    hold on; 
    grid on;
    saveas(gcf, sprintf('%d.png', count))
    hold off
endfunction