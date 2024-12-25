function Menu = RandomNumberGuesserStats
       Wins = fileread('WinRecord.txt');
                if Wins == "1"
                fprintf('You Have 1 Win!\n');
                else
                fprintf('You have %s Wins!\n',Wins);
                end
                Total = fileread('TotalRecord.txt');
                if Total == "1"
                fprintf('You have played 1 game!\n');
                else 
                fprintf('You have played %s Games!\n',Total);
                end
                Ratio = str2double(Wins)/(str2double(Total)-str2double(Wins)); % Calculates the Win-to-Loss Ratio
                if Ratio <= 0 || Ratio == Inf
                fprintf('Win-to-Loss Ratio: N/A\n\n');
                else
                fprintf('Win-to-Loss Ratio: %.2f \n\n',Ratio);
                end
                disp("Press Enter to return to the main menu");
                input('', 's'); % Waits for the user to press Enter (accepts any input as a string)
                Menu = "InMenu";
                disp("You are now back in the main menu.");
end