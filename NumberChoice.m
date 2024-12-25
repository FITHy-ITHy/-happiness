function [Difficulty,RandomNumber] = NumberChoice(Difficulty)
    if Difficulty == "Easy"
        RandomNumber = randi([1,10],1);
        RandomNumber = num2str(RandomNumber);
    elseif Difficulty == "Medium"
        RandomNumber = randi([1,100],1);
        RandomNumber = num2str(RandomNumber);
    elseif Difficulty == "Hard"
        RandomNumber = randi([1,1000],1);
        RandomNumber = num2str(RandomNumber);
    else
    Difficulty = 0;
    disp("That is not one of your options, now please");
    RandomNumber = NaN; % Needed otherwise function is invalid since RandomNumber won't have an output
    end
end