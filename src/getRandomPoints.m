function [points] = getRandomPoints(I, alpha)
% Generates random points in the image
% Input:
%   I:                      grayscale image
%   alpha:                  random points
% Output:
%   points:                    point locations
%
	% -----fill in your implementation here --------
    m=size(I,1);
    n=size(I,2);
    points=zeros(alpha,2);
    index=randperm(m*n,alpha);%pick alpha random points
    for i=1:alpha
        points(i,1)=ceil(index(i)/n);
        points(i,2)=index(i)-(points(i,1)-1)*n;
    end

    

    % ------------------------------------------

end

