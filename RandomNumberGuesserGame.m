function Play = RandomNumberGuesserGame(Play,gongSound,gongFs,laughterSound,laughterFs,handelSound,handelFs,Difficulty)

 while Play == true
        IsNotNumber = true; % As long as this is true, the program will not proceed as the guess wasn't a number or hasn't been made yet
        Replay = 1; % As long as Replay equals 1, Play won't be set to false 
        while Difficulty == 0
            sound(gongSound, gongFs);
            Difficulty = input("Choose a difficulty: Easy, Medium, Hard: ","s"); % Takes difficulty inputs
            [Difficulty,RandomNumber] = NumberChoice(Difficulty); % Takes Difficulty input to know what number to generate, if the input
            % if the input above is invalid, the Difficulty will be set to the value 0 in order for the loop to cycle back, also turns numbers to strings
        end
        Loss = 0; % Initial condition to allow up to 3 chances
        while IsNotNumber == true % Ensures the number you guess is actually a number
            % After a number is chosen by MATLAB after difficulty selection, it's your turn to guess
            [IsNotNumber,Answer,Loss] = AnswerCheck(RandomNumber,handelSound,handelFs,laughterSound,laughterFs,Loss); % Checks to see if the answer is valid and correct
        end
        while Replay == 1
            Replay = input("Would you like to play again: Yes or No? ","s"); % Ask if user would like to replay
            [Play,Replay,Difficulty] = ReplayCheck(Replay,Answer,RandomNumber,handelSound,handelFs); % Redifines Play, Difficulty, and Replay if needed
        end

end