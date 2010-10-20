function grid = make_grid(min_bound, max_bound, step, dimension)
    [grid_notflat{1:dimension}] = ndgrid(min_bound:step:max_bound);
    npoints = numel(grid_notflat{1}); % = ((max_bound - min_bound) / step) ^ dimension ?
    grid = zeros(npoints, dimension);
    for d=1:dimension
        grid(:, d) = grid_notflat{d}(:);
    end
end
