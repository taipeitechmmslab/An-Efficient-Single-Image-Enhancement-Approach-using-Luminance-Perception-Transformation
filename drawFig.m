

%%%%%%%%¥ßÊ^?%%%%%%%%
subplot(2,2,1)
N=100;
r=linspace(0,1,N);
phi=linspace(0,2*pi,N);
[R,Phi]=meshgrid(r,phi);
X1=R.*cos(Phi);
Y1=R.*sin(Phi);
Z1=1-sqrt(X1.*X1+Y1.*Y1);
Z2=zeros(size(Z1));
X=[X1;X1];
Y=[Y1;Y1];
Z=[Z1;Z2];
surfl(X,Y,Z)
colormap(hsv)
shading interp
title('HSV');

%%%%%%%%¥ßÊ^?%%%%%%%%

subplot(2,2,2)
x1=[-1,0,0;1,1,-1];
y1=[0,1,1;0,0,0];
x2=[0;0];
y2=[-0.1;1.1];
h=plot(x1,y1,'k-',x2,y2,'k-.');
axis([-1.1,1.1,-0.1,1.1])
set(h(1:3),'linewidth',3)
axis equal
title('2')

%%%%%%%%???%%%%%%%%

subplot(2,2,3)
x1=[-1,0,0;1,1,-1];
y1=[0,1,1;0,0,0];
x2=[0;0]; y2=[-0.1;1.1];
h=plot(x1,y1,'k-',x2,y2,'k-.');
axis([-1.1,1.1,-0.1,1.1])
set(h(1:3),'linewidth',3)
axis equal
title('3')

%%%%%%%%­Á??%%%%%%%%

subplot(2,2,4)
x1=cos(phi);
y1=sin(phi);
x2=[-1.1,0;1.1,0];
y2=[0,-1.1;0,1];
h=plot(x1,y1,'k-',x2,y2,'k-.');
colormap(hsv)
axis([-1.1,1.1,-1.1,1.1])
set(h(1),'linewidth',3)
axis equal
title('4')