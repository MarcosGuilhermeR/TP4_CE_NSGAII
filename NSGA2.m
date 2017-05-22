clc;
clear;
close all;

nVar = 1;           %Number of Decision Variables
varSize=[1 nVar];   % Size of Decision Variables Matrix

%interval
varMin = -15;
varMax = 17;

MaxIt=50;         % Maximum Number of Iterations

nPop=20;            % Population Size

pCrossover=1.0; %100%                   % Crossover Percentage
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation=0.1; %10%                     % Mutation Percentage
nMutation=round(pMutation*nPop);        % Number of Mutants

%Definition individual
individual.x=[];
individual.cost=[];
individual.rank=[];
individual.dominationSet=[];
individual.dominatedCount=[];
individual.crowdingDistance=[];

%Create clean population
pop=repmat(individual,nPop,1);

%Generate initial population
for i=1:nPop
    
    pop(i).x=unifrnd(varMin,varMax,varSize);
    pop(i).cost= cost_function(pop(i).x);
end

nit = 0;
while nit < MaxIt
    %Crossover
    pop_c = generate_population_children (pop, nPop, nCrossover, individual);
    
    %mutation
    pop_c = mutation_childrens (pop_c, nMutation);
    
    %merge
    pop = [pop; pop_c];
    
    %fast_non_dominated_sort
    [pop, F]=fast_non_dominated_sort(pop);
    
    
    %Print Fronts
%     nf = numel(F);
%     
%     for i=1: nf
%         fprintf('Fronteira %i',i); disp(F{i})
%     end
    
    %calculate crowding distance
    pop = crowding_distance(pop, F);
    
    %main loop
    i=1;
    popn = [];
    
    np = 0;
    nf = numel(F{1});
    while (np + nf <= nPop)
        
        popn = [popn; pop([F{i}])];
        
        i= i + 1;
        
        np = numel(popn);
        nf = numel(F{i});
    end
    
    % Sort Based on Crowding Distance
    popr = pop(F{i});
    [~, CDSO]=sort([popr.crowdingDistance],'descend');
    
    popr = popr(CDSO);
    popn=[popn; popr(1: nPop-np)];
    
    pop = popn;
    
    %fast_non_dominated_sort
    [~, F]=fast_non_dominated_sort(pop);
    
    % Show Iteration Information
    disp(['Iteration ' num2str(nit) ': Number of F1 Members = ' num2str(numel(F{1}))]);
    
    % Plot F1 Costs
    figure(1);
    plot_costs(pop);
    pause(0.01);
    
    nit = nit + 1;
end



