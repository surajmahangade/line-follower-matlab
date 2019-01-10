function position = findInCircle(display_image, scan_data)
         data=zeros(length(scan_data(:,1))-1)
         data(1,1)=0
         data(length(scan_data)-1,1)=0
         for index = 2:1: length(scan_data)
                data(index) = scan_data(index - 1,1) - scan_data(index,1)
         end
         left = ones(2)
         right = ones(2)
         data
         for index =1:1: length(data)
                if data(index) > left(2)
                        left(2) = data(index)
                        left(1) = index
                end
                if data(index) < right(2)
                        right(2) = data(index)
                        right(1) = index
                end
         end
        leftx = scan_data(left(1),2)
        lefty = scan_data(left(1),3)
        lefti = left(1)
        rightx = scan_data(right(1),2)
        righty = scan_data(right(1),3)
        righti = right(1)
        centre_index = round((righti + lefti)/2)
        position = [scan_data(centre_index,2), scan_data(centre_index,3)]
end