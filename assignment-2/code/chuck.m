function out = chuck(mulai, brp_kali)
    % fungsi chuck untuk membrute force p2 dan mencari berapa kali
    % fungsi itu berubah tanda (melalui nol)
    for j = [mulai:0.1:100]
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
                    cont+=1
                end;    
            end;
                now = coy;
        endfor;

        cont
        if(cont == brp_kali)
            j
            break;
        endif;
    endfor;
endfunction