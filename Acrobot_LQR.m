clc; clear; close all;

% acrobot system
sys = acrobot();

% time vector
t = 0:0.1:20;

% equilibrium for 'up' position
xtilde = [0 0 0 0]';
utilde = 0;

% initial condition (slightly left of vertical)
x0 = [0 .001 0 0]';

% linearization
[A,B] = sys.linearize(xtilde,utilde);

% cost matrices
Q = [1 0 0 0;   % position of bar1
    0 1 0 0;    % position of bar2
    0 0 100 0;   % velocity of bar1
    0 0 0 100]; % velocity of bar2
R = 0.0005;     % force on the cart

% static state feedback using LQR
K = -lqr(A,B,Q,R);

% simulate the system
%x = sys.static_state_feedback(t,x0,K,xtilde,utilde);
x = sys.simulate(t,x0);
% visualize the dynamics
sys.draw(x,.1,'Simulation');