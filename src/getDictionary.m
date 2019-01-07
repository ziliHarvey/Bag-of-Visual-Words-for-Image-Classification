function [dictionary] = getDictionary(imgPaths, alpha, K, method)
% Generate the filter bank and the dictionary of visual words
% Inputs:
%   imgPaths:        array of strings that repesent paths to the images
%   alpha:          num of points
%   K:              K means parameters
%   method:         string 'random' or 'harris'
% Outputs:
%   dictionary:         a length(imgPaths) * K matrix where each column
%                       represents a single visual word
    % -----fill in your implementation here --------
    filterbank=createFilterBank();
    n=numel(filterbank);
    T=numel(imgPaths);
    pixelResponses=zeros(alpha*T,3*n);
    for i=1:T
        I=imread(imgPaths{i});
        filterResponses=extractFilterResponses(I,filterbank);
        if method=='harris'
            if ndims(I)==3
                I=rgb2gray(I);
            end
            I_g=im2double(I);
            points_h=getHarrisPoints(I_g,alpha,0.05);
            for j=1:alpha
                m_h=points_h(j,1);
                n_h=points_h(j,2);
                for k=1:(3*n)
                    pixelResponses((alpha*(i-1)+j),k)=filterResponses(m_h,n_h,k);
                end
            end
        elseif method=='random'
            if ndims(I)==3
                I=rgb2gray(I);
            end
            I_g=im2double(I);
            points_r=getRandomPoints(I_g,alpha);
            for j=1:alpha
                m_r=points_r(j,1);
                n_r=points_r(j,2);
                for k=1:(3*n)
                    pixelResponses((alpha*(i-1)+j),k)=filterResponses(m_r,n_r,k);
                end
            end
        end
    end
    [~,dictionary] = kmeans(pixelResponses, K, 'EmptyAction', 'drop','MaxIter', 10000);

    % ------------------------------------------
    
end
