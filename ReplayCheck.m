function [Play,Replay,Difficulty] = ReplayCheck(Replay,Answer,RandomNumber,handelSound,handelFs)
        Difficulty = 0; % Value doesn't matter unless user decides to replay
        Play = true; % This will remain true unless user decides they donn't want to replay
        if Replay == "Yes" % If the initial condition is the same, meaning the user picked yes, the while will cycle again
            disp("Alright, let's go then!");
        elseif Replay == "No" % The user chose to not play anymore, so Play value is no longer 'No'
            if Answer ~= RandomNumber
                    pause(1);
                    disp("Okay, bye then!"); % Makes fun of user if their last answer was wrong
                    pause(2);
                    disp("Loser!")
                    Replay = 0;
                    Play = false; % Ends Game
            else
                    disp("Congratulations once again! "); % Gives one last congratulations before departure
                    sound(handelSound,handelFs);
                    Replay = 0;
                    Play = false; % Ends Game
            end
         else % If the user chooses an answer other than "Yes" or "No", they'll recieve this message and will be asked again
                pause(1);
                disp("You have two options moron, pick one! ");
                pause(2);
                Replay = 1;
        end
end