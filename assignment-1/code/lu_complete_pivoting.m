function [L U p q] = lu_complete_pivoting(A,tol,pm_opt)
    if nargin < 2 || isempty(tol)
        tol = 1e-10;
    end
    
    if nargin < 3 || isempty(pm_opt)
        pm_opt = 'vector';
    end

    if strcmp(pm_opt,'vector')
        pm_flag = false;
        sp_flag = false;
    elseif strcmp(pm_opt,'matrix')
        pm_flag = true;
        sp_flag = false;
    elseif strcmp(pm_opt,'sparse')
        pm_flag = true;
        sp_flag = true;
    else
        error('lucp:invalidOption','''%s'' is an un-recognized option.',pm_opt)
    end

    [n m] = size(A);

    % pivot vectors
    p = (1:n)';
    q = (1:m)';

    % temp storage
    rt = zeros(m,1); % row temp
    ct = zeros(n,1); % col temp
    t = 0; % scalar temp

    for k = 1:min(n-1,m)
        % determine pivot
        [cv ri] = max(abs(A(k:n,k:m)));
        [rv ci] = max(cv);
        rp = ri(ci)+k-1;
        cp = ci+k-1;

        % swap row
        t = p(k);
        p(k) = p(rp);
        p(rp) = t;
        rt = A(k,:);
        A(k,:) = A(rp,:);
        A(rp,:) = rt;

        % swap col
        t = q(k);
        q(k) = q(cp);
        q(cp) = t;
        ct = A(:,k);
        A(:,k) = A(:,cp);
        A(:,cp) = ct;

        if abs(A(k,k)) >= tol
            rows = (k+1):n;
            cols = (k+1):m;
            A(rows,k) = A(rows,k)/A(k,k);
            A(rows,cols) = A(rows,cols)-A(rows,k)*A(k,cols);
        else
            % stop factorization if pivot is too small
            break
        end
    end

    % final column swap if m > n
    if m > n
        % determine col pivot
        [cv ci] = max(abs(A(n,n:m)));
        cp = ci+n-1;

        % swap col
        t = q(n);
        q(n) = q(cp);
        q(cp) = t;
        ct = A(:,n);
        A(:,n) = A(:,cp);
        A(:,cp) = ct;
    end

    % produce L and U matrices
    % these are sparse if L and U are sparse
    l = min(n,m);
    L = tril(A(1:n,1:l),-1) + speye(n,l);
    U = triu(A(1:l,1:m));
    
    % produce sparse permutation matrices if desired
    if pm_flag
        p = sparse(1:n,p,1);
        q = sparse(q,1:m,1);
    end

    % produce full permutation matrices if desired
    if ~sp_flag
        p = full(p);
        q = full(q);
    end