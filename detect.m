function face = detect(filename)
faceDetector=vision.CascadeObjectDetector('FrontalFaceCART');
img=imread(filename);
img_gray=rgb2gray(img); 
BB=step(faceDetector,img_gray);
figure(1);
J = imcrop(img, BB);
imshow(J);
title('Detected face');
imwrite(J,'face.jpg');
face = J;
end