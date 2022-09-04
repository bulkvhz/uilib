-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local ButtonMenu = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local TextButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

--Properties:
local Lib = {}

function Lib:CreateMain()
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.350381672, 0, 0.190476179, 0)
	Frame.Size = UDim2.new(0, 500, 0, 360)

	UICorner.CornerRadius = UDim.new(0.0299999993, 10)
	UICorner.Parent = Frame

	ButtonMenu.Name = "ButtonMenu"
	ButtonMenu.Parent = ScreenGui
	ButtonMenu.BackgroundColor3 = Color3.fromRGB(88, 88, 88)
	ButtonMenu.BorderSizePixel = 0
	ButtonMenu.Position = UDim2.new(0.357977152, 0, 0.275297612, 0)
	ButtonMenu.Size = UDim2.new(0, 480, 0, 294)

	UICorner_3.CornerRadius = UDim.new(0.0299999993, 10)
	UICorner_3.Parent = ButtonMenu

	UIListLayout.Parent = ButtonMenu
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0.0175000001, 5)
end

function Lib:DraggingEnabled(frame, parent)

	parent = parent or frame

	
	local dragging = false
	local dragInput, mousePos, framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = parent.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	input.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
end


local Ob = {}

function Ob:NewButton(name)
TextButton.Parent = ButtonMenu
TextButton.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = name
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0.100000001, 8)
	UICorner_4.Parent = TextButton
end

local UIName = {}
function UIName:UIName(name)
	TextLabel.Parent = Frame
	TextLabel.Text = name
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.300000012, 0, 0.0194444451, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 43)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true

	UICorner_2.CornerRadius = UDim.new(0.0299999993, 10)
	UICorner_2.Parent = TextLabel
end
