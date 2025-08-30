classdef SpectogramAppVersion4_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                      matlab.ui.Figure
        TabGroup                      matlab.ui.container.TabGroup
        MainPageTab                   matlab.ui.container.Tab
        SelectDataAcquisitionMethodLabel  matlab.ui.control.Label
        GenerateSignalButton          matlab.ui.control.Button
        UploadAudioFileButton         matlab.ui.control.Button
        RecordAudioButton             matlab.ui.control.Button
        RecordTab                     matlab.ui.container.Tab
        Lamp                          matlab.ui.control.Lamp
        WindowTypeDropDown_2          matlab.ui.control.DropDown
        WindowTypeDropDown_2Label     matlab.ui.control.Label
        WindowShiftEditField          matlab.ui.control.NumericEditField
        WindowShiftEditFieldLabel     matlab.ui.control.Label
        WindowLengthEditField         matlab.ui.control.NumericEditField
        WindowLengthEditFieldLabel    matlab.ui.control.Label
        PlotSpectogramButton          matlab.ui.control.Button
        PlayButton                    matlab.ui.control.Button
        RecordButton                  matlab.ui.control.Button
        RecordingTimeEditField        matlab.ui.control.NumericEditField
        RecordingTimeEditFieldLabel   matlab.ui.control.Label
        SamplingRateEditField         matlab.ui.control.NumericEditField
        SamplingRateEditFieldLabel    matlab.ui.control.Label
        UIAxes                        matlab.ui.control.UIAxes
        SelectFileTab                 matlab.ui.container.Tab
        WindowTypeDropDown_3          matlab.ui.control.DropDown
        WindowTypeDropDown_3Label     matlab.ui.control.Label
        WindowShiftEditField_2        matlab.ui.control.NumericEditField
        WindowShiftEditField_2Label   matlab.ui.control.Label
        WindowLengthEditField_2       matlab.ui.control.NumericEditField
        WindowLengthEditField_2Label  matlab.ui.control.Label
        PlotSpectogramButton_2        matlab.ui.control.Button
        PlayButton_2                  matlab.ui.control.Button
        UploadaFileButton             matlab.ui.control.Button
        UIAxes_2                      matlab.ui.control.UIAxes
        GenerateTab                   matlab.ui.container.Tab
        SamplingRateEditField_2       matlab.ui.control.NumericEditField
        SamplingRateEditField_2Label  matlab.ui.control.Label
        DurationEditField_2           matlab.ui.control.NumericEditField
        DurationLabel_2               matlab.ui.control.Label
        DurationEditField             matlab.ui.control.NumericEditField
        DurationLabel                 matlab.ui.control.Label
        ComponentsLabel               matlab.ui.control.Label
        WindowTypeLabel               matlab.ui.control.Label
        PhaseLabel_3                  matlab.ui.control.Label
        PhaseEditField_3              matlab.ui.control.NumericEditField
        LengthLabel                   matlab.ui.control.Label
        LengthEditField               matlab.ui.control.NumericEditField
        StartTimeLabel                matlab.ui.control.Label
        FrequencyLabel_3              matlab.ui.control.Label
        AmplitudeLabel_3              matlab.ui.control.Label
        StartTimeEditField            matlab.ui.control.NumericEditField
        FrequencyEditField_3          matlab.ui.control.NumericEditField
        AmplitudeEditField_3          matlab.ui.control.NumericEditField
        PhaseLabel_2                  matlab.ui.control.Label
        FrequencyLabel_2              matlab.ui.control.Label
        AmplitudeLabel_2              matlab.ui.control.Label
        PhaseEditField_2              matlab.ui.control.NumericEditField
        FrequencyEditField_2          matlab.ui.control.NumericEditField
        AmplitudeEditField_2          matlab.ui.control.NumericEditField
        WindowTypeDropDown_4          matlab.ui.control.DropDown
        WindowTypeDropDown_4Label     matlab.ui.control.Label
        WindowShiftEditField_3        matlab.ui.control.NumericEditField
        WindowShiftEditField_3Label   matlab.ui.control.Label
        WindowLengthEditField_3       matlab.ui.control.NumericEditField
        WindowLengthEditField_3Label  matlab.ui.control.Label
        SubmitButton_2                matlab.ui.control.Button
        PhaseLabel                    matlab.ui.control.Label
        FrequencyLabel                matlab.ui.control.Label
        AmplitudeLabel                matlab.ui.control.Label
        PlotSpectogramButton_3        matlab.ui.control.Button
        PhaseEditField                matlab.ui.control.NumericEditField
        SubmitButton                  matlab.ui.control.Button
        FrequencyEditField            matlab.ui.control.NumericEditField
        AmplitudeEditField            matlab.ui.control.NumericEditField
        ComponetsEditField            matlab.ui.control.EditField
        WindowTypeDropDown            matlab.ui.control.DropDown
        SignalwithmultiplecomponentsCheckBox  matlab.ui.control.CheckBox
        WindowedsinusoidalCheckBox    matlab.ui.control.CheckBox
        SinusoidalCheckBox            matlab.ui.control.CheckBox
        UIAxes2_2                     matlab.ui.control.UIAxes
        UIAxes2                       matlab.ui.control.UIAxes
        ContextMenu                   matlab.ui.container.ContextMenu
        Menu                          matlab.ui.container.Menu
        Menu_2                        matlab.ui.container.Menu
        Menu2_2                       matlab.ui.container.Menu
        Menu_3                        matlab.ui.container.Menu
        Menu2                         matlab.ui.container.Menu
    end

    
    properties (Access = private)
        CurrentFilePath 
        Switch 
%         Amplitude1
%         Frequency1
%         Phase1
%         Amplitude2
%         Frequency2
%         Phase2
%         StartTime1
%         Lenght1
        MyDropdown
    end

    properties (Access = public)
        N
        FrequencyMatrix
        AmplitudeMatrix
        PhaseMatrix
    end
    
 
    
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: RecordAudioButton
        function RecordAudioButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.RecordTab;
        end

        % Button pushed function: UploadAudioFileButton
        function UploadAudioFileButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.SelectFileTab;
        end

        % Button pushed function: GenerateSignalButton
        function GenerateSignalButtonPushed(app, event)
            
            % Hiding the components at the beginning. We will show them
            % only if the corresponding function type is chosen.
            
          
            
            app.TabGroup.SelectedTab = app.GenerateTab;
           
            % For summed sinusoidals:

            app.AmplitudeEditField.Visible = 'off';
            app.AmplitudeLabel.Visible = 'off';
            app.FrequencyLabel.Visible = 'off';
            app.FrequencyEditField.Visible = 'off';
            app.PhaseLabel.Visible = 'off';
            app.PhaseEditField.Visible = 'off';
            app.SubmitButton.Visible = 'off';
            app.ComponentsLabel.Visible = 'off';
            app.ComponetsEditField.Visible = 'off';
            app.SubmitButton_2.Visible = 'off';
            app.DurationEditField_2.Visible = 'off';
            app.DurationLabel_2.Visible = 'off';
            
            
            % For sinusoidals:

            app.AmplitudeEditField_2.Visible = 'off';
            app.AmplitudeLabel_2.Visible = 'off';
            app.FrequencyLabel_2.Visible = 'off';
            app.FrequencyEditField_2.Visible = 'off';
            app.PhaseLabel_2.Visible = 'off';
            app.PhaseEditField_2.Visible = 'off';
            app.DurationEditField.Visible = 'off';
            app.DurationLabel.Visible = 'off';
            
            % For windowed sinusoidals:

            app.AmplitudeEditField_3.Visible = 'off';
            app.AmplitudeLabel_3.Visible = 'off';
            app.FrequencyLabel_3.Visible = 'off';
            app.FrequencyEditField_3.Visible = 'off';
            app.PhaseLabel_3.Visible = 'off';
            app.PhaseEditField_3.Visible = 'off';
            app.StartTimeLabel.Visible = 'off';
            app.StartTimeEditField.Visible = 'off';
            app.LengthEditField.Visible = 'off';
            app.LengthLabel.Visible = 'off';   
            app.WindowTypeDropDown.Visible = 'off';
            app.WindowTypeLabel.Visible = 'off';
     
        end

        % Button pushed function: UploadaFileButton
        function UploadaFileButtonPushed(app, event)
            % Button pushed function: UploadFileButton
            % Open a file dialog for the user to select a file
            [fileName, filePath] = uigetfile({'*.wav'; '*.mp3'}, 'Select a file');
    
            % Check if the user clicked 'Cancel'
            if isequal(fileName, 0)
                disp('User canceled file selection.');
            else
                % Construct the full file path
                fullFilePath = fullfile(filePath, fileName);
                app.CurrentFilePath=fullFilePath;
                
            end
        end

        % Button pushed function: RecordButton
        function RecordButtonPushed(app, event)
            samplingRate=app.SamplingRateEditField.Value;
            recordingDuration=app.RecordingTimeEditField.Value;
            app.Lamp.Color = 'r';
            captureAudio(samplingRate,recordingDuration);
            app.Lamp.Color = 'g';
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            openAudio('LastSaved.wav');
        end

        % Button pushed function: PlayButton_2
        function PlayButton_2Pushed(app, event)
         
                openAudio(app.CurrentFilePath);
        
        end

        % Callback function
        function SinusoidalSwitch_2ValueChanged(app, event)
            %switchState = app.Switch.Value;
            %app.AmplitudeEditField.Enable = switchState;
        end

        % Callback function
        function SinusoidalCheckBoxValueChanged(app, event)
                 
            
            
        end

        % Callback function
        function WindowedsinusoidalCheckBoxValueChanged(app, event)
      
        end

        % Callback function
        function SignalwithmultiplecomponentsCheckBoxValueChanged(app, event)
            app.AmplitudeEditField_3.Enable = 'off';
            value = app.SignalwithmultiplecomponentsCheckBox.Value;
            app.AmplitudeEditField_3.Enable = value;
            
        end

        % Callback function
        function ButtonPushed(app, event)
            app.AmplitudeEditField_3.Enable = 'on';
        end

        % Callback function
        function AmplitudeEditField_3ValueChanged(app, event)
             app.AmplitudeEditField_3.Enable="off"

            
        end

        % Size changed function: GenerateTab
        function GenerateTabSizeChanged(app, event)
            position = app.GenerateTab.Position;
            
        end

        % Value changed function: WindowedsinusoidalCheckBox
        function WindowedsinusoidalCheckBoxValueChanged2(app, event)
           
            if(app.WindowedsinusoidalCheckBox.Value == 1)
            % Turning the visibility of these boxes on
                app.AmplitudeEditField_3.Visible = 'on';
                app.AmplitudeLabel_3.Visible = 'on';
                app.FrequencyLabel_3.Visible = 'on';
                app.FrequencyEditField_3.Visible = 'on';
                app.PhaseLabel_3.Visible = 'on';
                app.PhaseEditField_3.Visible = 'on';
                app.StartTimeLabel.Visible = 'on';
                app.StartTimeEditField.Visible = 'on';
                app.LengthEditField.Visible = 'on';
                app.LengthLabel.Visible = 'on';   
                app.WindowTypeDropDown.Visible = 'on';
                app.WindowTypeLabel.Visible = 'on';
            else
                app.AmplitudeEditField_3.Visible = 'off';
                app.AmplitudeLabel_3.Visible = 'off';
                app.FrequencyLabel_3.Visible = 'off';
                app.FrequencyEditField_3.Visible = 'off';
                app.PhaseLabel_3.Visible = 'off';
                app.PhaseEditField_3.Visible = 'off';
                app.StartTimeLabel.Visible = 'off';
                app.StartTimeEditField.Visible = 'off';
                app.LengthEditField.Visible = 'off';
                app.LengthLabel.Visible = 'off';   
                app.WindowTypeDropDown.Visible = 'off';
                app.WindowTypeLabel.Visible = 'off';

            end
        end

        % Value changed function: SinusoidalCheckBox
        function SinusoidalCheckBoxValueChanged2(app, event)
            
            if(app.SinusoidalCheckBox.Value == 1)
                app.AmplitudeEditField_2.Visible = 'on';
                app.AmplitudeLabel_2.Visible = 'on';
                app.FrequencyLabel_2.Visible = 'on';
                app.FrequencyEditField_2.Visible = 'on';
                app.PhaseLabel_2.Visible = 'on';
                app.PhaseEditField_2.Visible = 'on';
                app.DurationEditField.Visible = 'on'
                app.DurationLabel.Visible = 'on';
            else
                app.AmplitudeEditField_2.Visible = 'off';
                app.AmplitudeLabel_2.Visible = 'off';
                app.FrequencyLabel_2.Visible = 'off';
                app.FrequencyEditField_2.Visible = 'off';
                app.PhaseLabel_2.Visible = 'off';
                app.PhaseEditField_2.Visible = 'off';
                app.DurationEditField.Visible = 'off';
                app.DurationLabel.Visible = 'off';
            end

             
        end

        % Button pushed function: PlotSpectogramButton
        function PlotSpectogramButtonPushed(app, event)
            
        [audioData,samplingRate] = audioread("LastSaved.wav");
        decimated_audio = decimate(audioData, 10);
        
        selectedWindow = app.WindowTypeDropDown.Value;

        switch selectedWindow
                case 'Rectangular'
                    WindowType = 'rectwin'; 
                case 'Tukey'
                    WindowType = 'tukeywin'; 
                case 'Hamming'
                    WindowType = 'hamming'; 
                otherwise
                    WindowType = 'rectwin'; 
            end

        spectogram_plotter_sound_GUI(app.UIAxes,decimated_audio,app.WindowLengthEditField.Value,app.WindowShiftEditField.Value,WindowType,samplingRate/2) % Takes ~10 seconds for a 10 second signal

        end

        % Button pushed function: PlotSpectogramButton_2
        function PlotSpectogramButton_2Pushed(app, event)
        [audioData,samplingRate] = audioread(app.CurrentFilePath);
        decimated_audio = decimate(audioData, 10);
        
        selectedWindow = app.WindowTypeDropDown_3.Value;

        switch selectedWindow
                case 'Rectangular'
                    WindowType = 'rectwin'; 
                case 'Tukey'
                    WindowType = 'tukeywin'; 
                case 'Hamming'
                    WindowType = 'hamming'; 
                otherwise
                    WindowType = 'rectwin'; 
            end

        spectogram_plotter_sound_GUI(app.UIAxes_2,decimated_audio,app.WindowLengthEditField_2.Value,app.WindowShiftEditField_2.Value,WindowType,samplingRate/2) % Takes ~10 seconds for a 10 second signal

        end

        % Value changed function: SignalwithmultiplecomponentsCheckBox
        function SignalwithmultiplecomponentsCheckBoxValueChanged2(app, event)
                if app.SignalwithmultiplecomponentsCheckBox.Value==1
                    app.AmplitudeEditField.Visible = 'on';
                    app.AmplitudeLabel.Visible = 'on';
                    app.FrequencyLabel.Visible = 'on';
                    app.FrequencyEditField.Visible = 'on';
                    app.PhaseLabel.Visible = 'on';
                    app.PhaseEditField.Visible = 'on';
                    app.SubmitButton.Visible = 'on';
                    app.ComponentsLabel.Visible = 'on';
                    app.ComponetsEditField.Visible = 'on';
                    app.SubmitButton_2.Visible = 'on';
                    app.DurationEditField_2.Visible = 'on';
                    app.DurationLabel_2.Visible = 'on';
                else 
                    app.AmplitudeEditField.Visible = 'off';
                    app.AmplitudeLabel.Visible = 'off';
                    app.FrequencyLabel.Visible = 'off';
                    app.FrequencyEditField.Visible = 'off';
                    app.PhaseLabel.Visible = 'off';
                    app.PhaseEditField.Visible = 'off'; 
                    app.SubmitButton.Visible = 'off';
                    app.ComponentsLabel.Visible = 'off';
                    app.ComponetsEditField.Visible = 'off';
                    app.SubmitButton_2.Visible = 'off';
                    app.DurationEditField_2.Visible = 'off';
                    app.DurationLabel_2.Visible = 'off';
                end
        end

        % Button pushed function: SubmitButton
        function SubmitButtonPushed(app, event)
            index = size(app.FrequencyMatrix,1)-app.N+1;
            if(index<size(app.FrequencyMatrix,1)+1)
                index
                app.FrequencyMatrix(index) = app.FrequencyEditField.Value;
                app.AmplitudeMatrix(index) = app.AmplitudeEditField.Value;
                app.PhaseMatrix(index) = app.PhaseEditField.Value;
                app.N = app.N-1;
                app.FrequencyEditField.Value = 0;
                app.AmplitudeEditField.Value = 0;
                app.PhaseEditField.Value = 0;
                app.FrequencyMatrix
            end

        end

        % Button pushed function: SubmitButton_2
        function SubmitButton_2Pushed(app, event)
            app.N = str2num(app.ComponetsEditField.Value);
            app.AmplitudeMatrix = zeros(app.N,1);
            app.FrequencyMatrix = zeros(app.N,1);
            app.PhaseMatrix = zeros(app.N,1);
        end

        % Button pushed function: PlotSpectogramButton_3
        function PlotSpectogramButton_3Pushed(app, event)
            
        selectedWindow = app.WindowTypeDropDown_4.Value;
        
        switch selectedWindow
                case 'Rectangular'
                    WindowType = 'rectwin'; 
                case 'Tukey'
                    WindowType = 'tukeywin'; 
                case 'Hamming'
                    WindowType = 'hamming'; 
                otherwise
                    WindowType = 'rectwin'; 
        end

        if(app.SignalwithmultiplecomponentsCheckBox.Value == 1)
            frequency = app.FrequencyMatrix;
            function_handle = generate_summed_sinusoidals(size(app.FrequencyMatrix,1),app.AmplitudeMatrix,app.FrequencyMatrix,app.PhaseMatrix);
            duration = app.DurationEditField_2.Value;
        end
        if(app.SinusoidalCheckBox.Value == 1)
            amplitude = app.AmplitudeEditField_2.Value;
            phase = app.PhaseEditField_2.Value;
            frequency = app.FrequencyEditField_2.Value;
            function_handle = generate_sinusoidal(amplitude,frequency,phase);
            duration = app.DurationEditField.Value;
        end

        if(app.WindowedsinusoidalCheckBox.Value == 1)
            amplitude = app.AmplitudeEditField_3.Value;
            phase = app.PhaseEditField_3.Value;
            frequency = app.FrequencyEditField_3.Value;
            start_time = app.StartTimeEditField.Value;
            interval_length = app.LengthEditField.Value;
            duration = interval_length;
            
            selectedWindowGenerator = app.WindowTypeDropDown.Value;
            switch selectedWindowGenerator
                case 'Rectangular'
                    window_type__for_generator = 'rectwin'; 
                case 'Tukey'
                    WindowType = 'tukeywin'; 
                case 'Hamming'
                    window_type__for_generator = 'hamming'; 
                otherwise
                    window_type__for_generator = 'rectwin'; 
             end
          
            function_handle = generate_windowed_sinusoidal(amplitude,frequency,phase,window_type__for_generator,start_time,interval_length);
         end
        
        frequency = min(frequency); %we'll need this for plotting 2 periods of the signals
        
        plotter_for_generated_signals_GUI(app.UIAxes2,app.UIAxes2_2,function_handle,frequency,app.WindowLengthEditField_3.Value,app.WindowShiftEditField_3.Value,WindowType,duration,app.SamplingRateEditField_2.Value);                 

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 0 640 481];

            % Create MainPageTab
            app.MainPageTab = uitab(app.TabGroup);
            app.MainPageTab.Title = 'Main Page';

            % Create RecordAudioButton
            app.RecordAudioButton = uibutton(app.MainPageTab, 'push');
            app.RecordAudioButton.ButtonPushedFcn = createCallbackFcn(app, @RecordAudioButtonPushed, true);
            app.RecordAudioButton.FontName = 'Bahnschrift';
            app.RecordAudioButton.Position = [270 294 100 23];
            app.RecordAudioButton.Text = 'Record Audio';

            % Create UploadAudioFileButton
            app.UploadAudioFileButton = uibutton(app.MainPageTab, 'push');
            app.UploadAudioFileButton.ButtonPushedFcn = createCallbackFcn(app, @UploadAudioFileButtonPushed, true);
            app.UploadAudioFileButton.FontName = 'Bahnschrift';
            app.UploadAudioFileButton.Position = [266 244 109 23];
            app.UploadAudioFileButton.Text = 'Upload Audio File';

            % Create GenerateSignalButton
            app.GenerateSignalButton = uibutton(app.MainPageTab, 'push');
            app.GenerateSignalButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateSignalButtonPushed, true);
            app.GenerateSignalButton.FontName = 'Bahnschrift';
            app.GenerateSignalButton.Position = [270 196 101 23];
            app.GenerateSignalButton.Text = 'Generate Signal';

            % Create SelectDataAcquisitionMethodLabel
            app.SelectDataAcquisitionMethodLabel = uilabel(app.MainPageTab);
            app.SelectDataAcquisitionMethodLabel.HorizontalAlignment = 'center';
            app.SelectDataAcquisitionMethodLabel.FontName = 'Bahnschrift';
            app.SelectDataAcquisitionMethodLabel.FontWeight = 'bold';
            app.SelectDataAcquisitionMethodLabel.Position = [234 346 172 22];
            app.SelectDataAcquisitionMethodLabel.Text = 'Select Data Acquisition Method';

            % Create RecordTab
            app.RecordTab = uitab(app.TabGroup);
            app.RecordTab.Title = 'Record';

            % Create UIAxes
            app.UIAxes = uiaxes(app.RecordTab);
            title(app.UIAxes, 'Title')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [288 60 300 185];

            % Create SamplingRateEditFieldLabel
            app.SamplingRateEditFieldLabel = uilabel(app.RecordTab);
            app.SamplingRateEditFieldLabel.HorizontalAlignment = 'right';
            app.SamplingRateEditFieldLabel.FontName = 'Bahnschrift';
            app.SamplingRateEditFieldLabel.Position = [226 376 83 22];
            app.SamplingRateEditFieldLabel.Text = 'Sampling Rate';

            % Create SamplingRateEditField
            app.SamplingRateEditField = uieditfield(app.RecordTab, 'numeric');
            app.SamplingRateEditField.FontName = 'Bahnschrift';
            app.SamplingRateEditField.Position = [324 376 105 22];

            % Create RecordingTimeEditFieldLabel
            app.RecordingTimeEditFieldLabel = uilabel(app.RecordTab);
            app.RecordingTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.RecordingTimeEditFieldLabel.FontName = 'Bahnschrift';
            app.RecordingTimeEditFieldLabel.Position = [224 339 88 22];
            app.RecordingTimeEditFieldLabel.Text = 'Recording Time';

            % Create RecordingTimeEditField
            app.RecordingTimeEditField = uieditfield(app.RecordTab, 'numeric');
            app.RecordingTimeEditField.FontName = 'Bahnschrift';
            app.RecordingTimeEditField.Position = [327 339 100 22];

            % Create RecordButton
            app.RecordButton = uibutton(app.RecordTab, 'push');
            app.RecordButton.ButtonPushedFcn = createCallbackFcn(app, @RecordButtonPushed, true);
            app.RecordButton.FontName = 'Bahnschrift';
            app.RecordButton.Position = [217 287 100 23];
            app.RecordButton.Text = 'Record';

            % Create PlayButton
            app.PlayButton = uibutton(app.RecordTab, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.FontName = 'Bahnschrift';
            app.PlayButton.Position = [331 287 100 23];
            app.PlayButton.Text = 'Play';

            % Create PlotSpectogramButton
            app.PlotSpectogramButton = uibutton(app.RecordTab, 'push');
            app.PlotSpectogramButton.ButtonPushedFcn = createCallbackFcn(app, @PlotSpectogramButtonPushed, true);
            app.PlotSpectogramButton.Position = [28 61 104 22];
            app.PlotSpectogramButton.Text = 'Plot Spectogram';

            % Create WindowLengthEditFieldLabel
            app.WindowLengthEditFieldLabel = uilabel(app.RecordTab);
            app.WindowLengthEditFieldLabel.HorizontalAlignment = 'right';
            app.WindowLengthEditFieldLabel.Position = [4 188 88 22];
            app.WindowLengthEditFieldLabel.Text = 'Window Length';

            % Create WindowLengthEditField
            app.WindowLengthEditField = uieditfield(app.RecordTab, 'numeric');
            app.WindowLengthEditField.Position = [106 188 106 22];

            % Create WindowShiftEditFieldLabel
            app.WindowShiftEditFieldLabel = uilabel(app.RecordTab);
            app.WindowShiftEditFieldLabel.HorizontalAlignment = 'right';
            app.WindowShiftEditFieldLabel.Position = [5 145 76 22];
            app.WindowShiftEditFieldLabel.Text = 'Window Shift';

            % Create WindowShiftEditField
            app.WindowShiftEditField = uieditfield(app.RecordTab, 'numeric');
            app.WindowShiftEditField.Position = [106 159 106 22];

            % Create WindowTypeDropDown_2Label
            app.WindowTypeDropDown_2Label = uilabel(app.RecordTab);
            app.WindowTypeDropDown_2Label.HorizontalAlignment = 'right';
            app.WindowTypeDropDown_2Label.Position = [6 110 77 22];
            app.WindowTypeDropDown_2Label.Text = 'Window Type';

            % Create WindowTypeDropDown_2
            app.WindowTypeDropDown_2 = uidropdown(app.RecordTab);
            app.WindowTypeDropDown_2.Items = {'Rectangular', 'Tukey', 'Hamming'};
            app.WindowTypeDropDown_2.Position = [109 124 100 22];
            app.WindowTypeDropDown_2.Value = 'Rectangular';

            % Create Lamp
            app.Lamp = uilamp(app.RecordTab);
            app.Lamp.Position = [170 274 20 20];

            % Create SelectFileTab
            app.SelectFileTab = uitab(app.TabGroup);
            app.SelectFileTab.Title = 'Select File';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.SelectFileTab);
            title(app.UIAxes_2, 'Title')
            xlabel(app.UIAxes_2, 'X')
            ylabel(app.UIAxes_2, 'Y')
            zlabel(app.UIAxes_2, 'Z')
            app.UIAxes_2.Position = [288 60 300 185];

            % Create UploadaFileButton
            app.UploadaFileButton = uibutton(app.SelectFileTab, 'push');
            app.UploadaFileButton.ButtonPushedFcn = createCallbackFcn(app, @UploadaFileButtonPushed, true);
            app.UploadaFileButton.FontName = 'Bahnschrift';
            app.UploadaFileButton.Position = [270 365 100 23];
            app.UploadaFileButton.Text = 'Upload a File';

            % Create PlayButton_2
            app.PlayButton_2 = uibutton(app.SelectFileTab, 'push');
            app.PlayButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlayButton_2Pushed, true);
            app.PlayButton_2.FontName = 'Bahnschrift';
            app.PlayButton_2.Position = [270 323 100 23];
            app.PlayButton_2.Text = 'Play';

            % Create PlotSpectogramButton_2
            app.PlotSpectogramButton_2 = uibutton(app.SelectFileTab, 'push');
            app.PlotSpectogramButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlotSpectogramButton_2Pushed, true);
            app.PlotSpectogramButton_2.Position = [28 47 104 22];
            app.PlotSpectogramButton_2.Text = 'Plot Spectogram';

            % Create WindowLengthEditField_2Label
            app.WindowLengthEditField_2Label = uilabel(app.SelectFileTab);
            app.WindowLengthEditField_2Label.HorizontalAlignment = 'right';
            app.WindowLengthEditField_2Label.Position = [4 174 88 22];
            app.WindowLengthEditField_2Label.Text = 'Window Length';

            % Create WindowLengthEditField_2
            app.WindowLengthEditField_2 = uieditfield(app.SelectFileTab, 'numeric');
            app.WindowLengthEditField_2.Position = [106 174 106 22];

            % Create WindowShiftEditField_2Label
            app.WindowShiftEditField_2Label = uilabel(app.SelectFileTab);
            app.WindowShiftEditField_2Label.HorizontalAlignment = 'right';
            app.WindowShiftEditField_2Label.Position = [5 159 76 22];
            app.WindowShiftEditField_2Label.Text = 'Window Shift';

            % Create WindowShiftEditField_2
            app.WindowShiftEditField_2 = uieditfield(app.SelectFileTab, 'numeric');
            app.WindowShiftEditField_2.Position = [106 145 106 22];

            % Create WindowTypeDropDown_3Label
            app.WindowTypeDropDown_3Label = uilabel(app.SelectFileTab);
            app.WindowTypeDropDown_3Label.HorizontalAlignment = 'right';
            app.WindowTypeDropDown_3Label.Position = [6 110 77 22];
            app.WindowTypeDropDown_3Label.Text = 'Window Type';

            % Create WindowTypeDropDown_3
            app.WindowTypeDropDown_3 = uidropdown(app.SelectFileTab);
            app.WindowTypeDropDown_3.Items = {'Rectangular', 'Tukey', 'Hamming'};
            app.WindowTypeDropDown_3.Position = [109 110 100 22];
            app.WindowTypeDropDown_3.Value = 'Rectangular';

            % Create GenerateTab
            app.GenerateTab = uitab(app.TabGroup);
            app.GenerateTab.SizeChangedFcn = createCallbackFcn(app, @GenerateTabSizeChanged, true);
            app.GenerateTab.Title = 'Generate';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.GenerateTab);
            title(app.UIAxes2, 'Title')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Position = [230 44 187 113];

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.GenerateTab);
            title(app.UIAxes2_2, 'Title')
            xlabel(app.UIAxes2_2, 'X')
            ylabel(app.UIAxes2_2, 'Y')
            zlabel(app.UIAxes2_2, 'Z')
            app.UIAxes2_2.Position = [437 41 183 119];

            % Create SinusoidalCheckBox
            app.SinusoidalCheckBox = uicheckbox(app.GenerateTab);
            app.SinusoidalCheckBox.ValueChangedFcn = createCallbackFcn(app, @SinusoidalCheckBoxValueChanged2, true);
            app.SinusoidalCheckBox.Text = 'Sinusoidal';
            app.SinusoidalCheckBox.FontName = 'Bahnschrift';
            app.SinusoidalCheckBox.Position = [42 389 78 22];

            % Create WindowedsinusoidalCheckBox
            app.WindowedsinusoidalCheckBox = uicheckbox(app.GenerateTab);
            app.WindowedsinusoidalCheckBox.ValueChangedFcn = createCallbackFcn(app, @WindowedsinusoidalCheckBoxValueChanged2, true);
            app.WindowedsinusoidalCheckBox.Text = 'Windowed sinusoidal';
            app.WindowedsinusoidalCheckBox.FontName = 'Bahnschrift';
            app.WindowedsinusoidalCheckBox.Position = [240 375 135 22];

            % Create SignalwithmultiplecomponentsCheckBox
            app.SignalwithmultiplecomponentsCheckBox = uicheckbox(app.GenerateTab);
            app.SignalwithmultiplecomponentsCheckBox.ValueChangedFcn = createCallbackFcn(app, @SignalwithmultiplecomponentsCheckBoxValueChanged2, true);
            app.SignalwithmultiplecomponentsCheckBox.Text = 'Signal with multiple components';
            app.SignalwithmultiplecomponentsCheckBox.FontName = 'Bahnschrift';
            app.SignalwithmultiplecomponentsCheckBox.Position = [429 374 199 22];

            % Create WindowTypeDropDown
            app.WindowTypeDropDown = uidropdown(app.GenerateTab);
            app.WindowTypeDropDown.Items = {'Rectangular', 'Hamming', 'Tukey'};
            app.WindowTypeDropDown.Position = [305 261 101 22];
            app.WindowTypeDropDown.Value = 'Rectangular';

            % Create ComponetsEditField
            app.ComponetsEditField = uieditfield(app.GenerateTab, 'text');
            app.ComponetsEditField.Position = [531 347 31 22];

            % Create AmplitudeEditField
            app.AmplitudeEditField = uieditfield(app.GenerateTab, 'numeric');
            app.AmplitudeEditField.Position = [524 308 46 22];

            % Create FrequencyEditField
            app.FrequencyEditField = uieditfield(app.GenerateTab, 'numeric');
            app.FrequencyEditField.Position = [524 282 44 22];

            % Create SubmitButton
            app.SubmitButton = uibutton(app.GenerateTab, 'push');
            app.SubmitButton.ButtonPushedFcn = createCallbackFcn(app, @SubmitButtonPushed, true);
            app.SubmitButton.Position = [575 282 53 23];
            app.SubmitButton.Text = 'Submit';

            % Create PhaseEditField
            app.PhaseEditField = uieditfield(app.GenerateTab, 'numeric');
            app.PhaseEditField.Position = [524 249 44 22];

            % Create PlotSpectogramButton_3
            app.PlotSpectogramButton_3 = uibutton(app.GenerateTab, 'push');
            app.PlotSpectogramButton_3.ButtonPushedFcn = createCallbackFcn(app, @PlotSpectogramButton_3Pushed, true);
            app.PlotSpectogramButton_3.Position = [42 7 104 22];
            app.PlotSpectogramButton_3.Text = 'Plot Spectogram';

            % Create AmplitudeLabel
            app.AmplitudeLabel = uilabel(app.GenerateTab);
            app.AmplitudeLabel.Position = [450 307 59 22];
            app.AmplitudeLabel.Text = 'Amplitude';

            % Create FrequencyLabel
            app.FrequencyLabel = uilabel(app.GenerateTab);
            app.FrequencyLabel.Position = [452 282 62 22];
            app.FrequencyLabel.Text = 'Frequency';

            % Create PhaseLabel
            app.PhaseLabel = uilabel(app.GenerateTab);
            app.PhaseLabel.Position = [455 250 40 22];
            app.PhaseLabel.Text = 'Phase';

            % Create SubmitButton_2
            app.SubmitButton_2 = uibutton(app.GenerateTab, 'push');
            app.SubmitButton_2.ButtonPushedFcn = createCallbackFcn(app, @SubmitButton_2Pushed, true);
            app.SubmitButton_2.Position = [574 345 53 23];
            app.SubmitButton_2.Text = 'Submit';

            % Create WindowLengthEditField_3Label
            app.WindowLengthEditField_3Label = uilabel(app.GenerateTab);
            app.WindowLengthEditField_3Label.HorizontalAlignment = 'right';
            app.WindowLengthEditField_3Label.Position = [4 119 88 22];
            app.WindowLengthEditField_3Label.Text = 'Window Length';

            % Create WindowLengthEditField_3
            app.WindowLengthEditField_3 = uieditfield(app.GenerateTab, 'numeric');
            app.WindowLengthEditField_3.Position = [106 119 106 22];

            % Create WindowShiftEditField_3Label
            app.WindowShiftEditField_3Label = uilabel(app.GenerateTab);
            app.WindowShiftEditField_3Label.HorizontalAlignment = 'right';
            app.WindowShiftEditField_3Label.Position = [5 76 76 22];
            app.WindowShiftEditField_3Label.Text = 'Window Shift';

            % Create WindowShiftEditField_3
            app.WindowShiftEditField_3 = uieditfield(app.GenerateTab, 'numeric');
            app.WindowShiftEditField_3.Position = [106 76 106 22];

            % Create WindowTypeDropDown_4Label
            app.WindowTypeDropDown_4Label = uilabel(app.GenerateTab);
            app.WindowTypeDropDown_4Label.HorizontalAlignment = 'right';
            app.WindowTypeDropDown_4Label.Position = [6 41 77 22];
            app.WindowTypeDropDown_4Label.Text = 'Window Type';

            % Create WindowTypeDropDown_4
            app.WindowTypeDropDown_4 = uidropdown(app.GenerateTab);
            app.WindowTypeDropDown_4.Items = {'Rectangular', 'Tukey', 'Hamming'};
            app.WindowTypeDropDown_4.Position = [109 41 100 22];
            app.WindowTypeDropDown_4.Value = 'Rectangular';

            % Create AmplitudeEditField_2
            app.AmplitudeEditField_2 = uieditfield(app.GenerateTab, 'numeric');
            app.AmplitudeEditField_2.Position = [82 319 63 22];

            % Create FrequencyEditField_2
            app.FrequencyEditField_2 = uieditfield(app.GenerateTab, 'numeric');
            app.FrequencyEditField_2.Position = [83 289 62 22];

            % Create PhaseEditField_2
            app.PhaseEditField_2 = uieditfield(app.GenerateTab, 'numeric');
            app.PhaseEditField_2.Position = [83 259 62 22];

            % Create AmplitudeLabel_2
            app.AmplitudeLabel_2 = uilabel(app.GenerateTab);
            app.AmplitudeLabel_2.Position = [14 318 59 22];
            app.AmplitudeLabel_2.Text = 'Amplitude';

            % Create FrequencyLabel_2
            app.FrequencyLabel_2 = uilabel(app.GenerateTab);
            app.FrequencyLabel_2.Position = [14 289 62 22];
            app.FrequencyLabel_2.Text = 'Frequency';

            % Create PhaseLabel_2
            app.PhaseLabel_2 = uilabel(app.GenerateTab);
            app.PhaseLabel_2.Position = [14 260 40 22];
            app.PhaseLabel_2.Text = 'Phase';

            % Create AmplitudeEditField_3
            app.AmplitudeEditField_3 = uieditfield(app.GenerateTab, 'numeric');
            app.AmplitudeEditField_3.Position = [309 347 63 22];

            % Create FrequencyEditField_3
            app.FrequencyEditField_3 = uieditfield(app.GenerateTab, 'numeric');
            app.FrequencyEditField_3.Position = [310 317 62 22];

            % Create StartTimeEditField
            app.StartTimeEditField = uieditfield(app.GenerateTab, 'numeric');
            app.StartTimeEditField.Position = [311 231 62 22];

            % Create AmplitudeLabel_3
            app.AmplitudeLabel_3 = uilabel(app.GenerateTab);
            app.AmplitudeLabel_3.Position = [241 346 59 22];
            app.AmplitudeLabel_3.Text = 'Amplitude';

            % Create FrequencyLabel_3
            app.FrequencyLabel_3 = uilabel(app.GenerateTab);
            app.FrequencyLabel_3.Position = [241 331 62 22];
            app.FrequencyLabel_3.Text = 'Frequency';

            % Create StartTimeLabel
            app.StartTimeLabel = uilabel(app.GenerateTab);
            app.StartTimeLabel.Position = [242 232 60 22];
            app.StartTimeLabel.Text = 'Start Time';

            % Create LengthEditField
            app.LengthEditField = uieditfield(app.GenerateTab, 'numeric');
            app.LengthEditField.Position = [311 203 62 22];

            % Create LengthLabel
            app.LengthLabel = uilabel(app.GenerateTab);
            app.LengthLabel.Position = [242 204 42 22];
            app.LengthLabel.Text = 'Length';

            % Create PhaseEditField_3
            app.PhaseEditField_3 = uieditfield(app.GenerateTab, 'numeric');
            app.PhaseEditField_3.Position = [311 290 62 22];

            % Create PhaseLabel_3
            app.PhaseLabel_3 = uilabel(app.GenerateTab);
            app.PhaseLabel_3.Position = [242 290 40 22];
            app.PhaseLabel_3.Text = 'Phase';

            % Create WindowTypeLabel
            app.WindowTypeLabel = uilabel(app.GenerateTab);
            app.WindowTypeLabel.Position = [222 261 77 22];
            app.WindowTypeLabel.Text = 'Window Type';

            % Create ComponentsLabel
            app.ComponentsLabel = uilabel(app.GenerateTab);
            app.ComponentsLabel.Position = [446 346 80 22];
            app.ComponentsLabel.Text = '#Components';

            % Create DurationLabel
            app.DurationLabel = uilabel(app.GenerateTab);
            app.DurationLabel.Position = [14 229 51 22];
            app.DurationLabel.Text = 'Duration';

            % Create DurationEditField
            app.DurationEditField = uieditfield(app.GenerateTab, 'numeric');
            app.DurationEditField.Position = [83 228 62 22];

            % Create DurationLabel_2
            app.DurationLabel_2 = uilabel(app.GenerateTab);
            app.DurationLabel_2.Position = [454 217 51 22];
            app.DurationLabel_2.Text = 'Duration';

            % Create DurationEditField_2
            app.DurationEditField_2 = uieditfield(app.GenerateTab, 'numeric');
            app.DurationEditField_2.Position = [525 216 42 22];

            % Create SamplingRateEditField_2Label
            app.SamplingRateEditField_2Label = uilabel(app.GenerateTab);
            app.SamplingRateEditField_2Label.HorizontalAlignment = 'right';
            app.SamplingRateEditField_2Label.Position = [8 145 84 22];
            app.SamplingRateEditField_2Label.Text = 'Sampling Rate';

            % Create SamplingRateEditField_2
            app.SamplingRateEditField_2 = uieditfield(app.GenerateTab, 'numeric');
            app.SamplingRateEditField_2.Position = [106 145 106 22];

            % Create ContextMenu
            app.ContextMenu = uicontextmenu(app.UIFigure);

            % Create Menu
            app.Menu = uimenu(app.ContextMenu);
            app.Menu.Text = 'Menu';

            % Create Menu_2
            app.Menu_2 = uimenu(app.Menu);
            app.Menu_2.Text = 'Menu';

            % Create Menu2_2
            app.Menu2_2 = uimenu(app.Menu);
            app.Menu2_2.Text = 'Menu2';

            % Create Menu_3
            app.Menu_3 = uimenu(app.Menu2_2);
            app.Menu_3.Text = 'Menu';

            % Create Menu2
            app.Menu2 = uimenu(app.ContextMenu);
            app.Menu2.Text = 'Menu2';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = SpectogramAppVersion4_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end