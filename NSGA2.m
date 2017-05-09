clc;
clear;
close all;

CostFunction=@(x) parabolas(x);      % Cost Function

nVar = 1;           %Number of Decision Variables
varSize=[1 nVar];   % Size of Decision Variables Matrix

%interval
varMin = -15;       
varMax = 17;

MaxIt=1000;         % Maximum Number of Iterations

nPop=20;            % Population Size

pCrossover=1.0; %100%                   % Crossover Percentage
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation=0.1; %10%                     % Mutation Percentage
nMutation=round(pMutation*nPop);        % Number of Mutants

%mu=0.02;                                % Mutation Rate

%sigma=0.1*(varMax-varMin);  % Mutation Step Size

individual.position=[];
individual.cost=[];
individual.rank=[];
individual.dominationSet=[];
individual.dominatedCount=[];
individual.crowdingDistance=[];clc;
clear;
close all;

CostFunction=@(x) parabolas(x);      % Cost Function

nVar = 1; %Number of Decision Variables
varSize=[1 nVar];   % Size of Decision Variables Matrix

varMin = -15;
varMax = 17;

MaxIt=1000;      % Maximum Number of Iterations

nPop=20;        % Population Size

pCrossover=0.7;                         % Crossover Percentage
nCrossover=2*round(pCrossover*nPop/2);  % Number of Parnets (Offsprings)

pMutation=0.4;                          % Mutation Percentage
nMutation=round(pMutation*nPop);        % Number of Mutants

mu=0.02;                    % Mutation Rate

sigma=0.1*(varMax-varMin);  % Mutation Step Size

%Definition individual
individual.position=[];
individual.cost=[];
individual.rank=[];
individual.dominationSet=[];
individual.dominatedCount=[];
individual.crowdingDistance=[];

pop=repmat(individual,nPop,1);





