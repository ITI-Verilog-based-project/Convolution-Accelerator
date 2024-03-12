# Convolution Accelerator Project

## Objective
The objective of this project is to implement a simple accelerator for the Convolution operator. Convolution is fundamental in signal processing, image processing, machine learning, and various other fields. Accelerating this operator will enhance the overall efficiency of related applications.

## Convolution Overview
The convolution operation is central to Convolutional Neural Networks (CNNs) and plays a pivotal role in feature extraction. It involves a sliding window (kernel/filter) traversing the input feature map to compute element-wise multiplications and summations that produce the output feature map. Mathematically, it can be expressed as:

Where:
- S(i,j): Value at position (i,j) in the output feature map.
- A(i,j): Input feature map.
- K(m,n): Convolution kernel/filter.
- M and N: Dimensions of the kernel.

## Specifications
### Modules Specification
In this project, the convolution operator core consists of the following components:
- 3 special memories:
  - Cyclic Queue for the kernel matrix (256 bytes).
  - Input queue for the input matrix (cyclic FIFO with modification, 1kB).
  - Output queue for output result (1kB).
- Registers:
  - M: Number of rows in the kernel K (mxn).
  - N: Number of columns in the kernel K (mxn).
  - S: Stride length (the sliding window slide by how much).
  - L: Number of rows of input matrix (LxW).
  - W: Number of rows of input matrix (LxW).
  - Any other relevant registers.
- Multiplier: 32-bit floating point multiplier (single precision, IEEE standard).
- Accumulator: 32-bit floating point accumulator.
- Controller: Has three modes of operation:
  - Loading data (kernel or input).
  - Computing (perform multiple and accumulate, also controls the shift of the queues).
  - Output generation.
