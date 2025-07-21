-- Grow a Garden Script UI by @yourname
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Create or get ScreenGui
local screenGui = PlayerGui:FindFirstChild("GardenGUI") or Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "GardenGUI"
screenGui.ResetOnSpawn = false

-- Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleGarden"
toggleButton.Text = "🌱 Garden"
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 170, 40)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.GothamBold
-- SpeedHub for Grow a Garden Cheat GUI
-- paste this entire block in your GardenSystem.lua

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "SpeedHubGarden"
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 300)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Text = "SpeedHub - Grow a Garden"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

-- Teleport Buttons
local function createTP(text, x, partName)
    local btn = Instance.new("TextButton", mainFrame)
    btn.Text = text
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = UDim2.new(0, x, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.MouseButton1Click:Connect(function()
        local p = workspace:FindFirstChild(partName)
        if p and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = p.CFrame + Vector3.new(0,5,0)
        else
            warn(partName.." part not found!")
        end
    end)
end

createTP("Gear Shop", 10, "GearShop")
createTP("Egg Shop", 120, "EggShop")

-- Auto Feature Toggles
local y = 80
local function addToggle(text, callback)
    local btn = Instance.new("TextButton", mainFrame)
    btn.Text = "❌ " .. text
    btn.Size = UDim2.new(0, 320, 0, 30)
    btn.Position = UDim2.new(0, 15, 0, y)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14

    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        btn.Text = (on and "✅ " or "❌ ") .. text
        callback(on)
    end)
    y = y + 40
end

addToggle("Auto Plant", function(on)
    spawn(function()
        while on do
            wait(1)
            ReplicatedStorage:FindFirstChild("Plant"):FireServer()
        end
    end)
end)

addToggle("Auto Collect", function(on)
    spawn(function()
        while on do
            wait(0.5)
            ReplicatedStorage:FindFirstChild("Collect"):FireServer()
        end
    end)
end)

addToggle("Auto Buy", function(on)
    spawn(function()
        while on do
            wait(2)
            ReplicatedStorage:FindFirstChild("Buy"):FireServer("Seed1")
        end
    end)
end)

-- Notification
local notice = Instance.new("TextLabel", screenGui)
notice.Text = "SpeedHub Loaded"
notice.Size = UDim2.new(1,0,0,20)
notice.Position = UDim2.new(0,0,1,-20)
notice.BackgroundTransparency = 1
notice.TextColor3 = Color3.fromRGB(0,255,0)
notice.TextSize = 14
toggleButton.TextSize = 16
toggleButton.Parent = screenGui

-- Garden Menu Frame
local gardenFrame = Instance.new("Frame")
gardenFrame.Size = UDim2.new(0, 320, 0, 240)
gardenFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
gardenFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
-- SpeedHub GUI for Grow a Garden by @yourname
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui", PlayerGui)
screenGui.Name = "SpeedHubGarden"
screenGui.ResetOnSpawn = false

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 250)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "SpeedHub - Grow a Garden"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

-- Top Buttons
local function createTopButton(text, xOffset, action)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = UDim2.new(0, xOffset, 0, 40)
    button.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
    button.TextColor3 = Color3.new(1,1,1)
    button.Parent = mainFrame
    button.MouseButton1Click:Connect(action)
end

createTopButton("Gear Shop", 10, function()
    if workspace:FindFirstChild("GearShop") then
        Player.Character:MoveTo(workspace.GearShop.Position)
    end
end)

createTopButton("Egg Shop", 120, function()
    if workspace:FindFirstChild("EggShop") then
        Player.Character:MoveTo(workspace.EggShop.Position)
    end
end)

-- Auto Features
local function createToggleFeature(text, yOffset, onToggle)
    local toggle = Instance.new("TextButton")
    toggle.Text = text
    toggle.Size = UDim2.new(0, 320, 0, 30)
    toggle.Position = UDim2.new(0, 15, 0, yOffset)
    toggle.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ear = workspace:FindFirstChild("GearShop")
	if gear and Player.Character then
		Player.Character:MoveTo(gear.Position)
	end
end)
