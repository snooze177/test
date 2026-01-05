--Enjoy❤
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ExecutorUI"
gui.Parent = PlayerGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 36, 0, 36)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "Open"
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 11
ToggleButton.TextWrapped = true
ToggleButton.Parent = gui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 10)
toggleCorner.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.22, 0, 0.24, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 25, 40)
MainFrame.BackgroundTransparency = 0.12
MainFrame.Position = UDim2.new(0.39, 0, 0.38, 0)
MainFrame.Visible = false
MainFrame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = MainFrame

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 35, 55)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 20, 35))
}
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, 0, 0.13, 0)
Bar.BackgroundColor3 = Color3.fromRGB(45, 50, 70)
Bar.BackgroundTransparency = 0.15
Bar.Parent = MainFrame

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 12)
barCorner.Parent = Bar

local Close = Instance.new("TextButton")
Close.Text = "×"
Close.Position = UDim2.new(0.90, -6, 0.15, 0)
Close.TextColor3 = Color3.fromRGB(220, 100, 100)
Close.TextSize = 16
Close.Font = Enum.Font.GothamBold
Close.Size = UDim2.new(0, 24, 0, 24)
Close.BackgroundColor3 = Color3.fromRGB(140, 30, 30)
Close.BackgroundTransparency = 0.15
Close.Parent = Bar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = Close

local WelcomeLabel = Instance.new("TextLabel")
WelcomeLabel.Size = UDim2.new(0.70, 0, 1, 0)
WelcomeLabel.Position = UDim2.new(0.15, 0, 0, 0)
WelcomeLabel.TextSize = 14
WelcomeLabel.TextColor3 = Color3.fromRGB(240, 245, 255)
WelcomeLabel.Font = Enum.Font.GothamBold
WelcomeLabel.Text = "Executor UI"
WelcomeLabel.BackgroundTransparency = 1
WelcomeLabel.Parent = Bar

local EntScript = Instance.new("TextBox")
EntScript.Size = UDim2.new(0.96, 0, 0.64, 0)
EntScript.Position = UDim2.new(0.02, 0, 0.17, 0)
EntScript.TextColor3 = Color3.fromRGB(230, 235, 245)
EntScript.TextSize = 11
EntScript.BackgroundColor3 = Color3.fromRGB(35, 40, 55)
EntScript.BackgroundTransparency = 0.08
EntScript.BorderSizePixel = 0
EntScript.MultiLine = true
EntScript.TextWrapped = true
EntScript.TextXAlignment = Enum.TextXAlignment.Left
EntScript.TextYAlignment = Enum.TextYAlignment.Top
EntScript.PlaceholderText = "Made by Snooze, put here ur script..."
EntScript.Parent = MainFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 9)
boxCorner.Parent = EntScript

local Execute = Instance.new("TextButton")
Execute.Size = UDim2.new(0.475, -4, 0.12, 0)
Execute.Position = UDim2.new(0.02, 0, 0.84, 0)
Execute.Font = Enum.Font.GothamBold
Execute.BackgroundColor3 = Color3.fromRGB(0, 90, 160)
Execute.TextColor3 = Color3.fromRGB(220, 225, 235)
Execute.TextSize = 13
Execute.Text = "Execute"
Execute.BackgroundTransparency = 0.12
Execute.Parent = MainFrame

local executeCorner = Instance.new("UICorner")
executeCorner.CornerRadius = UDim.new(0, 8)
executeCorner.Parent = Execute

local Clear = Instance.new("TextButton")
Clear.Size = UDim2.new(0.475, -4, 0.12, 0)
Clear.Position = UDim2.new(0.505, 0, 0.84, 0)
Clear.Font = Enum.Font.GothamBold
Clear.BackgroundColor3 = Color3.fromRGB(160, 40, 40)
Clear.TextColor3 = Color3.fromRGB(220, 225, 235)
Clear.TextSize = 13
Clear.Text = "Clear"
Clear.BackgroundTransparency = 0.12
Clear.Parent = MainFrame

local clearCorner = Instance.new("UICorner")
clearCorner.CornerRadius = UDim.new(0, 8)
clearCorner.Parent = Clear

local isVisible = false

local function toggleGUI()
    isVisible = not isVisible
    MainFrame.Visible = isVisible
    ToggleButton.Text = isVisible and "Close" or "Open"
    ToggleButton.BackgroundColor3 = isVisible and Color3.fromRGB(60, 65, 85) or Color3.fromRGB(40, 45, 60)
end

ToggleButton.MouseButton1Click:Connect(toggleGUI)
Close.MouseButton1Click:Connect(function()
    isVisible = false
    MainFrame.Visible = false
    ToggleButton.Text = "Open"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
end)
Clear.MouseButton1Click:Connect(function()
    EntScript.Text = ""
end)
Execute.MouseButton1Click:Connect(function()
    if EntScript.Text ~= "" then
        pcall(function()
            loadstring(EntScript.Text)()
        end)
    end
end)

local draggingToggle = false
local dragStartToggle, startPosToggle
ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingToggle = true
        dragStartToggle = input.Position
        startPosToggle = ToggleButton.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingToggle = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingToggle and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStartToggle
        ToggleButton.Position = UDim2.new(0, startPosToggle.X.Offset + delta.X, 0, startPosToggle.Y.Offset + delta.Y)
    end
end)

local draggingFrame = false
local dragStartFrame, startPosFrame
Bar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        draggingFrame = true
        dragStartFrame = input.Position
        startPosFrame = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                draggingFrame = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingFrame and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStartFrame
        MainFrame.Position = UDim2.new(startPosFrame.X.Scale, startPosFrame.X.Offset + delta.X, startPosFrame.Y.Scale, startPosFrame.Y.Offset + delta.Y)
    end
end)
