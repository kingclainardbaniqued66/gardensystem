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
    toggle.TextColor3 = Color3.new(1,1,1)
    toggle.Parent = mainFrame
    local toggled = false
    toggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        toggle.Text = (toggled and "✅ " or "❌ ") .. text
        onToggle(toggled)
    end)
end

createToggleFeature("Auto Plant", 80, function(on)
    while on and wait(1) do
        game:GetService("ReplicatedStorage").Plant:FireServer()
    end
end)

createToggleFeature("Auto Collect", 120, function(on)
    while on and wait(0.5) do
        game:GetService("ReplicatedStorage").Collect:FireServer()
    end
end)

createToggleFeature("Auto Buy", 160, function(on)
    while on and wait(2) do
        game:GetService("ReplicatedStorage").Buy:FireServer("Seed1") -- Edit as needed
    end
end)

-- Scrollable Buy List (Optional if game has many seeds/tools)
-- You can add this later based on real buttons/items in game

-- Notification
local notice = Instance.new("TextLabel")
notice.Text = "SpeedHub Loaded for Grow a Garden"
notice.Size = UDim2.new(1, 0, 0, 20)
notice.Position = UDim2.new(0, 0, 1, -20)
notice.BackgroundTransparency = 1
notice.TextColor3 = Color3.new(0,1,0)
notice.TextSize = 14
notice.Parent = screenGui
.Character then
		Player.Character:MoveTo(egg.Position)
	end
end)

gearShop.MouseButton1Click:Connect(function()
	local gear = workspace:FindFirstChild("GearShop")
	if gear and Player.Character then
		Player.Character:MoveTo(gear.Position)
	end
end)
