function [db] = computeProperties(orig_img)

bw_img = (orig_img > threshold * 255);
labeled_img = bwlabel(bw_img);

new_db = [];
 
    %Area
    area = regionprops(bw_img,'Area');
    
    %Centroid
    centroid = regionprops(bw_img,'Centroid');
    
    %ConvexArea
    convexarea = regionprops(bw_img,'ConvexArea');
    
    %Eccentricity
    eccentricity = regionprops(bw_img,'Eccentricity');
    
    %EquivDiameter
    eDiameter = regionprops(bw_img,'EquivDiameter');
    
    %Euler Number
    Euler = regionprops(bw_img,'EulerNumber');
    
    %Extent
    extent = regionprops(bw_img,'Extent');
    
    %Extrema
    extrema = regionprops(bw_img,'Extrema');
    
    %FilledArea
    fArea = regionprops(bw_img,'FilledArea');
    
    %Major Axis Length
    MajorA = regionprops(bw_img,'MajorAxisLength');
    
    %Minor Axis Length
    MinorA = regionprops(bw_img,'MinorAxisLength');
    
    %Orientation
    oriantation = regionprops(bw_img,'Orientation');
    
    %Perimeter
    perimeter = regionprops(bw_img,'Perimeter');
    
    %Solidity
    solidity = regionprops(bw_img,'Solidity');
    
    %Max Intensity
    Max_Int = regionprops(bw_img,'MaxIntensity');
    
    %Mean Intensity
    Mean_int = regionprops(bw_img,'MeanIntensity');
    
    %Weighted Centroid
    Pixel_val = regionprops(bw_img,'WeightedCentroid');
    
    for label = 1:max(labeled_img(:))
    %object label
    vec = double(label);
    test_img = double(labeled_img == label);
    
    %Emin and Emax
    Emin = a*sin(theta).^2  - b*sin(theta)*cos(theta)   + c*cos(theta).^2;
    theta_2 = theta + (pi/2);
    Emax = a*sin(theta_2).^2 - b*sin(theta_2)*cos(theta_2) + c*cos(theta_2).^2;
    
    %roundedness
    roundedness = Emin/Emax;
    
    end

    
    %keep properties in the databas updated
    new_db = [area; centroid; convexarea; eccentricity; Eccentricity; eDiameter; 
        Euler; extent; extrema; fArea; MajorA; MinorA; oriantation; perimeter; 
        solidity; Max_Int; Mean_int; Pixel_val; roundness];

end

db = new_db;
end