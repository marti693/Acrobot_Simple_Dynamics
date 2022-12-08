function [A,B] = linearize(sys,x,u)

% parameters
m1 = sys.mass_1;
m2 = sys.mass_2;
l1 = sys.length_1;
l2 = sys.length_2;
g = sys.gravity;

a = m1*l1^2+m2*l1^2;
b = m2*l2^2;
c = m2*l1*l2;
d = g*m1*l1+g*m2*l1;
e = g*m2*l2;

dn = (a*b-c^2*cos(x(2))^2);
a1 = (b*d*cos(x(1))+e*(2*b+c*cos(x(2)))*cos(x(1)+x(2)));
a2 = .5*(2*a*b-c^2-c^2*cos(2*x(2)))*(2*b*e*cos(x(1)+x(2))+c*e*cos(x(1)+2*x(2))+c*(3*b*cos(x(2))+c*cos(2*x(2)))*d*x(1)*d*x(2)+b*c*cos(x(2))*d*x(2)^2)-2*c^2*cos(x(2))*sin(x(2))*(b*d*sin(x(1))+e*(2*b+c*cos(x(2)))*sin(x(1)+x(2))+c*sin(x(2))*d*x(2)*((3*b+c*cos(x(2))*d*x(1)+b*d*x(2))));
a3 = c*(3*b+c*cos(x(2)))*sin(x(2))*d*x(2);
a4 = c*sin(x(2))*((3*b+c*cos(x(2)))*d*x(1)+2*b*d*x(2));
a5 = -d*cos(x(1))*(b+c*cos(x(2)))+e*(a+2*b+3*c*cos(x(2)))*cos(x(1)+x(2));
a6 = -((a*b-c^2*cos(x(2))^2)*(e*(a+2*b+3*c*cos(x(2)))*cos(x(1)+x(2))-c*d*sin(x(1))*sin(x(2))-3*c*e*sin(x(2))*sin(x(1)+x(2))-c^2*sin(x(2))^2*d*x(2)*(4*d*x(1)+d*x(2))+c*cos(x(2))*d*x(2)*((a+3*b+4*c*cos(x(2)))*d*x(1)+(b+c*cos(x(2)))*d*x(2))))+2*c^2*cos(x(2))*sin(x(2))*(d*(b+c*cos(x(2)))*sin(x(1))+e*(a+2*b+3*c*cos(x(2)))*sin(x(1)+x(2))+c*sin(x(2))*d*x(2)*((a+3*b+4*c*cos(x(2)))*d*x(1)+(b+c*cos(x(2)))*d*x(2)));
a7 = c*(a+3*b+4*c*cos(x(2)))*sin(x(2))*d*x(2);
a8 = c*sin(x(2))*((a+3*b+4*c*cos(x(2)))*d*x(1)+2*(b+c*cos(x(2)))*x(2));


% linearized dynamics for 'down' position
    
    A = [0 0 1 0;
         0 0 0 1;
         a1/dn a2/dn^2 a3/dn a4/dn;
         a5/dn a6/dn^2 a7/(-dn) a8/(-dn)];

    B = [0; 0; (b+c*cos(x(2)))/(-a*b+c^2*cos(x(2))^2); (a+b+2*c*cos(x(2)))/(a*b-c^2*cos(x(2))^2)];

    %A = [0 0 1 0;
    %     0 0 0 1;
    %     g/l1 -g*m2/(l1*m1) 0 0;
    %     -g/l1 g*(l1*m1+l1*m2+l2*m2)/(l1*l2*m2) 0 0];
    %B = [0; 0; -(l1+l2)/(l1^2*l2*m1); (l1^2*m1+(l1+l2)^2*m2)/(l1^2*l2^2*m1*m2)];
    



end