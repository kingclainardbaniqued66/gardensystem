-- Lumin Hub Style Grow a Garden Weight & Auto Script
-- Made by GLockz

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LuminHubGarden"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Main Frame (Draggable)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 300)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "Lumin Hub - Grow a Garden"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = mainFrame

-- Fruit Weight Label
local weightLabel = Instance.new("TextLabel")
weightLabel.Size = UDim2.new(1, -20, 0, 50)
weightLabel.Position = UDim2.new(0, 10, 0, 50)
weightLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
weightLabel.TextColor3 = Color3.new(1,1,1)
weightLabel.Font = Enum.Font.GothamBold
weightLabel.TextSize = 18
weightLabel.Text = "Fruit Weight: N/A"
weightLabel.Parent = mainFrame

-- Utility function to update weight display (you must customize this to your game's fruit data)
local function updateWeight()
    local fruit = workspace:FindFirstChild("Fruit") -- example fruit object
    if fruit and fruit:FindFirstChild("Weight") then
        weightLabel.Text = "Fruit Weight: " .. tostring(fruit.Weight.Value)
    else
        weightLabel.Text = "Fruit Weight: N/A"
    end
end

-- Toggle Buttons Setup
local toggles = {
    {name = "Auto Plant", state = false},
    {name = "Auto Collect", state = false},
    {name = "Auto Delete Mutations", state = false},
    {name = "Auto Buy Merchant Stock", state = false},
    {name = "Auto Buy Zen Shop", state = false},
    {name = "Auto Buy Gear", state = false},
}

local toggleButtons = {}

local function createToggleButton(text, positionY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 320, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, positionY)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 16
    btn.Text = "❌ " .. text
    btn.Parent = mainFrame
    return btn
end

local yPos = 110
for i, toggle in ipairs(toggles) do
    local btn = createToggleButton(toggle.name, yPos)
    toggleButtons[i] = btn
    yPos = yPos + 40

    btn.MouseButton1Click:Connect(function()
        toggle.state = not toggle.state
        btn.Text = (toggle.state and "✅ " or "❌ ") .. toggle.name
    end)
end

-- Main Loop for toggles (customize as needed)
spawn(function()
    while true do
        updateWeight()
        if toggles[1].state then -- Auto Plant
            local plantRemote = ReplicatedStorage:FindFirstChild("Plant")
            if plantRemote then
                plantRemote:FireServer()
            end
        end

        if toggles[2].state then -- Auto Collect
            local collectRemote = ReplicatedStorage:FindFirstChild("Collect")
            if collectRemote then
                collectRemote:FireServer()
            end
        end

        if toggles[3].state then -- Auto Delete Mutations (example check)
            for _, fruit in ipairs(workspace:GetChildren()) do
                if fruit.Name == "Fruit" and fruit:FindFirstChild("Mutation") and fruit.Mutation.Value == true then
                    fruit:Destroy()
                end
            end
        end

        if toggles[4].state then -- Auto Buy Merchant Stock
            local buyRemote = ReplicatedStorage:FindFirstChild("Buy")
            if buyRemote then
                buyRemote:FireServer("MerchantStock")
            end
        end

        if toggles[5].state then -- Auto Buy Zen Shop
            local buyRemote = ReplicatedStorage:FindFirstChild("Buy")
            if buyRemote then
                buyRemote:FireServer("ZenShop")
            end
        end

        if toggles[6].state then -- Auto Buy Gear
            local buyRemote = ReplicatedStorage:FindFirstChild("BuyGear")
            if buyRemote then
                buyRemote:FireServer()
            end
        end

        wait(1)
    end
end)
