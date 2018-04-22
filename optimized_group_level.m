function [T] = optimized_group_level(T, Ty, S, pre_max_dist, dist_y_star)
    sizePre = size(S,1) - 1;
    for c = 1:sizePre
        if(dist_y_star(c) > 2*pre_max_dist(c))
            T = setdiff(T, Ty{c}, 'rows');
        end
    end
end