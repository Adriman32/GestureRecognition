function IM = imageManipulator(H)
    [r c x] = size(H);
    if(x ~= 1)
        H = rgb2gray(H);
    end
    gaussImg = imgaussfilt(H,4);
    threshImg = zeros(r,c);
    
    for i = 1:r
        for j = 1:c
            if(gaussImg(i,j) < 130)
                threshImg(i,j) = 255;
            end
        end
    end
    IM = threshImg;
end
    
    % BI = zeros(r,c);
% for i = 1:r
%     for j = 1:c
%         if(GFI(i,j) < 130)
%             BI(i,j) = 255;
%         end
%     end
% end




% 
% % imds = imageDatastore("Images\test",'IncludeSubfolders',true,'LabelSource','foldernames');
% % [numFiles dim] = size(imds.Files);
% % 
% % randFiles = randperm(numFiles,9);
% % figure;
% % for i = 1:9
% %    inImg = imread(imds.Files{randFiles(i)});
% %    grayImg = rgb2gray(inImg);
% %    gaussImg = imgaussfilt(grayImg,5);
% %    test = edge(grayImg);
% %    
% %    subplot(3,3,i);
% %    imshow(test);
% %    title("Gesture: " + char(imds.Labels(randFiles(i))));
% % end
% % 
% % % 
% 
% 
% 
%  imds = imageDatastore("Images\test",'IncludeSubfolders',true,'LabelSource','foldernames');
% [numFiles dim] = size(imds.Files);
% 
% randFiles = randperm(numFiles,1);
% IM = imread(imds.Files{randFiles});
% GI = rgb2gray(IM);
% GFI = imgaussfilt(GI,4);
% 
% 
% [r c x] = size(GI);
% BI = zeros(r,c);
% for i = 1:r
%     for j = 1:c
%         if(GFI(i,j) < 130)
%             BI(i,j) = 255;
%         end
%     end
% end
% % 
% % Gx = [-1 0 1; -2 0 2; -1 0 1];
% % Gy = [-1 -2 -1; 0 0 0; 1 2 1];
% % PI = padarray(GI,[1,1],'replicate');
% % 
% % 
% % Gx = conv2(Gx,PI);
% % Gy = conv2(Gy,PI);
% % PI = double(PI);
% % 
% % %   Gx=(sum(Gx.*PI));
% % %   Gx = sum(Gx);
% % %   Gy= (sum(Gy.* PI));
% % %   Gy = sum(Gy);
% % 
% % G = sqrt(Gx.^2 + Gy.^2);
% % % G = Gx + Gy;
% [r,c,x] = size(G);
% 
% OI = zeros(r,c);
% for i = 2:r
%     for j = 2:c
%         if(atan(Gy(i,j)/Gx(i,j)) >= 0)
%             OI(i,j) = G(i,j);
%         end
%     end
% end
% 
% % [r c x] = size(GI);
% % BI = zeros(r,c);
% % for i = 1:r
% %     for j = 1:c
% %         if(GI(i,j) < 130)
% %             BI(i,j) = 255;
% %         end
% %     end
% % end
% 
% SI = imfill(BI);
% 
% figure;
% subplot(3,3,1);
% imshow(IM);
% title("Original Image");
% subplot(3,3,2);
% imshow(GI);
% title("Gray Image");
% subplot(3,3,3);
% imshow(GFI);
% title("Gray Blurred Image");
% subplot(3,3,4);
% imshow(Gx);
% title("Sobel Gx");
% subplot(3,3,5);
% imshow(Gy);
% title("Sobel Gy");
% subplot(3,3,6);
% imshow(G);
% title("Sobel Total");
% subplot(3,3,7);
% imshow(OI);
% title("Sobel Total with Angle");
% subplot(3,3,8);
% imshow(BI);
% title("Thresholded Gray Image");
% subplot(3,3,9);
% imshow(SI);
% title("Thresholded Gray Image Fill");
