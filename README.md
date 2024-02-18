# conv_matlab
Matlab conv implementation functions

#### myLaplacian( input)

A function implementation accepts a (0-255) greyscale image  matrix and returns an image that has been sharpened using the Laplacian high-pass sharpening method. 

The Laplacian kernel detects edges in all directions.

#### myUnsharp( input,  k, filt_size)

A function implementation sharpens images using the high-boost method.

* input:  a (0-255) greyscale image  matrix
* k: the amout of boost
* filt_size: choose the mean filter in size filt_size x filt_size
