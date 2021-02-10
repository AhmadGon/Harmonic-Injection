%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This MATLAB code reads voltages and currents from the load   %%
%% circuit extracted using ADCs and read and saved bu DE2-115   %%
%% FPGA, this script also computes the FFT for all read values  %%
%% Author: Ahmad Al-Astal                                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FilePhaseA_Voltage = fopen('PhaseA_Voltage.txt','r');
FilePhaseB_Voltage = fopen('PhaseB_Voltage.txt','r');
FilePhaseC_Voltage = fopen('PhaseC_Voltage.txt','r');

FilePhaseA_Current = fopen('PhaseA_Current.txt','r');
FilePhaseB_Current = fopen('PhaseB_Current.txt','r');
FilePhaseC_Current = fopen('PhaseC_Current.txt','r');

PhaseA_VoltageVector = fscanf(FilePhaseA_Voltage,'%d') * 0.235 - 30;
PhaseB_VoltageVector = fscanf(FilePhaseB_Voltage,'%d') * 0.235 - 30;
PhaseC_VoltageVector = fscanf(FilePhaseC_Voltage,'%d') * 0.235 - 30;
% Important Note:
    % According to LV-25P voltage sensor the primary current should be 10mA
    % so secondary 25mA and with 100ohm measuring resistance we have 2.5V
    % on secondary assuming the primary is 250V so to go to the primary we
    % multiply by 100 with this we reach 0.8% accuracy which is the maximum
    % possible accuracy for this sensor, Check datasheet for more info
    
%=========================================================================%
PhaseA_CurrentVector = fscanf(FilePhaseA_Current,'%d') * 0.189 - 24.1;
PhaseB_CurrentVector = fscanf(FilePhaseB_Current,'%d') * 0.189 - 24.1;
PhaseC_CurrentVector = fscanf(FilePhaseC_Current,'%d') * 0.189 - 24.1;
% Important Note:
    % According to LTS 25-NP current sensor and with the first connection
    % we can calculate the sensor function from the last page of the 
    % datasheet to be A = (V - 2.5) / 0.025 and that is what implemented 
    % here
    
%=========================================================================%
PhaseA_VoltageFFT = abs(fft(PhaseA_VoltageVector,4096));
PhaseB_VoltageFFT = abs(fft(PhaseB_VoltageVector,4096));
PhaseC_VoltageFFT = abs(fft(PhaseC_VoltageVector,4096));

PhaseA_CurrentFFT = abs(fft(PhaseA_CurrentVector,4096));
PhaseB_CurrentFFT = abs(fft(PhaseB_CurrentVector,4096));
PhaseC_CurrentFFT = abs(fft(PhaseC_CurrentVector,4096));

FrequencyRepresentation = 30000 * (0:4095)/4096;
TimeRepresentation = (0:4095) / 30000;
%=========================================================================%
%Phase A Voltages and Currents
subplot(3,4,1);
plot(TimeRepresentation, PhaseA_VoltageVector,'b');
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Phase A Voltage');

subplot(3,4,2);
plot(TimeRepresentation, PhaseA_CurrentVector,'b');
xlabel('Time(s)');
ylabel('Current(A)');
title('Phase A Current');

subplot(3,4,3);
plot(FrequencyRepresentation, PhaseA_VoltageFFT,'b');
xlabel('Frequency(Hz)');
title('Phase A Voltage FFT');

subplot(3,4,4);
plot(FrequencyRepresentation, PhaseA_CurrentFFT,'b');
xlabel('Frequency(Hz)');
title('Phase A Current FFT');
%=========================================================================%
%Phase B Voltages and Currents
subplot(3,4,5);
plot(TimeRepresentation, PhaseB_VoltageVector,'b');
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Phase B Voltage');

subplot(3,4,6);
plot(TimeRepresentation, PhaseB_CurrentVector,'b');
xlabel('Time(s)');
ylabel('Current(A)');
title('Phase B Current');

subplot(3,4,7);
plot(FrequencyRepresentation, PhaseB_VoltageFFT,'b');
xlabel('Frequency(Hz))');
title('Phase B Voltage FFT');

subplot(3,4,8);
plot(FrequencyRepresentation, PhaseB_CurrentFFT,'b');
xlabel('Frequency(Hz)');
title('Phase B Current FFT');
%=========================================================================%
subplot(3,4,9);
plot(TimeRepresentation, PhaseC_VoltageVector,'b');
xlabel('Time(s)');
ylabel('Voltage(V)');
title('Phase C Voltage');

subplot(3,4,10);
plot(TimeRepresentation, PhaseC_CurrentVector,'b');
xlabel('Time(s)');
ylabel('Current(A)');
title('Phase C Current');

subplot(3,4,11);
plot(FrequencyRepresentation, PhaseC_VoltageFFT,'b');
xlabel('Frequency(Hz)');
title('Phase C Voltage FFT');

subplot(3,4,12);
plot(FrequencyRepresentation, PhaseC_CurrentFFT,'b');
xlabel('Frequency(Hz)');
title('Phase C Current FFT');
%=========================================================================%