function [x,y]= findLine(display_image, scan_data, x, y, radius)
       for index = 2, length(scan_data)
                data(index) = scan_data(index - 1) - scan_data(index)
       end                     
        scan_start = x - radius;
        scan_end = x + radius;
        left  =  zeros(2);
        right = zeros(2);
        
       for index = 1 , length(data)
                if data(index) > left(2)
                    left(2) = data(index);
                        left(1) = index;
                end
                if data(index) < right(2)
                        right(2) = data(index);
                        right(1) = index;
                end
        end
        line_position = (right(1) + left(1)) / 2;
        x=scan_start + line_position
        
        