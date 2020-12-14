% Creates Convolutional Neural Network
close all
clear
clc

% Creates Image Datastore from files
digitDatasetPath = fullfile("Images\gestures");
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

allFiles = countEachLabel(imds);
numFiles = size(allFiles) * table2array(allFiles(1,2));
numFiles = numFiles(1,1);

% Creates random numbers to display 9 random images.
randI = randperm(numFiles,9);
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
    manImg = imresize(manImg, [100 100]);
    imwrite(manImg,imds.Files{i});
end

% Displays Images Post-Manipulation
figure;
for i = 1:9
    subplot(3,3,i);
    imshow(imds.Files{randI(i)});
    title("Label: " + char(imds.Labels(randI(i))));
end


% labelCount = countEachLabel(imds);
numTrainFiles = (numFiles/6)*0.8;
[imdsTrain, imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
imdsTrain=augmentedImageDatastore([100 100], imdsTrain,'ColorPreprocessing','rgb2gray');
imdsValidation=augmentedImageDatastore([100 100], imdsValidation,'ColorPreprocessing','rgb2gray');


layers = [
    % Input Layer
    imageInputLayer([100 100 1])
    
    % Hidden Layer 1
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    % Hidden Layer 2
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    % Hidden Layer 3
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    
    % Hidden Layer 4
    convolution2dLayer(3,64,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    % Output Layer
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

myNet = trainNetwork(imdsTrain,layers,options);
gestureClassifier = myNet;
save ("Trained Networks\testClassifier");
