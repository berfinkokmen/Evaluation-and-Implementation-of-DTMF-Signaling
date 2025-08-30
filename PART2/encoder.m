function dtmf_signal = encoder(digits, Fs, tone_duration, tone_pause)
    % Define DTMF Frequencies
    low_freqs = [697, 770, 852, 941];
    high_freqs = [1209, 1336, 1477, 1633];
    digit_map = ['1', '2', '3', 'A';
                 '4', '5', '6', 'B';
                 '7', '8', '9', 'C';
                 '*', '0', '#', 'D'];

    % Initialize signal
    dtmf_signal = [];

    for i = 1:length(digits)
        % Find the row and column of the digit
        [row, col] = find(digit_map == digits(i));

        % Generate tones
        t = 0:1/Fs:tone_duration-1/Fs;
        tone1 = sin(2 * pi * low_freqs(row) * t);
        tone2 = sin(2 * pi * high_freqs(col) * t);

        % Combine tones and add to signal
        dtmf_signal = [dtmf_signal, tone1 + tone2];

        % Add pause between tones
        if i < length(digits)
            pause = zeros(1, Fs * tone_pause);
            dtmf_signal = [dtmf_signal, pause];
        end
    end
%     pause = zeros(1, Fs * tone_pause);
%     dtmf_signal = [pause, dtmf_signal];
end