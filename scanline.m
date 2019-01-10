function data = scanline(image, display_image, point, radius)
        x = point(1);
        y = point(2);
        scan_start = x - radius;
        scan_end = x + radius;
        row=zeros(640)
        row = image(y,:)
        data = row(scan_start:scan_end)
        data
end
        