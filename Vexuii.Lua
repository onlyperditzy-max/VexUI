--[[ VEX UI | Zenith Foundation | Heavily Obfuscated ]]

local function _(x)
	return string.char(unpack(x))
end

local A,B,C,D,E,F =
	game:GetService(_({80,108,97,121,101,114,115})),
	game:GetService(_({85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101})),
	game:GetService(_({84,119,101,101,110,83,101,114,118,105,99,101})),
	nil,nil,nil

D = A.LocalPlayer
E = D:WaitForChild(_({80,108,97,121,101,114,71,117,105}))

pcall(function()
	local x = E:FindFirstChild(_({86,69,88,95,90,69,78,73,84,72,95,85,73}))
	if x then x:Destroy() end
end)

local function I(t,p)
	local i = Instance.new(t)
	for k,v in pairs(p) do
		i[k]=v
	end
	return i
end

F = I("ScreenGui",{
	Name=_({86,69,88,95,90,69,78,73,84,72,95,85,73}),
	ResetOnSpawn=false,
	Parent=E
})

local G = I("TextButton",{
	Parent=F,
	Size=UDim2.fromOffset(60,60),
	Position=UDim2.fromOffset(25,200),
	Text="Z",
	Font=Enum.Font.GothamBlack,
	TextSize=26,
	TextColor3=Color3.fromRGB(255,90,90),
	BackgroundColor3=Color3.fromRGB(18,18,24),
	BorderSizePixel=0,
	Visible=false
})
I("UICorner",{Parent=G,CornerRadius=UDim.new(1,0)})

local H = I("Frame",{
	Parent=F,
	Size=UDim2.fromOffset(720,430),
	Position=UDim2.fromScale(0.5,0.5),
	AnchorPoint=Vector2.new(0.5,0.5),
	BackgroundColor3=Color3.fromRGB(15,15,20),
	BorderSizePixel=0,
	Visible=false
})
I("UICorner",{Parent=H,CornerRadius=UDim.new(0,10)})

local S = I("UIScale",{Parent=H,Scale=0.9})

local BG = I("Frame",{
	Parent=H,
	Size=UDim2.fromScale(1,1),
	BackgroundColor3=Color3.fromRGB(20,20,25),
	BorderSizePixel=0,
	ZIndex=0
})
I("UICorner",{Parent=BG,CornerRadius=UDim.new(0,10)})

local GR = I("UIGradient",{
	Parent=BG,
	Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.fromRGB(25,25,35)),
		ColorSequenceKeypoint.new(0.5,Color3.fromRGB(18,18,24)),
		ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,40))
	}
})

task.spawn(function()
	while true do
		C:Create(GR,TweenInfo.new(12,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Rotation=180}):Play()
		task.wait(12)
	end
end)

local HD = I("Frame",{
	Parent=H,
	Size=UDim2.new(1,0,0,45),
	BackgroundColor3=Color3.fromRGB(18,18,24),
	BorderSizePixel=0,
	ZIndex=2
})
I("UICorner",{Parent=HD,CornerRadius=UDim.new(0,10)})

I("TextLabel",{
	Parent=HD,
	Size=UDim2.new(1,-120,1,0),
	Position=UDim2.fromOffset(15,0),
	BackgroundTransparency=1,
	Text=_({86,69,88,32,72,117,98,32,124,32,90,101,110,105,116,104,32,66,97,115,101}),
	Font=Enum.Font.GothamBold,
	TextSize=14,
	TextXAlignment=Enum.TextXAlignment.Left,
	TextColor3=Color3.fromRGB(220,220,220)
})

local CL = I("TextButton",{
	Parent=HD,
	Size=UDim2.fromOffset(28,28),
	Position=UDim2.new(1,-38,0,9),
	Text="✕",
	Font=Enum.Font.GothamBold,
	TextSize=14,
	TextColor3=Color3.fromRGB(255,90,90),
	BackgroundColor3=Color3.fromRGB(30,30,40),
	BorderSizePixel=0
})
I("UICorner",{Parent=CL,CornerRadius=UDim.new(0,6)})

local SB = I("Frame",{
	Parent=H,
	Size=UDim2.new(0,70,1,-45),
	Position=UDim2.new(0,0,0,45),
	BackgroundColor3=Color3.fromRGB(18,18,24),
	BorderSizePixel=0,
	ZIndex=2
})

local CT = I("Frame",{
	Parent=H,
	Size=UDim2.new(1,-90,1,-65),
	Position=UDim2.fromOffset(80,55),
	BackgroundTransparency=1,
	ZIndex=2
})

local function O()
	H.Visible=true
	G.Visible=false
	S.Scale=0.85
	H.BackgroundTransparency=1
	C:Create(S,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Scale=0.9}):Play()
	C:Create(H,TweenInfo.new(0.25),{BackgroundTransparency=0}):Play()
end

local function X()
	C:Create(S,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Scale=0.85}):Play()
	C:Create(H,TweenInfo.new(0.2),{BackgroundTransparency=1}):Play()
	task.delay(0.25,function()
		H.Visible=false
		G.Visible=true
	end)
end

CL.MouseButton1Click:Connect(X)
G.MouseButton1Click:Connect(O)

local d,ds,sp
HD.InputBegan:Connect(function(i)
	if i.UserInputType==Enum.UserInputType.MouseButton1 then
		d=true
		ds=i.Position
		sp=H.Position
		i.Changed:Connect(function()
			if i.UserInputState==Enum.UserInputState.End then d=false end
		end)
	end
end)

B.InputChanged:Connect(function(i)
	if d and i.UserInputType==Enum.UserInputType.MouseMovement then
		local dl=i.Position-ds
		H.Position=UDim2.new(sp.X.Scale,sp.X.Offset+dl.X,sp.Y.Scale,sp.Y.Offset+dl.Y)
	end
end)

O()

return {ScreenGui=F,Main=H,Sidebar=SB,Content=CT}
