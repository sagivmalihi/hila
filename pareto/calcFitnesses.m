function fitnesses = calcFitnesses(points, fitness_functions)
    fitnesses = zeros(length(points), length(fitness_functions));
    
    for f=1:length(fitness_functions)
        fitnesses(:, f) = fitness_functions{f}(points);
    end
 
