clear all;
cam = webcam('CEVCECM');
RESOLUTION_X = 320; 
RESOLUTION_Y = 240;
% This is half the width of the line at the bottom of the screen that we start looking for the line we want to follow.
SCAN_RADIUS = RESOLUTION_X/4;
% Start the scan height 10 pixels from the bottom.
SCAN_HEIGHT = RESOLUTION_Y - 10;
% This is our centre. We assume that we want to try and track the line in relation to this point
SCAN_POS_X = RESOLUTION_X / 2;
% This is the radius that we scan from the last known point for each of the circles
SCAN_RADIUS_REG = 50;
% The number of itterations we scan to allow us to look ahead and give us more time to make better choices
NUMBER_OF_CIRCLES =0;
% while(1)
    img = snapshot(cam);
    gray=rgb2gray(img);
    intImage = integralImage(gray);
    avgH = integralKernel([1 1 7 7], 1/49);
    J = integralFilter(intImage, avgH);
    blur = uint8(J);
    threshold = [0.3 0.6];
    edged = edge(blur,'Canny',threshold);
    edged =uint8(edged);
    subplot(2,1,2);
    imshow(edged)
    [a,b]=find(edged(SCAN_HEIGHT,:)==1)
    gray(b)=255
    subplot(2,1,1);
    imshow(gray)
%     subplot(2,1,2);
%     imshow(edged);
    center_point = [SCAN_POS_X, SCAN_HEIGHT];
    scan_data = scanline(gray, img , center_point, SCAN_RADIUS);
    [x,y] = findLine(img, scan_data, SCAN_POS_X, SCAN_HEIGHT, SCAN_RADIUS);
    point_on_line=[x,y];
    scan_data = scanCircle(gray, img, point_on_line, SCAN_RADIUS_REG, -90);
     previous_point = point_on_line;
     last_point = findInCircle(img, scan_data);
    line_length_from_center = lineLength(center_point, last_point);
     %angle=lineAngle(center_point, last_point) *-1 -90;
%end

   
