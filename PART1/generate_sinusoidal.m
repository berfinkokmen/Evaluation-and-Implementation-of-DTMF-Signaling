function signal = generate_sinusoidal(amplitude, frequency, phase)
    
    signal = @(t) amplitude * cos(2 * pi * frequency * t + phase*pi/180);
    
end