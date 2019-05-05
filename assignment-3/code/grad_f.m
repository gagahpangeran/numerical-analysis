function grad = grad_f (x)
	[n,_] = size(x);
	a= 20; b= 0.2; c = 2 * pi;
	s1 = 0; s2 = 0;
	
	for i = 1 : n
		s1 = s1 + x(i) ^ 2;
		s2 = s2 + cos(c * x(i));
	end
	
	grad = zeros(n, 1);
	p = sqrt(1 / n * s1);
	q = s2 / n;

	for k=1:n
		grad(k) = 4 * x(k) * exp(-b * p) / (n * p) + (c* sin(c * x (k)) * exp(q)) / (n);
	end
endfunction