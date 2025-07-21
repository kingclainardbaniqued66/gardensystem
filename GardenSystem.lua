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
gardenFrame.BorderSizePixel = 0
gardenFrame.Visible = false
gardenFrame.Active = true
gardenFrame.Draggable = true
gardenFrame.Parent = screenGui

-- UI Corner
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = gardenFrame

-- Top Teleport Buttons (Egg + Gear)
local eggShop = Instance.new("TextButton")
eggShop.Text = "🥚 Egg Shop"
eggShop.Size = UDim2.new(0, 140, 0, 35)
eggShop.Position = UDim2.new(0, 10, 0, 10)
eggShop.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
eggShop.Font = Enum.Font.Gotham
eggShop.TextColor3 = Color3.new(1,1,1)
eggShop.TextSize = 14
eggShop.Parent = gardenFrame

local gearShop = Instance.new("TextButton")
gearShop.Text = "🛠️ Gear Shop"
gearShop.Size = UDim2.new(0, 140, 0, 35)
gearShop.Position = UDim2.new(0, 170, 0, 10)
gearShop.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
gearShop.Font = Enum.Font.Gotham
gearShop.TextColor3 = Color3.new(1,1,1)
gearShop.TextSize = 14
gearShop.Parent = gardenFrame

-- Toggle Menu Visibility
toggleButton.MouseButton1Click:Connect(function()
	gardenFrame.Visible = not gardenFrame.Visible
end)

-- Teleport Actions
eggShop.MouseButton1Click:Connect(function()
	local egg = workspace:FindFirstChild("EggShop")
	if egg and Player.Character then
		Player.Character:MoveTo(egg.Position)
	end
end)

gearShop.MouseButton1Click:Connect(function()
	local gear = workspace:FindFirstChild("GearShop")
	if gear and Player.Character then
		Player.Character:MoveTo(gear.Position)
	end
end)
