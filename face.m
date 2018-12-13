%processing tool box
clear all
clc
close all
 
FDetect = vision.CascadeObjectDetector;
 
I = imread('sketch.jpg');
NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
face_dtect=step(NoseDetect,I);
figure(2),
imshow(I); hold on
nose = imcrop(I, face_dtect);
imwrite(nose, 'nose.jpg');
for i = 1:size(face_dtect,1)
    rectangle('Position',face_dtect(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','m');
end
title('Nose Detection');
hold off;
 
mouth_detect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
mouth_detect.MergeThreshold = 200;
face_dtect=step(mouth_detect,I);

figure(3),
imshow(I); hold on
mouth = imcrop(I, face_dtect);
imwrite(mouth, 'mouth.jpg');
for i = 1:size(face_dtect,1)
 rectangle('Position',face_dtect(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('Mouth Detection');
hold off;

eyes_detect = vision.CascadeObjectDetector('EyePairBig', 'MergeThreshold', 10);
face_dtect = step(eyes_detect, I);
figure(4);
imshow(I); hold on
eyes = imcrop(I, face_dtect);
imwrite(eyes, 'eyes.jpg');
for i = 1:size(face_dtect,1)
 rectangle('Position',face_dtect(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
title('eyes Detection');
hold off;