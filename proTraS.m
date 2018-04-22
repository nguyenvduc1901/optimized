function [T,S] = proTraS(NT)
    [n, ~] = size(NT);
    eps = 0.1;
    cprintf('key', '\nDefault epsilon is %d.', eps);
    cprintf('Black','\n To modify it go to Line 3 in function ProTras\n');
    %Chuan hoa 
    T = normalize(NT);
    s = 1; %So luong diem dai dien 
    x_init = get_init_point(T);
    S = x_init;
    pre_max_dist = [];
    weight = [];
    Cost = 1;

    disp('ProTraS...Please wait.....');
    tic
    while Cost > eps
        weight = [];
        pre_max_dist = [];
        idMax = [];
        diffPoints = setdiff(T, S, 'rows');
        [m, p] = size(diffPoints);
        Ty = {};
        for i = 1:s
            Ty{i} = S(i, :);
        end
        %Tim khoang cach nho nhat cua mot diem den mot cum
        minValue = -1;
        indMin = -1 ;
        for l = 1:m 
            xl = diffPoints(l, 1:end);
            d = distance2(S, xl)';
            [minValue, indMin] = min(d(:));
            Ty{indMin} = [Ty{indMin}; xl];
        end
        MaxWD = 0; Cost = 0;
        y_star = -1;
        x_star = -1;

        idMax = [];
        for yk = 1:s
            dyk = sqrt(distance2(Ty{yk}, S(yk, 1:end))');
            [maxValue, indMax] = max(dyk(:));
            weightK = size(Ty{yk},1);
            pre_max_dist = [pre_max_dist maxValue];
            weight = [weight weightK];
            idMax = [idMax indMax];
        end
        maxW = max(weight);
        maxD = max(pre_max_dist);
        for j = 1: s
            pk = weight(j)*pre_max_dist(j)/(maxW*maxD);
            if (pk > MaxWD)
                MaxWD = pk;
                y_star= j;
                x_star = Ty{j}(idMax(j), :);
            end
            Cost = Cost + weight(j)*pre_max_dist(j);
        end
        S = [S; x_star];
        Cost = Cost/n;
        s = s + 1;
        
        %calculate dist_y_start 
        dist_y_star = sqrt(distance2(S(1:end-1,:), S(end,:)));
        %optimized 
        T = optimized_group_level(T, Ty, S, pre_max_dist, dist_y_star);
        T = optimized_pattern_level(T, Ty, dist_y_star)
    end
    toc
end

