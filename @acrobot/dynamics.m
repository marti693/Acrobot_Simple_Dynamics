function dx = dynamics(sys,x,u)

if nargin < 2
    x = zeros(sys.num_states,1);
end
if nargin < 3
    u = zeros(sys.num_inputs,1);
end

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

% system dynamics: dx = f(x,u)
dx(1,1) = x(3);
dx(2,1) = x(4);
dx(3,1) = (b*d*sin(x(1))+e*(2*b+c*cos(x(2)))*sin(x(1)+x(2))+c*sin(x(2))*d*x(2)*((3*b+c*cos(x(2)))*d*x(1)+b*d*x(2)))/(a*b-c^2*cos(x(2))^2) + (b+c*cos(x(2)))/(-a*b+c^2*cos(x(2))^2)*u;
dx(4,1) = -(d*(b+c*cos(x(2)))*sin(x(1))+e*(a+2*b+3*c*cos(x(2)))*sin(x(1)+x(2))+c*sin(x(2))*d*x(2)*((a+3*b+4*c*cos(x(2)))*d*x(1)+(b+c*cos(x(2)))*d*x(2)))/(a*b-c^2*cos(x(2))^2) + (a+b+2*c*cos(x(2)))/(a*b-c^2*cos(x(2))^2)*u;

end