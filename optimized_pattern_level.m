function [T] = optimized_pattern_level(T, Ty, dist_y_star)
for c = 1: size(Ty,1)
    oneTy = Ty{c};
    for i = 2:size(oneTy,1)
        if(distance2(oneTy(i,:), oneTy(1,:))) < 0.5*dist_y_star(c)
            T = setdiff(T, oneTy(i,:), 'rows');
        end
    end
end
end