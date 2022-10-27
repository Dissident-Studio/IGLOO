

ApplicationState = {}


function ApplicationState:new()
	
	-- Create instance
	local object = {}
	
	-- Set meta table
	setmetatable(object, self)
	self.__index = self
	
	return object
end

function ApplicationState:OnGamepadPressed(joystick, button)
	-- Do nothing
end
