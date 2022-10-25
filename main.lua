
require "imgui"
require "GameRunner"

G_LauncherConfig = require "config"
G_DisplayDebugMenu = false

function love.load()
	if arg[#arg] == "-debug" then require("mobdebug").start() end
	
	img1 = love.graphics.newImage("img_1.png")
	img2 = love.graphics.newImage("img_2.png")
	
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
						
						local gr = GameRunner:New()
						gr:Launch(command)
						
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
	
	local mouseX, mouseY = love.mouse.getPosition()
	
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
	love.graphics.draw(img2, 400, 0, 0, 0.5, 0.5)
	
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

