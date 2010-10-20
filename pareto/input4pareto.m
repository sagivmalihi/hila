function FitnessArray = input4pareto(min_bound, max_bound, spacing, dimension, fitness_functions)
    MAX_POINTS = 150000
    num_points = ((max_bound - min_bound) / spacing) ^ dimension
    num_parts = floor((num_points / MAX_POINTS)^(1/dimension))
    new_spacing = spacing * num_parts;
    FitnessArray = [];
    offsets = make_grid(0, new_spacing, spacing, dimension);
    fprintf(1,'Total offsets to compute: %d', length(offsets));
    for i=1:length(offsets)
        if mod(i,10) == 0
            fprintf(1,'%d\r',i);
        end
        offset = offsets(i,:);
        result = input4pareto_singleSlice(min_bound + spacing*i, max_bound, new_spacing, dimension, fitness_functions, offset);
        FitnessArray = [FitnessArray; result];
    end

    fitnesses = calcFitnesses(FitnessArray, fitness_functions);
    frontier = paretofront(fitnesses);
    FitnessArray = FitnessArray(frontier(:,1)==1,:);


