pa_db_1p8_5p4 refers to a power amplifier (PA) operating in dual-band mode, with carrier frequencies of 1.8 GHz and 5.4 GHz.

## Authors ##
Luiz Augusto Shoiti Tsurukawa
Luis Schuartz
Eduardo Goncalves de Lima

## Structure ##
├───f0_functions
├───f1_source_data
├───f2_pa_mod
├───f3_pa_demod
└───f4_data

Folders f0 to f3 contain the MATLAB scripts and functions used to process the data. The overall flow of these scripts is explained in a diagram (d1_data_collection.drawio). The results shown correspond to the case where gain = 0.02, but the same logic applies for any gain value.

# Simulation Statistics #
Gain - Execution Time - Storage Used
gain 0.02 - 3h 23m 48s - 17 GB
gain 0.04 - 2h 31m 01s - 18 GB
gain 0.06 - 3h 43m 38s - 18 GB
gain 0.08 - 3h 58m 58s - 19 GB
gain 0.10 - 4h 07m 27s - 19 GB

Folder f4 contains the simulation data. Each dataset is stored in:
\f4_data\gain_0pxx\f3_pa_demod\pa_data.mat

# Signal Description #
signal_1 corresponds to the carrier frequency of 1.8 GHz and represents the LTE signal.
signal_2 corresponds to the carrier frequency of 5.4 GHz and represents the WLAN 11n signal.

Both signals are already in baseband, sampled at 123 MHz.

All intermediate results have been saved, except the direct outputs from Cadence ("input_pa.csv" and "output_pa") because they are too large to commit to Git. However, the same data is available in a smaller file, "pa_resampled.mat".

All simulation was executed using the same PA [1].

## Software and Environment ##
MATLAB Version: 9.6.0.1072779 (R2019a)
Cadence Virtuoso Version: IC23.1-64b

## References ##
[1] Schuartz, L., Silva, R.G., Hara, A.T. et al. "Concurrent Tri-band CMOS Power Amplifier Linearized by 3D Improved Memory Polynomial Digital Predistorter." Circuits, Systems, and Signal Processing 40, 2176–2208 (2021). https://doi.org/10.1007/s00034-020-01581-w
