%Junfu Cheng
function output = myLaplacian(input)
%Implement a function myLaplacian(), which accepts a grayscale image that has been stored in a
%matrix and returns an image that has been sharpened using the Laplacian high-pass sharpening
%method. 
%The Laplacian kernel used should detect edges in all eight directions
% To sharpen an image, the Laplacian of the image is subtracted from the original image.

    % Display the original image
    figure, imshow(input), title('Original Image');
    input =  im2double(input);
    [rows, cols] = size(input);
    padding_rows = rows+2;
    padding_cols = cols+2;
    padding_image = zeros(padding_rows, padding_cols);
    padding_image(2:padding_rows - 1, 2: padding_cols - 1) = padding_image(2:padding_rows - 1, 2: padding_cols - 1) + input;
    laplacian11 = padding_image(1:padding_rows-2, 1:padding_cols - 2 );
    laplacian12 = padding_image(1:padding_rows-2, 2:padding_cols - 1 );
    laplacian13 = padding_image(1:padding_rows-2, 3:padding_cols     );
    laplacian21 = padding_image(2:padding_rows-1, 1:padding_cols - 2 );
    laplacian22 = -8 * padding_image(2:padding_rows-1, 2:padding_cols - 1 );
    laplacian23 = padding_image(2:padding_rows-1, 3: padding_cols    );
    laplacian31 = padding_image(3:padding_rows  , 1:padding_cols - 2 );
    laplacian32 = padding_image(3:padding_rows  , 2:padding_cols - 1 );
    laplacian33 = padding_image(3:padding_rows  , 3:padding_cols     );
    laplacian_image = laplacian11 + laplacian12 + laplacian13 + laplacian21 + laplacian22 + laplacian23 + laplacian31 + laplacian32 + laplacian33;
    
    % Display the laplacian image
    figure, imshow(laplacian_image), title('laplacian image');

    output = input - laplacian_image;

    output = im2uint8(output);

    % Display the sharpened image
    figure, imshow(output), title('sharpened image');
end

