--[[
	 ____  _         _   _         _      _____ _         _ _
	|    \|_|___ ___|_|_| |___ ___| |_   |   __| |_ _ _ _| |_|___
	|  |  | |_ -|_ -| | . | -_|   |  _|  |__   |  _| | | . | | . |
	|____/|_|___|___|_|___|___|_|_|_|    |_____|_| |___|___|_|___|

	This project is under the GNU GPLv3 license. Please refer to the LICENSE file for more informations

	Project			:	IGLOO
	Author			:	Yannis Beaux (Kranck) [yannis.beaux@dissidentstudio.fr]
	Date			:	26 / 10/ 2022
	Description		:	Utility to simplify logging in the project
--]]

IglooLogger = {}

function IglooLogger:new()
	
	-- Create object
	local object = {}
	
	-- Set metatable
	setmetatable(object, self)
	self.__index = self
	
	return object
end

function IglooLogger:LogInfo(message)
	print("[IGLOO][Info] : " .. message)
end

function IglooLogger:LogWarning(message)
	print("[IGLOO][Warning] : " .. message)
end

function IglooLogger:LogError(message)
	if not love.filesystem.isFused() then 
		assert(false, message) -- Throw the error is the app is not packaged 
	else 
		print("[IGLOO][Error] : " .. message)
	end
end

-- Global instance and helper functions

G_IGLOOLogger = IglooLogger:new()

function IGLOO_LOG_INFO(message)
	G_IGLOOLogger:LogInfo(message)
end

function IGLOO_LOG_WARNING(message)
	G_IGLOOLogger:LogWarning(message)
end

function IGLOO_LOG_ERROR(message)
	G_IGLOOLogger:LogError(message)
end

-- TODO: Move this elsewhere
IGLOO_ASSERT = assert