function FitnessArray = input4pareto(min_bound, max_bound, step, dimension, fitness_functions, points2exclude)
    points = make_grid(min_bound, max_bound, step, dimension);
    fitnesses = zeros(length(points), length(fitness_functions));
    for f=1:length(fitness_functions)
        fitnesses(:, f) = fitness_functions{f}(points);
    end
    frontier = paretofront(fitnesses);
    FitnessArray = points(frontier);
end


function grid = make_grid(min_bound, max_bound, step, dimension)
    [grid_notflat{1:dimension}] = ndgrid(min_bound:step:max_bound);
    npoints = numel(grid_notflat{1}); % = ((max_bound - min_bound) / step) ^ dimension ?
    grid = zeros(npoints, dimension)
    for d=1:dimension
        grid(:, d) = grid_notflat{d}(:);
    end
end
