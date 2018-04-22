function x_init = get_init_point(T)
    [n, p] = size(T);
    vitual_point = [];
    for c = 1:p
        vitual_point = [vitual_point min(T(:,c))];
    end
    diffT = setdiff(T, vitual_point, 'rows');
    d = distance2(diffT, vitual_point)';
    [minValue, indMin] = min(d(:));
    x_init = diffT(indMin, 1:end);
end