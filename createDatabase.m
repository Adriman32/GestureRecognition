% Creates database of images from webcam
close all
clear
clc

cam = webcam;

% Get the handle to the image in the axes.
hImage = image(zeros(720,1280,'uint8'));
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

% Turns on webcam
preview(cam, hImage);
hold on 

% Left Hand
handBox = [ 870 27.5 311 381];
% Right Hand
% handBox = [28.5 27.5 311 381];

rectangle('Position', [handBox(1),handBox(2),handBox(3),handBox(4)], 'EdgeColor','g','LineWidth',2 )

version = 2;
figure;
for i = 0:5
    fileName = "Images\gestures\" + i +"\";
    pause(5);
    for j = 0:9
        capturedImage = snapshot(cam);
        croppedImage = imcrop(capturedImage,handBox);
        imwrite(croppedImage, fileName + "Left." + version + j +".png")
    end
    subplot(2,3,(i+1));
    imshow(croppedImage);
    title("Gesture: " + i);
end

closepreview;
clear;

