% evaluateRecognitionSystem.m
% This script evaluates nearest neighbour recognition system on test images
% load traintest.mat and classify each of the test_imagenames files.
% Report both accuracy and confusion matrix
load('traintest.mat');
%..........................................................................
%classification on harris points using chi2
load('dictionaryHarris.mat');
load('visionHarris.mat');
dictionarySize=size(dictionary,1);
N=numel(mapping);% number of classes
C=zeros(N,N);%initialize confusion matrix
%we need to obtain the histogram of each testing image
n_test=numel(test_labels);%number of test images
n_train=numel(train_labels);%number of train images
testFeatures=zeros(n_test,dictionarySize);%histogram matrix of test image
for i=1:n_test
    id=test_imagenames{i};
    wordMap_h=load([id(1:end-4),'.mat']);
    h=getImageFeatures(wordMap_h.wordMap,dictionarySize);%get histogram of a wordMap
    testFeatures(i,:)=h;
end
for i=1:n_test
    dist=zeros(1,n_train);
    for j=1:n_train
        dist(j)=getImageDistance(testFeatures(i,:),trainFeatures(j,:),'chi2');
    end
    [result,id]=min(dist);%means test iamge i is most similar to train image id
    C(test_labels(i),train_labels(id))=C(test_labels(i),train_labels(id))+1;
end
%calculate accuracy
accuracy=trace(C)/sum(C(:));
fprintf('Using Harris and Chi2, the accuracy of the Recognition System: %.2f%% \n', accuracy*100);
%print confusion matrix
disp(C);
%................................y..........................................
%classification on harris points using euclidean
fprintf('.............................................\n');
C=zeros(N,N);%initialize confusion matrix
for i=1:n_test
    dist=zeros(1,n_train);
    for j=1:n_train
        dist(j)=getImageDistance(testFeatures(i,:),trainFeatures(j,:),'euclidean');
    end
    [result,id]=min(dist);%means test iamge i is most similar to train image id
    C(test_labels(i),train_labels(id))=C(test_labels(i),train_labels(id))+1;
end
%calculate accuracy
accuracy=trace(C)/sum(C(:));
fprintf('Using Harris and Euclidean, the accuracy of the Recognition System: %.2f%% \n', accuracy*100);
%print confusion matrix
disp(C);
%..........................................................................
%classification on random points using chi2
fprintf('.............................................\n');
load('dictionaryRandom.mat');
load('visionRandom.mat');
dictionarySize=size(dictionary,1);
N=numel(mapping);% number of classes
C=zeros(N,N);%initialize confusion matrix
%we need to obtain the histogram of each testing image
n_test=numel(test_labels);%number of test images
n_train=numel(train_labels);%number of train images
for i=1:n_test
    dist=zeros(1,n_train);
    for j=1:n_train
        dist(j)=getImageDistance(testFeatures(i,:),trainFeatures(j,:),'chi2');
    end
    [result,id]=min(dist);%means test iamge i is most similar to train image id
    C(test_labels(i),train_labels(id))=C(test_labels(i),train_labels(id))+1;
end
%calculate accuracy
accuracy=trace(C)/sum(C(:));
fprintf('Using Random and Chi2, the accuracy of the Recognition System: %.2f%% \n', accuracy*100);
%print confusion matrix
disp(C);
%..........................................................................
%classification on random points using euclidean
fprintf('.............................................\n');
C=zeros(N,N);%initialize confusion matrix
for i=1:n_test
    dist=zeros(1,n_train);
    for j=1:n_train
        dist(j)=getImageDistance(testFeatures(i,:),trainFeatures(j,:),'euclidean');
    end
    [result,id]=min(dist);%means test iamge i is most similar to train image id
    C(test_labels(i),train_labels(id))=C(test_labels(i),train_labels(id))+1;
end
%calculate accuracy
accuracy=trace(C)/sum(C(:));
fprintf('Using Random and Euclidean, the accuracy of the Recognition System: %.2f%% \n', accuracy*100);
%print confusion matrix
disp(C);
        
        
   
        
    



