function [x,y]=coordinateFromPoint(origin, angle, radius)
        xo = origin(1);
        yo = origin(1);
        %x = xo - radius * cosd(rad2deg(angle))
        %y = yo + radius * sind(rad2deg(angle))
        cos=cosd(angle)
        sin=sind(angle)
        x = xo - radius * cosd(angle)
        y = yo + radius * sind(angle)
        x = round(x);
        y = round(y);
end