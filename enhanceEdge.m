function [ ImOut ] = enhanceEdge( ImEn, Q1, Q2 )
%ENHANCEEDGE Summary of this function goes here
%   Detailed explanation goes here

    [height, width] = size(ImEn);
    ImY2 = double( ImEn ) ;
    ImInt = ImY2 ;
    ImRef = ImY2;
    for i = 1 : 1 : height
        for j = 1 : 1 : width
            if i > 1
                ImInt(i,j) = ImInt(i,j) + ImInt(i-1,j) ;
            end
            if j > 1
                ImInt(i,j) = ImInt(i,j) + ImInt(i,j-1) ;
            end
            if i > 1 && j > 1
                ImInt(i,j) = ImInt(i,j) - ImInt(i-1,j-1) ;
            end
        end
    end
    down = Q1 ; % offset to 'lower' indices
    up = down+1 ; % offset to 'upper' indices
    for i = 1+up : 1 : height-down
        for j = 1+up : 1 : width-down
            SUM1 = ImInt(i+down,j+down) ;
            SUM1 = SUM1 - ImInt(i-up,j+down) ;
            SUM1 = SUM1 - ImInt(i+down,j-up) ;
            SUM1 = SUM1 + ImInt(i-up,j-up) ;

            AVG = SUM1/(2*Q1+1)/(2*Q1+1) ;

            ImRef(i,j) = ImY2(i,j) + (1+Q2)*(ImY2(i,j)-AVG) ;
        end
    end
%     ImOut= ycbcr2rgb(ImYCbCr) ;
    ImOut = zeros(height-1, width-1);
    ImOut = ImRef(2:height,2:width);
    ImOut = imresize(ImOut, [height width],'nearest');
%     s = sprintf('%d_enh',filecount) ;
%     imwrite(uint8( ImOut ), '~~.jpg') ;
    

end

