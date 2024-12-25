function [IsNotNumber,Answer,Loss] = AnswerCheck(RandomNumber,handelSound,handelFs,laughterSound,laughterFs,Loss)
            Answer = input("Take your best guess! ","s"); % After a number is chosen by MATLAB after difficulty selection, it's your turn to guess
            if Answer == RandomNumber % Checks if answer is correct: It does this by seeing if the strings match
                disp("Congratulations! You did it! The answer was:"); % Congratulates user if answer is correct and reveals number
                disp(RandomNumber);
                sound(handelSound,handelFs);
                %Code below is to add to the number of wins
                Wins = fileread('WinRecord.txt');
                Score = fopen('WinRecord.txt', 'w'); % Opens File                
                Wins = str2double(Wins);
                Wins = Wins + 1; % Adds to the number of wins when you win
                fprintf(Score,'%d',Wins); % Updates the amount of points you have
                fclose(Score); % Close the file
                % --------------------------------------
                % Code below is to add to the number of total games played
                Total = fileread('TotalRecord.txt');
                Plays = fopen('TotalRecord.txt','w');
                Total = str2double(Total);
                Total = Total + 1; % Adds to the number of total games when you win or lose
                fprintf(Plays,'%d',Total);
                fclose(Plays);
                % --------------------------------------
                IsNotNumber = false; % Exits while
            elseif all(isstrprop(Answer, 'digit')) == false % Checks if the input string is actually a number: Only necessary if the strings don't match
                disp("It's called 'Random Number Guesser', please choose a number!");
                IsNotNumber = true; % Statement remains true, so it will ask for a new input for your guess
            else % Only other possible outcome is incorrect answer: The input string actually is a number but it wasn't the correct one
                Loss = Loss + 1; % Tallies the number of fails to give the correct answer, allowing up to 3 total guesses 
                switch Loss
                    case 1
                        disp("That's strike one!");
                        pause(1)
                        IsNotNumber = true;
                    case 2
                        disp("Last chance!")
                        pause(1)
                        RandomNumberDouble = str2double(RandomNumber); % Converts RandomNumber from a string to a number to be able to give a hint
                        AnswerDouble = str2double(Answer); % We also need the answer to be converted back to a number for the comparison to work
                        if AnswerDouble > RandomNumberDouble
                            disp('Hint:Try going a little lower!');
                        else
                            disp('Hint:Try going a little higher!');
                        end
                        pause(1);
                        IsNotNumber = true;
                    otherwise
                        % Code below is to add to the number of total games played
                        Total = fileread('TotalRecord.txt');
                        Plays = fopen('TotalRecord.txt','w');
                        Total = str2double(Total);
                        Total = Total + 1; % Adds to the number of total games when you win or lose
                        fprintf(Plays,'%d',Total);
                        fclose(Plays);
                        % --------------------------------------
                        disp("Oooh, Eesh, Aah, better luck next time (:");
                        disp("The real answer, the one that you couldn't guess was:");
                        sound(laughterSound,laughterFs); % Makes fun of user and reveals number
                        disp(RandomNumber);
                        IsNotNumber = false; % Exits while
                end
            end
end