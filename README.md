# vibro_hearing_fMRI

In this fMRI experiment, we aim to transform the speech into vibrotactile stimulus and see if itself and the speech aided by this stimulus can provide people with a strengthened ability to recognize speech, especially for people with hearing function loss. This repository stores codes for generating the vibrotactile stimulus, and codes for generating speech.

The Nouns_to_speech folder contains all the audio files of nouns by category, the list of nouns, and the function that transforms the nouns to speech. Note that the transformation requires the voice synthesizer built within the Window's system. The code currently doesn't work on MacOS system. 

The speech and vibration folder contains the .mp3 files that stores the signals of vibration and speech. The ds.mp3 and pm.mp3 are the combined files: speech signal is put in the LEFT channel, and vibration is put on the RIGHT channel. 
