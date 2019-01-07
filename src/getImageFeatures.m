function [h] = getImageFeatures(wordMap, dictionarySize)
% Convert an wordMap to its feature vector. In this case, it is a histogram
% of the visual words
% Input:
%   wordMap:            an H * W matrix with integer values between 1 and K
%   dictionarySize:     the total number of words in the dictionary, K
% Outputs:
%   h:                  the feature vector for this image


	% -----fill in your implementation here --------
    m_map=size(wordMap,1);
    n_map=size(wordMap,2);
    h=zeros(1,dictionarySize);
    for i=1:m_map
        for j=1:n_map
            for k=1:dictionarySize
                if wordMap(i,j)==k
                    h(k)=h(k)+1;
                end
            end
        end
    end
    sum_h=sum(h);
    h=h/sum_h;


    

    % ------------------------------------------

end
