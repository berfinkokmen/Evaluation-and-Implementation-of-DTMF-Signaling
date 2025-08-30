function captureAudio(samplingRate, recordingDuration)

    outputFileName = 'LastSaved.wav';  

    % Check if the input sampling rate is valid
    if samplingRate <= 0
        error('Sampling rate must be greater than 0.');
    end
    
    % Check if the recording duration is valid
    if recordingDuration <= 0
        error('Recording duration must be greater than 0.');
    end

    % Create an audio recorder object
    recorder = audiorecorder(samplingRate, 16, 1);

    % Record audio for the specified duration
    disp('Start recording...');
    recordblocking(recorder, recordingDuration);
    disp('Recording complete.');

    % Get the recorded audio data
    audioData = getaudiodata(recorder);
    
    audiowrite(outputFileName, audioData, samplingRate);
end

