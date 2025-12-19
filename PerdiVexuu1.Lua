--==================================================
-- VEX UI - FULL UI SCRIPT (ui.lua)
--==================================================

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- SCREEN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ThanHub_EXEC_SAFE"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

--==================================================
-- FLOATING VEX LOGO
--==================================================
local LogoButton = Instance.new("TextButton")
LogoButton.Name = "LogoButton"
LogoButton.Size = UDim2.fromOffset(70,70)
LogoButton.Position = UDim2.fromOffset(20,200)
LogoButton.Text = ""
LogoButton.BackgroundColor3 = Color3.fromRGB(150,50,200)
LogoButton.BorderSizePixel = 0
LogoButton.Visible = false
LogoButton.Parent = ScreenGui

Instance.new("UICorner", LogoButton).CornerRadius = UDim.new(0,12)

local LogoStroke = Instance.new("UIStroke", LogoButton)
LogoStroke.Color = Color3.fromRGB(200,100,255)
LogoStroke.Thickness = 3

local LogoFrame = Instance.new("Frame", LogoButton)
LogoFrame.Size = UDim2.fromScale(1,1)
LogoFrame.BackgroundTransparency = 1

local function CreateLogoLetter(text, yPos, size)
	local label = Instance.new("TextLabel", LogoFrame)
	label.Size = UDim2.new(1,0,0,size)
	label.Position = UDim2.new(0,0,yPos,0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
	label.TextColor3 = Color3.new(0,0,0)
	return label
end

CreateLogoLetter("V", 0.1, 20)
CreateLogoLetter("e", 0.4, 24)
CreateLogoLetter("x", 0.72, 20)

--==================================================
-- MAIN FRAME
--==================================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.fromOffset(670,410)
MainFrame.Position = UDim2.new(0.5,0,0.5,0)
MainFrame.AnchorPoint = Vector2.new(0.5,0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(17,20,28)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0,6)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(35,40,50)
MainStroke.Thickness = 1

--==================================================
-- HEADER
--==================================================
local Header = Instance.new("Frame", MainFrame)
Header.Size = UDim2.new(1,0,0,42)
Header.BackgroundColor3 = Color3.fromRGB(22,26,35)
Header.BorderSizePixel = 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0,6)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1,-100,1,0)
Title.Position = UDim2.new(0,12,0,0)
Title.BackgroundTransparency = 1
Title.Text = "Vex UI | Version 1.0.0"
Title.Font = Enum.Font.Gotham
Title.TextSize = 14
Title.TextColor3 = Color3.fromRGB(90,140,200)
Title.TextXAlignment = Enum.TextXAlignment.Left

local MinimizeBtn = Instance.new("TextButton", Header)
MinimizeBtn.Size = UDim2.fromOffset(28,28)
MinimizeBtn.Position = UDim2.new(1,-68,0,7)
MinimizeBtn.Text = "─"
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 14
MinimizeBtn.TextColor3 = Color3.fromRGB(150,160,180)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30,35,45)
MinimizeBtn.BorderSizePixel = 0
Instance.new("UICorner", MinimizeBtn).CornerRadius = UDim.new(0,4)

local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.fromOffset(28,28)
CloseBtn.Position = UDim2.new(1,-35,0,7)
CloseBtn.Text = "✕"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.TextColor3 = Color3.fromRGB(220,80,100)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30,35,45)
CloseBtn.BorderSizePixel = 0
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0,4)

--==================================================
-- CONTENT AREA (INFO PAGE + DISCORD TOOLTIP)
--==================================================
local ContentArea = Instance.new("Frame", MainFrame)
ContentArea.Size = UDim2.new(1,-24,1,-60)
ContentArea.Position = UDim2.new(0,12,0,48)
ContentArea.BackgroundTransparency = 1

local DiscordBox = Instance.new("Frame", ContentArea)
DiscordBox.Size = UDim2.new(0,300,0,90)
DiscordBox.BackgroundColor3 = Color3.fromRGB(25,30,40)
DiscordBox.BorderSizePixel = 0
Instance.new("UICorner", DiscordBox).CornerRadius = UDim.new(0,6)

local DiscordTitle = Instance.new("TextLabel", DiscordBox)
DiscordTitle.Size = UDim2.new(1,-20,0,20)
DiscordTitle.Position = UDim2.new(0,10,0,10)
DiscordTitle.BackgroundTransparency = 1
DiscordTitle.Text = "💬 VEX UI Discord"
DiscordTitle.Font = Enum.Font.GothamBold
DiscordTitle.TextSize = 13
DiscordTitle.TextColor3 = Color3.fromRGB(114,137,218)
DiscordTitle.TextXAlignment = Enum.TextXAlignment.Left

local DiscordButton = Instance.new("ImageButton", DiscordBox)
DiscordButton.Size = UDim2.fromOffset(45,45)
DiscordButton.Position = UDim2.new(0,10,0,40)
DiscordButton.BackgroundColor3 = Color3.fromRGB(88,101,242)
DiscordButton.Image = ""
DiscordButton.BorderSizePixel = 0
Instance.new("UICorner", DiscordButton).CornerRadius = UDim.new(1,0)

local btnGrad = Instance.new("UIGradient", DiscordButton)
btnGrad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255,60,172)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120,75,160)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(43,134,197)),
}

local tooltip = Instance.new("Frame", DiscordButton)
tooltip.Size = UDim2.fromOffset(140,40)
tooltip.Position = UDim2.fromOffset(-150,2)
tooltip.BackgroundTransparency = 1
tooltip.BackgroundColor3 = Color3.fromRGB(88,101,242)
tooltip.Visible = false
Instance.new("UICorner", tooltip).CornerRadius = UDim.new(1,0)

local tooltipText = Instance.new("TextLabel", tooltip)
tooltipText.Size = UDim2.fromScale(1,1)
tooltipText.BackgroundTransparency = 1
tooltipText.Text = "Join Discord!"
tooltipText.Font = Enum.Font.Gotham
tooltipText.TextSize = 14
tooltipText.TextColor3 = Color3.new(1,1,1)

local showTween = TweenService:Create(
	tooltip,
	TweenInfo.new(0.4, Enum.EasingStyle.Quint),
	{Position = UDim2.fromOffset(55,2), BackgroundTransparency = 0}
)

local hideTween = TweenService:Create(
	tooltip,
	TweenInfo.new(0.3),
	{Position = UDim2.fromOffset(-150,2), BackgroundTransparency = 1}
)

DiscordButton.MouseEnter:Connect(function()
	tooltip.Visible = true
	showTween:Play()
end)

DiscordButton.MouseLeave:Connect(function()
	hideTween:Play()
	hideTween.Completed:Once(function()
		tooltip.Visible = false
	end)
end)

DiscordButton.MouseButton1Click:Connect(function()
	pcall(function()
		setclipboard("https://discord.gg/vexui")
	end)
	tooltipText.Text = "✓ Copied!"
	task.delay(1.5, function()
		tooltipText.Text = "Join Discord!"
	end)
end)

--==================================================
-- CLOSE / OPEN + DRAG
--==================================================
local function CloseUI()
	MainFrame.Visible = false
	LogoButton.Visible = true
end

local function OpenUI()
	MainFrame.Visible = true
	LogoButton.Visible = false
end

CloseBtn.MouseButton1Click:Connect(CloseUI)
MinimizeBtn.MouseButton1Click:Connect(CloseUI)
LogoButton.MouseButton1Click:Connect(OpenUI)

local dragging, dragInput, dragStart, startPos
Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Header.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

OpenUI()
return true
