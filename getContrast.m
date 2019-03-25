function [ contrast ] = getContrast( imOri )
    [hei, wid, dep] = size(imOri);
% contrast
    imV = 0.299 * imOri(:,:,1) + 0.587 * imOri(:,:,2) + 0.114 * imOri(:,:,3) ;
    contrast = 0 ;
    imMin = vanherk(imV,3,'min') ;
    imMin = vanherk(imMin,3,'min','col') ;
    imMax = vanherk(imV,3,'max') ;
    imMax = vanherk(imMax,3,'max','col') ;
    c = 0 ;
    for i = 1 : 1 : hei
        for j = 1 : 1 : wid
            A1 = imMax(i,j) + imMin(i,j) ;
            A2 = imMax(i,j) - imMin(i,j) ;
            if A1 ~= 0 && A2 ~= 0
                A3 = (log(A1/A2))^(-0.5) ;
                if A3 > 0 && A3 < 1
                    contrast = contrast + A3 ;
                    c = c + 1 ;
                end
            end
        end
    end
    contrast = contrast / c ;

end

