function sk = sketch()
    I=imread('C:\Users\Haowei Li\Desktop\eye\bigEye\3.jpg');  
    figure(1); 
    imshow(I);  
    info_size=size(I);  
    height=info_size(1);  
    width=info_size(2);  
    N=zeros(height,width);  
    G=zeros(height,width);  
rc = I(:,:,1);
gc = I(:,:,2);
bc = I(:,:,3);

channel = gc;
out=zeros(height,width);  

spec=zeros(height,width,3);  

for i=1:height  
    for j=1:width  
        N(i,j)=uint8(255-channel(i,j));   %double
    end  
end  

gausize = 600;     
gausigma = 650;   
GH = fspecial('gaussian', gausize, gausigma);
G = imfilter(N, GH);

for i=1:height  
    for j=1:width  
        b=double(G(i,j));  
        a=double(channel(i,j));  
        temp=a+a*b/(256-b);  
        out(i,j)=uint8(min(temp,255));  
    end  
end  
imwrite(out/255, 'sketch.jpg');
sk = out/255;
end
