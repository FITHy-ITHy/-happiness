function [Sound,SoundFrequency] = AssigningFile(File)
load(File);
Sound = y;
SoundFrequency = Fs;
end

