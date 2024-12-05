clc
clear        % SHE Biopler Half Bridge code to cancel third & fifth harmonic  
alpha1=20*pi/180;
alpha2=30*pi/180;
intial_angles=[alpha1 ; alpha2];
syms X1 X2 
fy1=[1-2*cos(3*X1)+2*cos(3*X2)];
fy2=[1-2*cos(5*X1)+2*cos(5*X2)];
fy_intial=[1-2*cos(3*alpha1)+2*cos(3*alpha2) ; 1-2*cos(5*alpha1)+2*cos(5*alpha2)];
j=[subs(diff(fy1,X1),X1,alpha1) subs(diff(fy1,X2),X2,alpha2) ; subs(diff(fy2,X1),X1,alpha1) subs(diff(fy2,X2),X2,alpha2) ];
j= double(j);
jinv=inv(j);
new_angles=(intial_angles-jinv*fy_intial)*180/pi;
t1=new_angles(1)*0.02/360;
t2=new_angles(2)*0.02/360;
t0=1e-9;