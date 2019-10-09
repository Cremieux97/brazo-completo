close all
clear all
clc

 promt = 'introduzca el valor (grados):';
 ang_Deg = input(promt);
 ang_Rad = deg2rad(ang_Deg);
 promt = 'introduzca el valor (grados):';
 ang_Deg2 = input(promt);
 ang_Rad2 = deg2rad(ang_Deg2);
 promt = 'introduzca el valor (grados):';
 ang_Deg3 = input(promt);
 ang_Rad3 = deg2rad(ang_Deg3);
 promt = 'introduzca el valor (grados):';
 ang_Deg4 = input(promt);
 ang_Rad4 = deg2rad(ang_Deg4);
 promt = 'introduzca el valor de L1:';
 L1= input(promt);
 promt = 'introduzca el valor de L2:';
 L2= input(promt);
 promt = 'introduzca el valor de L3:';
 L3= input(promt);
 promt = 'introduzca el valor de L4:';
 L4= input(promt);

 p1=[0 0 0]';
 if ang_Deg>=0
     angVec = 0:0.01:ang_Rad;
 else
      angVec = 0:-0.01:ang_Rad;
 end
 for i=1:length(angVec)
   clf
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
     cos(angVec(i))

TRz1 = [cos(angVec(i)) -sin(angVec(i)) 0 0;sin(angVec(i)) cos(angVec(i)) 0 0;0 0 1 0;0 0 0 1];
TTz = [1 0 0 0;0 1 0 0; 0 0 1 L1; 0 0 0 1];
T1=TRz1*TTz;
p2=T1(1:3,4);
%---------------------------------
v1x=T1(1:3,1);
v1y=T1(1:3,2);
v1z=T1(1:3,3);
view(150,15)
%-----------------------------
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.5 00.7 0],'linewidth',5)%primer eslabon del brazo
line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

%-----------------------
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy1 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz1 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRy1*TTz1;
Ta=T1*T2;
p3=Ta(1:3,4);
%-------------------------------
v2x=p2+Ta(1:3,1);
v2y=p2+Ta(1:3,2);
v2z=p2+Ta(1:3,3);
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.6 0 0.8],'linewidth',5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
%----------------------------------
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy2 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz2 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);

%-------------------
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0 0.3 0],'linewidth',5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

%------------------------------
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);

v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);

%----------------------------------------------
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0 0.7 0],'linewidth',5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)

pause(0.1);



 end
 
  if ang_Deg2>=0
 angVec2=0:0.01:ang_Rad2;
 else
     angVec2=0:-0.01:ang_Rad2;
  end
 for i=1:length(angVec2)
   clf
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
 p2=T1(1:3,4);
%----------------------------------------
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.9 0.9 0.08],'linewidth',5)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy1 = [cos(angVec2(i)) 0 -sin(angVec2(i)) 0;0 1 0 0;sin(angVec2(i)) 0 cos(angVec2(i)) 0;0 0 0 1];
TTz1 = [1 0 0 L2;0 1 0 0; 0 0 1 0; 0 0 0 1];
T2=TRy1*TTz1;
Ta=T1*T2;
p3=Ta(1:3,4);
v2x=p2+Ta(1:3,1);
v2y=p2+Ta(1:3,2);
v2z=p2+Ta(1:3,3);
%------------------------------------
view(150,15)
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy2 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz2 = [1 0 0 L3;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);
%-----------------------------------
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 L4;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);
%-----------------------------------------------
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)
pause(0.1);
 end

 if ang_Deg3>=0
 angVec3=0:0.01:ang_Rad3;
 else
     angVec3=0:-0.01:ang_Rad3;
  end
  
   for i=1:length(angVec3)
   clf
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.9 0.9 0.08],'linewidth',5)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

 p3=Ta(1:3,4);
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.9 0.9 0.08],'linewidth',5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
 line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)

line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy2 = [cos(angVec3(i)) 0 -sin(angVec3(i)) 0;0 1 0 0;sin(angVec3(i)) 0 cos(angVec3(i)) 0;0 0 0 1];
TTz2 = [1 0 0 L3;0 1 0 0; 0 0 1 0; 0 0 0 1];
T3=TRy2*TTz2;
Tb=Ta*T3;
p4=Tb(1:3,4);
v3x=p3+Tb(1:3,1);
v3y=p3+Tb(1:3,2);
v3z=p3+Tb(1:3,3);
%imprime linea 2
view(150,15)
line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)

line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy3 = [cos(0) 0 -sin(0) 0;0 1 0 0;sin(0) 0 cos(0) 0;0 0 0 1];
TTz3 = [1 0 0 L4;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);
%---------------------------------
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)
line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)
pause(0.1);
   end
   
   if ang_Deg4>=0
 angVec4=0:0.01:ang_Rad4;
 else
     angVec4=0:-0.01:ang_Rad4;
  end
  
   for i=1:length(angVec4)
   clf
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
 
 p2=T1(1:3,4);
 line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[0.9 0.9 0.08],'linewidth',5)
 line([p1(1) v1x(1)],[p1(2) v1x(2)],[p1(3) v1x(3)],'color',[1 0 0],'linewidth',5)
 line([p1(1) v1y(1)],[p1(2) v1y(2)],[p1(3) v1y(3)],'color',[0 1 0],'linewidth',5)
 line([p1(1) v1z(1)],[p1(2) v1z(2)],[p1(3) v1z(3)],'color',[0 0 1],'linewidth',5)

 p3=Ta(1:3,4);
 line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0.9 0.9 0.08],'linewidth',5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[1 0 0],'linewidth',5)
 line([p2(1) v2x(1)],[p2(2) v2x(2)],[p2(3) v2x(3)],'color',[0 1 0],'linewidth',5)
 line([p2(1) v2z(1)],[p2(2) v2z(2)],[p2(3) v2z(3)],'color',[0 0 1],'linewidth',5)
 
 p4=Tb(1:3,4);
 line([p3(1) p4(1)],[p3(2) p4(2)],[p3(3) p4(3)],'color',[0.9 0.9 0.08],'linewidth',5)
 line([p3(1) v3x(1)],[p3(2) v3x(2)],[p3(3) v3x(3)],'color',[1 0 0],'linewidth',5)
 line([p3(1) v3y(1)],[p3(2) v3y(2)],[p3(3) v3y(3)],'color',[0 1 0],'linewidth',5)
 line([p3(1) v3z(1)],[p3(2) v3z(2)],[p3(3) v3z(3)],'color',[0 0 1],'linewidth',5)
line([-3 3],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-3 3],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-3 3],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul
TRy3 = [cos(angVec4(i)) 0 -sin(angVec4(i)) 0;0 1 0 0;sin(angVec4(i)) 0 cos(angVec4(i)) 0;0 0 0 1];
TTz3 = [1 0 0 L4;0 1 0 0; 0 0 1 0; 0 0 0 1];
T4=TRy3*TTz3;
Tc=Tb*T4;
p5=Tc(1:3,4);
v4x=p4+Tc(1:3,1);
v4y=p4+Tc(1:3,2);
v4z=p4+Tc(1:3,3);

v5x=p5+Tc(1:3,1);
v5y=p5+Tc(1:3,2);
v5z=p5+Tc(1:3,3);
%----------------------------------
view(150,15)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p4(1) p5(1)],[p4(2) p5(2)],[p4(3) p5(3)],'color',[0.9 0.9 0.08],'linewidth',5)
line([p4(1) v4x(1)],[p4(2) v4x(2)],[p4(3) v4x(3)],'color',[1 0 0],'linewidth',5)
line([p4(1) v4y(1)],[p4(2) v4y(2)],[p4(3) v4y(3)],'color',[0 1 0],'linewidth',5)
line([p4(1) v4z(1)],[p4(2) v4z(2)],[p4(3) v4z(3)],'color',[0 0 1],'linewidth',5)

line([p5(1) v5x(1)],[p5(2) v5x(2)],[p5(3) v5x(3)],'color',[1 0 0],'linewidth',5)
line([p5(1) v5y(1)],[p5(2) v5y(2)],[p5(3) v5y(3)],'color',[0 1 0],'linewidth',5)
line([p5(1) v5z(1)],[p5(2) v5z(2)],[p5(3) v5z(3)],'color',[0 0 1],'linewidth',5)
pause(0.1);
   end