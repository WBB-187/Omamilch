-- LocalScript (z.B. unter StarterGui)
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PersistentMessageGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local label = Instance.new("TextLabel")
label.Name = "PersistentLabel"
label.Size = UDim2.new(0.4, 0, 0.05, 0)         -- Breite x Höhe
label.Position = UDim2.new(1, 0, 0.05, 0)       -- ganz rechts, gleiche Höhe
label.AnchorPoint = Vector2.new(1, 0.5)         -- rechte Kante als Referenz, vertikal mittig
label.BackgroundTransparency = 1                -- kein Hintergrund
label.Text = "OmamilchV5"                           -- Text
label.TextColor3 = Color3.fromRGB(0, 255, 0)    -- grün
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.Parent = screenGui


-- UsernameScreenEffect.lua
-- Zeigt einen schwarzen Bildschirm mit rotem Text,
-- wenn der Spielername in der Liste enthalten ist.

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- === HIER BENUTZERNAMEN EINTRAGEN ===
local TargetNames = {
    "USERNAME",  -- Ersetze das durch den Namen, der erkannt werden soll
    -- "NochEinName",
}
-- ================================

-- Funktion zum Vergleichen (Case-insensitive)
local function isTargetUser(name)
    name = string.lower(name)
    for _, target in ipairs(TargetNames) do
        if name == string.lower(target) then
            return true
        end
    end
    return false
end

-- Prüfe ob aktueller Spieler betroffen ist
if isTargetUser(player.Name) then
    -- GUI erstellen
    local gui = Instance.new("ScreenGui")
    gui.Name = "BlackScreenEffect"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = playerGui

    -- Schwarzer Hintergrund
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Position = UDim2.new(0, 0, 0, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = gui

    -- Roter Text
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 0, 200)
    label.Position = UDim2.new(0, 0, 0.5, -100)
    label.BackgroundTransparency = 1
    label.Text = "You got banned from OmamilchV5"
    label.TextColor3 = Color3.new(1, 0, 0) -- Rot
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.TextTransparency = 1
    label.Parent = gui

    -- Sanftes Einblenden
    for i = 1, 20 do
        frame.BackgroundTransparency = 1 - (i / 20)
        label.TextTransparency = 1 - (i / 20)
        task.wait(0.03)
    end

    -- Effekt bleibt sichtbar (du kannst optional nach ein paar Sekunden löschen)
    -- task.wait(5)
    -- gui:Destroy()
end

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
   Name = "OmamilchV5  V.9",
   Icon =0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "OmamilchV5",
   LoadingSubtitle = "made by OmamilchV5",
   ShowText = "OmamilchV5", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
   ToggleUIKeybind = "Z", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
   ConfigurationSaving = {
      Enabled = flase,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
 
   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "mStkmJgnYw", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
 
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "false",
      Subtitle = "if you have a problem join the discord: https://discord.gg/f6CeympDNZ",
      Note = "This script is currently being processed. Please be patient.", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"DontWork"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local MainTab = Window:CreateTab("Home🏠", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")


local FunTab = Window:CreateTab("Universal🌌", nil) -- Title, Image
local FunSection = FunTab:CreateSection("Fun")

local MusicTab = Window:CreateTab("Piano🎹", nil) -- Title, Image
local MusicSection = MusicTab:CreateSection("Music")

Rayfield:Notify({
   Title = "Join  on Discord",
   Content = "Have Fun",
   Duration = 5.1,
   Image = nil,
})


local Button = MainTab:CreateButton({
   Name = "OmamilchV5 Slot Machine",
   Callback = function()
     -- 🟢 Jackpot-Text hier anpassen:
local jackpotMessage = "🎉 YOU HIT THE OmamilchV5 JACKPOT! 💎"
------------------------------------------------------------

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI erstellen
local gui = Instance.new("ScreenGui")
gui.Name = "OmamilchV5Slots"
gui.Parent = playerGui

local bg = Instance.new("Frame")
bg.Size = UDim2.new(0,500,0,350)
bg.Position = UDim2.new(0.5,-250,0.5,-175)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BorderSizePixel = 0
bg.Parent = gui

-- Titel
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "OmamilchV5Slots"
title.TextColor3 = Color3.fromRGB(0,255,0)
title.Font = Enum.Font.Code
title.TextScaled = true
title.Parent = bg

-- Rollen-Container
local reelContainer = Instance.new("Frame")
reelContainer.Size = UDim2.new(1,0,0,150)
reelContainer.Position = UDim2.new(0,0,0,70)
reelContainer.BackgroundTransparency = 1
reelContainer.Parent = bg

local symbols = {"🍒","🍋","🔔","💎","7️⃣"}
local reels = {}
for i=1,3 do
	local reel = Instance.new("TextLabel")
	reel.Size = UDim2.new(0,150,1,0)
	reel.Position = UDim2.new((i-1)/3,0,0,0)
	reel.BackgroundColor3 = Color3.fromRGB(20,20,20)
	reel.TextColor3 = Color3.fromRGB(0,255,0)
	reel.Font = Enum.Font.Code
	reel.TextScaled = true
	reel.Text = symbols[math.random(1,#symbols)]
	reel.Parent = reelContainer
	reels[i] = reel
end

-- Ergebnisanzeige
local resultLabel = Instance.new("TextLabel")
resultLabel.Size = UDim2.new(1,0,0,40)
resultLabel.Position = UDim2.new(0,0,0,240)
resultLabel.BackgroundTransparency = 1
resultLabel.TextColor3 = Color3.fromRGB(0,255,0)
resultLabel.Font = Enum.Font.Code
resultLabel.TextScaled = true
resultLabel.Text = ""
resultLabel.Parent = bg

-- Spin Button (weiter unten)
local spinBtn = Instance.new("TextButton")
spinBtn.Size = UDim2.new(0,200,0,50)
spinBtn.Position = UDim2.new(0.5,-100,1,-60)
spinBtn.BackgroundColor3 = Color3.fromRGB(50,0,0)
spinBtn.Text = "SPIN"
spinBtn.TextColor3 = Color3.fromRGB(0,255,0)
spinBtn.Font = Enum.Font.Code
spinBtn.TextScaled = true
spinBtn.Parent = bg

-- Close Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,50,0,50)
closeBtn.Position = UDim2.new(1,-60,0,10)
closeBtn.BackgroundColor3 = Color3.fromRGB(150,0,0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.Code
closeBtn.TextScaled = true
closeBtn.Parent = bg

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- RGB blinkender Spin Button
task.spawn(function()
	local r,g,b = 50,0,0
	local step = 5
	while spinBtn.Parent do
		spinBtn.BackgroundColor3 = Color3.fromRGB(r,g,b)
		r = (r+step)%256
		g = (g+step*2)%256
		b = (b+step*3)%256
		task.wait(0.03)
	end
end)

-- Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118820646"
sound.Volume = 0.3
sound.Parent = gui

-- Spin Funktion
local function spin()
	sound:Play()
	resultLabel.Text = ""
	for i=1,3 do
		task.spawn(function()
			for j=1,20 do
				reels[i].Text = symbols[math.random(1,#symbols)]
				task.wait(0.05 + i*0.02)
			end
		end)
	end

	task.delay(1.5,function()
		local final = {}
		for i=1,3 do
			final[i] = reels[i].Text
		end
		if final[1]==final[2] and final[2]==final[3] then
			-- 🏆 Jackpot
			resultLabel.Text = jackpotMessage
		elseif final[1]==final[2] or final[2]==final[3] or final[1]==final[3] then
			resultLabel.Text = "You won a small prize!"
		else
			resultLabel.Text = "You lost. Try again!"
		end
	end)
end

spinBtn.MouseButton1Click:Connect(spin)

   end,
})
 
 
local Button = MainTab:CreateButton({
   Name = "📜OmamilchV5Support📢",
   Callback = function()

-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Schwarzes zentrales Fenster
local background = Instance.new("Frame")
background.Size = UDim2.new(0.8, 0, 0.6, 0) -- größer und zentriert
background.Position = UDim2.new(0.1, 0, 0.2, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Großer zentraler Text "OmamilchV5"
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(0.9, 0, 0.6, 0)
titleText.Position = UDim2.new(0.05, 0, 0.05, 0)
titleText.BackgroundTransparency = 1
titleText.TextColor3 = Color3.fromRGB(0, 255, 0)
titleText.Font = Enum.Font.Bangers
titleText.TextSize = 120
titleText.Text = "OmamilchV5"
titleText.TextScaled = true
titleText.Parent = background

-- Grüne Ladeleiste
local progressBarBackground = Instance.new("Frame")
progressBarBackground.Size = UDim2.new(0.8, 0, 0.08, 0)
progressBarBackground.Position = UDim2.new(0.1, 0, 0.65, 0)
progressBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
progressBarBackground.Parent = background

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
progressBar.Parent = progressBarBackground

-- Prozentanzeige
local percentText = Instance.new("TextLabel")
percentText.Size = UDim2.new(0.2, 0, 0.1, 0) -- größer
percentText.Position = UDim2.new(0.4, 0, 0.78, 0) -- weiter mittig
percentText.BackgroundTransparency = 1
percentText.TextColor3 = Color3.fromRGB(0, 255, 0)
percentText.Font = Enum.Font.SourceSansBold
percentText.TextSize = 48
percentText.Parent = background

-- Ladefortschritt animieren
local totalTime = 10
local startTime = tick()

game:GetService("RunService").RenderStepped:Connect(function()
    local elapsed = tick() - startTime
    local progress = math.clamp(elapsed / totalTime, 0, 1)
    progressBar.Size = UDim2.new(progress, 0, 1, 0)

    -- Prozentanzeige
    local percent = math.floor(progress * 100)
    percentText.Text = percent .. "%"

    -- Wenn fertig, alles entfernen
    if progress >= 1 then
        screenGui:Destroy()
    end
end)
            
Rayfield:Notify({
   Title = "Discord loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
 -- Erstelle ein ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DiscordPopup"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
 
-- Erstelle den Frame (Fenster)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 170)
frame.Position = UDim2.new(0.5, -150, 0.5, -85)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui
 
-- Runde Ecken
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = frame
 
-- Titel
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Join our Discord!"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame
 
-- Hinweis-Text über dem Link
local hint = Instance.new("TextLabel")
hint.Size = UDim2.new(1, -20, 0, 30)
hint.Position = UDim2.new(0, 10, 0, 40)
hint.BackgroundTransparency = 1
hint.Text = "Click on the link to copy the link"
hint.Font = Enum.Font.SourceSansItalic
hint.TextSize = 16
hint.TextColor3 = Color3.fromRGB(200, 200, 200)
hint.TextWrapped = true
hint.Parent = frame
 
-- Discord-Link (Button)
local linkBtn = Instance.new("TextButton")
linkBtn.Size = UDim2.new(1, -20, 0, 40)
linkBtn.Position = UDim2.new(0, 10, 0, 70)
linkBtn.BackgroundTransparency = 1
linkBtn.Text = "discord.gg/mStkmJgnYw"
linkBtn.Font = Enum.Font.SourceSans
linkBtn.TextSize = 18
linkBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
linkBtn.TextWrapped = true
linkBtn.Parent = frame
 
-- Button zum Schließen
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 80, 0, 30)
closeBtn.Position = UDim2.new(0.5, -40, 1, -40)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "Close"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Parent = frame
 
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = closeBtn
 
-- Funktion: Link in Zwischenablage kopieren
linkBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/mStkmJgnYw")
        linkBtn.Text = "Link copied!"
        wait(2)
        linkBtn.Text = "discord.gg/mStkmJgnYw"
    else
        linkBtn.Text = "Clipboard not supported"
        wait(2)
        linkBtn.Text = "discord.gg/mStkmJgnYw"
    end
end)
 
-- Button-Funktion: Fenster schließen
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite yield",
   Callback = function()
Rayfield:Notify({
   Title = "CMDR loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fake Lag",
   Callback = function()
Rayfield:Notify({
   Title = "Bug loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
  local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "FakeLagGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 120)
frame.Position = UDim2.new(0.35, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Fake Lag"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromHSV(0,1,1)
title.BackgroundTransparency = 1
spawn(function() while wait() do title.TextColor3 = Color3.fromHSV(tick()%5/5,1,1) end end)

local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0.9, 0, 0, 30)
toggleBtn.Position = UDim2.new(0.05, 0, 0, 40)
toggleBtn.Text = "Fake Lag: OFF"
toggleBtn.Font = Enum.Font.Gotham
toggleBtn.TextSize = 14
toggleBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
toggleBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9, 0, 0, 25)
box.Position = UDim2.new(0.05, 0, 0, 80)
box.PlaceholderText = "Speed (e.g. 2 for slowmo, 0.3 for hyper)"
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(45,45,45)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.Gotham
box.TextSize = 13
Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

local fakeLag = false
local delayValue = 2

toggleBtn.MouseButton1Click:Connect(function()
	fakeLag = not fakeLag
	toggleBtn.Text = "Fake Lag: "..(fakeLag and "ON" or "OFF")
	if fakeLag then
		delayValue = tonumber(box.Text) or 2
		spawn(function()
			while fakeLag do
				if char:FindFirstChild("HumanoidRootPart") then
					char.HumanoidRootPart.Anchored = true
					wait(delayValue)
					char.HumanoidRootPart.Anchored = false
				end
				wait(0.05)
			end
		end)
	end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Fast Menu",
   Callback = function()
Rayfield:Notify({
   Title = "secret loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
  local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera

-- Constants
local NORMAL_WALKSPEED = 16
local NORMAL_GRAVITY = workspace.Gravity

-- Variables for states
local flying = false
local flySpeed = 100
local flyBodyVelocity = nil
local flyBodyGyro = nil

local espEnabled = false
local espHighlights = {}

local noclipEnabled = false
local noclipConnection = nil

local humpEnabled = false
local humpTarget = nil
local humpAnimConnection = nil
local humpFollowConnection = nil

local glitchEnabled = false
local glitchConnection = nil
local glitchTargets = {}

local distanceEspEnabled = false
local distanceEspLabels = {}

local gravityChanged = false

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OmamilchV5-FastMenu"
screenGui.ResetOnSpawn = false
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Notification on load
StarterGui:SetCore("SendNotification", {
	Title = "OmamilchV5";
	Text = "Have Fun";
	Duration = 5;
})

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 280, 0, 400)
mainFrame.Position = UDim2.new(1, -290, 0, 10) -- Top right with 10px margin
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.BackgroundTransparency = 0.15
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true
mainFrame.Active = true

-- UI Corner rounding
local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 8)
uicorner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.Text = "OmamilchV5-FastMenu"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = mainFrame

-- Scrolling frame for buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ScrollFrame"
scrollFrame.Size = UDim2.new(1, 0, 1, -30)
scrollFrame.Position = UDim2.new(0, 0, 0, 30)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = mainFrame
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollFrame
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 6)

local uiPadding = Instance.new("UIPadding")
uiPadding.Parent = scrollFrame
uiPadding.PaddingTop = UDim.new(0, 6)
uiPadding.PaddingLeft = UDim.new(0, 6)
uiPadding.PaddingRight = UDim.new(0, 6)
uiPadding.PaddingBottom = UDim.new(0, 6)

-- Dragging functionality for mainFrame
do
	local dragging = false
	local dragInput, dragStart, startPos

	mainFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = mainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	mainFrame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			local newPos = UDim2.new(
				math.clamp(startPos.X.Scale, 0, 1),
				math.clamp(startPos.X.Offset + delta.X, 0, workspace.CurrentCamera.ViewportSize.X - mainFrame.AbsoluteSize.X),
				math.clamp(startPos.Y.Scale, 0, 1),
				math.clamp(startPos.Y.Offset + delta.Y, 0, workspace.CurrentCamera.ViewportSize.Y - mainFrame.AbsoluteSize.Y)
			)
			mainFrame.Position = newPos
		end
	end)
end

-- Helper function to create buttons
local function createButton(text)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	btn.BorderSizePixel = 0
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 18
	btn.Text = text
	btn.AutoButtonColor = true
	btn.Name = text:gsub("%s", "") -- Remove spaces for name
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = btn
	return btn
end

-- Helper function to create textboxes
local function createTextbox(placeholder)
	local tb = Instance.new("TextBox")
	tb.Size = UDim2.new(1, 0, 0, 25)
	tb.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	tb.BorderSizePixel = 0
	tb.TextColor3 = Color3.fromRGB(255, 255, 255)
	tb.Font = Enum.Font.Gotham
	tb.TextSize = 16
	tb.PlaceholderText = placeholder
	tb.ClearTextOnFocus = false
	tb.Name = placeholder:gsub("%s", "") .. "Textbox"
	local tbCorner = Instance.new("UICorner")
	tbCorner.CornerRadius = UDim.new(0, 6)
	tbCorner.Parent = tb
	return tb
end

-- ========== BUTTONS AND TEXTBOXES ==========

-- 1. FLY
local btnFly = createButton("FLY")
btnFly.Parent = scrollFrame

-- 2. UNFLY
local btnUnFly = createButton("UNFLY")
btnUnFly.Parent = scrollFrame

-- 3. ESP
local btnESP = createButton("ESP")
btnESP.Parent = scrollFrame

-- 4. UN ESP
local btnUnESP = createButton("UN ESP")
btnUnESP.Parent = scrollFrame

-- 5. NOCLIP
local btnNoclip = createButton("NOCLIP")
btnNoclip.Parent = scrollFrame

-- 6. UN NOCLIP
local btnUnNoclip = createButton("UN NOCLIP")
btnUnNoclip.Parent = scrollFrame

-- 7. WALK SPEED
local btnWalkSpeed = createButton("WALK SPEED")
btnWalkSpeed.Parent = scrollFrame

-- 8. UN WALK SPEED
local btnUnWalkSpeed = createButton("UN WALK SPEED")
btnUnWalkSpeed.Parent = scrollFrame

-- 9. TELEPORT + textbox
local btnTeleport = createButton("TELEPORT")
btnTeleport.Parent = scrollFrame
local tbTeleport = createTextbox("Player name or first 3 letters")
tbTeleport.Parent = scrollFrame

-- 10. GLITCH
local btnGlitch = createButton("GLITCH")
btnGlitch.Parent = scrollFrame

-- 11. UN GLITCH
local btnUnGlitch = createButton("UN GLITCH")
btnUnGlitch.Parent = scrollFrame

-- 12. HUMP + textbox
local btnHump = createButton("HUMP")
btnHump.Parent = scrollFrame
local tbHump = createTextbox("Player name or first 3 letters")
tbHump.Parent = scrollFrame

-- 13. UN HUMP
local btnUnHump = createButton("UN HUMP")
btnUnHump.Parent = scrollFrame

-- 14. DISTANCE ESP
local btnDistanceESP = createButton("DISTANCE ESP")
btnDistanceESP.Parent = scrollFrame

-- 15. UN DISTANCE ESP
local btnUnDistanceESP = createButton("UN DISTANCE ESP")
btnUnDistanceESP.Parent = scrollFrame

-- 16. GRAVITY CHANGER + textbox
local btnGravityChanger = createButton("GRAVITY CHANGER")
btnGravityChanger.Parent = scrollFrame
local tbGravityChanger = createTextbox("0-100")
tbGravityChanger.Parent = scrollFrame

-- 17. RESET GRAVITY
local btnResetGravity = createButton("RESET GRAVITY")
btnResetGravity.Parent = scrollFrame

-- Update canvas size on layout change
uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scrollFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)
end)

-- ========== FUNCTIONALITY ==========

-- FLY implementation
local function startFly()
	if flying then return end
	flying = true

	-- Create BodyVelocity and BodyGyro for smooth flying
	flyBodyVelocity = Instance.new("BodyVelocity")
	flyBodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
	flyBodyVelocity.Velocity = Vector3.new(0, 0, 0)
	flyBodyVelocity.Parent = HumanoidRootPart

	flyBodyGyro = Instance.new("BodyGyro")
	flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
	flyBodyGyro.CFrame = HumanoidRootPart.CFrame
	flyBodyGyro.Parent = HumanoidRootPart

	-- Disable Humanoid's platform stand to allow flying
	Humanoid.PlatformStand = false

	-- Fly control variables
	local speed = flySpeed
	local moveDirection = Vector3.new(0, 0, 0)

	local function updateFly()
		if not flying then return end
		local cameraCFrame = Camera.CFrame
		local moveVec = Vector3.new(0, 0, 0)
		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			moveVec = moveVec + cameraCFrame.LookVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			moveVec = moveVec - cameraCFrame.LookVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			moveVec = moveVec - cameraCFrame.RightVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			moveVec = moveVec + cameraCFrame.RightVector
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
			moveVec = moveVec + Vector3.new(0, 1, 0)
		end
		if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
			moveVec = moveVec - Vector3.new(0, 1, 0)
		end
		moveVec = moveVec.Unit * speed
		if moveVec ~= moveVec then -- NaN check
			moveVec = Vector3.new(0, 0, 0)
		end
		flyBodyVelocity.Velocity = moveVec
		flyBodyGyro.CFrame = Camera.CFrame
	end

	-- Connect to RenderStepped for smooth flying
	flyConnection = RunService.RenderStepped:Connect(updateFly)
end

local function stopFly()
	if not flying then return end
	flying = false
	if flyBodyVelocity then
		flyBodyVelocity:Destroy()
		flyBodyVelocity = nil
	end
	if flyBodyGyro then
		flyBodyGyro:Destroy()
		flyBodyGyro = nil
	end
	if flyConnection then
		flyConnection:Disconnect()
		flyConnection = nil
	end
	Humanoid.PlatformStand = false
end

-- ESP implementation
local function enableESP()
	if espEnabled then return end
	espEnabled = true
	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
			local highlight = Instance.new("Highlight")
			highlight.Adornee = plr.Character
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0
			highlight.Parent = plr.Character
			espHighlights[plr] = highlight
		end
	end
	-- Connect to player added and character added to add highlights dynamically
	espConnection = Players.PlayerAdded:Connect(function(plr)
		plr.CharacterAdded:Connect(function(char)
			if espEnabled and plr ~= LocalPlayer then
				wait(0.1)
				if char and char:FindFirstChild("HumanoidRootPart") then
					local highlight = Instance.new("Highlight")
					highlight.Adornee = char
					highlight.FillTransparency = 0.5
					highlight.OutlineTransparency = 0
					highlight.Parent = char
					espHighlights[plr] = highlight
				end
			end
		end)
	end)
	-- Rainbow color update loop
	espRainbowConnection = RunService.RenderStepped:Connect(function()
		if not espEnabled then return end
		local time = tick()
		for plr, highlight in pairs(espHighlights) do
			local hue = (time * 60) % 360
			local color = Color3.fromHSV(hue / 360, 1, 1)
			highlight.FillColor = color
			highlight.OutlineColor = color
		end
	end)
end

local function disableESP()
	if not espEnabled then return end
	espEnabled = false
	for plr, highlight in pairs(espHighlights) do
		if highlight and highlight.Parent then
			highlight:Destroy()
		end
	end
	espHighlights = {}
	if espConnection then
		espConnection:Disconnect()
		espConnection = nil
	end
	if espRainbowConnection then
		espRainbowConnection:Disconnect()
		espRainbowConnection = nil
	end
end

-- NOCLIP implementation
local function enableNoclip()
	if noclipEnabled then return end
	noclipEnabled = true
	noclipConnection = RunService.Stepped:Connect(function()
		if Character then
			for _, part in pairs(Character:GetChildren()) do
				if part:IsA("BasePart") and part.CanCollide then
					part.CanCollide = false
				end
			end
		end
	end)
end

local function disableNoclip()
	if not noclipEnabled then return end
	noclipEnabled = false
	if noclipConnection then
		noclipConnection:Disconnect()
		noclipConnection = nil
	end
	if Character then
		for _, part in pairs(Character:GetChildren()) do
			if part:IsA("BasePart") then
				part.CanCollide = true
			end
		end
	end
end

-- WALK SPEED implementation
local function setWalkSpeed(speed)
	if Humanoid then
		Humanoid.WalkSpeed = speed
	end
end

-- TELEPORT implementation
local function teleportToPlayer(nameOrPrefix)
	if not nameOrPrefix or nameOrPrefix == "" then return end
	local targetPlayer = nil
	local lowerInput = nameOrPrefix:lower()
	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Name:lower():sub(1, #lowerInput) == lowerInput or (plr.DisplayName and plr.DisplayName:lower():sub(1, #lowerInput) == lowerInput) then
			targetPlayer = plr
			break
		end
	end
	if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
	end
end

-- GLITCH implementation (head and neck only)
local function startGlitch()
	if glitchEnabled then return end
	glitchEnabled = true

	local function glitchPlayer(plr)
		if not plr.Character then return end
		local head = plr.Character:FindFirstChild("Head")
		local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
		if not head or not humanoid then return end
		local neck = nil
		for _, joint in pairs(head:GetJoints()) do
			if joint.Name == "Neck" then
				neck = joint
				break
			end
		end
		if not neck then
			-- Try to find neck via HumanoidRootPart and Head CFrame difference
			neck = humanoid:FindFirstChild("Neck")
		end
		if glitchTargets[plr] then return end -- Already glitching

		local originalC0 = nil
		if neck and neck:IsA("Motor6D") then
			originalC0 = neck.C0
		end

		local glitching = true

		local conn
		conn = RunService.Heartbeat:Connect(function()
			if not glitchEnabled or not plr.Character or not head or not neck or not neck:IsDescendantOf(plr.Character) then
				conn:Disconnect()
				if neck and originalC0 then
					neck.C0 = originalC0
				end
				glitchTargets[plr] = nil
				return
			end
			local t = tick() * 20
			local offsetY = math.sin(t) * 2
			head.CFrame = head.CFrame * CFrame.new(0, offsetY, 0)
			if neck and neck:IsA("Motor6D") and originalC0 then
				neck.C0 = originalC0 * CFrame.new(0, offsetY, 0)
			end
		end)
		glitchTargets[plr] = conn
	end

	for _, plr in pairs(Players:GetPlayers()) do
		glitchPlayer(plr)
	end

	Players.PlayerAdded:Connect(function(plr)
		plr.CharacterAdded:Connect(function()
			if glitchEnabled then
				wait(0.1)
				glitchPlayer(plr)
			end
		end)
	end)
end

local function stopGlitch()
	if not glitchEnabled then return end
	glitchEnabled = false
	for plr, conn in pairs(glitchTargets) do
		if conn then
			conn:Disconnect()
		end
		if plr.Character then
			local head = plr.Character:FindFirstChild("Head")
			local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
			local neck = nil
			if head and humanoid then
				for _, joint in pairs(head:GetJoints()) do
					if joint.Name == "Neck" then
						neck = joint
						break
					end
				end
				if neck and neck:IsA("Motor6D") then
					neck.C0 = neck.C0 -- Reset to current to avoid weirdness
				end
			end
		end
	end
	glitchTargets = {}
end

-- HUMP implementation
local function startHump(targetName)
	if humpEnabled then return end
	if not targetName or targetName == "" then return end
	local targetPlayer = nil
	local lowerInput = targetName:lower()
	for _, plr in pairs(Players:GetPlayers()) do
		if plr.Name:lower():sub(1, #lowerInput) == lowerInput or (plr.DisplayName and plr.DisplayName:lower():sub(1, #lowerInput) == lowerInput) then
			targetPlayer = plr
			break
		end
	end
	if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

	humpEnabled = true
	humpTarget = targetPlayer

	-- Animation: move back and forth fast behind target, facing them, on ground
	local function humpStep()
		if not humpEnabled or not humpTarget or not humpTarget.Character or not humpTarget.Character:FindFirstChild("HumanoidRootPart") then
			return
		end
		local targetHRP = humpTarget.Character.HumanoidRootPart
		local targetCF = targetHRP.CFrame
		local behindOffset = -3 -- studs behind
		local heightOffset = -3 -- on ground (approximate)
		local directionToTarget = (targetCF.Position - HumanoidRootPart.Position).Unit
		local desiredPos = targetCF * CFrame.new(0, heightOffset, behindOffset)
		-- Face the target
		local lookAt = CFrame.new(desiredPos.Position, targetCF.Position)
		-- Oscillate back and forth fast
		local oscillate = math.sin(tick() * 30) * 1.5
		local offset = lookAt.LookVector * oscillate
		local finalPos = desiredPos.Position + offset
		HumanoidRootPart.CFrame = CFrame.new(finalPos, targetCF.Position)
	end

	humpAnimConnection = RunService.Heartbeat:Connect(function()
		if not humpEnabled then return end
		if not humpTarget or not humpTarget.Character or not humpTarget.Character:FindFirstChild("HumanoidRootPart") then
			humpEnabled = false
			if humpAnimConnection then
				humpAnimConnection:Disconnect()
				humpAnimConnection = nil
			end
			return
		end
		humpStep()
	end)
end

local function stopHump()
	if not humpEnabled then return end
	humpEnabled = false
	if humpAnimConnection then
		humpAnimConnection:Disconnect()
		humpAnimConnection = nil
	end
	humpTarget = nil
end

-- DISTANCE ESP implementation
local function enableDistanceESP()
	if distanceEspEnabled then return end
	distanceEspEnabled = true

	local function createDistanceLabel(plr)
		if plr == LocalPlayer then return end
		if distanceEspLabels[plr] then return end
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "DistanceESP"
		billboard.Adornee = nil
		billboard.Size = UDim2.new(0, 100, 0, 30)
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		billboard.AlwaysOnTop = true
		billboard.Parent = screenGui

		local textLabel = Instance.new("TextLabel")
		textLabel.BackgroundTransparency = 1
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = 18
		textLabel.TextStrokeTransparency = 0
		textLabel.Parent = billboard

		distanceEspLabels[plr] = {Billboard = billboard, Label = textLabel}
	end

	for _, plr in pairs(Players:GetPlayers()) do
		createDistanceLabel(plr)
	end

	Players.PlayerAdded:Connect(function(plr)
		createDistanceLabel(plr)
	end)

	distanceEspConnection = RunService.RenderStepped:Connect(function()
		if not distanceEspEnabled then return end
		for plr, data in pairs(distanceEspLabels) do
			if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				data.Billboard.Adornee = plr.Character.HumanoidRootPart
				local dist = (HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
				data.Label.Text = string.format("%s: %.1f studs", plr.Name, dist)
			else
				data.Billboard.Adornee = nil
				data.Label.Text = ""
			end
		end
	end)
end

local function disableDistanceESP()
	if not distanceEspEnabled then return end
	distanceEspEnabled = false
	if distanceEspConnection then
		distanceEspConnection:Disconnect()
		distanceEspConnection = nil
	end
	for _, data in pairs(distanceEspLabels) do
		if data.Billboard then
			data.Billboard:Destroy()
		end
	end
	distanceEspLabels = {}
end

-- GRAVITY CHANGER implementation
local function setGravity(value)
	value = tonumber(value)
	if not value then return end
	if value < 0 then value = 0 end
	if value > 100 then value = 100 end
	workspace.Gravity = value
	gravityChanged = true
end

local function resetGravity()
	workspace.Gravity = NORMAL_GRAVITY
	gravityChanged = false
end

-- ========== BUTTON CONNECTIONS ==========

btnFly.MouseButton1Click:Connect(function()
	startFly()
end)

btnUnFly.MouseButton1Click:Connect(function()
	stopFly()
end)

btnESP.MouseButton1Click:Connect(function()
	enableESP()
end)

btnUnESP.MouseButton1Click:Connect(function()
	disableESP()
end)

btnNoclip.MouseButton1Click:Connect(function()
	enableNoclip()
end)

btnUnNoclip.MouseButton1Click:Connect(function()
	disableNoclip()
end)

btnWalkSpeed.MouseButton1Click:Connect(function()
	setWalkSpeed(100)
end)

btnUnWalkSpeed.MouseButton1Click:Connect(function()
	setWalkSpeed(NORMAL_WALKSPEED)
end)

btnTeleport.MouseButton1Click:Connect(function()
	teleportToPlayer(tbTeleport.Text)
end)

btnGlitch.MouseButton1Click:Connect(function()
	startGlitch()
end)

btnUnGlitch.MouseButton1Click:Connect(function()
	stopGlitch()
end)

btnHump.MouseButton1Click:Connect(function()
	startHump(tbHump.Text)
end)

btnUnHump.MouseButton1Click:Connect(function()
	stopHump()
end)

btnDistanceESP.MouseButton1Click:Connect(function()
	enableDistanceESP()
end)

btnUnDistanceESP.MouseButton1Click:Connect(function()
	disableDistanceESP()
end)

btnGravityChanger.MouseButton1Click:Connect(function()
	setGravity(tbGravityChanger.Text)
end)

btnResetGravity.MouseButton1Click:Connect(function()
	resetGravity()
end)

-- Cleanup on character respawn
LocalPlayer.CharacterAdded:Connect(function(char)
	Character = char
	Humanoid = char:WaitForChild("Humanoid")
	HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
	-- Reset walk speed and gravity on respawn
	setWalkSpeed(NORMAL_WALKSPEED)
	resetGravity()
	-- Stop fly, noclip, hump, glitch on respawn
	stopFly()
	disableNoclip()
	stopHump()
	stopGlitch()
	disableESP()
	disableDistanceESP()
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Info service",
   Callback = function()
Rayfield:Notify({
   Title = "Window loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
            
-- LocalScript (Client) - OmamilchV5 Info Service
-- Place this script in StarterPlayerScripts or StarterGui as a LocalScript.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- RemoteEvent in ReplicatedStorage (optional; server should create it)
local REPORT_EVENT = ReplicatedStorage:FindFirstChild("ReportExploit")
if not REPORT_EVENT then
    warn("ReportExploit RemoteEvent not found in ReplicatedStorage. Server reporting disabled.")
end

-- === Configuration ===
local CONFIG = {
    SPEED_THRESHOLD = 32,
    JUMP_THRESHOLD = 100,
    DISTANCE_TELEPORT = 50,
    SPEED_TELEPORT = 150,
    TOOL_COUNT_THRESHOLD = 10,
    UPDATE_INTERVAL = 0.5,
    REPORT_DEBOUNCE = 10,
    SUDDEN_TOOL_GAIN = 5,
    WHITELIST = {},

    -- Fly detection
    FLY_AIRTIME_THRESHOLD = 2.0, -- seconds in air considered suspicious (client-side heuristic)

    -- Executor detection
    EXECUTOR_SUSPICION_REQUIRED = 1, -- number of positive indicators to consider executor present
}

-- lastChecks keyed by UserId:
-- { pos = Vector3, time = number, toolCount = number, lastReport = number, airtime = number, lastOnGround = boolean }
local lastChecks = {}

-- === GUI (black window) ===
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "InfoOverlay"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 500)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- black
frame.BorderSizePixel = 2
frame.Parent = screenGui
frame.Active = true

-- Header
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 40)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
header.BorderSizePixel = 0
header.Text = "OmamilchV5 info service"
header.TextScaled = true
header.Font = Enum.Font.SourceSansBold
header.TextColor3 = Color3.fromRGB(255, 255, 255) -- white
header.Parent = frame

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -40, 0, 5)
closeButton.Text = "X"
closeButton.TextScaled = true
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Parent = frame
closeButton.MouseButton1Click:Connect(function() screenGui:Destroy() end)

-- Info label (main text)
local infoLabel = Instance.new("TextLabel")
infoLabel.Size = UDim2.new(1, -10, 0, 360)
infoLabel.Position = UDim2.new(0, 5, 0, 45)
infoLabel.BackgroundTransparency = 1
infoLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
infoLabel.TextWrapped = true
infoLabel.TextScaled = false
infoLabel.TextSize = 16
infoLabel.Font = Enum.Font.Code
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top
infoLabel.Parent = frame

-- Select Player button
local selectButton = Instance.new("TextButton")
selectButton.Size = UDim2.new(0, 150, 0, 35)
selectButton.Position = UDim2.new(0, 5, 0, 415)
selectButton.Text = "Select Player"
selectButton.TextScaled = true
selectButton.BackgroundColor3 = Color3.fromRGB(50, 150, 200)
selectButton.Parent = frame

-- Dropdown
local dropdown = Instance.new("ScrollingFrame")
dropdown.Size = UDim2.new(0, 150, 0, 0)
dropdown.Position = UDim2.new(0, 5, 0, 455)
dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
dropdown.BorderSizePixel = 1
dropdown.CanvasSize = UDim2.new(0, 0, 0, 0)
dropdown.ScrollBarThickness = 6
dropdown.Parent = frame
dropdown.ClipsDescendants = true

local open = false
local currentTarget = player

selectButton.MouseButton1Click:Connect(function()
    open = not open
    if open then
        local playersCount = #Players:GetPlayers()
        local targetHeight = math.min(playersCount * 30, 200)
        dropdown:TweenSize(UDim2.new(0, 150, 0, targetHeight), "Out", "Quad", 0.15, true)
    else
        dropdown:TweenSize(UDim2.new(0, 150, 0, 0), "Out", "Quad", 0.15, true)
    end
end)

-- Refresh dropdown contents
local function refreshDropdown()
    for _, child in ipairs(dropdown:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    local yPos = 0
    for _, p in pairs(Players:GetPlayers()) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, 0, 0, 30)
        btn.Position = UDim2.new(0, 0, 0, yPos)
        btn.Text = p.Name
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.Parent = dropdown
        btn.MouseButton1Click:Connect(function()
            currentTarget = p
            updateInfo()
            dropdown:TweenSize(UDim2.new(0, 150, 0, 0), "Out", "Quad", 0.15, true)
            open = false
        end)
        yPos = yPos + 30
    end
    dropdown.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

Players.PlayerAdded:Connect(refreshDropdown)
Players.PlayerRemoving:Connect(function(p)
    refreshDropdown()
    if lastChecks[p.UserId] then lastChecks[p.UserId] = nil end
end)
refreshDropdown()

-- Utility: safe pcall check
local function safeCheck(fn)
    local ok, res = pcall(fn)
    if ok then return true, res end
    return false, nil
end

-- Executor detection heuristics (client-side)
local function detectExecutors()
    local positives = {}

    -- Known global indicators
    local knownGlobals = {
        "syn", "is_sirhurt_closure", "secure_load", "KRNL_LOADED", "fluxus", "protofunc",
        "FuzzyDuck", "DarkDex", "RynxConsole", "CommandN", "soar", "EasyExploits",
        "OPx", "ape", "Protosmasher", "WRD", "Ident", "REC", "Electron", "Oxygen",
        "execute", "pebc_execute", "identifyexecutor", "getexecutor", "ExploitAPI",
    }

    for _, name in ipairs(knownGlobals) do
        local ok, val = safeCheck(function() return _G[name] end)
        if ok and val ~= nil then
            table.insert(positives, "Global: " .. name)
        else
            local ok2, val2 = safeCheck(function() return rawget(_G, name) end)
            if ok2 and val2 ~= nil then
                table.insert(positives, "Global(raw): " .. name)
            end
        end
    end

    -- Known function/global names for executors
    local knownFuncs = {
        "isfile","writefile","readfile","appendfile","delfile","makefolder","isfolder",
        "listfiles","listfolders","http_request","httprequest","request","hookfunction",
        "hookmetamethod","getrawmetatable","setreadonly","islclosure","getgc","getconstants",
        "getupvalues","getscriptclosure","getinfo","setfflag","getfflag","identifyexecutor",
    }
    for _, fname in ipairs(knownFuncs) do
        local ok, val = safeCheck(function() return _G[fname] end)
        if ok and val ~= nil then
            table.insert(positives, "Func/global: " .. fname)
        end
    end

    -- try calling identifyexecutor/getexecutor safely
    local okIdent, ident = safeCheck(function()
        if type(identifyexecutor) == "function" then return identifyexecutor() end
        if type(getexecutor) == "function" then return getexecutor() end
        if _G.identifyexecutor and type(_G.identifyexecutor) == "function" then return _G.identifyexecutor() end
        return nil
    end)
    if okIdent and ident then
        table.insert(positives, "identifyexecutor(): " .. tostring(ident))
    end

    -- syn table specifics
    local okSyn, synTbl = safeCheck(function() return syn end)
    if okSyn and type(synTbl) == "table" then
        table.insert(positives, "syn table detected")
        if synTbl.request or synTbl.writefile or synTbl.protect_gui then
            table.insert(positives, "syn api exposed")
        end
    end

    -- Debug-like functions presence
    local debugFuncs = {"getrawmetatable", "hookfunction", "hookmetamethod", "getgc", "newcclosure"}
    for _, dfn in ipairs(debugFuncs) do
        local ok, val = safeCheck(function() return _G[dfn] end)
        if ok and val ~= nil then
            table.insert(positives, "Debug/global: " .. dfn)
        end
    end

    -- file I/O heuristic
    local ok_io, io_exists = safeCheck(function() return type(isfile) == "function" or type(writefile) == "function" end)
    if ok_io and io_exists then table.insert(positives, "file I/O APIs available") end

    -- return positives (strings)
    return positives
end

-- Exploit checks (returns list of strings)
local function performExploitChecks(target)
    local suspects = {}
    if not target then return suspects end

    local uid = target.UserId
    if CONFIG.WHITELIST[uid] then return suspects end

    local char = target.Character
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    local hrp = char and char:FindFirstChild("HumanoidRootPart")

    -- Basic humanoid-based checks: speed, jump, health
    if humanoid then
        local walk = humanoid.WalkSpeed or 0
        local jump = humanoid.JumpPower or humanoid.JumpHeight or 0
        if walk > CONFIG.SPEED_THRESHOLD then
            table.insert(suspects, string.format("SpeedHack? (WalkSpeed=%.1f)", walk))
        end
        if jump > CONFIG.JUMP_THRESHOLD then
            table.insert(suspects, string.format("JumpHack? (Jump=%.1f)", jump))
        end
        if humanoid.Health and humanoid.MaxHealth and humanoid.Health > humanoid.MaxHealth then
            table.insert(suspects, string.format("HealthHack? (Health=%.1f Max=%.1f)", humanoid.Health, humanoid.MaxHealth))
        end
    end

    -- Position / teleport / unnatural movement checks
    if hrp then
        local now = tick()
        local pos = hrp.Position
        local last = lastChecks[uid] or {}
        if last.pos and last.time then
            local dt = now - last.time
            if dt > 0 then
                local dist = (pos - last.pos).Magnitude
                local speed = dist / dt
                if dist > CONFIG.DISTANCE_TELEPORT then
                    table.insert(suspects, string.format("Teleport? (Δ=%.1f studs)", dist))
                elseif speed > CONFIG.SPEED_TELEPORT then
                    table.insert(suspects, string.format("Unnatural Movement (%.1f studs/s)", speed))
                end
            end
        end

        -- Fly detection (airtime heuristic)
        lastChecks[uid] = lastChecks[uid] or {}
        lastChecks[uid].airtime = lastChecks[uid].airtime or 0
        lastChecks[uid].lastOnGround = (lastChecks[uid].lastOnGround == nil) and true or lastChecks[uid].lastOnGround

        local onGroundNow = true
        if humanoid then
            if humanoid.FloorMaterial == Enum.Material.Air then
                onGroundNow = false
            else
                onGroundNow = true
            end
        else
            onGroundNow = true
        end

        if not onGroundNow then
            lastChecks[uid].airtime = lastChecks[uid].airtime + math.max(0, now - (lastChecks[uid].time or now))
        else
            lastChecks[uid].airtime = 0
        end

        if lastChecks[uid].airtime and lastChecks[uid].airtime >= CONFIG.FLY_AIRTIME_THRESHOLD then
            local jumpPower = (humanoid and (humanoid.JumpPower or humanoid.JumpHeight)) or 0
            if jumpPower < CONFIG.JUMP_THRESHOLD then
                table.insert(suspects, string.format("Possible Fly (airtime=%.2fs)", lastChecks[uid].airtime))
            end
        end

        lastChecks[uid].pos = pos
        lastChecks[uid].time = now
        lastChecks[uid].lastOnGround = onGroundNow
    end

    -- Inventory / Backpack checks
    local bp = target:FindFirstChild("Backpack")
    if bp then
        local toolCount = 0
        for _, item in pairs(bp:GetChildren()) do
            if item:IsA("Tool") then toolCount = toolCount + 1 end
        end
        local last = lastChecks[uid] or {}
        local lastTool = last.toolCount or toolCount
        if toolCount > CONFIG.TOOL_COUNT_THRESHOLD then
            table.insert(suspects, string.format("Many Tools (%d)", toolCount))
        end
        if toolCount - lastTool > CONFIG.SUDDEN_TOOL_GAIN then
            table.insert(suspects, "Sudden Tool Gain?")
        end
        lastChecks[uid] = lastChecks[uid] or {}
        lastChecks[uid].toolCount = toolCount
    end

    -- Executor detection (only for local player)
    if target == player then
        local positives = detectExecutors()
        if #positives >= CONFIG.EXECUTOR_SUSPICION_REQUIRED then
            for _, pstr in ipairs(positives) do
                table.insert(suspects, "Executor detected: " .. pstr)
            end
        end
    end

    return suspects
end

-- Format player info text (includes Execute: YES/NO for local player)
local function getPlayerInfo(target)
    if not target then return "No player selected." end
    local out = {}

    -- Executor headline for local player
    if target == player then
        local positives = detectExecutors()
        if #positives > 0 then
            table.insert(out, "Execute: YES - " .. table.concat(positives, ", "))
        else
            table.insert(out, "Execute: NO")
        end
    end

    -- Basic info
    table.insert(out, "Name: " .. tostring(target.Name))
    table.insert(out, "DisplayName: " .. tostring(target.DisplayName or ""))
    table.insert(out, "UserId: " .. tostring(target.UserId))
    table.insert(out, "Account Age: " .. math.floor(target.AccountAge or 0) .. " days")
    table.insert(out, "Team: " .. (target.Team and target.Team.Name or "No Team"))
    table.insert(out, "Premium: " .. tostring(target.MembershipType == Enum.MembershipType.Premium))

    if target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
        local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
        table.insert(out, string.format("Health: %d / %d", math.floor(humanoid.Health), math.floor(humanoid.MaxHealth)))
        table.insert(out, "WalkSpeed: " .. tostring(humanoid.WalkSpeed))
        table.insert(out, "Jump: " .. tostring(humanoid.JumpPower or humanoid.JumpHeight or "n/a"))
        local hrp = target.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos = hrp.Position
            table.insert(out, string.format("Position: (%.1f, %.1f, %.1f)", pos.X, pos.Y, pos.Z))
            local last = lastChecks[target.UserId] or {}
            if last.airtime and last.airtime > 0 then
                table.insert(out, string.format("Airtime(last): %.2fs", last.airtime))
            end
        end
    else
        table.insert(out, "Character: Not Available")
    end

    -- Inventory
    local toolNames = {}
    local bp = target:FindFirstChild("Backpack")
    if bp then
        for _, item in pairs(bp:GetChildren()) do
            if item:IsA("Tool") then table.insert(toolNames, item.Name) end
        end
    end
    table.insert(out, "Inventory: " .. (#toolNames > 0 and table.concat(toolNames, ", ") or "Empty"))

    -- Exploit checks (append)
    local suspects = performExploitChecks(target)
    if #suspects > 0 then
        table.insert(out, "\n--- Exploit Suspicion ---")
        for _, s in ipairs(suspects) do table.insert(out, s) end
    else
        table.insert(out, "\nExploit Suspicion: No anomalies detected.")
    end

    return table.concat(out, "\n")
end

-- UI update
local function updateInfo()
    if currentTarget and currentTarget.Parent == nil then currentTarget = player end
    infoLabel.Text = getPlayerInfo(currentTarget)
end

-- Report to server (debounced)
local function reportToServer(target, reasons)
    if not REPORT_EVENT then return end
    if not target then return end

    local uid = target.UserId
    lastChecks[uid] = lastChecks[uid] or {}
    local lastReport = lastChecks[uid].lastReport or 0
    if tick() - lastReport < CONFIG.REPORT_DEBOUNCE then return end
    lastChecks[uid].lastReport = tick()

    local payload = {
        TargetUserId = uid,
        TargetName = target.Name,
        ReporterUserId = player.UserId,
        Reason = reasons,
        Timestamp = os.time(),
    }

    REPORT_EVENT:FireServer(payload)
end

-- Press "R" key to report current target if suspicious
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.R then
        local suspects = performExploitChecks(currentTarget)
        if #suspects > 0 then
            reportToServer(currentTarget, suspects)
        else
            infoLabel.Text = getPlayerInfo(currentTarget) .. "\n\nNo suspicion — report not sent."
        end
    end
end)

-- Dragging
local dragging, dragInput, dragStart, startPos = false, nil, nil, nil
local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                               startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

-- Main loop (periodic updates)
local accumulator = 0
RunService.Heartbeat:Connect(function(dt)
    accumulator = accumulator + dt
    if accumulator >= CONFIG.UPDATE_INTERVAL then
        accumulator = accumulator - CONFIG.UPDATE_INTERVAL

        -- initialize checking data for players with HRP
        for _, p in pairs(Players:GetPlayers()) do
            local char = p.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                lastChecks[p.UserId] = lastChecks[p.UserId] or {}
                if not lastChecks[p.UserId].time then
                    lastChecks[p.UserId].pos = hrp.Position
                    lastChecks[p.UserId].time = tick()
                    lastChecks[p.UserId].toolCount = lastChecks[p.UserId].toolCount or 0
                    lastChecks[p.UserId].airtime = lastChecks[p.UserId].airtime or 0
                    lastChecks[p.UserId].lastOnGround = lastChecks[p.UserId].lastOnGround or true
                end
            end
        end

        updateInfo()
    end
end)

-- Initial update
updateInfo()


            -- LocalScript in StarterPlayerScripts
 
local Players = game:GetService("Players")
 
-- Funktion zum Erstellen von Nametags
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        if not player.Character.Head:FindFirstChild("ESP") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP"
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = player.Character.Head
 
            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.TextColor3 = Color3.fromRGB(0, 255, 0)
            text.TextStrokeTransparency = 0
            text.Text = player.Name
            text.Parent = billboard
        end
    end
end
 
-- Wenn ein neuer Spieler spawnt
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        createESP(player)
    end)
end)
 
-- Für bereits vorhandene Spieler
for _, player in pairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        if player.Character then
            createESP(player)
        end
        player.CharacterAdded:Connect(function()
            task.wait(1)
            createESP(player)
        end)
    end
end
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Teleport",
   Callback = function()
Rayfield:Notify({
   Title = "MENU",
   Content = "Have FUn",
   Duration = 8.1,
   Image = nil,
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- GUI setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 370, 0, 560)
Frame.Position = UDim2.new(0.5, -185, 0.5, -280)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Frame.BackgroundTransparency = 0.15
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Rounded corners
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 18)

-- Top bar for title and close button
local TopBar = Instance.new("Frame", Frame)
TopBar.Size = UDim2.new(1, 0, 0, 38)
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner", TopBar)
TopBarCorner.CornerRadius = UDim.new(0, 18)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.Text = "Teleport Menu"
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left

local closeBtn = Instance.new("TextButton", TopBar)
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -36, 0, 3)
closeBtn.Text = "✕"
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.TextSize = 22
closeBtn.Font = Enum.Font.GothamBold
closeBtn.AutoButtonColor = true
local closeUICorner = Instance.new("UICorner", closeBtn)
closeUICorner.CornerRadius = UDim.new(1, 0)

-- Tab buttons
local TabContainer = Instance.new("Frame", Frame)
TabContainer.Size = UDim2.new(1, -24, 0, 40)
TabContainer.Position = UDim2.new(0, 12, 0, 44)
TabContainer.BackgroundTransparency = 1

local playersTab = Instance.new("TextButton", TabContainer)
playersTab.Size = UDim2.new(0.5, -2, 1, 0)
playersTab.Position = UDim2.new(0, 0, 0, 0)
playersTab.Text = "Players"
playersTab.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
playersTab.TextColor3 = Color3.new(1,1,1)
playersTab.TextSize = 18
playersTab.Font = Enum.Font.GothamBold
local playersTabCorner = Instance.new("UICorner", playersTab)
playersTabCorner.CornerRadius = UDim.new(0, 8)

local cframeTab = Instance.new("TextButton", TabContainer)
cframeTab.Size = UDim2.new(0.5, -2, 1, 0)
cframeTab.Position = UDim2.new(0.5, 2, 0, 0)
cframeTab.Text = "CFrame"
cframeTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
cframeTab.TextColor3 = Color3.new(1,1,1)
cframeTab.TextSize = 18
cframeTab.Font = Enum.Font.GothamBold
local cframeTabCorner = Instance.new("UICorner", cframeTab)
cframeTabCorner.CornerRadius = UDim.new(0, 8)

-- Main content frames
local PlayersContent = Instance.new("Frame", Frame)
PlayersContent.Size = UDim2.new(1, -24, 1, -94)
PlayersContent.Position = UDim2.new(0, 12, 0, 88)
PlayersContent.BackgroundTransparency = 1
PlayersContent.Visible = true

local CFrameContent = Instance.new("Frame", Frame)
CFrameContent.Size = UDim2.new(1, -24, 1, -94)
CFrameContent.Position = UDim2.new(0, 12, 0, 88)
CFrameContent.BackgroundTransparency = 1
CFrameContent.Visible = false

-- PLAYERS TAB CONTENT --
-- Direction selection
local dirLabel = Instance.new("TextLabel", PlayersContent)
dirLabel.Size = UDim2.new(1, 0, 0, 28)
dirLabel.Position = UDim2.new(0, 0, 0, 0)
dirLabel.Text = "Choose teleport direction:"
dirLabel.BackgroundTransparency = 1
dirLabel.TextColor3 = Color3.new(1,1,1)
dirLabel.TextSize = 17
dirLabel.Font = Enum.Font.Gotham

local frontBtn = Instance.new("TextButton", PlayersContent)
frontBtn.Size = UDim2.new(0.48, -3, 0, 32)
frontBtn.Position = UDim2.new(0, 0, 0, 32)
frontBtn.Text = "In Front"
frontBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 80)
frontBtn.TextColor3 = Color3.new(1,1,1)
frontBtn.TextSize = 17
frontBtn.Font = Enum.Font.GothamBold
local frontUICorner = Instance.new("UICorner", frontBtn)
frontUICorner.CornerRadius = UDim.new(0, 8)

local backBtn = Instance.new("TextButton", PlayersContent)
backBtn.Size = UDim2.new(0.48, -3, 0, 32)
backBtn.Position = UDim2.new(0.52, 3, 0, 32)
backBtn.Text = "Behind"
backBtn.BackgroundColor3 = Color3.fromRGB(160, 80, 80)
backBtn.TextColor3 = Color3.new(1,1,1)
backBtn.TextSize = 17
backBtn.Font = Enum.Font.GothamBold
local backUICorner = Instance.new("UICorner", backBtn)
backUICorner.CornerRadius = UDim.new(0, 8)

local errorLabel = Instance.new("TextLabel", PlayersContent)
errorLabel.Size = UDim2.new(1, 0, 0, 22)
errorLabel.Position = UDim2.new(0, 0, 0, 68)
errorLabel.Text = ""
errorLabel.BackgroundTransparency = 1
errorLabel.TextColor3 = Color3.new(1,0.2,0.2)
errorLabel.TextSize = 15
errorLabel.Font = Enum.Font.Gotham

local listLabel = Instance.new("TextLabel", PlayersContent)
listLabel.Size = UDim2.new(1, 0, 0, 24)
listLabel.Position = UDim2.new(0, 0, 0, 94)
listLabel.Text = "Players:"
listLabel.BackgroundTransparency = 1
listLabel.TextColor3 = Color3.new(1,1,1)
listLabel.TextSize = 17
listLabel.Font = Enum.Font.Gotham

local playerFrame = Instance.new("ScrollingFrame", PlayersContent)
playerFrame.Size = UDim2.new(1, 0, 0, 220)
playerFrame.Position = UDim2.new(0, 0, 0, 120)
playerFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
playerFrame.BackgroundTransparency = 0.3
playerFrame.BorderSizePixel = 0
playerFrame.ScrollBarThickness = 6
local playerFrameCorner = Instance.new("UICorner", playerFrame)
playerFrameCorner.CornerRadius = UDim.new(0, 8)

local playerListLayout = Instance.new("UIListLayout", playerFrame)
playerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
playerListLayout.Padding = UDim.new(0, 6)

local tpBtn = Instance.new("TextButton", PlayersContent)
tpBtn.Size = UDim2.new(0.48, -3, 0, 36)
tpBtn.Position = UDim2.new(0, 0, 1, -40)
tpBtn.Text = "Teleport Once"
tpBtn.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
tpBtn.TextColor3 = Color3.new(1,1,1)
tpBtn.TextSize = 18
tpBtn.Font = Enum.Font.GothamBold
local tpUICorner = Instance.new("UICorner", tpBtn)
tpUICorner.CornerRadius = UDim.new(0, 8)

local contBtn = Instance.new("TextButton", PlayersContent)
contBtn.Size = UDim2.new(0.48, -3, 0, 36)
contBtn.Position = UDim2.new(0.52, 3, 1, -40)
contBtn.Text = "Continuous Teleport"
contBtn.BackgroundColor3 = Color3.fromRGB(200, 120, 80)
contBtn.TextColor3 = Color3.new(1,1,1)
contBtn.TextSize = 18
contBtn.Font = Enum.Font.GothamBold
local contUICorner = Instance.new("UICorner", contBtn)
contUICorner.CornerRadius = UDim.new(0, 8)

-- CFRAME TAB CONTENT --
local cframeLabel = Instance.new("TextLabel", CFrameContent)
cframeLabel.Size = UDim2.new(1, 0, 0, 28)
cframeLabel.Position = UDim2.new(0, 0, 0, 0)
cframeLabel.Text = "CFrame Teleport:"
cframeLabel.BackgroundTransparency = 1
cframeLabel.TextColor3 = Color3.new(1,1,1)
cframeLabel.TextSize = 17
cframeLabel.Font = Enum.Font.Gotham

local saveCFrameBtn = Instance.new("TextButton", CFrameContent)
saveCFrameBtn.Size = UDim2.new(1, 0, 0, 36)
saveCFrameBtn.Position = UDim2.new(0, 0, 0, 32)
saveCFrameBtn.Text = "Save Current Position"
saveCFrameBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 80)
saveCFrameBtn.TextColor3 = Color3.new(1,1,1)
saveCFrameBtn.TextSize = 18
saveCFrameBtn.Font = Enum.Font.GothamBold
local saveCFrameCorner = Instance.new("UICorner", saveCFrameBtn)
saveCFrameCorner.CornerRadius = UDim.new(0, 8)

local cframeInfoLabel = Instance.new("TextLabel", CFrameContent)
cframeInfoLabel.Size = UDim2.new(1, 0, 0, 24)
cframeInfoLabel.Position = UDim2.new(0, 0, 0, 78)
cframeInfoLabel.Text = "Saved Positions:"
cframeInfoLabel.BackgroundTransparency = 1
cframeInfoLabel.TextColor3 = Color3.new(1,1,1)
cframeInfoLabel.TextSize = 17
cframeInfoLabel.Font = Enum.Font.Gotham

local cframeListFrame = Instance.new("ScrollingFrame", CFrameContent)
cframeListFrame.Size = UDim2.new(1, 0, 0, 280)
cframeListFrame.Position = UDim2.new(0, 0, 0, 104)
cframeListFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
cframeListFrame.BackgroundTransparency = 0.3
cframeListFrame.BorderSizePixel = 0
cframeListFrame.ScrollBarThickness = 6
local cframeListCorner = Instance.new("UICorner", cframeListFrame)
cframeListCorner.CornerRadius = UDim.new(0, 8)

local cframeListLayout = Instance.new("UIListLayout", cframeListFrame)
cframeListLayout.SortOrder = Enum.SortOrder.LayoutOrder
cframeListLayout.Padding = UDim.new(0, 6)

local clearAllBtn = Instance.new("TextButton", CFrameContent)
clearAllBtn.Size = UDim2.new(1, 0, 0, 32)
clearAllBtn.Position = UDim2.new(0, 0, 1, -36)
clearAllBtn.Text = "Clear All Positions"
clearAllBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
clearAllBtn.TextColor3 = Color3.new(1,1,1)
clearAllBtn.TextSize = 16
clearAllBtn.Font = Enum.Font.GothamBold
local clearAllCorner = Instance.new("UICorner", clearAllBtn)
clearAllCorner.CornerRadius = UDim.new(0, 8)

local cframeErrorLabel = Instance.new("TextLabel", CFrameContent)
cframeErrorLabel.Size = UDim2.new(1, 0, 0, 20)
cframeErrorLabel.Position = UDim2.new(0, 0, 1, -60)
cframeErrorLabel.Text = ""
cframeErrorLabel.BackgroundTransparency = 1
cframeErrorLabel.TextColor3 = Color3.new(1,0.2,0.2)
cframeErrorLabel.TextSize = 14
cframeErrorLabel.Font = Enum.Font.Gotham

-- Tab switching logic
local currentTab = "Players"

local function switchTab(tabName)
    if tabName == "Players" then
        PlayersContent.Visible = true
        CFrameContent.Visible = false
        playersTab.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
        cframeTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
    elseif tabName == "CFrame" then
        PlayersContent.Visible = false
        CFrameContent.Visible = true
        playersTab.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
        cframeTab.BackgroundColor3 = Color3.fromRGB(80, 120, 200)
    end
    currentTab = tabName
end

playersTab.MouseButton1Click:Connect(function()
    switchTab("Players")
end)

cframeTab.MouseButton1Click:Connect(function()
    switchTab("CFrame")
end)

-- PLAYERS TAB LOGIC --
local direction = nil
local selectedPlayer = nil
local teleporting = false

frontBtn.MouseButton1Click:Connect(function()
    direction = "Front"
    frontBtn.BackgroundColor3 = Color3.fromRGB(60, 220, 100)
    backBtn.BackgroundColor3 = Color3.fromRGB(160, 80, 80)
    errorLabel.Text = ""
end)

backBtn.MouseButton1Click:Connect(function()
    direction = "Back"
    backBtn.BackgroundColor3 = Color3.fromRGB(220, 100, 100)
    frontBtn.BackgroundColor3 = Color3.fromRGB(60, 160, 80)
    errorLabel.Text = ""
end)

local function teleportToPlayer(target, dir)
    local char = LocalPlayer.Character
    local targetChar = target and target.Character
    if char and targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
        local root = char:FindFirstChild("HumanoidRootPart")
        local targetRoot = targetChar.HumanoidRootPart
        if root then
            local offset = dir == "Front" and -3 or 3
            root.CFrame = targetRoot.CFrame * CFrame.new(0, 0, offset)
        end
    end
end

local function addPlayerButton(player)
    local btn = Instance.new("TextButton", playerFrame)
    btn.Size = UDim2.new(1, -12, 0, 48)
    btn.Text = ""
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.LayoutOrder = player.UserId
    btn.AutoButtonColor = true
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 10)

    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size48x48
    local content, _ = Players:GetUserThumbnailAsync(player.UserId, thumbType, thumbSize)
    local img = Instance.new("ImageLabel", btn)
    img.Size = UDim2.new(0, 38, 0, 38)
    img.Position = UDim2.new(0, 5, 0.5, -19)
    img.Image = content
    img.BackgroundTransparency = 1

    local nameLabel = Instance.new("TextLabel", btn)
    nameLabel.Size = UDim2.new(1, -50, 1, 0)
    nameLabel.Position = UDim2.new(0, 48, 0, 0)
    nameLabel.Text = player.Name
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.new(1,1,1)
    nameLabel.Font = Enum.Font.Gotham
    nameLabel.TextSize = 18
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left

    btn.MouseButton1Click:Connect(function()
        selectedPlayer = player
        for _, b in ipairs(playerFrame:GetChildren()) do
            if b:IsA("TextButton") then
                b.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
            end
        end
        btn.BackgroundColor3 = Color3.fromRGB(80, 120, 180)
        errorLabel.Text = ""
    end)
    
    -- Update scroll canvas size
    local playerCount = #Players:GetPlayers() - 1 -- Subtract 1 for LocalPlayer
    playerFrame.CanvasSize = UDim2.new(0, 0, 0, playerCount * 54)
end

local function updatePlayerListSize()
    local playerCount = 0
    for _, child in ipairs(playerFrame:GetChildren()) do
        if child:IsA("TextButton") then
            playerCount = playerCount + 1
        end
    end
    playerFrame.CanvasSize = UDim2.new(0, 0, 0, playerCount * 54)
end

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        addPlayerButton(player)
    end
end
updatePlayerListSize()

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        addPlayerButton(player)
        updatePlayerListSize()
    end
end)

Players.PlayerRemoving:Connect(function(player)
    for _, btn in ipairs(playerFrame:GetChildren()) do
        if btn:IsA("TextButton") then
            for _, child in ipairs(btn:GetChildren()) do
                if child:IsA("TextLabel") and child.Text == player.Name then
                    btn:Destroy()
                    updatePlayerListSize()
                end
            end
        end
    end
    if selectedPlayer == player then
        selectedPlayer = nil
    end
end)

tpBtn.MouseButton1Click:Connect(function()
    if not selectedPlayer then
        errorLabel.Text = "Select a player first!"
        return
    end
    if not direction then
        errorLabel.Text = "Choose a direction first!"
        return
    end
    teleportToPlayer(selectedPlayer, direction)
end)

local contConnection = nil
contBtn.MouseButton1Click:Connect(function()
    if teleporting then
        teleporting = false
        contBtn.Text = "Continuous Teleport"
        errorLabel.Text = ""
        if contConnection then
            contConnection:Disconnect()
            contConnection = nil
        end
        return
    end
    if not selectedPlayer then
        errorLabel.Text = "Select a player first!"
        return
    end
    if not direction then
        errorLabel.Text = "Choose a direction first!"
        return
    end
    teleporting = true
    contBtn.Text = "Stop Teleporting"
    errorLabel.Text = ""
    contConnection = game:GetService("RunService").RenderStepped:Connect(function()
        teleportToPlayer(selectedPlayer, direction)
    end)
end)

-- CFRAME TAB LOGIC --
local savedCFrames = {}
local cframeCounter = 0

local function updateCFrameList()
    cframeListFrame.CanvasSize = UDim2.new(0, 0, 0, #savedCFrames * 54 + (#savedCFrames - 1) * 6)
end

local function createEditableLabel(parent, text, onTextChanged)
    local labelFrame = Instance.new("Frame", parent)
    labelFrame.Size = UDim2.new(1, -140, 1, 0)
    labelFrame.Position = UDim2.new(0, 10, 0, 0)
    labelFrame.BackgroundTransparency = 1

    local displayLabel = Instance.new("TextLabel", labelFrame)
    displayLabel.Size = UDim2.new(1, 0, 1, 0)
    displayLabel.Text = text
    displayLabel.BackgroundTransparency = 1
    displayLabel.TextColor3 = Color3.new(1,1,1)
    displayLabel.Font = Enum.Font.Gotham
    displayLabel.TextSize = 16
    displayLabel.TextXAlignment = Enum.TextXAlignment.Left

    local textBox = Instance.new("TextBox", labelFrame)
    textBox.Size = UDim2.new(1, 0, 1, 0)
    textBox.Text = text
    textBox.BackgroundColor3 = Color3.fromRGB(60, 60, 75)
    textBox.TextColor3 = Color3.new(1,1,1)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 16
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.Visible = false
    textBox.ClearTextOnFocus = false
    local textBoxCorner = Instance.new("UICorner", textBox)
    textBoxCorner.CornerRadius = UDim.new(0, 4)

    local isEditing = false

    displayLabel.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isEditing = true
            displayLabel.Visible = false
            textBox.Visible = true
            textBox:CaptureFocus()
        end
    end)

    textBox.FocusLost:Connect(function()
        isEditing = false
        local newText = textBox.Text
        if newText ~= "" then
            displayLabel.Text = newText
            if onTextChanged then
                onTextChanged(newText)
            end
        end
        textBox.Visible = false
        displayLabel.Visible = true
    end)

    return displayLabel, textBox
end

local function addCFrameEntry(cframe, name)
    cframeCounter = cframeCounter + 1
    local entry = {
        cframe = cframe,
        name = name or ("Position " .. cframeCounter),
        id = cframeCounter
    }
    table.insert(savedCFrames, entry)

    local entryFrame = Instance.new("Frame", cframeListFrame)
    entryFrame.Size = UDim2.new(1, -12, 0, 48)
    entryFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    entryFrame.BorderSizePixel = 0
    entryFrame.LayoutOrder = entry.id
    local entryCorner = Instance.new("UICorner", entryFrame)
    entryCorner.CornerRadius = UDim.new(0, 8)

    local nameLabel, nameTextBox = createEditableLabel(entryFrame, entry.name, function(newName)
        entry.name = newName
        for i, v in ipairs(savedCFrames) do
            if v.id == entry.id then
                v.name = newName
                break
            end
        end
    end)

    local tpCFrameBtn = Instance.new("TextButton", entryFrame)
    tpCFrameBtn.Size = UDim2.new(0, 70, 0, 28)
    tpCFrameBtn.Position = UDim2.new(1, -108, 0.5, -14)
    tpCFrameBtn.Text = "Teleport"
    tpCFrameBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 80)
    tpCFrameBtn.TextColor3 = Color3.new(1,1,1)
    tpCFrameBtn.TextSize = 14
    tpCFrameBtn.Font = Enum.Font.GothamBold
    local tpCFrameCorner = Instance.new("UICorner", tpCFrameBtn)
    tpCFrameCorner.CornerRadius = UDim.new(0, 6)

    local deleteCFrameBtn = Instance.new("TextButton", entryFrame)
    deleteCFrameBtn.Size = UDim2.new(0, 28, 0, 28)
    deleteCFrameBtn.Position = UDim2.new(1, -32, 0.5, -14)
    deleteCFrameBtn.Text = "✕"
    deleteCFrameBtn.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
    deleteCFrameBtn.TextColor3 = Color3.new(1,1,1)
    deleteCFrameBtn.TextSize = 16
    deleteCFrameBtn.Font = Enum.Font.GothamBold
    local deleteCFrameCorner = Instance.new("UICorner", deleteCFrameBtn)
    deleteCFrameCorner.CornerRadius = UDim.new(0, 6)

    tpCFrameBtn.MouseButton1Click:Connect(function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = entry.cframe
            cframeErrorLabel.Text = "Teleported to " .. entry.name
            cframeErrorLabel.TextColor3 = Color3.new(0.2, 1, 0.2)
            wait(2)
            cframeErrorLabel.Text = ""
        else
            cframeErrorLabel.Text = "Character not found!"
            cframeErrorLabel.TextColor3 = Color3.new(1, 0.2, 0.2)
        end
    end)

    deleteCFrameBtn.MouseButton1Click:Connect(function()
        for i, v in ipairs(savedCFrames) do
            if v.id == entry.id then
                table.remove(savedCFrames, i)
                break
            end
        end
        entryFrame:Destroy()
        updateCFrameList()
        cframeErrorLabel.Text = "Deleted " .. entry.name
        cframeErrorLabel.TextColor3 = Color3.new(1, 0.8, 0.2)
    end)

    updateCFrameList()
end

saveCFrameBtn.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local currentCFrame = char.HumanoidRootPart.CFrame
        local positionName = "Position " .. (cframeCounter + 1)
        addCFrameEntry(currentCFrame, positionName)
        cframeErrorLabel.Text = "Position saved!"
        cframeErrorLabel.TextColor3 = Color3.new(0.2, 1, 0.2)
    else
        cframeErrorLabel.Text = "Character not found!"
        cframeErrorLabel.TextColor3 = Color3.new(1, 0.2, 0.2)
    end
end)

clearAllBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(cframeListFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    savedCFrames = {}
    cframeCounter = 0
    updateCFrameList()
    cframeErrorLabel.Text = "All positions cleared!"
    cframeErrorLabel.TextColor3 = Color3.new(1, 0.8, 0.2)
end)

-- Warning popup
local warnFrame = Instance.new("Frame", ScreenGui)
warnFrame.Size = UDim2.new(0, 260, 0, 120)
warnFrame.Position = UDim2.new(0.5, -130, 0.5, -60)
warnFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
warnFrame.Visible = false
local warnCorner = Instance.new("UICorner", warnFrame)
warnCorner.CornerRadius = UDim.new(0, 14)

local warnLabel = Instance.new("TextLabel", warnFrame)
warnLabel.Size = UDim2.new(1, -20, 0, 60)
warnLabel.Position = UDim2.new(0, 10, 0, 10)
warnLabel.Text = "Are you sure you want to close the GUI?"
warnLabel.BackgroundTransparency = 1
warnLabel.TextColor3 = Color3.new(1,1,1)
warnLabel.TextSize = 18
warnLabel.TextWrapped = true
warnLabel.Font = Enum.Font.Gotham

local yesBtn = Instance.new("TextButton", warnFrame)
yesBtn.Size = UDim2.new(0.45, -5, 0, 32)
yesBtn.Position = UDim2.new(0, 10, 1, -38)
yesBtn.Text = "Yes"
yesBtn.BackgroundColor3 = Color3.fromRGB(80, 160, 80)
yesBtn.TextColor3 = Color3.new(1,1,1)
yesBtn.TextSize = 18
yesBtn.Font = Enum.Font.GothamBold
local yesCorner = Instance.new("UICorner", yesBtn)
yesCorner.CornerRadius = UDim.new(0, 8)

local noBtn = Instance.new("TextButton", warnFrame)
noBtn.Size = UDim2.new(0.45, -5, 0, 32)
noBtn.Position = UDim2.new(0.55, 5, 1, -38)
noBtn.Text = "No"
noBtn.BackgroundColor3 = Color3.fromRGB(160, 80, 80)
noBtn.TextColor3 = Color3.new(1,1,1)
noBtn.TextSize = 18
noBtn.Font = Enum.Font.GothamBold
local noCorner = Instance.new("UICorner", noBtn)
noCorner.CornerRadius = UDim.new(0, 8)

closeBtn.MouseButton1Click:Connect(function()
    warnFrame.Visible = true
end)

yesBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

noBtn.MouseButton1Click:Connect(function()
    warnFrame.Visible = false
end)

local watermark = Instance.new("TextLabel", Frame)
watermark.Size = UDim2.new(0, 160, 0, 20)
watermark.Position = UDim2.new(1, -170, 1, -26)
watermark.BackgroundTransparency = 1
watermark.Text = "made by: actionmacsen"
watermark.TextColor3 = Color3.fromRGB(180, 180, 180)
watermark.TextSize = 14
watermark.Font = Enum.Font.GothamSemibold
watermark.TextXAlignment = Enum.TextXAlignment.Right
watermark.TextYAlignment = Enum.TextYAlignment.Bottom
   end,
})
 
local Slider = FunTab:CreateSlider({
   Name = "Walk Speed🏃‍♂️",
   Range = {0, 300},
   Increment = 1,
   Suffix = "speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local GUITab = Window:CreateTab("FE GUI", nil) -- Title, Image
local GUISection = GUITab:CreateSection("GUI")
 
local AimbotTab = Window:CreateTab("Aimbot🔫", nil) -- Title, Image
local Section = AimbotTab:CreateSection("Aimbot")
 
local Button = AimbotTab:CreateButton({
   Name = "Aim camlock🔫",
   Callback = function()
Rayfield:Notify({
   Title = "Aim Bot ON",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 --// Cache 
local select = select
local pcall, getgenv, next, Vector2, mathclamp, type, mousemoverel = select(1, pcall, getgenv, next, Vector2.new, math.clamp, type, mousemoverel or (Input and Input.MouseMove))
 
--// Preventing Multiple Processes
 
pcall(function()
	getgenv().Aimbot.Functions:Exit()
end)
 
--// Environment
 
getgenv().Aimbot = {}
local Environment = getgenv().Aimbot
 
--// Services
 
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
 
--// Variables
 
local RequiredDistance, Typing, Running, Animation, ServiceConnections = 2000, false, false, nil, {}
 
--// Script Settings
 
Environment.Settings = {
	Enabled = true,
	TeamCheck = false,
	AliveCheck = true,
	WallCheck = false, -- Laggy
	Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
	ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
	ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
	TriggerKey = "MouseButton2",
	Toggle = false,
	LockPart = "Head" -- Body part to lock on
}
 
Environment.FOVSettings = {
	Enabled = true,
	Visible = true,
	Amount = 90,
	Color = Color3.fromRGB(255, 255, 255),
	LockedColor = Color3.fromRGB(255, 70, 70),
	Transparency = 0.5,
	Sides = 60,
	Thickness = 1,
	Filled = false
}
 
Environment.FOVCircle = Drawing.new("Circle")
 
--// Functions
 
local function CancelLock()
	Environment.Locked = nil
	if Animation then Animation:Cancel() end
	Environment.FOVCircle.Color = Environment.FOVSettings.Color
end
 
local function GetClosestPlayer()
	if not Environment.Locked then
		RequiredDistance = (Environment.FOVSettings.Enabled and Environment.FOVSettings.Amount or 2000)
 
		for _, v in next, Players:GetPlayers() do
			if v ~= LocalPlayer then
				if v.Character and v.Character:FindFirstChild(Environment.Settings.LockPart) and v.Character:FindFirstChildOfClass("Humanoid") then
					if Environment.Settings.TeamCheck and v.Team == LocalPlayer.Team then continue end
					if Environment.Settings.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
					if Environment.Settings.WallCheck and #(Camera:GetPartsObscuringTarget({v.Character[Environment.Settings.LockPart].Position}, v.Character:GetDescendants())) > 0 then continue end
 
					local Vector, OnScreen = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
					local Distance = (Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2(Vector.X, Vector.Y)).Magnitude
 
					if Distance < RequiredDistance and OnScreen then
						RequiredDistance = Distance
						Environment.Locked = v
					end
				end
			end
		end
	elseif (Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2(Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).X, Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position).Y)).Magnitude > RequiredDistance then
		CancelLock()
	end
end
 
--// Typing Check
 
ServiceConnections.TypingStartedConnection = UserInputService.TextBoxFocused:Connect(function()
	Typing = true
end)
 
ServiceConnections.TypingEndedConnection = UserInputService.TextBoxFocusReleased:Connect(function()
	Typing = false
end)
 
--// Main
 
local function Load()
	ServiceConnections.RenderSteppedConnection = RunService.RenderStepped:Connect(function()
		if Environment.FOVSettings.Enabled and Environment.Settings.Enabled then
			Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
			Environment.FOVCircle.Thickness = Environment.FOVSettings.Thickness
			Environment.FOVCircle.Filled = Environment.FOVSettings.Filled
			Environment.FOVCircle.NumSides = Environment.FOVSettings.Sides
			Environment.FOVCircle.Color = Environment.FOVSettings.Color
			Environment.FOVCircle.Transparency = Environment.FOVSettings.Transparency
			Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
			Environment.FOVCircle.Position = Vector2(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
		else
			Environment.FOVCircle.Visible = false
		end
 
		if Running and Environment.Settings.Enabled then
			GetClosestPlayer()
 
			if Environment.Locked then
				if Environment.Settings.ThirdPerson then
					Environment.Settings.ThirdPersonSensitivity = mathclamp(Environment.Settings.ThirdPersonSensitivity, 0.1, 5)
 
					local Vector = Camera:WorldToViewportPoint(Environment.Locked.Character[Environment.Settings.LockPart].Position)
					mousemoverel((Vector.X - UserInputService:GetMouseLocation().X) * Environment.Settings.ThirdPersonSensitivity, (Vector.Y - UserInputService:GetMouseLocation().Y) * Environment.Settings.ThirdPersonSensitivity)
				else
					if Environment.Settings.Sensitivity > 0 then
						Animation = TweenService:Create(Camera, TweenInfo.new(Environment.Settings.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)})
						Animation:Play()
					else
						Camera.CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)
					end
				end
 
			Environment.FOVCircle.Color = Environment.FOVSettings.LockedColor
 
			end
		end
	end)
 
	ServiceConnections.InputBeganConnection = UserInputService.InputBegan:Connect(function(Input)
		if not Typing then
			pcall(function()
				if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
					if Environment.Settings.Toggle then
						Running = not Running
 
						if not Running then
							CancelLock()
						end
					else
						Running = true
					end
				end
			end)
 
			pcall(function()
				if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
					if Environment.Settings.Toggle then
						Running = not Running
 
						if not Running then
							CancelLock()
						end
					else
						Running = true
					end
				end
			end)
		end
	end)
 
	ServiceConnections.InputEndedConnection = UserInputService.InputEnded:Connect(function(Input)
		if not Typing then
			if not Environment.Settings.Toggle then
				pcall(function()
					if Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
						Running = false; CancelLock()
					end
				end)
 
				pcall(function()
					if Input.UserInputType == Enum.UserInputType[Environment.Settings.TriggerKey] then
						Running = false; CancelLock()
					end
				end)
			end
		end
	end)
end
 
--// Functions
 
Environment.Functions = {}
 
function Environment.Functions:Exit()
	for _, v in next, ServiceConnections do
		v:Disconnect()
	end
 
	if Environment.FOVCircle.Remove then Environment.FOVCircle:Remove() end
 
	getgenv().Aimbot.Functions = nil
	getgenv().Aimbot = nil
 
	Load = nil; GetClosestPlayer = nil; CancelLock = nil
end
 
function Environment.Functions:Restart()
	for _, v in next, ServiceConnections do
		v:Disconnect()
	end
 
	Load()
end
 
function Environment.Functions:ResetSettings()
	Environment.Settings = {
		Enabled = true,
		TeamCheck = false,
		AliveCheck = true,
		WallCheck = false,
		Sensitivity = 0, -- Animation length (in seconds) before fully locking onto target
		ThirdPerson = false, -- Uses mousemoverel instead of CFrame to support locking in third person (could be choppy)
		ThirdPersonSensitivity = 3, -- Boundary: 0.1 - 5
		TriggerKey = "MouseButton2",
		Toggle = false,
		LockPart = "Head" -- Body part to lock on
	}
 
	Environment.FOVSettings = {
		Enabled = true,
		Visible = true,
		Amount = 90,
		Color = Color3.fromRGB(255, 255, 255),
		LockedColor = Color3.fromRGB(255, 70, 70),
		Transparency = 0.5,
		Sides = 60,
		Thickness = 1,
		Filled = false
	}
end
 
--// Load
 
Load()
   end,
})

local Button = AimbotTab:CreateButton({
   Name = "ESP Box",
   Callback = function()
    loadstring([[
local Players = game:GetService("Players")

local function addGreenSkeleton(player)
    local character = player.Character or player.CharacterAdded:Wait()
    if character:FindFirstChild("GreenSkeleton") then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "GreenSkeleton"
    highlight.FillColor = Color3.fromRGB(0, 255, 0)
    highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = character
end

for _, player in pairs(Players:GetPlayers()) do
    addGreenSkeleton(player)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        addGreenSkeleton(player)
    end)
end)
]])()

   end,
})
 
local Button = AimbotTab:CreateButton({
   Name = "ESP Name👨‍💼",
   Callback = function() 
Rayfield:Notify({
   Title = "ESP ON",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})           
-- LocalScript in StarterPlayerScripts
 
local Players = game:GetService("Players")
 
-- Funktion zum Erstellen von Nametags
local function createESP(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        if not player.Character.Head:FindFirstChild("ESP") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ESP"
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = player.Character.Head
 
            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.TextColor3 = Color3.fromRGB(0, 255, 0)
            text.TextStrokeTransparency = 0
            text.Text = player.Name
            text.Parent = billboard
        end
    end
end
 
-- Wenn ein neuer Spieler spawnt
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        createESP(player)
    end)
end)
 
-- Für bereits vorhandene Spieler
for _, player in pairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        if player.Character then
            createESP(player)
        end
        player.CharacterAdded:Connect(function()
            task.wait(1)
            createESP(player)
        end)
    end
end
 
   end,
})
 
local GamesTab = Window:CreateTab("Games", nil) -- Title, Image
local Section = GamesTab:CreateSection("GG")
 
local Button = GamesTab:CreateButton({
   Name = "Dead rails🚂",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
   end,
})
 
local Button = GUITab:CreateButton({
   Name = "Car GUI🚗",
   Callback = function()
Rayfield:Notify({
   Title = "Car GUI ON",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
  loadstring(game:HttpGet("https://pastebin.com/raw/wQmCgz2Y"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Build a Boat⛵",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ExyXyz/ExyGantenk/main/ExyBABFT"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Brookhaven",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/VictoryHub/refs/heads/main/Victory_Hub.lua"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Brothers VOW",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Imverygoodsikeek/brother-s-vow/refs/heads/main/Brothersvow"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Arsenal🔫",
   Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/andrewdarkyyofficial/thunderclient/main/main.lua'))();
   end,
})
local Button = GamesTab:CreateButton({
   Name = "Westbound🤠",
   Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/GQ26pQce"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Pixel Blade🗡",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/TexRBLX/Roblox-stuff/refs/heads/main/pixel%20blade/final.lua"))()
   end,
})
 
local Button = GUITab:CreateButton({
   Name = "Emotes💃",
   Callback = function()
Rayfield:Notify({
   Title = "Emotes ON",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
  loadstring(game:HttpGet("https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/IMPROVED%20FE%20Silly%20Emotes%20v2.4.lua", true))()
   end,
})
 
local Button = FunTab:CreateButton({
   Name = "Fling🛸",
   Callback = function()
Rayfield:Notify({
   Title = "Fling loading",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB",true))()
  end,
})

local Button = FunTab:CreateButton({
   Name = "F3X Tool",
   Callback = function()
Rayfield:Notify({
   Title = "f3x tool loading",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
  end,
})
 
local Button = FunTab:CreateButton({
   Name = "INF Jump",
   Callback = function()
Rayfield:Notify({
   Title = "INF Jump ON",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 game:GetService("UserInputService").JumpRequest:connect(function()
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")       
    end)
    end,
})
 
local Button = FunTab:CreateButton({
   Name = "Fly✈",
   Callback = function()
Rayfield:Notify({
   Title = "Fly loadnig",
   Content = "Fly Fun",
   Duration = 6.5,
   Image = nil,
})
 -- GUI-Code als String
local guiCode = [[
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
local flying = false
local speed = 50
 
-- GUI erstellen
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
 
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 180, 0, 130)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.BorderSizePixel = 0
frame.Parent = screenGui
 
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = frame
 
local shadow = Instance.new("UIStroke")
shadow.Thickness = 2
shadow.Color = Color3.fromRGB(0,0,0)
shadow.Parent = frame
 
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Fly Controller"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true
title.Parent = frame
 
local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(1, 0, 0, 30)
flyButton.Position = UDim2.new(0, 0, 0, 35)
flyButton.Text = "Fly OFF"
flyButton.BackgroundColor3 = Color3.fromRGB(70,130,180)
flyButton.TextColor3 = Color3.fromRGB(255,255,255)
flyButton.Parent = frame
local flyCorner = Instance.new("UICorner")
flyCorner.CornerRadius = UDim.new(0, 8)
flyCorner.Parent = flyButton
 
local plusButton = Instance.new("TextButton")
plusButton.Size = UDim2.new(0.5, -5, 0, 30)
plusButton.Position = UDim2.new(0, 0, 0, 70)
plusButton.Text = "+ Speed"
plusButton.BackgroundColor3 = Color3.fromRGB(100,180,100)
plusButton.TextColor3 = Color3.fromRGB(255,255,255)
plusButton.Parent = frame
local plusCorner = Instance.new("UICorner")
plusCorner.CornerRadius = UDim.new(0, 6)
plusCorner.Parent = plusButton
 
local minusButton = Instance.new("TextButton")
minusButton.Size = UDim2.new(0.5, -5, 0, 30)
minusButton.Position = UDim2.new(0.5, 5, 0, 70)
minusButton.Text = "- Speed"
minusButton.BackgroundColor3 = Color3.fromRGB(180,100,100)
minusButton.TextColor3 = Color3.fromRGB(255,255,255)
minusButton.Parent = frame
local minusCorner = Instance.new("UICorner")
minusCorner.CornerRadius = UDim.new(0, 6)
minusCorner.Parent = minusButton
 
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(1, 0, 0, 20)
speedLabel.Position = UDim2.new(0, 0, 0, 105)
speedLabel.Text = "Speed: "..speed
speedLabel.TextColor3 = Color3.fromRGB(255,255,255)
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.SourceSans
speedLabel.TextScaled = true
speedLabel.Parent = frame
 
local function addHoverEffect(button, color)
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = color:Lerp(Color3.fromRGB(255,255,255),0.2)
    end)
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = color
    end)
end
 
addHoverEffect(flyButton, flyButton.BackgroundColor3)
addHoverEffect(plusButton, plusButton.BackgroundColor3)
addHoverEffect(minusButton, minusButton.BackgroundColor3)
 
-- Fly System
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local bodyVelocity
local currentVelocity = Vector3.new()
 
flyButton.MouseButton1Click:Connect(function()
    flying = not flying
    flyButton.Text = flying and "Fly ON" or "Fly OFF"
 
    if flying then
        -- BodyVelocity erstellen
        bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.MaxForce = Vector3.new(400000,400000,400000)
        bodyVelocity.Velocity = Vector3.new(0,0,0)
        bodyVelocity.Parent = hrp
        humanoid.PlatformStand = true -- verhindert die normale Schwerkraft
    else
        -- Fly aus -> alles zurücksetzen
        if bodyVelocity then
            bodyVelocity:Destroy()
            bodyVelocity = nil
        end
        humanoid.PlatformStand = false
        currentVelocity = Vector3.new()
    end
end)
 
plusButton.MouseButton1Click:Connect(function()
    speed = speed + 10
    speedLabel.Text = "Speed: "..speed
end)
 
minusButton.MouseButton1Click:Connect(function()
    speed = math.max(10, speed - 10)
    speedLabel.Text = "Speed: "..speed
end)
 
runService.RenderStepped:Connect(function(dt)
    if flying and bodyVelocity then
        local moveDir = Vector3.new()
        if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + hrp.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - hrp.CFrame.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - hrp.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + hrp.CFrame.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0,1,0) end
        if uis:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0,1,0) end
 
        if moveDir.Magnitude > 0 then
            local targetVelocity = moveDir.Unit * speed
            currentVelocity = currentVelocity:Lerp(targetVelocity, 0.2)
            bodyVelocity.Velocity = currentVelocity
        else
            currentVelocity = currentVelocity:Lerp(Vector3.new(0,0,0),0.2)
            bodyVelocity.Velocity = currentVelocity
        end
    end
end)
 
-- GUI verschiebbar
local dragging = false
local dragStart
local startPos
 
title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
 
title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
end)
]]
 
-- loadstring ausführen
local func = loadstring(guiCode)
func()
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Fast Leave",
   Callback = function()
 game.Players.LocalPlayer:Kick("BYE")
   end,
})
 
local Button = GUITab:CreateButton({
   Name = "suck🍌",
   Callback = function()
Rayfield:Notify({
   Title = "Suck loading",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
local ANIM_ID = 88361175214934
local LOOPED = true
local PLAYBACK_SPEED = 5
local ANIM_WEIGHT = 99
 
local Players = game:GetService("Players")
local player = Players.LocalPlayer
 
local currentTrack
local animPlaying = false
local originalRot
 
local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = cloneref(game:GetService("CoreGui"))
 
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0, 20, 0, 20)
button.Text = "Suck"
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.new(1, 1, 1)
button.Active = true
button.Draggable = true
button.Parent = screenGui
 
local function loadAnimation(char)
	local humanoid = char:WaitForChild("Humanoid")
	local animator = humanoid:FindFirstChildOfClass("Animator")
	if not animator then
		animator = Instance.new("Animator")
		animator.Parent = humanoid
	end
	local anim = Instance.new("Animation")
	anim.AnimationId = "rbxassetid://" .. ANIM_ID
	return animator:LoadAnimation(anim)
end
 
local function rotateCharacter(char, degrees)
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(degrees), 0)
	end
end
 
button.MouseButton1Click:Connect(function()
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not animPlaying then
		if hrp then
			originalRot = hrp.CFrame - hrp.Position
		end
		currentTrack = loadAnimation(char)
		currentTrack.Looped = LOOPED
		currentTrack.Priority = Enum.AnimationPriority.Action
		currentTrack:Play(0, ANIM_WEIGHT)
		currentTrack:AdjustSpeed(PLAYBACK_SPEED)
		rotateCharacter(char, 0)
		animPlaying = true
		button.Text = "Stop Suck"
	else
		if currentTrack then
			currentTrack:Stop(0)
			currentTrack:Destroy()
			currentTrack = nil
		end
		if hrp and originalRot then
			hrp.CFrame = CFrame.new(hrp.Position) * originalRot
		end
		animPlaying = false
		button.Text = "Suck"
	end
end)
   end,
})
 
local Button = FunTab:CreateButton({
   Name = "Air walk🏃‍♂️",
   Callback = function()
Rayfield:Notify({
   Title = "Air walk loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
-- Rounded corners
local function addRoundCorner(guiObject, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius)
	corner.Parent = guiObject
end
 
-- Create main GUI
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "AirWalkGUI"
screenGui.ResetOnSpawn = false
 
-- Main frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 200, 0, 150)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderColor3 = Color3.new(0, 0, 0)
mainFrame.BorderSizePixel = 2
mainFrame.Active = true
mainFrame.Draggable = true
addRoundCorner(mainFrame, 10)
 
-- Close button (X)
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderColor3 = Color3.new(0, 0, 0)
closeButton.BorderSizePixel = 1
addRoundCorner(closeButton, 6)
 
-- Minimize button (-)
local minimizeButton = Instance.new("TextButton", mainFrame)
minimizeButton.Text = "-"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -70, 0, 5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
minimizeButton.BorderColor3 = Color3.new(0, 0, 0)
minimizeButton.BorderSizePixel = 1
addRoundCorner(minimizeButton, 6)
 
-- Air Walk button
local airWalkButton = Instance.new("TextButton", mainFrame)
airWalkButton.Text = "Air Walk"
airWalkButton.Size = UDim2.new(0.8, 0, 0, 40)
airWalkButton.Position = UDim2.new(0.1, 0, 0.3, 0)
airWalkButton.BackgroundColor3 = Color3.fromRGB(100, 255, 100)
airWalkButton.BorderColor3 = Color3.new(0, 0, 0)
airWalkButton.BorderSizePixel = 1
addRoundCorner(airWalkButton, 8)
 
-- Height label
local heightLabel = Instance.new("TextLabel", mainFrame)
heightLabel.Size = UDim2.new(0.8, 0, 0, 30)
heightLabel.Position = UDim2.new(0.1, 0, 0.65, 0)
heightLabel.BackgroundTransparency = 1
heightLabel.TextColor3 = Color3.new(1, 1, 1)
heightLabel.TextScaled = true
heightLabel.Text = "Height: -"
 
-- AW ball GUI
local ballButton = Instance.new("TextButton", screenGui)
ballButton.Size = UDim2.new(0, 50, 0, 50)
ballButton.Position = UDim2.new(0, 20, 0.5, -25)
ballButton.Text = ""
ballButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ballButton.BackgroundTransparency = 0.3
ballButton.BorderColor3 = Color3.new(0, 0, 0)
ballButton.BorderSizePixel = 2
ballButton.Visible = false
ballButton.Active = true
ballButton.Draggable = true
addRoundCorner(ballButton, 25)
 
local awLabel = Instance.new("TextLabel", ballButton)
awLabel.Text = "AW"
awLabel.Size = UDim2.new(1, 0, 1, 0)
awLabel.BackgroundTransparency = 1
awLabel.TextColor3 = Color3.new(1, 1, 1)
awLabel.TextScaled = true
awLabel.Font = Enum.Font.GothamBold
 
-- Platform
local platform = Instance.new("Part")
platform.Anchored = true
platform.Size = Vector3.new(5, 1, 5)
platform.Transparency = 1
platform.CanCollide = false
platform.Parent = workspace
 
local airWalkOn = false
local platformY = 0
 
-- Update
game:GetService("RunService").RenderStepped:Connect(function()
	if airWalkOn then
		platform.Position = Vector3.new(
			humanoidRootPart.Position.X,
			platformY,
			humanoidRootPart.Position.Z
		)
		platform.CanCollide = true
	end
	heightLabel.Text = "Height: " .. string.format("%.3f", humanoidRootPart.Position.Y)
end)
 
-- Air Walk button click
airWalkButton.MouseButton1Click:Connect(function()
	platformY = humanoidRootPart.Position.Y - 3
	airWalkOn = not airWalkOn
	platform.CanCollide = airWalkOn
end)
 
-- Close all
closeButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
	platform:Destroy()
end)
 
-- Minimize
minimizeButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	ballButton.Visible = true
end)
 
-- Restore GUI
ballButton.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	ballButton.Visible = false
end)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "DEX📑",
   Callback = function()
Rayfield:Notify({
   Title = "DEX loading",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
   end,
})
 
local Button = FunTab:CreateButton({
   Name = "Noclip👽",
   Callback = function()
Rayfield:Notify({
   Title = "Noclip ON",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 local Noclip = nil
local Clip = nil
 
function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end
 
function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end
 
noclip() -- to toggle noclip() and clip()
 
    end,
})
 
local Button = FunTab:CreateButton({
   Name = "BREAD Auto Click",
   Callback = function()
Rayfield:Notify({
   Title = "Auto Click loading",
   Content = "Have Fun",
   Duration = 6.5,
   Image = nil,
})
 loadstring(game:HttpGetAsync('https://pastebin.com/raw/WgkcDYUs'))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Rivals🔫",
   Callback = function()
Rayfield:Notify({
   Title = "Rivals loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
 loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Rivals%20Beta.lua"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Hypershot🔫",
   Callback = function()
Rayfield:Notify({
   Title = "Hzpershot loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
 loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Hypershot.lua"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Gunfight Arena🔫",
   Callback = function()
Rayfield:Notify({
   Title = "Gunfight Arena loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
  loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Gunfight%20Arena.lua"))()
   end,
})
 
local Button = AimbotTab:CreateButton({
   Name = "Aimbot 2🔫",
   Callback = function()
Rayfield:Notify({
   Title = "AimBot loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
 loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Universal.lua"))()
   end,
})
 
local Button = GamesTab:CreateButton({
   Name = "Emergency Hamburg🚗",
   Callback = function()
Rayfield:Notify({
   Title = "EH loading",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
loadstring(game:HttpGet("https://vortex-hub.pages.dev/api/vortex"))()
   end,
})
 
local Button = MusicTab:CreateButton({
   Name = "Piano🎹 (LunarZ)",
   Callback = function()
Rayfield:Notify({
   Title = "Piano loading",
   Content = "Made by LunarZ",
   Duration = 8.1,
   Image = nil,
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarZR/QOUTES/refs/heads/main/PIANO"))()
   end,
})
 
local Button = MusicTab:CreateButton({
   Name = "Piano🎹 (TalentLess)",
   Callback = function()
Rayfield:Notify({
   Title = "Piano loading",
   Content = "Made by hellohellohell012321",
   Duration = 8.1,
   Image = nil,
})
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/TALENTLESS/main/TALENTLESS", true))()
end)
   end,
})

local Button = GamesTab:CreateButton({
   Name = "War Tycoon🔫🎖",
   Callback = function()
Rayfield:Notify({
   Title = "made by abibajbus",
   Content = "Have Fun",
   Duration = 8.1,
   Image = nil,
})
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Awakenchan/Awaken-UI-s/main/Notification%20Ui"))()
local awakenNotification = library:CreateWindow()
local clonef = clonefunction
local cwrap = clonef(coroutine.wrap)
local Player = game:GetService("Players")
local LocalPlayer = Player.LocalPlayer
local PlayerName = LocalPlayer.Name
local vim = game:service("VirtualInputManager")

local TycoonName
local cango

-- Find the player's tycoon
for _, tycoon in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
    if tycoon:FindFirstChild("Owner") and tostring(tycoon.Owner.Value) == PlayerName then
        TycoonName = tycoon.Name
        warn('// Found player tycoon! '.. TycoonName)
        break
    end
end

-- Check if the player has a tycoon
local PlayerTycoon = game:GetService("Workspace").Tycoon.Tycoons[TycoonName]
if not PlayerTycoon then
    warn("// Failed to find player tycoon. Make sure you're loaded in and have a tycoon!")
    awakenNotification:CreateNotification(
        'Error:',
        "Failed to find player tycoon. Make sure you're loaded in and have a tycoon!",
        14404156927,
        4
    )
    return
end

-- Loading Functions....
getgenv().ButtonPressAmmount = 1
getgenv().WaitBeforeCollect = 0
getgenv().WaitAfterCollect = 0.6
getgenv().IgnoreRebirthButtons = false

local partsToIgnore = {
    "Javelin Giver",
    "AWP Giver",
    "Auto Collect Gamepass",
    "2x Cash Gamepass",
    "2x Health Armor",
    "Speedy Oil Extractor",
    "FAMAS Group Gun",
    "GTE Shirt",
    "10k Shield Health Gamepass",
    "Speedy Humvee",
    "AbramsX Tank",
    "Barrett M82 Giver",
    "Boxer CRV Giver",
    "Camo Customizer Giver",
    "Desert Eagle Giver",
    "Tactical JLTV Giver",
    "WW2 US Army Pack Giver",
    "Mi24 Helicopter",
    "Explosive Sniper Giver",
    "FAL Heavy Giver",
    "Boxer CRV",
    'JLTV',
    "M1117 Guardian",
    "M142 HIMARS",
    "Pantsir S1",
    "A-10 Air Strike Giver",
    "Gunship",
    "Lazar 3 APC",
    "Barrett M82",
    "KA-52 Alligator",
    "Mi24 Hind",
    "UH-60 Black Hawk",
    "KA-52 Alligator",
    "Eurocopter Tiger",
    "AH-64 Apache",
    "Boxer CRV",
    "JLTV",
    "SURC",
    "Vietnam River Boat",
    "KSG 12 Giver",
    "PP19 Bizon Giver",
    'Fairmile',
    'USS Douglas',
    'PG-02',
    "LAV-AD",
    "Super Stallion",
}
local RebirthButtons = {
    "Boats [3 Rebirths]",
    "Drone [5 Rebirths]",
    "Helicopters [3 Rebirths]",
    "Planes [7 Rebirths]",
    "Tank Unlock Rebirth 6",
    "Vietnam Unlock Rebirth 4",
    "WW2 [4 Rebirths]",
    "Missile Silo Start",
    "Easter Egg [10 Rebirths]",
}


local function  CrateFarm()
    local easterthing = game:GetService("Workspace")["Game Systems"]["Crate Workspace"]

    local function isPlayerCloseToPosition(position, distance)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local playerPosition = player.Character.HumanoidRootPart.Position
            local distanceToPosition = (position - playerPosition).magnitude
            return distanceToPosition <= distance
        end
        return false
    end

    local function moveToNextCrate()
        -- Implementacja przesunięcia gracza do następnego "crate" ...
    end

    if easterthing then
        for i, v in ipairs(easterthing:GetChildren()) do
            if #v:GetChildren() > 0 then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                if v:FindFirstChild("StealPrompt") then
                    -- fireproximityprompt(v.ProximityPrompt)
                end
                task.wait(.25)

                if isPlayerCloseToPosition(v.CFrame.Position, 50) then
                    moveToNextCrate()
                end
                task.wait(.25)
            end
        end
    end
end


local function CaptirePoint()
    for _, tycoon in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
        if tycoon:FindFirstChild("Owner") and tostring(tycoon.Owner.Value) == PlayerName then
            TycoonName = tycoon.Name
            warn('// Found player tycoon! '.. TycoonName)
            break
        end
    end

    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  CFrame.new(-3.06392288, 75.586441, 399.406158)
    task.wait(.5)


    if game:GetService("Workspace")["Game Systems"].CapturePoint["Captured Team"].Value ~= TycoonName then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Game Systems"].CapturePoint.Flag.CubeFlag.CFrame
    end
    while game:GetService("Workspace")["Game Systems"].CapturePoint["Captured Team"].Value == TycoonName do
        local PlayerName = game.Players.LocalPlayer.Name-- Zmień na właściwe imię gracza
        for _, tycoon in pairs(game:GetService("Workspace").Tycoon.Tycoons:GetChildren()) do
            if tycoon:FindFirstChild("Owner") and tostring(tycoon.Owner.Value) == PlayerName then
                if tycoon:FindFirstChild("Floor") then
                    local targetCFrame = tycoon.Floor.BaseCheckMax.CFrame
                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(targetCFrame)
                    warn('// Teleporting Plr '..tycoon.Name)

                end
                break
            end
        end
    end
end

local collectorPosition = PlayerTycoon.Essentials["Oil Collector"].Collector.Display.Part.CFrame.Position
local success, part = pcall(function()
    return PlayerTycoon.Essentials["Oil Collector"].Collector.Display.Part
end)

if success and part then
    collectorPosition = part.CFrame.Position
else
    warn("Oil Collector part not found.")
end

local function moveAndSend(cframe, key)
    LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
    task.wait(1.5)
    repeat LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        wait(0.1)
    until (LocalPlayer.Character.HumanoidRootPart.Position - collectorPosition).Magnitude <= 1 or 50 or 20 or 10
    vim:SendKeyEvent(true, key, false, game)
    task.wait(1.5)
    vim:SendKeyEvent(false, key, false, game)
    task.wait(5)
end 

local actions = {
    {CFrame.new(69.41250610351562, 105.25658416748047, 3436.249267578125), 'E'},
    {CFrame.new(collectorPosition), 'E'},
    {CFrame.new(78.37213134765625, 105.25657653808594, -2062.473876953125), 'E'},
    {CFrame.new(collectorPosition), 'E'},
    {CFrame.new(-27.435659408569336, 49.34040069580078, -418.55621337890625), 'E'},
    {CFrame.new(collectorPosition), 'E'},
    {CFrame.new(-14.359360694885254, 49.34040069580078, 700.2596435546875), 'E'},
    {CFrame.new(collectorPosition), 'E'},
}

local loop = cwrap(function()  
    getgenv().okbro = true
    while getgenv().okbro do task.wait()
        for i, gamepassName in pairs(partsToIgnore) do
            local gamepass = PlayerTycoon.UnpurchasedButtons:FindFirstChild(gamepassName)
            if gamepass then
                gamepass:Destroy()
            end
        end
    end
end)
task.spawn(loop)

warn("// Functions Loaded!")
----------------𝐒𝐜𝐫𝐢𝐩𝐭 𝐈𝐧𝐬𝐢𝐝𝐞𝐬-----------------------------
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Wt",
    SubTitle = "abibajbus",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark"
})
local Tabs = {
    Farm = Window:AddTab({ Title = "Farm", Icon = 'dollar-sign' }),
    FarmConfig = Window:AddTab({ Title = "FarmConfig", Icon = 'file-cog'}),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options
do
---------------------------FARM TAB---------------------------------------
local antiafk = Tabs.Farm:AddToggle("antiafk", {Title = "Anti-Afk", Default = false })
antiafk:OnChanged(function(value)
    getgenv().antiafk = value
    while getgenv().antiafk do task.wait()
        game:GetService("VirtualUser"):ClickButton1(Vector2.new(710,534,0))
    end
end)
local AutoPlay = Tabs.Farm:AddToggle("AutoPlay", {Title = "[auto buy buttons]: Auto-Play", Default = false })
AutoPlay:OnChanged(function(value)
    getgenv().AutoPlay = value
    while getgenv().AutoPlay do task.wait()
        if PlayerTycoon.CurrencyToCollect.Value == 0 then
            cango = false
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(PlayerTycoon.PurchasedObjects:FindFirstChild("Oil 1").PromptDisplay.CFrame.Position)
            task.wait(0.5)
			vim:SendKeyEvent(true, 'E', false, game)
			task.wait(0.5)
			vim:SendKeyEvent(false, 'E', false, game)
            task.wait(3)
        elseif PlayerTycoon.CurrencyToCollect.Value >= 0 then
          warn("[Debug]: User have more then 0 cash")
          cango = true
        end
        if cango == true then
         task.wait(tonumber(getgenv().WaitBeforeCollect))
         local CashCollectorPart = PlayerTycoon.Essentials.CashCollector.CFrame.Position
         local CashCollectorPart2 = PlayerTycoon.Essentials.CashCollector2.CFrame.Position
         CashCollectorPart = CashCollectorPart + Vector3.new(0, 5, 0)
         if PlayerTycoon.PurchasedObjects:FindFirstChild("Oil Drill 1") then
             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CashCollectorPart)
             task.wait(0.5)
             CashCollectorPart2 = CashCollectorPart2 + Vector3.new(0, 5, 0)
             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CashCollectorPart2)
         else
             game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CashCollectorPart)
         end
         for i= 1,tonumber(getgenv().ButtonPressAmmount) do task.wait(0.5)
            local partsToTeleportTo = {}
            for _, model in pairs(PlayerTycoon.UnpurchasedButtons:GetChildren()) do
                if model:IsA("Model") then
                    for _, part in pairs(model:GetChildren()) do
                        if part.Name == "Part" then
                            local ignore = false
                            for _, name in pairs(partsToIgnore) do
                                if part.Parent.Name == name then
                                    ignore = true
                                elseif getgenv().IgnoreRebirthButtons then
                                    for _, name in pairs(RebirthButtons) do
                                        if part.Parent.Name == name then
                                            ignore = true
                                            break
                                        end
                                    end
                                end
                            end
                            if not ignore then
                                table.insert(partsToTeleportTo, part)
                            end
                        end
                    end
                end
            end
            if #partsToTeleportTo > 0 then
                local randomPart = partsToTeleportTo[math.random(1, #partsToTeleportTo)]
                local newPosition = randomPart.CFrame.Position
                newPosition = newPosition + Vector3.new(0, 5, 0)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
            end
         end
         task.wait(tonumber(getgenv().WaitAfterCollect))
        end
    end
end)
local autobarrel = Tabs.Farm:AddToggle("autobarrel", {Title = "[out of tycoon]: Auto Barrel -- possibly banable", Default = false })
autobarrel:OnChanged(function(value)
    getgenv().AutoBarrel = value
    while getgenv().AutoBarrel do task.wait()
        for _, action in ipairs(actions) do 
            task.wait(3)
            moveAndSend(action[1], action[2])
        end
    end
end)
local autoRebirth = Tabs.Farm:AddToggle("autoRebirth", {Title = "Auto Rebirth", Default = false })
autoRebirth:OnChanged(function(value)
    getgenv().AutoRebirth = value
    while getgenv().AutoRebirth do task.wait(1)
        game:GetService("ReplicatedStorage"):WaitForChild("RebirthEVT"):FireServer()
        
    end
end)
local autoCollect = Tabs.Farm:AddToggle("autoCollect", {Title = "Auto Collect", Default = false })
autoCollect:OnChanged(function(value)
    getgenv().autoCollect = value
    while getgenv().autoCollect do task.wait(1)
        local CashCollectorPart = PlayerTycoon.Essentials.CashCollector.CFrame.Position
        local CashCollectorPart2 = PlayerTycoon.Essentials.CashCollector2.CFrame.Position
        CashCollectorPart = CashCollectorPart + Vector3.new(0, 5, 0)
        if PlayerTycoon.PurchasedObjects:FindFirstChild("Oil Drill 1") then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CashCollectorPart)
            task.wait(0.5)
            CashCollectorPart2 = CashCollectorPart2 + Vector3.new(0, 5, 0)
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CashCollectorPart2)
        else
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(CashCollectorPart)
        end
    end
end)

Tabs.Farm:AddButton({
    Title = "Cap-Point",
    Description = "can be reported by player",
    Callback = function()
        CaptirePoint()

    end
})
Tabs.Farm:AddButton({
    Title = "Tp to crate",
    Description = "can be reported by player",
    Callback = function()
        CrateFarm()

    end
})
Tabs.Farm:AddButton({
    Title = "Tp to Resarch Hangar",
    Description = "can be reported by player",
    Callback = function()
        local plrhangar = game:GetService("Workspace").Tycoon.Tycoons.Charlie.PurchasedObjects["Helicopter Hull Research"].ResearchCollision.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plrhangar
    end
})

---------------------------FARM CONFIG TAB---------------------------------------
local IgnoreRebirthButtons = Tabs.FarmConfig:AddToggle("IgnoreRebirthButtons", {Title = "Ignore RebirthButtons", Default = false })
IgnoreRebirthButtons:OnChanged(function(value)
    getgenv().IgnoreRebirthButtons = value
end)
local WaitAfterCollect = Tabs.FarmConfig:AddInput("WaitAfterCollect", {
    Title = "Wait After AutoCollect",
    Default =  getgenv().WaitAfterCollect,
    Placeholder = "1 or 2 or 3",
    Numeric = true, 
    Finished = true,
    Callback = function(Value)
      getgenv().WaitAfterCollect = Value
    end
})
WaitAfterCollect:OnChanged(function()
    Fluent:Notify({
        Title = "awakenkn",
        Content = "Button Press Ammount: "..WaitAfterCollect.Value,
        Duration = 5
    })
end)
local WaitBeforeCollect = Tabs.FarmConfig:AddInput("WaitBeforeCollect", {
    Title = "Wait Before AutoCollect",
    Default = getgenv().WaitBeforeCollect,
    Placeholder = "1 or 2 or 3",
    Numeric = true, 
    Finished = true,
    Callback = function(Value)
        getgenv().WaitBeforeCollect = Value
    end
})
WaitBeforeCollect:OnChanged(function()
    Fluent:Notify({
        Title = "awakenkn",
        Content = "Wait Before AutoCollect: "..WaitBeforeCollect.Value,
        Duration = 5
    })
end)
local ButtonPressAmmount = Tabs.FarmConfig:AddInput("ButtonPressAmmount", {
    Title = "How many buttons pressed?",
    Default = getgenv().ButtonPressAmmount,
    Placeholder = "1 or 2 or 3",
    Numeric = true, 
    Finished = true,
    Callback = function(Value)
        getgenv().ButtonPressAmmount = Value
    end
})
ButtonPressAmmount:OnChanged(function()
    Fluent:Notify({
        Title = "awakenkn",
        Content = "How many buttons pressed?: "..ButtonPressAmmount.Value,
        Duration = 5
    })
end)
end
SaveManager:SetLibrary(Fluent)InterfaceManager:SetLibrary(Fluent)SaveManager:IgnoreThemeSettings()SaveManager:SetIgnoreIndexes({})InterfaceManager:SetFolder("awakenkn")SaveManager:SetFolder("awakenkn/WarTycoon")InterfaceManager:BuildInterfaceSection(Tabs.Settings)SaveManager:BuildConfigSection(Tabs.Settings)Window:SelectTab(1)SaveManager:LoadAutoloadConfig()
warn("// script Loaded!")
   end,
})

local Button = FunTab:CreateButton({
   Name = "TpTool",
   Callback = function()
            pcall(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            local tool = Instance.new("Tool")
            tool.RequiresHandle = false
            tool.Name = "Tp tool(Equip to Click TP)"
            tool.Activated:Connect(function()
                local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
                pos = CFrame.new(pos.X, pos.Y, pos.Z)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
            end)
            tool.Parent = game.Players.LocalPlayer.Backpack
        end)
   end,
})


local Button = FunTab:CreateButton({
   Name = "Telekinese",
   Callback = function()
       local re=game:GetService("Workspace")
local sandbox=function(var,func)
	local env=getfenv(func)
	local newenv=setmetatable({},{
		__index=function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors={}
local _Name="Telekinesis V6"
local uis=game:GetService("UserInputService")
local _Ins, _CF_new, _VTR_new=Instance.new, CFrame.new, Vector3.new
mas=_Ins("Model",game:GetService("Lighting"))
local con=getfenv().sethiddenproperty
Tool0=_Ins("Tool")
Part1=_Ins("Part")
Script2=_Ins("Script")
local light=_Ins("Highlight", Tool0)
light.FillTransparency = 1
LocalScript3=_Ins("LocalScript")
re=game:GetService("RunService")
Tool0.Name=_Name
Tool0.Parent=mas
Tool0.Grip=_CF_new(0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Tool0.GripPos=_VTR_new(0, 0, 1)
Part1.Name="Handle"
Part1.Parent=Tool0
local changed="Changed"
Part1.CFrame=_CF_new(-3.5, 5.30000019, -3.5, 1, 0, 0, 0, -1, 0, 0, 0, -1)
Part1.Orientation=_VTR_new(0, 180, 180)
Part1.Position=_VTR_new(-3.5, 5.300000190734863, -3.5)
Part1.Rotation=_VTR_new(-180, 0, 0)
Part1.Color=Color3.new(0.972549, 0.972549, 0.972549)
Part1.Transparency=1
local cam=re.RenderStepped
local w=wait
Part1.Size=_VTR_new(1, 1, 1)
Part1.BottomSurface=Enum.SurfaceType.Smooth
Part1.BrickColor=BrickColor.new("Institutional white")
Part1.Locked=true
local speed=55
local mb=uis.TouchEnabled
Part1.TopSurface=Enum.SurfaceType.Smooth
Part1.brickColor=BrickColor.new("Institutional white")
Script2.Name="LineConnect"
Script2.Parent=Tool0
light.Adornee=nil
local Sound=_Ins("Sound", game.Workspace)
Sound.SoundId="rbxassetid://1092093337"
Sound:Play()
cam:Connect(function() if con then con(game:GetService("Players").LocalPlayer, changed, speed) end end)
table.insert(cors,sandbox(Script2,function()
	w()
	local check=script.Part2
	local part1=script.Part1.Value
	local part2=script.Part2.Value
	local parent=script.Par.Value
	local color=script.Color
	local line=_Ins("Part")
	line.TopSurface=0
	line.BottomSurface=0
	line.Reflectance=.5
	line.Name="Laser"
	line.Locked=true
	line.CanCollide=false
	line.Anchored=true
	line.formFactor=0
	line.Size=_VTR_new(1,1,1)
	local mesh=_Ins("BlockMesh")
	mesh.Parent=line
	while true do
		if (check.Value==nil) then break end
		if (part1==nil or part2==nil or parent==nil) then break end
		if (part1.Parent==nil or part2.Parent==nil) then break end
		if (parent.Parent==nil) then break end
		local lv=_CF_new(part1.Position,part2.Position)
		local dist=(part1.Position-part2.Position).magnitude
		line.Parent=parent
		line.BrickColor=color.Value.BrickColor
		line.Reflectance=color.Value.Reflectance
		line.Transparency=color.Value.Transparency
		line.CFrame=_CF_new(part1.Position+lv.lookVector*dist/2)
		line.CFrame=_CF_new(line.Position,part2.Position)
		mesh.Scale=_VTR_new(.25,.25,dist)
		w()
	end
	line:remove()
	script:remove() 
end))
changed="SimulationRadius"
Script2.Disabled=true
LocalScript3.Name="MainScript"
LocalScript3.Parent=Tool0
table.insert(cors,sandbox(LocalScript3,function()
	w() 
	tool=script.Parent
	lineconnect=tool.LineConnect
	object=nil
	mousedown=false
	found=false
	BP=_Ins("BodyPosition")
	BP.maxForce=_VTR_new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge) --pwns everyone elses bodyposition
	BP.P=BP.P*3
	dist=nil
	point=_Ins("Part")
	point.Locked=true
	point.Anchored=true
	point.formFactor=0
	point.Shape=0
	point.BrickColor=BrickColor.Blue() 
	point.Size=_VTR_new(0,0,0)
	point.CanCollide=false
	local mesh=_Ins("SpecialMesh")
	mesh.MeshType="Sphere"
	mesh.Scale=_VTR_new(.7,.7,.7)
	mesh.Parent=point
	handle=tool.Handle
	front=tool.Handle
	color=tool.Handle
	objval=nil
	local hooked=false 
	local hookBP=BP:clone() 
	hookBP.maxForce=_VTR_new(30000,30000,30000) 

	local LineConnect=function(part1,part2,parent)
		local p1=_Ins("ObjectValue")
		p1.Value=part1
		p1.Name="Part1"
		local p2=_Ins("ObjectValue")
		p2.Value=part2
		p2.Name="Part2"
		local par=_Ins("ObjectValue")
		par.Value=parent
		par.Name="Par"
		local col=_Ins("ObjectValue")
		col.Value=color
		col.Name="Color"
		local s=lineconnect:clone()
		s.Disabled=false
		p1.Parent=s
		p2.Parent=s
		par.Parent=s
		col.Parent=s
		s.Parent=workspace
		if (part2==object) then
			objval=p2
		end
	end

	local onButton1Down=function(mouse)
		if (mousedown==true) then return end
		mousedown=true
		coroutine.resume(coroutine.create(function()
			local p=point:clone()
			p.Parent=tool
			LineConnect(front,p,workspace)
			while (mousedown==true) do
				p.Parent=tool
				if (object==nil) then
					if (mouse.Target==nil) then
						local lv=_CF_new(front.Position,mouse.Hit.p)
						p.CFrame=_CF_new(front.Position+(lv.lookVector*1000))
					else
						p.CFrame=_CF_new(mouse.Hit.p)
					end
				else
					LineConnect(front,object,workspace)
					break
				end
				w()
			end
			p:remove()
		end))
		while (mousedown==true) do
			if (mouse.Target~=nil) then
				local t=mouse.Target
				if (t.Anchored==false) then
					object=t
					light.Adornee=object
					dist=(object.Position-front.Position).magnitude
					break
				end
			end
			w()
		end
		while (mousedown==true) do
			if (object.Parent==nil) then break end
			local lv=_CF_new(front.Position,mouse.Hit.p)
			BP.Parent=object
			BP.position=front.Position+lv.lookVector*dist
			w()
		end
		BP:remove()
		object=nil
		objval.Value=nil
		light.Adornee=nil
	end

	local onKeyDown=function(key,mouse) 
		local key=key:lower() 
		local yesh=false 
		if (key=="q") then 
			if (dist>=5) then 
				dist=dist-5 
			end 
		end
		if (key=="u") then 
			if (dist ~=1) then 
				BX=_Ins("BodyGyro")
				BX.MaxTorque=_VTR_new(math.huge,0,math.huge)
				BX.CFrame=BX.CFrame * CFrame.Angles(0, math.rad(45), 0)
				BX.D=0
				BX.Parent=object
				--object.CFrame=CFrame.Angles(math.rad(90), 0,0) -- not used
				--object.Orientation=_VTR_new(50,0,0)
				--BX.Orientation=_VTR_new(23,0,0)
			end 
		end 
		if (key=="p") then 
			if (dist ~=1) then
				BX=_Ins("BodyVelocity")
				BX.maxForce=_VTR_new(0,math.huge,0)
				BX.velocity=_VTR_new(0,1,0)
				--BX.CFrame=BX.CFrame * CFrame.Angles(0, math.rad(45), 0)
				BX.Parent=object
			end 
		end 
		if key == "l" then 
			if (object==nil) then return end 
			for _,v in pairs(object:children()) do 
				if v.className == "BodyGyro" then 
					return nil 
				end 
			end 
			BG=_Ins("BodyGyro") 
			BG.maxTorque=_VTR_new(math.huge,math.huge,math.huge) 
			BG.cframe=_CF_new(object.CFrame.p) 
			BG.Parent=object 
			repeat w() until(object.CFrame == _CF_new(object.CFrame.p))
			BG.Parent=nil 
			if (object==nil) then return end 
			for _,v in pairs(object:children()) do 
				if v.className == "BodyGyro" then 
					v.Parent=nil 
				end 
			end 
			object.Velocity=_VTR_new(0,0,0) 
			object.RotVelocity=_VTR_new(0,0,0) 
		end 
		if (key=="y") then 
			if (dist ~=100) then 
				dist=100 
			end 
		end 
		if (key=="j") then 
			if (dist~=5000) then 
				dist=5000 
			end 
		end
		if (key=="e") then
			dist=dist+5
		end
		if (key=="x") then 
			if dist ~= 15 then 
				dist=15 
			end 
		end 
	end
	local onEquipped=function(mouse)
		keymouse=mouse
		local char=tool.Parent
		human=char.Humanoid
		human.Changed:connect(function() if (human.Health==0) then mousedown=false BP:remove() point:remove() tool:remove() end end)
		mouse.Button1Down:connect(function() onButton1Down(mouse) end)
		mouse.KeyDown:connect(function(key) onKeyDown(key,mouse) end)
		if mb then
			uis.TouchLongPress:Connect(function() onKeyDown("y",mouse) end)
			uis.TouchEnded:Connect(function() mousedown=false end)
		else
			mouse.Button1Up:connect(function() mousedown=false end)
		end
	end
	tool.Equipped:connect(onEquipped)
	tool.Unequipped:connect(function() mousedown=false end)
end))
for i,v in pairs(mas:GetChildren()) do
	v.Parent=game:GetService("Players").LocalPlayer.Backpack
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
   end,
})

local Button = FunTab:CreateButton({
   Name = "Invisible👽",
   Callback = function()
   local key = Enum.KeyCode.X -- key to toggle invisibility
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local VERSION = 1.5
print("Made By Mohamedguguu")
print("new update fixed unload not working and fixed speed noclip addad notic and remoed = unload and addad are you sure or not sure unloading")

if _G.InvisGhostLoaded and _G.InvisGhostLoaded >= VERSION then
    return
end
_G.InvisGhostLoaded = VERSION

local Players = game:GetService("Players")
local CoreguiM = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer

local SETTINGS_FOLDER = "FeInvisibleOld"
local SETTINGS_FILE = SETTINGS_FOLDER .. "/ghostspeed.txt"

local function saveSpeed(speed)
    if isfolder and makefolder and writefile then
        if not isfolder(SETTINGS_FOLDER) then
            makefolder(SETTINGS_FOLDER)
        end
        writefile(SETTINGS_FILE, tostring(speed))
    end
end

local function loadSpeed()
    if isfile and readfile and isfile(SETTINGS_FILE) then
        local val = tonumber(readfile(SETTINGS_FILE))
        if val then
            return val
        end
    end
    return 50
end

local invisOn = false
local ghostOn = false
local noclipOn = false
local ghostSpeed = loadSpeed()
local uiHidden = false

local sg = Instance.new("ScreenGui", CoreguiM)
sg.Name = "InvisGhostUI"
sg.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", sg)
mainFrame.Size = UDim2.new(0, 220, 0, 200)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.Active = true
mainFrame.Draggable = true
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

local function makeButton(text, pos)
    local b = Instance.new("TextButton", mainFrame)
    b.Size = UDim2.new(0, 200, 0, 30)
    b.Position = pos
    b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    return b
end

local invisBtn = makeButton("Toggle Invisibility 👻", UDim2.new(0, 10, 0, 10))
local ghostBtn = makeButton("Toggle Ghost Speed ⚡", UDim2.new(0, 10, 0, 50))
local noclipBtn = makeButton("Toggle Noclip 🚪", UDim2.new(0, 10, 0, 90))
local unloadBtn = makeButton("Unload ❌", UDim2.new(0, 10, 0, 170))

local speedBox = Instance.new("TextBox", mainFrame)
speedBox.Size = UDim2.new(0, 200, 0, 30)
speedBox.Position = UDim2.new(0, 10, 0, 130)
speedBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedBox.TextColor3 = Color3.new(1, 1, 1)
speedBox.Text = tostring(ghostSpeed)
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0, 8)

local function showNotice(txt)
    pcall(function()
        if CoreguiM:FindFirstChild("InvisGhostNotice") then
            CoreguiM.InvisGhostNotice:Destroy()
        end
    end)
    local g = Instance.new("ScreenGui", CoreguiM)
    g.Name = "InvisGhostNotice"
    g.ResetOnSpawn = false
    local lbl = Instance.new("TextLabel", g)
    lbl.Size = UDim2.new(0, 300, 0, 40)
    lbl.Position = UDim2.new(0.5, -150, 0, 20)
    lbl.BackgroundTransparency = 0.15
    lbl.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.Text = txt
    lbl.TextSize = 18
    lbl.Font = Enum.Font.SourceSansSemibold
    lbl.ZIndex = 9999
    Instance.new("UICorner", lbl).CornerRadius = UDim.new(0, 8)
    spawn(function()
        task.wait(2)
        pcall(function() g:Destroy() end)
    end)
end

local function setTransparency(char, val)
    for _, p in ipairs(char:GetDescendants()) do
        if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
            p.Transparency = val
        end
    end
end

local function toggleInvis()
    invisOn = not invisOn
    local char = plr.Character
    if char then
        if invisOn then
            setTransparency(char, 0.5)
            local savedpos = char.HumanoidRootPart.CFrame
            task.wait()
            char:MoveTo(Vector3.new(-25.95, 84, 3537.55))
            task.wait(0.15)
            local Seat = Instance.new("Seat", workspace)
            Seat.Anchored = false
            Seat.CanCollide = false
            Seat.Name = "invischair"
            Seat.Transparency = 1
            Seat.Position = Vector3.new(-25.95, 84, 3537.55)
            local Weld = Instance.new("Weld", Seat)
            Weld.Part0 = Seat
            Weld.Part1 = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
            Seat.CFrame = savedpos
            showNotice("Invisibility Enabled")
        else
            setTransparency(char, 0)
            if workspace:FindFirstChild("invischair") then
                workspace.invischair:Destroy()
            end
            showNotice("Invisibility Disabled")
        end
    end
end

local ghostEnforceConn
local function toggleGhost()
    ghostOn = not ghostOn
    local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        if ghostOn then
            hum.WalkSpeed = ghostSpeed
            if ghostEnforceConn then
                pcall(function() ghostEnforceConn:Disconnect() end)
                ghostEnforceConn = nil
            end
            ghostEnforceConn = RunService.Stepped:Connect(function()
                if hum and hum.WalkSpeed ~= ghostSpeed then
                    pcall(function() hum.WalkSpeed = ghostSpeed end)
                end
            end)
            showNotice("Ghost Enabled: " .. tostring(ghostSpeed))
        else
            if ghostEnforceConn then
                pcall(function() ghostEnforceConn:Disconnect() end)
                ghostEnforceConn = nil
            end
            hum.WalkSpeed = 16
            showNotice("Ghost Disabled")
        end
    else
        if ghostOn then
            showNotice("Ghost Enabled: " .. tostring(ghostSpeed))
        else
            showNotice("Ghost Disabled")
        end
    end
end

local noclipConn
local function toggleNoclip()
    noclipOn = not noclipOn
    if noclipOn then
        noclipConn = game:GetService("RunService").Stepped:Connect(function()
            local char = plr.Character
            if char then
                for _, part in ipairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
        showNotice("Noclip Enabled")
    else
        if noclipConn then
            pcall(function() noclipConn:Disconnect() end)
            noclipConn = nil
        end
        showNotice("Noclip Disabled")
    end
end

local keybindConn
local function unload()
    if sg then
        pcall(function() sg:Destroy() end)
        sg = nil
    end
    _G.InvisGhostLoaded = nil
    if noclipConn then
        pcall(function() noclipConn:Disconnect() end)
        noclipConn = nil
    end
    if keybindConn then
        pcall(function() keybindConn:Disconnect() end)
        keybindConn = nil
    end
    if ghostEnforceConn then
        pcall(function() ghostEnforceConn:Disconnect() end)
        ghostEnforceConn = nil
    end
    local char = plr.Character
    if char then
        pcall(function()
            setTransparency(char, 0)
            if workspace:FindFirstChild("invischair") then
                workspace.invischair:Destroy()
            end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = 16
                if hum.JumpPower then
                    hum.JumpPower = 50
                end
            end
        end)
    end
    invisOn = false
    ghostOn = false
    noclipOn = false
    uiHidden = false
    showNotice("Invis Ghost Unloaded")
end

local function confirmUnload()
    if CoreguiM:FindFirstChild("UnloadConfirmUI") then
        CoreguiM.UnloadConfirmUI:Destroy()
    end
    local confirmGui = Instance.new("ScreenGui", CoreguiM)
    confirmGui.Name = "UnloadConfirmUI"
    confirmGui.ResetOnSpawn = false
    local frame = Instance.new("Frame", confirmGui)
    frame.Size = UDim2.new(0, 250, 0, 120)
    frame.Position = UDim2.new(0.5, -125, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0, 40)
    label.BackgroundTransparency = 1
    label.Text = "Are you sure to unload?"
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 20
    local yesBtn = Instance.new("TextButton", frame)
    yesBtn.Size = UDim2.new(0.5, -5, 0, 40)
    yesBtn.Position = UDim2.new(0, 5, 1, -45)
    yesBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 8)
    local noBtn = Instance.new("TextButton", frame)
    noBtn.Size = UDim2.new(0.5, -5, 0, 40)
    noBtn.Position = UDim2.new(0.5, 0, 1, -45)
    noBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 0)
    noBtn.Text = "No"
    noBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 8)
    yesBtn.MouseButton1Click:Connect(function()
        pcall(function() confirmGui:Destroy() end)
        unload()
    end)
    noBtn.MouseButton1Click:Connect(function()
        pcall(function() confirmGui:Destroy() end)
    end)
end

invisBtn.MouseButton1Click:Connect(toggleInvis)
ghostBtn.MouseButton1Click:Connect(toggleGhost)
noclipBtn.MouseButton1Click:Connect(toggleNoclip)
unloadBtn.MouseButton1Click:Connect(confirmUnload)

speedBox.FocusLost:Connect(function(enter)
    if enter then
        local val = tonumber(speedBox.Text)
        if val and val > 0 then
            ghostSpeed = val
            saveSpeed(ghostSpeed)
            local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                if ghostOn then
                    hum.WalkSpeed = ghostSpeed
                else
                    hum.WalkSpeed = 16
                end
            end
        else
            speedBox.Text = tostring(ghostSpeed)
        end
    end
end)

keybindConn = UIS.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Z then
        toggleInvis()
    elseif input.KeyCode == Enum.KeyCode.B then
        toggleGhost()
    elseif input.KeyCode == Enum.KeyCode.N then
        toggleNoclip()
    elseif input.KeyCode == Enum.KeyCode.K then
        uiHidden = not uiHidden
        mainFrame.Visible = not uiHidden
    end
end)
--DONT SKID Llitte bro just dont its my 
--2025/9/6
   end,
})

local Button = FunTab:CreateButton({
   Name = "Flames Hub🔥",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EnterpriseExperience/MicUpSource/refs/heads/main/retrieve_branch_version.lua'))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "ReJoin",
   Callback = function()
          local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer



ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
   end,
})

local SetTab = Window:CreateTab("Set Timer ⏰", nil) -- Title, Image
local SetSection = SetTab:CreateSection("Set")

local Button = SetTab:CreateButton({
   Name = "1 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 60   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "2 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 120   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "3 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 180   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "4 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 240   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "5 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 300   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "6 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 360   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "7 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 420   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "8 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 480   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "9 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 540   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = SetTab:CreateButton({
   Name = "10 Min",
   Callback = function()
    -- Sekunden für den Countdown
local totalTime = 600   -- z.B. 60 Sekunden

-- GUI erzeugen
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Falls schon ein Countdown läuft: alten entfernen
local oldGui = playerGui:FindFirstChild("CountdownGui")
if oldGui then oldGui:Destroy() end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGui"
screenGui.Parent = playerGui

local timerLabel = Instance.new("TextLabel")
timerLabel.Size = UDim2.new(0, 200, 0, 50)
timerLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
timerLabel.BackgroundTransparency = 0.3
timerLabel.BackgroundColor3 = Color3.new(0, 0, 0)
timerLabel.TextColor3 = Color3.new(1, 1, 1)
timerLabel.TextScaled = true
timerLabel.Font = Enum.Font.SourceSansBold
timerLabel.Parent = screenGui

-- Countdown-Funktion
for i = totalTime, 0, -1 do
    local minutes = math.floor(i/60)
    local seconds = i % 60
    timerLabel.Text = string.format("%02d:%02d", minutes, seconds)
    task.wait(1) -- echte Sekunden warten
end

-- kurze Endmeldung und dann GUI entfernen
timerLabel.Text = "Zeit abgelaufen!"
task.wait(2)        -- optional: 2 Sekunden warten
screenGui:Destroy()  -- komplette Anzeige verschwindet
   end,
})

local Button = MainTab:CreateButton({
   Name = "Reset Caracter",
   Callback = function()
      -- Sofortiger Respawn / Charakter zurücksetzen
loadstring([[
local Players = game:GetService("Players")
local player = Players.LocalPlayer
if player and player.Character then
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:TakeDamage(humanoid.Health)  -- entspricht "Reset Character"
    end
end
]])()

   end,
})

local Button = MainTab:CreateButton({
   Name = "FPS-Ping",
   Callback = function()
   -- FPS & Ping Anzeige (rechts mittig)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

-- GUI erstellen
local gui = Instance.new("ScreenGui")
gui.Name = "FPSPingHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- FPS Label
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(0,200,0,22)
fpsLabel.Position = UDim2.new(1, -210, 0.5, -30) -- rechts, mittig
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(0,255,0) -- grün
fpsLabel.Font = Enum.Font.Code
fpsLabel.TextSize = 18
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Text = "FPS: ..."
fpsLabel.Parent = gui

-- Ping Label
local pingLabel = fpsLabel:Clone()
pingLabel.Position = UDim2.new(1, -210, 0.5, 0) -- direkt darunter
pingLabel.Text = "PING: ..."
pingLabel.Parent = gui

-- FPS Berechnung
local lastRender = tick()
local frameCount = 0
local currentFPS = 0

RunService.RenderStepped:Connect(function()
    frameCount += 1
    if tick() - lastRender >= 1 then
        currentFPS = frameCount / (tick() - lastRender)
        frameCount = 0
        lastRender = tick()
    end

    fpsLabel.Text = string.format("FPS: %d", math.floor(currentFPS))
    pingLabel.Text = string.format("PING: %d ms", math.floor(player:GetNetworkPing()*1000))
end)
   end,
})
