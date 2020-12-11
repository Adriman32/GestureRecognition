close all
clear
clc

% Creates Image Datastore from files
digitDatasetPath = fullfile("Images\test");
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

% Creates random numbers to display 9 random images.
randI = randperm(1200,9);
figure;
for i = 1:9
    subplot(3,3,i);
    imshow(imds.Files{randI(i)});
    title("Label: " + char(imds.Labels(randI(i))));
end

% Saves number of images to prepare manipulation
allFiles = countEachLabel(imds);
numFiles = size(allFiles) * table2array(allFiles(1,2));
numFiles = numFiles(1,1);

% Performs Image Manipulation
for i = 1:numFiles
    manImg = imageManipulator(imread(imds.Files{i}));
    imwrite(manImg,imds.Files{i});
end

% Displays 
figure;
for i = 1:9
    subplot(3,3,i);
    imshow(imds.Files{randI(i)});
    title("Label: " + char(imds.Labels(randI(i))));
end



% labelCount = countEachLabel(imds);
numTrainFiles = 150;
[imdsTrain, imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

layers = [
%     Image size
    imageInputLayer([382 312 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,64,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,128,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
%     fullyConnected layer value is how many categories it must find
    fullyConnectedLayer(6)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',2, ...
    'Verbose',true, ...
    'Plots','training-progress');

testNet = trainNetwork(imdsTrain,layers,options);
gestureClassifier = testNet;
save ("Trained Networks\gestureClassifier");
