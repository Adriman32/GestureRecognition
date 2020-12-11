% % Testing Trained Network
% % close all
% clear
% clc
% 
% 
% load gestureClassifier;
% fullFile = ("Images\gestures");
% myImds = imageDatastore(fullFile,'IncludeSubfolders', true, 'LabelSource','foldernames');
% 
% perm = randperm(30, 9);
% figure;
% for i = 1:9
%     myImg = readimage(myImds,perm(i));
% %     manImg = imageManipulator(myImg);
%     manImg = imageManipulator(imread(myImds.Files{perm(i)}));
%     calcLabel = classify(gestureClassifier,manImg);
%     subplot(3,3,i);
% %     imshow(manImg);
%     imshow(myImds.Files{perm(i)});
%     title("Detected: " + char(calcLabel));
% end








% Testing Trained Network
close all
clear
clc


load ("Trained Networks\gestureClassifier");
fullFile = ("Images\test");
myImds = imageDatastore(fullFile,'IncludeSubfolders', true, 'LabelSource','foldernames');

perm = randperm(1200, 9);
figure;
for i = 1:9
    myImg = readimage(myImds,perm(i));
    calcLabel = classify(gestureClassifier,myImg);
    subplot(3,3,i);
    imshow(myImds.Files{perm(i)});
    title("Detected: " + char(calcLabel));
end