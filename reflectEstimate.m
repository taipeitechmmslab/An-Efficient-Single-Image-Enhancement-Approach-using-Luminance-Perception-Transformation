function imR = refleEstimate(imOri,imI)

[hei,wid,dim] = size(imOri) ;
imR = zeros(hei,wid,dim) ;
for i = 1 : 1 : hei
    for j = 1 : 1 : wid
        for k = 1 : 1 : dim
            imR(i,j,k) = imOri(i,j,k) / imI(i,j) ;
        end
    end
end

end