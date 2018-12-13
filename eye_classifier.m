eyeDataPath = fullfile('C:\', 'Users', 'Haowei Li', 'Desktop', 'eye');
dataSet = imageDatastore(eyeDataPath, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');

labelCount = countEachLabel(dataSet);

img = readimage(dataSet, 1);
size(img);

numTrainFiles = 75;
[imdsTrain, imdsValidation] = splitEachLabel(dataSet, numTrainFiles, 'randomize');

layers = [
    imageInputLayer([100,400,3])
    
    convolution2dLayer(3,8,'padding','same')
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
    
    fullyConnectedLayer(2)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.05, ...
    'MaxEpochs',10, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain, layers, options);

YPred = classify(net, imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation);

save('retard.mat','net'); 
    
    
    
    
    =
    
    
    