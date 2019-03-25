clear, clc ; close all;

imgRoot = '../TestingImage1/' ;
addpath(imgRoot);
addpath('./Results/');

% NAME = 'lg-image7' ;
% TYPE = '.jpg' ;
% strin = sprintf('%s%s',NAME,TYPE) ;

w=15;
ps = w*2+1 ;
t0 = 0.1 ;

imnames=dir([imgRoot '*' 'jpg']);
for ii=1:length(imnames)   

    imOri = double( imread(imnames(ii).name) ) ;
    
tic ;
imIll = illumEstimate(imOri,ps,t0) ;
imRef = reflectEstimate(imOri,imIll) ;

[ contrast ] = getContrast( imRef );
Q1 = 1 ; % Window radius of neighbors
Q2 = contrast ; % Enhancement ratio
imEnh = zeros(size(imRef,1),size(imRef,2),size(imRef,3));
imEnh(:,:,1) = enhanceEdge( imRef(:,:,1), Q1, Q2 );
imEnh(:,:,2) = enhanceEdge( imRef(:,:,2), Q1, Q2 );
imEnh(:,:,3) = enhanceEdge( imRef(:,:,3), Q1, Q2 );
fprintf('%f\n',Q2);
toc ;

%{
figure(1), imshow(uint8(imOri)) ;
figure(2), imshow(imIll) ;
figure(3), imshow(uint8(imRef)) ;
%}
strin = sprintf('./Results/%s_FIT%s',imnames(ii).name(1:end-4),imnames(ii).name(end-3:end)) ;
imwrite(uint8(imEnh),strin) ;
end

% figure, imshow(uint8(imRef));
% figure, imshow(uint8(imEnh));
