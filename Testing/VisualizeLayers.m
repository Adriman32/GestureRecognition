close all
clear
clc

net = load("numberClassifier");

name = net.net.Layers(2).Name;
channels = 1:8;
I = deepDreamImage(net.net,name,channels,'PyramidLevels',1');
figure
for i = 1:8
    subplot(5,5,i)
    imshow(I(:,:,:,i));
end

name = net.net.Layers(3).Name;
channels = 1:8;
I = deepDreamImage(net.net,name,channels,'PyramidLevels',1');
figure
for i = 1:8
    subplot(5,5,i)
    imshow(I(:,:,:,i));
end