clear;clc;close all;
%% Parameters in the mechanical part
L = 0.305;     % (m) the length to the rod's center of mass
m = 0.210;     % (kg) the mass of the rod
r = 0.145;     % (m) the rotating arm length
J_eq = 0.0044; % (kg*m^2) arm inertia
g = 9.81;      % m/s^2, acceleration of gravity
%% Parameters in the electrical part
R_m = 2.6;     % (Ohm) the armature resistance
K_m = 0.00767; % (V/(rad/s)) the back EMF constant
K_t = 0.00767; % (Nm/A) the motor torque constant
eta_m = 0.69;  % motor efficiency
K_g = 70;      % (70:1) the gearbox ratio, the output is slower
eta_g = 0.9;   % the gearbox efficiency
B_eq = 0.004;  % (Nm/(rad/s)) equivalent viscous damping coefficient

%% tuning LQR parameters

trial_LUT(1).index = 1;
trial_LUT(1).name = 'default';
trial_LUT(1).description = 'default scenario in the assignment.';
trial_LUT(1).Q = [4 0  0 0;
                  0 20 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(1).R = 1.5;

trial_LUT(2).index = 2;
trial_LUT(2).name = 'trial_1';
trial_LUT(2).description = 'reduce R to 1 w.r.t default scenario. Increase motor voltage.';
trial_LUT(2).Q = [4 0  0 0;
                  0 20 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(2).R = 1;

trial_display_str = '========= trial name choices start ============\n';
trial_display_str = strcat(trial_display_str, 'index\tname\tdescription\n');
for i=1:length(trial_LUT)
  trial_display_str = strcat(trial_display_str, num2str(trial_LUT(i).index), '\t', trial_LUT(i).name, '\t', trial_LUT(i).description, '\n');
end
trial_display_str = strcat(trial_display_str, '============ trial name choices end ===========\n\n');

fprintf("parameters registered.\n")