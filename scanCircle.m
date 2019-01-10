function [data]=scanCircle(image, display_image, point, radius, look_angle)
        x = point(1);
        y = point(2);
        scan_start = x - radius;
        scan_end = x + radius;
        endpoint_left = coordinateFromPoint(point, look_angle - 90, radius);
        endpoint_right = coordinateFromPoint(point, look_angle + 90, radius);
        startAngle = look_angle - 91
        returnVal = true;
        for i = 1:1:180
                current_angle = startAngle + i
                [x1,y1] = coordinateFromPoint(point, current_angle, radius)
                if y1==0
                    y1=1
                end
                if x1==0
                    x1=1
                end
                scan_point = [x1,y1]
                if inImageBounds(image, scan_point(1), scan_point(2))
                        imageValue = image(scan_point(1),scan_point(2))
                        data(i,:) = [imageValue, scan_point(1), scan_point(2)]
                else
                        returnVal = false
                        break;
                end
        end
end