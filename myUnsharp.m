%Junfu Cheng
function output = myUnsharp(input, k, filt_size)
%The function will return an image that has been sharpened using the high-boost method.
%Blur the original image
%Subtract the blurred image from the original (the resulting difference is called the mask) (Unsharp)
%Add the mask to the original

    figure, imshow(input), title('Original Image');
    input =  im2double(input);
    [rows, cols] = size(input);
    padding_rows = rows + filt_size - 1;
    padding_cols = cols + filt_size - 1;
    padding_image = zeros(padding_rows, padding_cols);
    row_begin_index = floor(filt_size/2) + 1;
    row_end_index = row_begin_index + rows - 1;
    col_begin_index = floor(filt_size/2) + 1;
    col_end_index = col_begin_index + cols - 1;
    padding_image(row_begin_index:row_end_index, col_begin_index: col_end_index)...
    = padding_image(row_begin_index:row_end_index, col_begin_index: col_end_index) + input;
    
    blur_image = zeros(rows,cols);
    for i = 1:filt_size
        for j = 1:filt_size
            blur_image = blur_image + padding_image(i:i+rows-1, j:j+cols-1);
        end
    end
    %blur_image = myMeanJ(input, padding_image, filt_size,filt_size);
    blur_image = blur_image/(filt_size^2);
    
    figure, imshow(blur_image), title('blur Image');

    g_mask = input - blur_image;

    figure, imshow(g_mask), title('the mask');

    output = input + k * g_mask;

    output = im2uint8(output);

    figure, imshow(output), title('the Highboost image');

end

% recursive algorithm function used for avoiding loop
function blur_image = myMeanI(input, padding_image, i, j)
    [rows, cols] = size(input);
    if( i == 1)
        blur_image = padding_image(1:1+rows-1, j:j+cols-1);
    else
        blur_image = padding_image(i:i+rows-1, j:j+cols-1) + myMeanI(input,padding_image,i-1 ,j);
    end

end

function blur_image = myMeanJ(input, padding_image, i, j)
    if( j == 1)
        blur_image = myMeanI(input,padding_image,i ,j);
    else
        blur_image = myMeanJ(input, padding_image,i,j - 1 ) + myMeanI(input,padding_image,i ,j);
    end
end