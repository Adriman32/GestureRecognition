close all
clear
clc


cam = webcam;

% Get the handle to the image in the axes.
hImage = image(zeros(720,1280,'uint8'));
% Reset image magnification. Required if you ever displayed an image
% in the axes that was not the same size as your webcam image.

% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Turn on the live video.
% videoObject = videoinput('winvideo');
preview(cam, hImage);
hold on 
thisBB = [ 870 27.5 311 381];
% thisBB = [28.5 27.5 311 381];
rectangle('Position', [thisBB(1),thisBB(2),thisBB(3),thisBB(4)], 'EdgeColor','g','LineWidth',2 )

version = 2;
figure;
for i = 0:5
    fileName = "Images\gestures\" + i +"\";
    pause(5);
    for j = 0:9
        capturedImage = snapshot(cam);
        croppedImage = imcrop(capturedImage,thisBB);
        imwrite(croppedImage, fileName + "Left." + version + j +".png")
    end
    
    subplot(2,3,(i+1));
    imshow(croppedImage);
    title("Gesture: " + i);
end

closepreview;
clear;

