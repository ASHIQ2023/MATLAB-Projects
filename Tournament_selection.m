% Prompt the user for the number of values to enter
No_of_input = input('How many values do you want to enter: ');

% Initialize arrays to store strings and fitness values
Strings = cell(No_of_input, 1);
Fitness = zeros(No_of_input, 1);

% Loop to input values
for i = 1:No_of_input
    Strings{i} = input('Enter the string value: ', 's');
    Fitness(i) = input('Enter the fitness value: ');
end

% Create a table from the collected data
a = table(Strings, Fitness);

% Determine tournament size
if mod(height(a), 2) == 0
    tournament_size = height(a) / 2 + 1;
else
    tournament_size = height(a);
end

% Convert tournament size to integer
tournament_size = int64(tournament_size);

% Initialize cell array to store chosen strings and fitness
parents = cell(tournament_size, 2);

% Perform tournament selection
for i = 1:tournament_size
    tournament = randsample(height(a), 2); % Select two individuals randomly
    if a.Fitness(tournament(1)) > a.Fitness(tournament(2))
        parents{i, 1} = a.Strings{tournament(1)};
        parents{i, 2} = a.Fitness(tournament(1));
    else
        parents{i, 1} = a.Strings{tournament(2)};
        parents{i, 2} = a.Fitness(tournament(2));
    end
end

% Create a table for chosen strings and fitness
chosen_string = cell2table(parents, 'VariableNames', {'Chosen_String', 'Chosen_Fitness'});

% Concatenate original data with chosen strings and fitness
final_results = [a, chosen_string];

% Display the final results
disp(final_results);