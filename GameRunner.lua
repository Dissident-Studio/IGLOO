
GameRunner = {}

function GameRunner:New(object)
	object = object or {}
	setmetatable(object, self)
	self.__index = self
	
	self.m_handle = nil
	
	return object
end


function GameRunner:Launch(pathToExecutable)
	
	m_handle = io.popen(pathToExecutable)
	local result = handle:read("*a")
	
end
