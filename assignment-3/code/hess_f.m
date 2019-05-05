function H = hess_f(x)
    %fungsi hessian ackley
	[n,_] = size(x);
	a= 20; b = 0.2; c = 2 * pi;
	s1 = 0; s2 = 0;
	for i = 1 : n;
		s1 = s1 + x(i) ^ 2;
		s2 = s2 + cos(c * x(i));
	end
	y = -a * exp(-b * sqrt(1 / n * s1)) - exp(1 / n * s2) + a + exp(1);
	H = zeros(n, n);
	p = sqrt(1 / n * s1);
	q = s2 / n;

	tmp = -b * p;
	n_kuadrat = n ^ 2;
	
	for i = 1 : n;
		for j = 1 : i;
			XiXj = x(i) * x(j);
			if i ~= j;
				H(i, j) = ...
				- (4 * XiXj * exp(tmp) / (n_kuadrat * p ^ 3)) ...
				- (4 * pi^2 * sin(c * x(j)) * sin(c * x(i)) * exp(q)) / (n_kuadrat) ...
				- (.8 * XiXj * exp(tmp) / (n_kuadrat * p));
				H(j, i) = H(i, j);
			else;
				H(i, j) =...
				+ (4 * exp(tmp) / (n * p)) ...
				- (4 * XiXj * exp(tmp) / (n_kuadrat * p ^ 3)) ...
				- (.8 * XiXj * exp(tmp) / (n_kuadrat * p)) ...
				- (4 * pi^2 * sin(c * x(j)) * sin(c * x(i)) * exp(q)) / (n_kuadrat) ...
				+ (c * cos(c * x(i)) * c * exp(q) / n);
			end
		end
	end
endfunction