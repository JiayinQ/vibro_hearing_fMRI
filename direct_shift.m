function direct_shift(file_name)

% PURPOSE: This function reads the speech audio file read in a male voice
% and write an audio file with the center frequency shifted to 50 Hz

% INPUT: the audio file that needs to be shifted in frequency

% AUTHORS: Jiayin Qu, Henning U Voss

% Step 1: Read the audio file
[file_path, Fs] = audioread(file_name);

% Step 2: Frequency shifting
% Calculate the necessary shift to center the frequency at 50 Hz

desired_center_freq = 50; % 50 Hz
current_center_freq = mean([85, 180]); % Assuming the original center is at 132.5Hz (for male voice)
freq_shift = desired_center_freq - current_center_freq;

% Create a complex exponential to shift the frequency
t = (0:length(file_path)-1)/Fs;
complex_exponential = exp(1i*2*pi*freq_shift*t');

% Apply the frequency shift
shifted_signal = real(file_path .* complex_exponential);

% Step 3: Filtering
% Design a bandpass filter for 25-75 Hz
bpFilt = designfilt('bandpassiir', 'FilterOrder', 4, ...
                   'HalfPowerFrequency1', 25, 'HalfPowerFrequency2', 75, ...
                   'SampleRate', Fs);

% Apply the filter
filtered_signal = filter(bpFilt, shifted_signal);

% Step 4: Normalize 
normalized_signal = filtered_signal / max(abs(filtered_signal));

% Write the signal

[~, name, ext] = fileparts(file_name);
outputFileName = strcat(name, '_ds', ext);
outputDir = '/Users/taediumvitae/Desktop/FMRI project/frequency shifting/Direct_shift';
outputFilePath = fullfile(outputDir, outputFileName);
audiowrite(outputFilePath, normalized_signal, Fs);