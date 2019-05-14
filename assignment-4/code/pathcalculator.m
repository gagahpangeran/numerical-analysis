function pathcalculator(n)
    plot([-1 1],[0,0],'k',[0 0],[-1 1],'k');hold on
    t=0:.02:1;
    %[x,y]=ginput(1); % get one mouse click
    
    xdata = zeros(1,n);
    ydata = zeros(1,n);
    for i=1:n
      [x,y] = ginput(1) % get n mouse clicks
      plot(x, y, 'bo');
      xdata(i) = x;
      ydata(i) = y;    
    endfor

    tmp = []
    for i=1:n
      tmp = [tmp xdata(i)]
    endfor

    xdata = []
    for i=1:n
      xdata = [xdata i]
    endfor

    
    %proses xdata dan ydata untuk menggambarkan path
    %dan menghitung panjang path
  
    % What if we interpolate x from t then y from t ?
    % init h
    
    h = []
    for i = 1:n-1  
      h = [h xdata(i+1)-xdata(i)];
    endfor
    
    % init u 
    
    u = []
    for i = 1:n-2
      u = [u h(i)/(h(i)+h(i+1))];
    endfor
    
    % init lamb
    
    lamb = []
    for i = 1:n-2
      lamb = [lamb 1-u(i)];
    endfor
    
    % init ye
    
    ye = []
    for i = 1:n-2
      ye = [ye 6*((ydata(i+2)-ydata(i+1))/ ...
      h(i+1)-(ydata(i+1)-ydata(i))/h(i))/(h(i)+h(i+1))];
    endfor
  
    % A\b, generate A matrix
  
    A = eye(n-2)*2;
    A(1,2) = lamb(1);
    A(n-2,n-3) = u(n-2);
    for i = 2:n-3
      A(i,i-1) = u(i);
      A(i,i+1) = lamb(i);
    endfor
   
    
    % natural spline
    buah = A\ye';
    buah = [0 buah' 0];
    
    % generate a, b, c, d
    a = [];
    b = [];
    c = [];
    d = [];
  
    for i=1:n-1
      a = [a (buah(i+1)-buah(i))/(6*h(i))];
      b = [b buah(i)/2];
      c = [c (ydata(i+1)-ydata(i))/h(i)-h(i)*(2*buah(i)+buah(i+1))/6];
      d = [d ydata(i)];
    endfor
  
    % second part

    ydata = []
    for i=1:n
      ydata = [ydata tmp(i)];
    endfor

    h = []
    for i = 1:n-1  
      h = [h xdata(i+1)-xdata(i)];
    endfor
    
    % init u 
    
    u = []
    for i = 1:n-2
      u = [u h(i)/(h(i)+h(i+1))];
    endfor
    
    % init lamb
    
    lamb = []
    for i = 1:n-2
      lamb = [lamb 1-u(i)];
    endfor
    
    % init ye
    
    ye = []
    for i = 1:n-2
      ye = [ye 6*((ydata(i+2)-ydata(i+1))/ ...
      h(i+1)-(ydata(i+1)-ydata(i))/h(i))/(h(i)+h(i+1))];
    endfor
  
    % A\b, generate A matrix
  
    A = eye(n-2)*2;
    A(1,2) = lamb(1);
    A(n-2,n-3) = u(n-2);
    for i = 2:n-3
      A(i,i-1) = u(i);
      A(i,i+1) = lamb(i);
    endfor
   
    
    % natural spline
    buah = A\ye';
    buah = [0 buah' 0];
    
    % generate aa, bb, cc, dd
    aa = [];
    bb = [];
    cc = [];
    dd = [];
  
    for i=1:n-1
      aa = [aa (buah(i+1)-buah(i))/(6*h(i))];
      bb = [bb buah(i)/2];
      cc = [cc (ydata(i+1)-ydata(i))/h(i)-h(i)*(2*buah(i)+buah(i+1))/6];
      dd = [dd ydata(i)];
    endfor


    % plot polynomial
    _range = 100000;
    total_length = 0;
    h = 1e-11;

    for i = 1:n-1
      x = linspace(xdata(i),xdata(i+1),_range);
      y = a(i)*(x.-xdata(i)).^3+b(i)*(x.-xdata(i)).^2+c(i) ...
      *(x.-xdata(i))+d(i);
      xx = aa(i)*(x.-xdata(i)).^3+bb(i)*(x.-xdata(i)).^2+cc(i) ... 
      *(x.-xdata(i))+dd(i);

      % calculate diff using centered difference, take h = 1e-11
      xPlusH = x.+h; 
      xMinH = x.-h;
      dfxx = aa(i)*(xPlusH.-xdata(i)).^3+bb(i) ...
      *(xPlusH.-xdata(i)).^2+cc(i)*(xPlusH.-xdata(i))+dd(i);
      dfxx-= aa(i)*(xMinH.-xdata(i)).^3+bb(i) ...
      *(xMinH.-xdata(i)).^2+cc(i)*(xMinH.-xdata(i))+dd(i);
      dfxx/= 2*h;
      dfy = a(i)*(xPlusH.-xdata(i)).^3+b(i) ...
      *(xPlusH.-xdata(i)).^2+c(i)*(xPlusH.-xdata(i))+d(i);
      dfy-= a(i)*(xMinH.-xdata(i)).^3+b(i) ...
      *(xMinH.-xdata(i)).^2+c(i)*(xMinH.-xdata(i))+d(i);
      dfy/= 2*h; 
      % calculate the integral using composite trap rule, n = _range
      dfy = (dfy.^2) .+ (dfxx.^2);
      dfy = dfy.^(0.5);
      
      integral = 0;
      hh = (xdata(i+1)-xdata(i))/_range;
      for i=1:_range-1
        integral+= (dfy(i) + dfy(i+1));
      endfor; 
      integral*= hh;
      integral/= 2;
      % add to total length 
      integral
      total_length+= integral;
      plot(xx,y)
    endfor

    text(0.5, 0.5, sprintf("Total Length = %0.5f", total_length));
  endfunction