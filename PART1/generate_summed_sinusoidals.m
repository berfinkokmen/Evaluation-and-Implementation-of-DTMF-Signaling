function signal = generate_summed_sinusoidals(M, Am, f, p_vector)
    
    % Initialize the signal
    y = @(t) Am(1) * cos(2 * pi * f(1) * t + p_vector(1)*pi/180) ;

    % Generate the signal using a for loop
    for i = 2:M
        x = @(t) Am(i) * cos(2 * pi * f(i) * t + p_vector(i));
        y = @(t) y(t) + x(t);
    end;

    signal = y;
    
end