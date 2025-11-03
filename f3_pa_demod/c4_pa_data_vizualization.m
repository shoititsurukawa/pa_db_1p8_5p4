%% c4_pa_data_vizualization.m
%{
Description:
  This script explores the PA data in pa_data.mat and plots the AM-AM and
  AM-PM characteristics.

Input:
  - pa_data.mat
%}
clc; clear; close all;
tic

%% Functions folder
current_folder = fileparts(mfilename('fullpath'));
root_folder = fileparts(current_folder);
functions_folder = fullfile(root_folder, 'f0_functions');
addpath(functions_folder);

%% Import data
pa_data_file = fullfile(current_folder, 'pa_data.mat');
load(pa_data_file);

%% Plot
plot_amam(signal_1_in, signal_1_out);
plot_ampm(signal_1_in, signal_1_out);

plot_amam(signal_2_in, signal_2_out);
plot_ampm(signal_2_in, signal_2_out);

toc
