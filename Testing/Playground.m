% %
% close all
% clear
% clc
% 
% digitDatasetPath = fullfile("C:\Users\adria\Documents\.minecraft\School\Fall 2020\ECE 4580\Final Project\Images\test");
% imds = imageDatastore(digitDatasetPath, ...
%     'IncludeSubfolders',true,'LabelSource','foldernames');
% figure;
% perm = randperm(300,9);
% 
% for i = 1:9
%     subplot(3,3,i);
%     imshow(imds.Files{perm(i)});
%     title("Label: " + char(imds.Labels(perm(i))));
% end
% 
% labelCount = countEachLabel(imds);
% numTrainFiles = 45;
% [imdsTrain, imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
% 
% 382 312 3
% 
% layers = [
%     Image size
%     imageInputLayer([382 312 3])
%     
%     convolution2dLayer(3,8,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
%     
%     maxPooling2dLayer(2,'Stride',2)
%     
%     convolution2dLayer(3,16,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
%     
%     maxPooling2dLayer(2,'Stride',2)
%     
%     convolution2dLayer(3,32,'Padding','same')
%     batchNormalizationLayer
%     reluLayer
%     
%     fullyConnected layer value is how many categories it must find
%     fullyConnectedLayer(6)
%     softmaxLayer
%     classificationLayer];
% 
% options = trainingOptions('sgdm', ...
%     'InitialLearnRate',0.01, ...
%     'MaxEpochs',4, ...
%     'Shuffle','every-epoch', ...
%     'ValidationData',imdsValidation, ...
%     'ValidationFrequency',30, ...
%     'Verbose',false, ...
%     'Plots','training-progress');
% 
% testNet = trainNetwork(imdsTrain,layers,options);
% gestureClassifier = testNet;
% save gestureClassifier;
%  




% calcLabel2 = classify(gestureClassifier,myImg);
% figure;
% imshow(myImg);
% title("Value: " + char(calcLabel2));
% 


% myimds = imageDatastore(digitDatasetPath, ...
%     'IncludeSubfolders',true,'LabelSource','foldernames');
% figure;
% for i = 1:10
%    subplot(2,5,i);
%    myimg = readimage(myimds,i);
%    imshow(myimg);
%    calcLabel = classify(gestureClassifier,myimg);
%    title("My Value: " + char(calcLabel));
% end
% 






% % %%
% % close all
% % clear
% % clc
% % 
% % digitDatasetPath = fullfile(matlabroot,'toolbox','nnet','nndemos', ...
% %     'nndatasets','DigitDataset');
% % imds = imageDatastore(digitDatasetPath, ...
% %     'IncludeSubfolders',true,'LabelSource','foldernames');
% % 
% % % figure;
% % % perm = randperm(10000,20);
% % % for i = 1:20
% % %     subplot(4,5,i);
% % %     imshow(imds.Files{perm(i)});
% % %     title("Label: " + char(imds.Labels(perm(i))));
% % % end
% % 
% % 
% % % labelCount = countEachLabel(imds);
% % 
% % numTrainFiles = 750;
% % [imdsTrain, imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');
% % 
% % 
% % layers = [
% %     imageInputLayer([28 28 1])
% %     
% %     convolution2dLayer(3,8,'Padding','same')
% %     batchNormalizationLayer
% %     reluLayer
% %     
% %     maxPooling2dLayer(2,'Stride',2)
% %     
% %     convolution2dLayer(3,16,'Padding','same')
% %     batchNormalizationLayer
% %     reluLayer
% %     
% %     maxPooling2dLayer(2,'Stride',2)
% %     
% %     convolution2dLayer(3,32,'Padding','same')
% %     batchNormalizationLayer
% %     reluLayer
% %     
% %     fullyConnectedLayer(10)
% %     softmaxLayer
% %     classificationLayer];
% % 
% % options = trainingOptions('sgdm', ...
% %     'InitialLearnRate',0.01, ...
% %     'MaxEpochs',4, ...
% %     'Shuffle','every-epoch', ...
% %     'ValidationData',imdsValidation, ...
% %     'ValidationFrequency',30, ...
% %     'Verbose',false, ...
% %     'Plots','training-progress');
% % 
% % net = trainNetwork(imdsTrain,layers,options);
% % numberClassifier = net;
% % save numberClassifier
% 
% %%
% % Testing Trained Network
% close all
% clear
% clc
% 
% 
% 
% % figure;
% % perm = randperm(10000,20);
% % for i = 1:20
% %     subplot(4,5,i);
% %     img = readimage(imds,perm(i));
% %     imshow(img);
% %     calcLabel = classify(net,img);
% %     
% %     title("Test Value: " + char(calcLabel));
% % end
% 
% load numberClassifier;
% 
% myImagePath = fullfile("Images\numbers");
% myimds = imageDatastore(myImagePath);
% figure;
% for i = 1:10
%    subplot(2,5,i);
%    myimg = readimage(myimds,i);
%    myimg = rgb2gray(imresize(myimg,[28 28]));
%    myimg = imcomplement(myimg);
%    imshow(myimg);
%    calcLabel = classify(numberClassifier,myimg);
%    title("My Value: " + char(calcLabel));
% end
% 
% 
% 
% % myImg = imread("Images\three.png");
% % myImg = rgb2gray(imresize(myImg,[28 28]));
% % myImg = imcomplement(myImg);
% % calcLabel2 = classify(net,myImg);
% % figure;
% % imshow(myImg);
% % title("Value: " + char(calcLabel2));
% 
% 

