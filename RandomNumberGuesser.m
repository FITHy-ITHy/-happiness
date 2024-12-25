function RandomNumberGuesser
    disp("Welcome to the Random Number Guesser!") % Where your chances of actually guessing correctly are extremely low!")
    [gongSound,gongFs] = AssigningFile("gong.mat");
    [handelSound,handelFs] = AssigningFile("handel.mat");
    [laughterSound,laughterFs] = AssigningFile("laughter.mat");
    Difficulty = 0; % Initial value for Difficulty outside of its valid range
    pause(1.5); % Above, Resources are loaded in, MATLAB then takes 1.5 seconds to create an effect of "waiting for the game to start"
    Menu = "InMenu"; % Places the user into the main menu
    Guide = fileread('RandomNumberGuesserGuide.txt'); % Read's Guide's .txt file
    disp("You are now in the main menu.");
    while Menu == "InMenu"
        Menu = input("What would you like to do? \nGuide     Game     Stats     Quit \n","s"); % Initiates the Main Menu
        switch Menu
            case "Guide" % This is the guide page
                disp(Guide); % Displays the guide
                disp("Press Enter to return to the main menu");
                input('', 's'); % Waits for the user to press Enter (accepts any input as a string)
                Menu = "InMenu";
                disp("You are now back in the main menu.");
            case "Game" % This is the game page
                Play = true; % Initial Condition to allow the game to start
                RandomNumberGuesserGame(Play,gongSound,gongFs,laughterSound,laughterFs,handelSound,handelFs,Difficulty); % Runs the Random Number Guesser Game!
                Menu = "InMenu";
                disp("You have been returned to the main menu.");
            case "Stats" % Displays Stats
                Menu = RandomNumberGuesserStats; % Displays Stats using Stats function which outputs Menu to know to return back to the main menu
            case "Quit" % This will quit you from the game
                pause(1);
                disp("Alrighty");
                disp("See you later!");
            otherwise % If you don't choose, you'll be allowed to choose again
                pause(3);
                disp("If there was another option, I would've given it to you!");
                pause(0.5);
                disp("Now please, choose from the options I gave you!");
                pause(1);
                Menu = "InMenu";
        end
    end
% RandomNumberGuesserGame - Executes the Random Number Guesser Game
% Inputs: 
%   - Play: Boolean indicating if the game is running
%   - gongSound, gongFs, laughterSound, laughterFs, handelSound, handelFs: Audio resources
%   - Difficulty: Initial difficulty value
% Output: 
%   - Play: Updated boolean indicating if the game continues
