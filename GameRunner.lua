--[[
	 ____  _         _   _         _      _____ _         _ _
	|    \|_|___ ___|_|_| |___ ___| |_   |   __| |_ _ _ _| |_|___
	|  |  | |_ -|_ -| | . | -_|   |  _|  |__   |  _| | | . | | . |
	|____/|_|___|___|_|___|___|_|_|_|    |_____|_| |___|___|_|___|

	This project is under the GNU GPLv3 license. Please refer to the LICENSE file for more informations

	Project			:	IGLOO
	Author			:	Yannis Beaux (Kranck) [yannis.beaux@dissidentstudio.fr]
	Date			:	26 / 10/ 2022
	Description		:	Base class to run a game in the application
--]]

GameRunner = {}

-- Instantiate a new game runner
function GameRunner:New()
	
	-- Create the class instance
	local object = {}
	
	-- Set metatable for this object 
	setmetatable(object, self)
	self.__index = self
	
	-- Variables
	self.m_handle = nil
	
	return object
end


function GameRunner:Launch(pathToExecutable)
	
	m_handle = io.popen(pathToExecutable)
	local result = handle:read("*a")
	
end
