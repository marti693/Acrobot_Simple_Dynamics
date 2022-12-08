classdef acrobot
    % The acrobot is a 4-dimensional nonlinear system with state
    % [ theta1; theta2; dtheta1; dtheta2 ]
    
    properties
        num_states      % number of states
        num_inputs      % number of inputs
        mass_1   % mass of the pendulum
        mass_2       % mass of the cart
        length_1     % length of the pole
        gravity         % acceleration due to gravity
        length_2    % damping of the cart
    end
    
    methods
        
        % constructor
        function obj = acrobot()
            
            obj.num_states = 4;
            obj.num_inputs = 1;
            
            % default parameters
            obj.mass_1   = .1;
            obj.mass_2       = .1;
            obj.length_1     = 1;
            obj.gravity         = -10;
            obj.length_2    = 1;
        end
    end
end