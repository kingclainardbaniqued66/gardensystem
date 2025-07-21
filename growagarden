-- Grow a Garden Script UI by @yourname
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleGarden"
toggleButton.Text = "Toggle"
toggleButton.Size = UDim2.new(0, 100, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0.5, -20)
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 170, 40)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Parent = PlayerGui:WaitForChild("ScreenGui") or Instance.new("ScreenGui", PlayerGui)

-- Create Main Garden Menu
local gardenFrame = Instance.new("Frame")
gardenFrame.Size = UDim2.new(0, 300, 0, 200)
gardenFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
gardenFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
gardenFrame.Visible = false
gardenFrame.Active = true
gardenFrame.Draggable = true
gardenFrame.Parent = PlayerGui.ScreenGui

-- Teleport Buttons
local eggShop = Instance.new("TextButton")
eggShop.Text = "Egg Shop"
eggShop.Size = UDim2.new(0, 100, 0, 30)
eggShop.Position = UDim2.new(0, 10, 0, 10)
eggShop.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
eggShop.Parent = gardenFrame

local gearShop = Instance.new("TextButton")
gearShop.Text = "Gear Shop"
gearShop.Size = UDim2.new(0, 100, 0, 30)
gearShop.Position = UDim2.new(0, 120, 0, 10)
gearShop.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
gearShop.Parent = gardenFrame

-- Toggle Menu Visibility
toggleButton.MouseButton1Click:Connect(function()
    gardenFrame.Visible = not gardenFrame.Visible
end)

-- Teleport Actions (example)
eggShop.MouseButton1Click:Connect(function()
    if workspace:FindFirstChild("EggShop") then
        Player.Character:MoveTo(workspace.EggShop.Position)
    end
end)

gearShop.MouseButton1Click:Connect(function()
    if workspace:FindFirstChild("GearShop") then
        Player.Character:MoveTo(workspace.GearShop.Position)
    end
end)
