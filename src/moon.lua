__name__ = "Palatka - Arizona RP"
__build__ = 3295
__rev__ = 3

if doesFileExist(getWorkingDirectory() .. "\\config\\" .. __name__ .. ".lua") then
	loadfile(getWorkingDirectory() .. "\\config\\" .. __name__ .. ".lua")()
else
	loadfile(getWorkingDirectory() .. "\\config\\" .. __name__ .. ".luac")()
end
