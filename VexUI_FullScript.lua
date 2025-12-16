--[[====================================================
 VexUI - Single File UI Framework
 ThanHub-inspired | WindUI-level Core
 Author : You (VexUI)
 Safe   : Yes
 Use    : loadstring / require
======================================================]]

-- ==============================
-- SERVICES
-- ==============================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- ==============================
-- MAIN TABLE
-- ==============================
local VexUI = {}
VexUI.__index = VexUI

VexUI.Tabs = {}
VexUI.Flags = {}
VexUI.Elements = {}
VexUI.Theme = {}
VexUI.Connections = {}

-- ==============================
-- THEME : THANHUB DARK (MAX)
-- ==============================
VexUI.Theme.ThanHubDark = {
    Background = Color3.fromRGB(15, 15, 18),
    Sidebar    = Color3.fromRGB(18, 18, 22),
    Topbar     = Color3.fromRGB(20, 20, 26),
    Accent     = Color3.fromRGB(125, 95, 255),
    Text       = Color3.fromRGB(235, 235, 240),
    Muted      = Color3.fromRGB(150, 150, 160),
    Stroke     = Color3.fromRGB(35, 35, 45),
    Hover      = Color3.fromRGB(30, 30, 40),
}

VexUI.CurrentTheme = VexUI.Theme.ThanHubDark

-- ==============================
-- SCREEN GUI
-- ==============================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VexUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

pcall(function()
    ScreenGui.Parent = gethui and gethui() or game:GetService("CoreGui")
end)

-- ==============================
-- MAIN WINDOW
-- ==============================
local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(760, 520)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = VexUI.CurrentTheme.Background
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
Instance.new("UIStroke", Main).Color = VexUI.CurrentTheme.Stroke

-- ==============================
-- TOPBAR
-- ==============================
local Topbar = Instance.new("Frame", Main)
Topbar.Size = UDim2.new(1, 0, 0, 48)
Topbar.BackgroundColor3 = VexUI.CurrentTheme.Topbar
Instance.new("UICorner", Topbar).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel", Topbar)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.fromOffset(16, 0)
Title.TextXAlignment = Left
Title.Text = "VexUI"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.TextColor3 = VexUI.CurrentTheme.Text
Title.BackgroundTransparency = 1

-- ==============================
-- SIDEBAR
-- ==============================
local Sidebar = Instance.new("Frame", Main)
Sidebar.Position = UDim2.fromOffset(0, 48)
Sidebar.Size = UDim2.new(0, 190, 1, -48)
Sidebar.BackgroundColor3 = VexUI.CurrentTheme.Sidebar

local SidebarLayout = Instance.new("UIListLayout", Sidebar)
SidebarLayout.Padding = UDim.new(0, 6)

-- ==============================
-- CONTENT
-- ==============================
local Content = Instance.new("Frame", Main)
Content.Position = UDim2.fromOffset(200, 60)
Content.Size = UDim2.new(1, -212, 1, -72)
Content.BackgroundTransparency = 1

-- ==============================
-- TAB API
-- ==============================
function VexUI:CreateTab(name, icon)
    local Tab = {}
    Tab.Elements = {}

    -- Sidebar Button
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -16, 0, 36)
    Button.BackgroundColor3 = VexUI.CurrentTheme.Background
    Button.Text = "  " .. name
    Button.TextXAlignment = Left
    Button.TextColor3 = VexUI.CurrentTheme.Text
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 14
    Button.AutoButtonColor = false
    Button.Parent = Sidebar

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

    -- Page
    local Page = Instance.new("ScrollingFrame")
    Page.Size = UDim2.fromScale(1, 1)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarImageTransparency = 1
    Page.Visible = false
    Page.Parent = Content

    local Layout = Instance.new("UIListLayout", Page)
    Layout.Padding = UDim.new(0, 8)

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
    end)

    Button.MouseButton1Click:Connect(function()
        for _, t in ipairs(VexUI.Tabs) do
            t.Page.Visible = false
        end
        Page.Visible = true
    end)

    -- ==========================
    -- ELEMENTS
    -- ==========================
    function Tab:AddButton(text, callback)
        local Btn = Instance.new("TextButton", Page)
        Btn.Size = UDim2.new(1, 0, 0, 38)
        Btn.Text = text
        Btn.Font = Enum.Font.Gotham
        Btn.TextSize = 14
        Btn.TextColor3 = VexUI.CurrentTheme.Text
        Btn.BackgroundColor3 = VexUI.CurrentTheme.Hover
        Btn.AutoButtonColor = false

        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)

        Btn.MouseButton1Click:Connect(function()
            if callback then
                task.spawn(callback)
            end
        end)
    end

    function Tab:AddToggle(text, flag, callback)
        VexUI.Flags[flag] = false

        local Toggle = Instance.new("TextButton", Page)
        Toggle.Size = UDim2.new(1, 0, 0, 38)
        Toggle.Text = text .. " : OFF"
        Toggle.Font = Enum.Font.Gotham
        Toggle.TextSize = 14
        Toggle.TextColor3 = VexUI.CurrentTheme.Text
        Toggle.BackgroundColor3 = VexUI.CurrentTheme.Hover
        Toggle.AutoButtonColor = false

        Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0, 8)

        Toggle.MouseButton1Click:Connect(function()
            VexUI.Flags[flag] = not VexUI.Flags[flag]
            Toggle.Text = text .. (VexUI.Flags[flag] and " : ON" or " : OFF")
            if callback then
                callback(VexUI.Flags[flag])
            end
        end)
    end

    Tab.Page = Page
    table.insert(VexUI.Tabs, Tab)

    if #VexUI.Tabs == 1 then
        Page.Visible = true
    end

    return Tab
end

-- ==============================
-- LOGO RESTORE (ThanHub Style)
-- ==============================
local Logo = Instance.new("ImageButton")
Logo.Size = UDim2.fromOffset(52, 52)
Logo.Position = UDim2.fromOffset(24, 24)
Logo.Image = "rbxassetid://123516175747026"
Logo.Visible = false
Logo.Parent = ScreenGui

UIS.InputBegan:Connect(function(i, g)
    if g then return end
    if i.KeyCode == Enum.KeyCode.RightShift then
        Main.Visible = not Main.Visible
        Logo.Visible = not Main.Visible
    end
end)

Logo.MouseButton1Click:Connect(function()
    Main.Visible = true
    Logo.Visible = false
end)

-- ==============================
-- RETURN LIBRARY
-- ==============================
return VexUI
