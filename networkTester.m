% Testing Trained Network
close all
clear
clc

load ("Trained Networks\finalClassifier");
fullFile = ("Images\validation");
myImds = imageDatastore(fullFile,'IncludeSubfolders', true, 'LabelSource','foldernames');


perm = randperm(3750, 9);
figure;
for i = 1:9
    myImg = readimage(myImds,perm(i));
    manImg = imresize(myImg,[100 100]);
    manImg = rgb2gray(manImg);
    calcLabel = classify(gestureClassifier,manImg);
    subplot(3,3,i);
    imshow(myImg);
    title("Detected: " + char(calcLabel));
end


























% 
% IM = imread("Images\gestures\5\download.jpg");
% IM = imresize(IM, [382 312]);
% NM = im2bw(IM,.9);
% NM = imageManipulator(IM);
% 
% calcLabel = classify(gestureClassifier,NM);
% 
% figure;
% subplot(1,2,1);
% imshow(IM);
% subplot(1,2,2);
% imshow(NM);
% title("Detected: " + char(calcLabel));


% 
% 
% % Testing Trained Network
% close all
% clear
% clc
% 
% 
% load ("Trained Networks\gestureClassifier");
% fullFile = ("Images\test");
% myImds = imageDatastore(fullFile,'IncludeSubfolders', true, 'LabelSource','foldernames');
% 
% perm = randperm(1200, 9);
% figure;
% for i = 1:9
%     myImg = readimage(myImds,perm(i));
%     calcLabel = classify(gestureClassifier,myImg);
%     subplot(3,3,i);
%     imshow(myImds.Files{perm(i)});
%     title("Detected: " + char(calcLabel));
% end