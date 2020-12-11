% Testing Trained Network
close all
clear
clc


load gestureClassifier;
fullFile = ("C:\Users\adria\Documents\.minecraft\School\Fall 2020\ECE 4580\Final Project\Images\test");
myImds = imageDatastore(fullFile,'IncludeSubfolders', true, 'LabelSource','foldernames');

perm = randperm(1200, 9);
figure;
for i = 1:9
    myImg = readimage(imds,perm(i));
    calcLabel = classify(gestureClassifier,myImg);
    subplot(3,3,i);
    imshow(myImds.Files{perm(i)});
    title("Detected: " + char(calcLabel));
end