This repo is for the term project of E430 Digital Signal Processing.

## **Overview**  
This project centers on the exploration of dual-tone multi-frequency (DTMF) signaling. Specifically, we intended to implement signal processing techniques in
MATLAB for the purpose of generating, transmitting, receiving, and decoding audio DTMF signals.For decoding algorithms, we utilized the Spectrogram method and Goertzel
method. According to tests conducted on the decoding methods by altering the period of tone duration and tone rest, we compared these methods. There are two interfaces in this project: the Transmitter and the Receiver.

Transmitter Panel is shown below.
<p align="center">
  <img src="circuit_diagram.png" alt="Açıklama" width="600"/>
</p>

The displayed encoded signal and its spectrogram is as follows.
<p align="center">
  <img src="circuit_diagram.png" alt="Açıklama" width="600"/>
</p>


## **The Encoder**
The encoder function simply takes the input digits and generates a sum of 2 sine functions according to formula 1, where fL and fH correspond to the high and low
frequencies of the k^th digit. Only a Td long duration of this signal is taken. This is done for each digit given as input.

Here is the circuit shematic of the system.




## Final Report
- [Project Final Report (PDF)](https://github.com/berfinkokmen/Evaluation-and-Implementation-of-DTMF-Signaling/blob/main/430report.pdf)
  
## Project Group Members
Humeyra Bodur, Berfin Kokmen.

