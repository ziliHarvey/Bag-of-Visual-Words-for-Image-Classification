load('traintest.mat','train_imagenames');%load files and get path string array
alpha=500;
K=150;
filterBank=createFilterBank();
save('filterBank.mat','filterBank');
dictionary=getDictionary(train_imagenames,alpha,K,'harris');%dictionary for Harris Points
save('dictionaryHarris.mat','dictionary');
dictionary=getDictionary(train_imagenames,alpha,K,'random');%dictionary for Random Points
save('dictionaryRandom.mat','dictionary');
