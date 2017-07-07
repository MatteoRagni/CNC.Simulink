%% CNC SIMULATOR

close all
clear all

% Un po' di appunti su quello che mi piacerebbe fare:
% mi piacerebbe costruire il modello di una fresa a cinque assi e renderlo
% disponibile open source:
%  - disegnare i drive
%  - cercare un modo per costruire la cinematica della macchina 
%  - costruire un modulo che parsi un file e generi sulla base di
%  determinato timestamp la reference da seguire in versione lineare
%  - costruire un visualizzatore trimdimensionale usando anche dei modelli
%  che mi costruisco con openscad

%% Linear Drive Test

% Model Coefficients
driver.x.current_amplifier_gain  = 6.4898; % [A/V]
driver.x.motor_gain              = 0.4769; % [Nm/A]
driver.x.total_reflected_inertia = 0.0077736; % [kg m²]
driver.x.viscous_damping         = 0.0191811; % [kg m²/s]
driver.x.lead_screw_ratio        = 1.5915 * 1e-3; % [m/rad]
driver.x.backlash_band           = 3 * 1e-6; % [m] and [m/s]
driver.x.input_saturation        = 5; % [V]

driver.r.gear_ratio              = 0.3; % [ ]

% Friction coefficients
driver.x.friction.Tst_P          = 2.6256; % [Nm]
driver.x.friction.Tst_N          = -1.8672; % [Nm]
driver.x.friction.Tcl_P          = 2.1529; % [Nm]
driver.x.friction.Tcl_N          = -1.4730; % [Nm]
driver.x.friction.omega1_P       = 3.88; % [rad/s]
driver.x.friction.omega1_N       = -3.51; % [rad/s]
driver.x.friction.omega2_P       = 4.20; % [rad/s]
driver.x.friction.omega2_N       = -3.52; % [rad/s]

% Controller parameters
driver.x.controller.lambda       = 200; % [rad/sec]
driver.x.controller.fback_gain   = 0.3; % [V/(mm/sec)]
driver.x.disturbance_gain        = 30; % [V/mm]


%% Run simulink model

Ts = 0.001; % [s] (Sampling Time)
alpha = 0.6; % [ ] (Discretization pole)

sim 'drive'