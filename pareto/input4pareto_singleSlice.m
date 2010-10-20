function FitnessArray = input4pareto_singleSlice(min_bound, max_bound, spacing, dimension, fitness_functions, offset)
    points = make_grid(min_bound, max_bound, spacing, dimension);
    for d=1:dimension
        points(:,d) = points(:,d) + offset(:,d);
    end
    fitnesses = calcFitnesses(points, fitness_functions);
    frontier = paretofront(fitnesses);
    FitnessArray = points(frontier(:,1)==1,:);

