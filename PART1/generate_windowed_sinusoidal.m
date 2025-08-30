function signal = generate_windowed_sinusoidal(amplitude, frequency, phase, window_type, start_time, interval_length)
    
    sinusoidal_part = @(t) amplitude * cos(2 * pi * frequency * t + phase*pi/180);
    
    a = start_time;
    b = interval_length + start_time;
    alpha = 5;


    if window_type == 'rectwin'
        window_function = @(t) (t >= a & t <= b);

    elseif window_type == 'hamming'
        window_function = @(t) (0.54 - 0.46 * cos(2 * pi * (t - a) / (b - a))) .* ((t >= a) & (t <= b));

    elseif window_type == 'tukeywin'
        window_function = @(t) ((t >= a) & (t <= b)) .* ...
        (0.5 * (1 + cos(pi * ((t - a) / (alpha * (b - a)) - 1))) .* (t >= a) & (t < a + alpha * (b - a)) + ...
        (t >= a + alpha * (b - a)) & (t <= b));
    end
            
         
   signal= @(t) sinusoidal_part(t) .* window_function(t); %This is for limiting the interval,  it'll be detremined by start_time and interval length

end