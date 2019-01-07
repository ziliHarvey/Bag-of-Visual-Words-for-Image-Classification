% buildRecognitionSystem.m
% This script loads the visual word dictionary (in dictionaryRandom.mat or dictionaryHarris.mat) and processes
% the training images so as to build the recognition system. The result is
% stored in visionRandom.mat and visionHarris.mat.
load('traintest.mat');
load('filterBank');
%for visionHarris.mat
load('dictionaryHarris.mat');
T=numel(train_imagenames);%number of train images
dictionarySize=size(dictionary,1);
trainFeatures=zeros(T,dictionarySize);
for i=1:T
    id=train_imagenames{i};
    wordMap_h=load([id(1:end-4),'.mat']);
    h=getImageFeatures(wordMap_h.wordMap,dictionarySize);%get histogram of a wordMap
    trainFeatures(i,:)=h;
end
trainLabels=train_labels';
save('visionHarris.mat','dictionary','filterBank','trainFeatures','trainLabels');
%................................................................................
%for visionRandom.mat
load('dictionaryRandom.mat');
T=numel(train_imagenames);%number of train images
dictionarySize=size(dictionary,1);
trainFeatures=zeros(T,dictionarySize);
for i=1:T
    id=train_imagenames{i};
    wordMap_r=load([id(1:end-4),'_r.mat']);
    h=getImageFeatures(wordMap_r.wordMap,dictionarySize);%get histogram of a wordMap
    trainFeatures(i,:)=h;
end
trainLabels=train_labels';
save('visionRandom.mat','dictionary','filterBank','trainFeatures','trainLabels');



    


