function pop_c = mutation_children (pop_c)

    % Mutation
    for k=1:nMutation
        
        i=randi([1 nPop]);
        p=pop(i);
        
        pop_c(k).x = mutate(p.x,mu,sigma);
        
        pop_c(k).cost = cost_function(pop_c(k).position);
        
    end


end