function FitnessArray = input4pareto(min_bound, max_bound, step, dimension, fitness_functions, points2exclude)

if nargin == 5
    points2exclude = 0;
end

    points = make_grid(min_bound, max_bound, step, dimension);
    fitnesses = zeros(length(points), length(fitness_functions));
    for f=1:length(fitness_functions)
        fitnesses(:, f) = fitness_functions{f}(points);
    end
    FitnessArray = fitnesses;
     frontier = paretofront(fitnesses);
     FitnessArray = points(frontier(:,1)==1,:);

