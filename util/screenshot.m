function imgData = screenshot(x1,y1,x2,y2)

    robo = java.awt.Robot;
    rectangle = java.awt.Rectangle(x1,y1,x2-x1,y2-y1);
    image = robo.createScreenCapture(rectangle);

    H=image.getHeight;
    W=image.getWidth;
    imgData = zeros([H,W,3],'uint8');
    pixelsData = reshape(typecast(image.getData.getDataStorage,'uint32'),W,H).';
    imgData(:,:,3) = bitshift(bitand(pixelsData,256^1-1),-8*0);
    imgData(:,:,2) = bitshift(bitand(pixelsData,256^2-1),-8*1);
    imgData(:,:,1) = bitshift(bitand(pixelsData,256^3-1),-8*2);
end

