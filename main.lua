--[[
	 ____  _         _   _         _      _____ _         _ _
	|    \|_|___ ___|_|_| |___ ___| |_   |   __| |_ _ _ _| |_|___
	|  |  | |_ -|_ -| | . | -_|   |  _|  |__   |  _| | | . | | . |
	|____/|_|___|___|_|___|___|_|_|_|    |_____|_| |___|___|_|___|

	This project is under the GNU GPLv3 license. Please refer to the LICENSE file for more informations

	Project			:	IGLOO
	Author			:	Yannis Beaux (Kranck) [yannis.beaux@dissidentstudio.fr]
	Date			:	26 / 10/ 2022
	Description		:	Main entry point for the IGLOO application
--]]

-- TODO: Custom error handler : http://www.love2d.org/wiki/love.errorhandler

-- Require all IGLOO constants
require "IGLOOConstants"

-- Require the IGLOO logger
require "IGLOOLogger"

-- Require ImGUI
require "imgui"

-- TODO
--require "GameRunner"

G_DisplayDebugMenu = false
G_CurrentConfiguration = nil	-- The configuration of this application instance (loaded when the game loads)


function love.load()
	
	-- Enable ZeroBrane Löve2D debug
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	
	-- Check if the current folder has a config
	configFileInfos = love.filesystem.getInfo(G_IGLOOConfigFilename)
	if nil == configFileInfos then
		IGLOO_LOG_ERROR("No configuration found ! Ensure you have a " .. G_IGLOOConfigFilename .. " in your folder")
		return
	end
	
	-- Load the config file
	configFileChunk = love.filesystem.load(G_IGLOOConfigFilename)
	
	-- Now execute the loading chunk safely by using pcall
	local chunkExecuteResult
	chunkExecuteResult, G_CurrentConfiguration = pcall(configFileChunk)
	if not chunkExecuteResult then
		IGLOO_LOG_ERROR("Failed executing config file : " .. G_CurrentConfiguration)
		return
	end
	
	love.window.setFullscreen(true)
end

function love.update(dt)
	
	imgui.NewFrame()
	
end


function love.draw()
	
	--imgui.SetNextWindowPos
	imgui.Begin("Debug Window")
	
	if imgui.TreeNode("Games") then
	
		
		for key, value in pairs(G_LauncherConfig) do
		
			if imgui.TreeNode(value.Name) then
				imgui.Text(value.Company)
				
				if value.Folder ~= nil then
					if imgui.Button("Launch") then
						local wd = love.filesystem.getWorkingDirectory()
						local command = '"' .. wd .. "/" .. value.Folder .. "/" .. value.Executable .. '"'
						print("Launching : " .. command)
						
--						local gr = GameRunner:New()
--						gr:Launch(command)
						
					end
				end
				
				imgui.TreePop()
			end
			
		end
		
		imgui.TreePop()
	end
	
	
	
	
	imgui.End()
	
	imgui.ShowDemoWindow(true)
	
	if imgui.BeginMainMenuBar() then
		if imgui.BeginMenu("File") then
			imgui.MenuItem("Test")
			imgui.EndMenu()
		end
		imgui.EndMainMenuBar()
	end
	
	--[[local mouseX, mouseY = love.mouse.getPosition()
	
	if mouseX > 400 then
		love.graphics.setColor(0.5, 0.5, 0.5)
	else 
		love.graphics.setColor(1, 1, 1)
	end
	
	love.graphics.draw(img1, 0, 0, 0, 0.5, 0.5)
	
	if mouseX < 400 then
		love.graphics.setColor(0.5, 0.5, 0.5)
	else 
		love.graphics.setColor(1, 1, 1)
	end
	love.graphics.draw(img2, 400, 0, 0, 0.5, 0.5)--]]
	
	--
	-- Render IMGUI
	love.graphics.setColor(1, 1, 1)
	if G_DisplayDebugMenu then
		imgui.Render()
	end
end

function love.textinput(t)
	imgui.TextInput(t)
	if not imgui.GetWantCaptureKeyboard() then
		-- Pass event to the game
	end
end

function love.keypressed(key)
	
	if key == "f1" then
		G_DisplayDebugMenu = not G_DisplayDebugMenu
	end
	
	imgui.KeyPressed(key)
	if not imgui.GetWantCaptureKeyboard() then
		-- Pass event to the game
	end
end

function love.keyreleased(key)
	imgui.KeyReleased(key)
	if not imgui.GetWantCaptureKeyboard() then
		-- Pass event to the game
	end
end

function love.mousemoved(x, y)
	imgui.MouseMoved(x, y)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
	end
end

function love.mousepressed(x, y, button)
	imgui.MousePressed(button)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
	end
end

function love.mousereleased(x, y, button)
	imgui.MouseReleased(button)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
	end
end

function love.wheelmoved(x, y)
	imgui.WheelMoved(y)
	if not imgui.GetWantCaptureMouse() then
		-- Pass event to the game
	end
end

function love.gamepadpressed(joystick, button)
	
end
