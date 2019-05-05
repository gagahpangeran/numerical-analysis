function ret = ackley_all(x)
	tol = 1e-4;
    [row col] = size(x);
    tic()
	newton = newton_wrapper(x,tol);
	newton_time = toc

	tic()
	steep = steepest_descent_wrapper(x,tol);
	steep_time = toc

	tic()
	quasi = quasi_newton_sr1_wrapper(x, tol);
	quasi_time = toc()

	newton_time
	steep_time
	quasi_time
end