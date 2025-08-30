function [selectedChannel,samplingRate]=openAudio(file) % wav or mp3 file chosen by the user.

    [audioData,samplingRate] = audioread(file);

    % Check the number of channels
    numChannels = size(audioData, 2);
    
    if numChannels > 1
        % If there are multiple channels, choose one channel (e.g., the first channel)
        selectedChannel = audioData(:, 1);
        disp('Selected only the first channel.');
    else
        % If there is only one channel, use the original data
        selectedChannel = audioData;
        disp('The file has only one channel.');
    end

    disp('Playing audio...');
    player = audioplayer(audioData, samplingRate);
    playblocking(player);
    disp('Playback complete.');

end