This repo is for the term project of E430 Digital Signal Processing.

## **Overview**  
This project centers on the exploration of dual-tone multi-frequency (DTMF) signaling. Specifically, we intended to implement signal processing techniques in
MATLAB for the purpose of generating, transmitting, receiving, and decoding audio DTMF signals.For decoding algorithms, we utilized the Spectrogram method and Goertzel
method. According to tests conducted on the decoding methods by altering the period of tone duration and tone rest, we compared these methods. There are two interfaces in this project: the Transmitter and the Receiver.

Transmitter Panel is shown below.
<p align="center">
  <img width="450" height="330" src="https://github.com/user-attachments/assets/c6c163d7-c13a-4e2a-b545-19597241191a" alt="Açıklama" width="600"/>
</p>

The displayed encoded signal and its spectrogram is as follows.
<p align="center">
  <img width="450" height="330" src="https://github.com/user-attachments/assets/66c723e9-139c-42c3-a31c-b704ec06acf2" alt="Açıklama" width="600"/>
</p>

## **The Encoder**
The encoder function simply takes the input digits and generates a sum of 2 sine functions according to formula 1, where fL and fH correspond to the high and low
frequencies of the k^th digit. Only a Td long duration of this signal is taken. This is done for each digit given as input.

<p align="center">
  <img src="https://github.com/user-attachments/assets/059dd418-4bac-481b-9bc0-bda720f5316d" alt="Açıklama" width="600"/>
</p>

Then, as in equation 2, we sum up these signals with a time shift, so that each consecutive
digit is encoded in consecutive Td duration segments, where each segment is separated by Tr.

<p align="center">
  <img width="480" height="65" src="https://github.com/user-attachments/assets/ce5c5363-455c-41b1-8f23-a02fb9c9054d" alt="Açıklama" width="600"/>
</p>

## **The Decoder**

Spectrogram and Goertzel Methods are used. The comparison of these methods are explained in the project report.

## Final Report
- [Project Final Report (PDF)](https://github.com/berfinkokmen/Evaluation-and-Implementation-of-DTMF-Signaling/blob/main/430report.pdf)
  
## Project Group Members
Humeyra Bodur, Berfin Kokmen.

