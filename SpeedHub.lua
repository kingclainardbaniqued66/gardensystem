-- SpeedHub for Grow a Garden Cheat GUI

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Create GUI
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
        local part = workspace:FindFirstChild(partName)
        if part and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 5, 0)
        end
    end)
end

createTP("Gear Shop", 10, "GearShop")
createTP("Egg Shop", 120, "EggShop")

-- Auto Features
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

    local enabled = false
    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        btn.Text = (enabled and "✅ " or "❌ ") .. text
        callback(enabled)
    end)
    y = y + 40
end

addToggle("Auto Plant", function(enabled)
    while enabled do
        task.wait(1)
        local plant = ReplicatedStorage:FindFirstChild("Plant")
        if plant then plant:FireServer() end
    end
end)

addToggle("Auto Collect", function(enabled)
    while enabled do
        task.wait(0.5)
        local collect = ReplicatedStorage:FindFirstChild("Collect")
        if collect then collect:FireServer() end
    end
end)

addToggle("Auto Buy", function(enabled)
    while enabled do
        task.wait(2)
        local buy = ReplicatedStorage:FindFirstChild("Buy")
        if buy then buy:FireServer("Seed1") end
    end
end)

-- Notification
local notice = Instance.new("TextLabel", screenGui)
notice.Text = "SpeedHub Loaded"
notice.Size = UDim2.new(1,0,0,20)
notice.Position = UDim2.new(0,0,1,-20)
notice.BackgroundTransparency = 1
notice.TextColor3 = Color3.fromRGB(0,255,0)
notice.TextSize = 14
