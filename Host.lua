--// LocalScript

--lol chatgpt
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--=== GUI SETUP ===--
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "gui00"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 250) -- ✅ More compact rectangle shape
mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 60, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Host"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

-- Discord Button
local discordButton = Instance.new("TextButton")
discordButton.Size = UDim2.new(0, 80, 0, 22)
discordButton.Position = UDim2.new(0, 80, 0.5, -11)
discordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordButton.Text = "Discord"
discordButton.TextColor3 = Color3.new(1, 1, 1)
discordButton.Font = Enum.Font.SourceSansBold
discordButton.TextSize = 16
discordButton.Parent = titleBar

local discordCorner = Instance.new("UICorner")
discordCorner.CornerRadius = UDim.new(0, 6)
discordCorner.Parent = discordButton

local inviteLink = "https://discord.gg/XBgEpCFQqv"
discordButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(inviteLink)
		print("[GUI] Discord link copied to clipboard!")
	else
		print("[GUI] Manual link: " .. inviteLink)
	end
end)

-- Minimize Button
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -55, 0.5, -12)
minimizeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextSize = 18
minimizeButton.Parent = titleBar

local minimizeCorner = Instance.new("UICorner")
minimizeCorner.CornerRadius = UDim.new(1, 0)
minimizeCorner.Parent = minimizeButton

-- Exit Button
local exitButton = Instance.new("TextButton")
exitButton.Size = UDim2.new(0, 25, 0, 25)
exitButton.Position = UDim2.new(1, -25, 0.5, -12)
exitButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
exitButton.Text = "X"
exitButton.TextColor3 = Color3.new(1, 1, 1)
exitButton.Font = Enum.Font.SourceSansBold
exitButton.TextSize = 18
exitButton.Parent = titleBar

local exitCorner = Instance.new("UICorner")
exitCorner.CornerRadius = UDim.new(1, 0)
exitCorner.Parent = exitButton

exitButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

--=== SCROLL FRAME ===--
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -30)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollFrame.Parent = mainFrame

local layout = Instance.new("UIListLayout")
layout.Parent = scrollFrame
layout.Padding = UDim.new(0, 6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local padding = Instance.new("UIPadding")
padding.Parent = scrollFrame
padding.PaddingTop = UDim.new(0, 8)
padding.PaddingLeft = UDim.new(0, 8)
padding.PaddingRight = UDim.new(0, 8)

--=== SECTION & BUTTON HELPERS ===--
local function createSection(title)
	local header = Instance.new("TextLabel")
	header.Size = UDim2.new(1, 0, 0, 22)
	header.BackgroundTransparency = 1
	header.Text = "🔹 " .. title
	header.Font = Enum.Font.SourceSansBold
	header.TextSize = 17
	header.TextColor3 = Color3.new(1, 1, 1)
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.Parent = scrollFrame
	return header
end

local function createScriptButton(name, callback, parent)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	btn.Text = name
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Font = Enum.Font.SourceSansBold
	btn.TextSize = 16
	btn.Parent = parent

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn

	btn.MouseButton1Click:Connect(callback)
	return btn
end

--=== DEFINE SECTIONS & BUTTONS ===--
-- ✅ Each section has its own list of buttons underneath
local sections = {
	{
		title = "Universal",
		buttons = {
			{ name = "IY", action = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end },
			{ name = "DEX", action = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/memeenjoyer43/darkdex/refs/heads/main/script"))() end },
			{ name = "SimpleSpy", action = function() loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))() end },
			{ name = "OtherSpy", action = function() loadstring(game:HttpGetAsync("https://github.com/richie0866/remote-spy/releases/latest/download/RemoteSpy.lua"))() end },
		}
	},
	{
		title = "Da Hood",
		buttons = {
			{ name = "Farm Script", action = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/sertgw456y/luar/refs/heads/main/DaHoodFarm000.lua"))() end },
			{ name = "PVP Script", action = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/yuvic123/SKIDO-V3/refs/heads/main/Skido-3.4"))() end },
		}
	},
}

--=== BUILD GUI ===--
local layoutCounter = 0

for _, section in ipairs(sections) do
	-- Create header
	local header = createSection(section.title)
	header.LayoutOrder = layoutCounter
	layoutCounter += 1

	-- Create buttons for this section
	for _, btnInfo in ipairs(section.buttons) do
		local btn = createScriptButton(btnInfo.name, btnInfo.action, scrollFrame)
		btn.LayoutOrder = layoutCounter
		layoutCounter += 1
	end
end


--=== DRAGGING ===--
local dragging = false
local dragStart, startPos

titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
	end
end)

titleBar.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

--=== MINIMIZE ===--
local minimized = false
minimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		scrollFrame.Visible = false
		mainFrame.Size = UDim2.new(0, 350, 0, 30)
	else
		scrollFrame.Visible = true
		mainFrame.Size = UDim2.new(0, 350, 0, 250)
	end
end)
