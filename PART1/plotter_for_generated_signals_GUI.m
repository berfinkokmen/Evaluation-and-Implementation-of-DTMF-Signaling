function plotter_for_generated_signals_GUI(axes1,axes2,signal_handle,f,winLength,winShift,window_type,duration,sampling_frequency)

        
        sampling_frequency_div_2 = sampling_frequency/2;
        t = linspace(0,duration,2*sampling_frequency_div_2*duration);                
        
        y = signal_handle(t);
        
        spectogram_plotter_generated_signals_GUI(axes1,y, winLength, winShift,window_type,sampling_frequency_div_2);

        t = linspace(0,duration,2*sampling_frequency*duration);
        y = signal_handle(t);
        plot(axes2,t,y);
        xlabel(axes2,'Time','Fontsize',12);
        ylabel(axes2,'Magnitude','Fontsize',12);
        title(axes2,'Magnitude-Time Plot for 2T','Fontsize',14);
        xlim(axes2,[0 2/f]);
        
end