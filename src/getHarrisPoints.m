function [points] = getHarrisPoints(I, alpha, k)
% Finds the corner points in an image using the Harris Corner detection algorithm
% Input:
%   I:                      grayscale image
%   alpha:                  number of points
%   k:                      Harris parameter
% Output:
%   points:                    point locations
%
    % -----fill in your implementation here --------
    points=zeros(alpha,2);
    m=size(I,1);
    n=size(I,2);
    fx = [-1,0,1; -2,0,2; -1,0,1]/8;%sobel filter for x derivative
	fy = [ 1,2,1;  0,0,0; -1,-2,-1]/8;%sobel filter for y derivative
    %we computer covariance matrix of a pixel using a 3*3 window
    pad_rows = 1;
    pad_cols = 1;
    pad_I=padarray(I,[pad_rows pad_cols],'replicate','both');%paddle the image
    Ix=imfilter(pad_I,fx);
    Iy=imfilter(pad_I,fy);
    R_m=zeros(m,n);
    %compute covariance matrix for each pixel
    for i=1:m
        for j=1:n
            Ixx=Ix(i:i+2,j:j+2).*Ix(i:i+2,j:j+2);
            Ixx_sum=sum(Ixx(:));
            Ixy=Ix(i:i+2,j:j+2).*Iy(i:i+2,j:j+2);
            Ixy_sum=sum(Ixy(:));
            Iyy=Iy(i:i+2,j:j+2).*Iy(i:i+2,j:j+2);
            Iyy_sum=sum(Iyy(:));
            %compute the response function R
            det_m=Ixx_sum*Iyy_sum-Ixy_sum*Ixy_sum;
            tr_m=Ixx_sum+Iyy_sum;
            R=det_m-k*(tr_m^2);
            R_m(i,j)=R;
        end
    end
    %select the top alpha R_m values as the corner points and return
    %their coordinates as the output matrix
    r4sort=zeros(1,m*n);
    for i=1:m
        for j=1:n
            r4sort(n*(i-1)+j)=R_m(i,j);
        end
    end
    [r_sorted,index]=sort(r4sort,'descend');%transform R matrix into a vextor for sorting concern
    for i=1:alpha
        points(i,1)=ceil(index(i)/n);%return row coordinate
        points(i,2)=index(i)-(points(i,1)-1)*n;%return column_coordinate
    end
        
        
    
            
            
    

    

    % ------------------------------------------

end
