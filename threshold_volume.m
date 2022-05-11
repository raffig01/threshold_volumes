clear; clc;

%{
%}

% ---Make sure to change model_folder (and plot colour)--- %

%--
pat_num = 'P01';
%model_folder = 'ϵ parameters (φ0, G0)\model1 (φ0=7.465e+2)'; % model directory
model_folder = 'Reaction parameters (λ1, δ)\model Rp6 (λ1= 12e-1)';
%--

A=zeros(1,53);  % pre allocating size to improve speed
B=A;

for i=0:53
    
    % csv files saved from Paraview (1 for each time step)
    csv_name = 'V_'+string(i)+'.csv';
    file_directory = fullfile( 'c:', 'Users', 'raffi', 'Desktop', ...
        'Paraview Patients', pat_num, model_folder, 'Volume Data', csv_name);
    Array = readmatrix(file_directory);

        if size(Array)==[1 5]           % checks if volume column exists
            col2 = 0;                   % (if not then volume=0)         
        else
            col2 = Array(:, 5);
        end

    col1 = Array(:, 1);

    A(1,i+1)=col1;  % time variables
    B(1,i+1)=col2;  % volume variables

end

figure
plot(A,B, '-*', 'color', 'r', 'LineWidth',4)
grid on
%legend(model_folder)
legend('model Rp6 (λ1= 12e-1)')
