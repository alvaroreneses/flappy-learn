function mask = calculateMask(base,image)
% Calculate the mask of one image
% We just use the blue channel
    T = base(:,:,3);
    S = image(:,:,3);
    mask = (T-S)>0;
end

