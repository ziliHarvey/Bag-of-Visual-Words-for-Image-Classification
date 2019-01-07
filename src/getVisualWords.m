function [wordMap] = getVisualWords(I, dictionary, filterBank)
% Convert an RGB or grayscale image to a visual words representation, with each
% pixel converted to a single integer label.   
% Inputs:
%   I:              RGB or grayscale image of size H * W * C
%   filterBank:     cell array of matrix filters used to make the visual words.
%                   generated from getFilterBankAndDictionary.m
%   dictionary:     matrix of size 3*length(filterBank) * K representing the
%                   visual words computed by getFilterBankAndDictionary.m
% Outputs:
%   wordMap:        a matrix of size H * W with integer entries between
%                   1 and K

    % -----fill in your implementation here --------
    m=size(I,1);
    n=size(I,2);
    wordMap=zeros(m,n);
    n_fb=numel(filterBank);
    filterResponses=extractFilterResponses(I,filterBank);%a 3D matrix 
    fr_2D=zeros(m*n,3*n_fb);%reshape 3D filterResponses to a 2D matrix for pdist 
    for i=1:m
        for j=1:n
            fr_2D(((i-1)*n+j),:)=filterResponses(i,j,:);
        end
    end
    distance=pdist2(fr_2D,dictionary);%calculate Euclidean distance
    [result,index]=min(distance');
    for i=1:m
        for j=1:n
            wordMap(i,j)=index((i-1)*n+j);
        end
    end
    
    
    
    

    

    % ------------------------------------------
end
