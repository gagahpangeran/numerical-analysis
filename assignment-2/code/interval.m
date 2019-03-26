function out = interval(mulai)
    cont_sebelum = 0;
    last_j = 0;
    last_j = last_j
    
    for j = [mulai:0.01:100]
        now = fp2(-pi, j);
        cont = 0; 

        for i = [-pi:0.1:pi]
            coy = fp2(i, j);
            if(now < 0)
                if(coy > 0)
                    cont +=1;
                end;
                else
                if(coy < 0)
                    cont+=1;
                end; 
            end;
            now = coy;
        endfor;

        if(cont != cont_sebelum)
            j = j
            cont_sebelum
            last_j = j
            cont_sebelum = cont;
        endif;
    endfor;
endfunction