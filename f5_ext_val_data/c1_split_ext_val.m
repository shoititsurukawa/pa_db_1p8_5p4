%% c1_split_ext_val.m
%{
Description:
  This script split the PA data in extraction and validation.

Input:
  - pa_data.mat (f4_raw_data > gain_0p08 > f3_pa_demod)

Output:
 - pa_data_ext_val.mat
%}
clear variables; close all; clc;
tic

%% Parameters
split_point = 3000;

%% Import data
current_folder = fileparts(mfilename('fullpath'));
root_folder = fileparts(current_folder);
mat_file = fullfile(root_folder, 'f4_raw_data', 'gain_0p08', 'f3_pa_demod', 'pa_data.mat');
data = load(mat_file);

% Structure
signal_1_in = data.signal_1_in;
signal_2_in = data.signal_2_in;
signal_1_out = data.signal_1_out;
signal_2_out = data.signal_2_out;

%% Split data
% in_1
in_1_extraction = signal_1_in(1:split_point, :);
in_1_validation = signal_1_in(split_point+1:end, :);

% in_2
in_2_extraction = signal_2_in(1:split_point, :);
in_2_validation = signal_2_in(split_point+1:end, :);

% out_1
out_1_extraction = signal_1_out(1:split_point, :);
out_1_validation = signal_1_out(split_point+1:end, :);

% out_2
out_2_extraction = signal_2_out(1:split_point, :);
out_2_validation = signal_2_out(split_point+1:end, :);

%% Check for extrapolation
% in_1
max_in_1_extraction = max(abs(in_1_extraction));
max_in_1_validation = max(abs(in_1_validation));
fprintf('\nin_1: extraction = %.4g, validation = %.4g\n', max_in_1_extraction, max_in_1_validation);
if max_in_1_extraction >= max_in_1_validation
    disp(' No extrapolation detected in in_1');
else
    disp(' Extrapolation detected in in_1');
end

% in_2
max_in_2_extraction = max(abs(in_2_extraction));
max_in_2_validation = max(abs(in_2_validation));
fprintf('\nin_2: extraction = %.4g, validation = %.4g\n', max_in_2_extraction, max_in_2_validation);
if max_in_2_extraction >= max_in_2_validation
    disp(' No extrapolation detected in in_2');
else
    disp(' Extrapolation detected in in_2');
end

% out_1
max_out_1_extraction = max(abs(out_1_extraction));
max_out_1_validation = max(abs(out_1_validation));
fprintf('\nout_1: extraction = %.4g, validation = %.4g\n', max_out_1_extraction, max_out_1_validation);
if max_out_1_extraction >= max_out_1_validation
    disp(' No extrapolation detected in out_1');
else
    disp(' Extrapolation detected in out_1');
end

% out_2
max_out_2_extraction = max(abs(out_2_extraction));
max_out_2_validation = max(abs(out_2_validation));
fprintf('\nout_2: extraction = %.4g, validation = %.4g\n', max_out_2_extraction, max_out_2_validation);
if max_out_2_extraction >= max_out_2_validation
    disp(' No extrapolation detected in out_2');
else
    disp(' Extrapolation detected in out_2');
end

%% Save
save_file = fullfile(current_folder, 'pa_data_ext_val.mat');

save(save_file, ...
    'in_1_extraction', 'in_1_validation', ...
    'out_1_extraction', 'out_1_validation', ...
    'in_2_extraction', 'in_2_validation', ...
    'out_2_extraction', 'out_2_validation');

fprintf('Data successfully split and saved to:\n%s\n', save_file);

toc
