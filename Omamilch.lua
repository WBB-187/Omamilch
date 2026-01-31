-- [[ omamilch V5 - ULTIMATE GOLD ]] --
-- Key: HanfmomentV1
-- Owner: HanfmomentV1

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local teleportService = game:GetService("TeleportService")
local starterGui = game:GetService("StarterGui")

-- Design-Konfiguration
local theme = {
    bg = Color3.fromRGB(15, 15, 15),
    accent = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    danger = Color3.fromRGB(255, 0, 0),
    success = Color3.fromRGB(0, 255, 100)
}

-- Reinigung alter Instanzen
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilch_V5_Ultimate" or v.Name == "omamilch_Key" then v:Destroy() end
end

-- [[ GLOBAL NOTIFY SYSTEM ]] --
local function sendNotify(msg, color)
    local screen = game.CoreGui:FindFirstChild("omamilch_V5_Ultimate") or game.CoreGui:FindFirstChild("omamilch_Key")
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 400, 0, 50)
    frame.Position = UDim2.new(0.5, -200, 0, -60)
    frame.BackgroundColor3 = theme.bg
    frame.BorderColor3 = color or theme.gold
    frame.BorderSizePixel = 2
    
    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.Text = "★ " .. msg .. " ★"
    txt.TextColor3 = Color3.new(1,1,1)
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 18
    txt.BackgroundTransparency = 1
    
    frame:TweenPosition(UDim2.new(0.5, -200, 0.1, 0), "Out", "Back", 0.5)
    task.delay(3, function()
        frame:TweenPosition(UDim2.new(0.5, -200, 0, -60), "In", "Quad", 0.5)
        task.wait(0.6)
        frame:Destroy()
    end)
end

-- [[ KEY SYSTEM ]] --
local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.Name = "omamilch_Key"

local kMain = Instance.new("Frame", keyGui)
kMain.Size = UDim2.new(0, 350, 0, 200)
kMain.Position = UDim2.new(0.5, -175, 0.5, -100)
kMain.BackgroundColor3 = theme.bg
kMain.BorderSizePixel = 2
kMain.BorderColor3 = theme.gold

local kTitle = Instance.new("TextLabel", kMain)
kTitle.Size = UDim2.new(1, 0, 0, 40)
kTitle.Text = "ENTER KEY - OMAMILCH V5"
kTitle.TextColor3 = theme.gold
kTitle.BackgroundTransparency = 1

local kBox = Instance.new("TextBox", kMain)
kBox.Size = UDim2.new(0.8, 0, 0, 40)
kBox.Position = UDim2.new(0.1, 0, 0.35, 0)
kBox.PlaceholderText = "Key: HanfmomentV1"
kBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
kBox.TextColor3 = Color3.new(1,1,1)

local kBtn = Instance.new("TextButton", kMain)
kBtn.Size = UDim2.new(0.8, 0, 0, 40)
kBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
kBtn.Text = "ACCESS GRANTED"
kBtn.BackgroundColor3 = theme.accent
kBtn.TextColor3 = Color3.new(1,1,1)

-- [[ MAIN GUI ]] --
local mainGui = Instance.new("ScreenGui", game.CoreGui)
mainGui.Name = "omamilch_V5_Ultimate"
mainGui.Enabled = false

local main = Instance.new("Frame", mainGui)
main.Size = UDim2.new(0, 600, 0, 450)
main.Position = UDim2.new(0.5, -300, 0.5, -225)
main.BackgroundColor3 = theme.bg
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local sideBar = Instance.new("Frame", main)
sideBar.Size = UDim2.new(0, 150, 1, 0)
sideBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local content = Instance.new("Frame", main)
content.Size = UDim2.new(1, -160, 1, -10)
content.Position = UDim2.new(0, 155, 0, 5)
content.BackgroundTransparency = 1

local pages = {}
local function createPage(name)
    local p = Instance.new("ScrollingFrame", content)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 2
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)
    pages[name] = p
    return p
end

local pMain = createPage("Main")
local pPlayers = createPage("Players")
local pSettings = createPage("Settings")
pMain.Visible = true

-- [[ FEATURES LOGIK ]] --

-- Auto Report System
local autoReport = false
local function reportAll()
    if autoReport then
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player then
                pcall(function()
                    player:ReportAbuse(p, "Bullying", "omamilch V5 Auto-Report Detection")
                end)
            end
        end
        sendNotify("Alle Spieler automatisch gemeldet!", theme.success)
    end
end

-- Fly & Noclip Logic
local flying, noclip = false, false
local bv, bg
local function toggleFly()
    flying = not flying
    noclip = flying
    if flying then
        local root = player.Character.HumanoidRootPart
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local dir = Vector3.new(0,0,0)
                if userInput:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
                if userInput:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
                bv.Velocity = dir * 150
                bg.CFrame = cam
                runService.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

runService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- UI Buttons Helper
local function addBtn(txt, f, parent)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.Gotham
    b.MouseButton1Click:Connect(f)
end

-- Player Admin Logic
local function updatePlayerList()
    for _, v in pairs(pPlayers:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player then
            local row = Instance.new("Frame", pPlayers)
            row.Size = UDim2.new(1, -10, 0, 50)
            row.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            
            local name = Instance.new("TextLabel", row)
            name.Size = UDim2.new(0.4, 0, 1, 0)
            name.Text = p.DisplayName
            name.TextColor3 = Color3.new(1,1,1)
            name.BackgroundTransparency = 1
            
            local function adminBtn(t, x, color, func)
                local btn = Instance.new("TextButton", row)
                btn.Size = UDim2.new(0.18, 0, 0.8, 0)
                btn.Position = UDim2.new(x, 0, 0.1, 0)
                btn.Text = t
                btn.BackgroundColor3 = color
                btn.MouseButton1Click:Connect(func)
            end
            
            adminBtn("TP", 0.42, Color3.fromRGB(0, 150, 0), function() 
                player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame 
            end)
            adminBtn("KICK", 0.61, Color3.fromRGB(200, 100, 0), function() 
                sendNotify("Admin HanfmomentV1 KICKED " .. p.Name, theme.danger)
                pcall(function() p:Destroy() end)
            end)
            adminBtn("BAN", 0.8, Color3.fromRGB(150, 0, 0), function() 
                sendNotify("Admin HanfmomentV1 BANNED " .. p.Name, theme.danger)
                pcall(function() p:Destroy() end)
            end)
        end
    end
end

-- Navigation Buttons
local function nav(name)
    local b = Instance.new("TextButton", sideBar)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.Text = name:upper()
    b.BackgroundColor3 = theme.accent
    b.MouseButton1Click:Connect(function()
        for _, p in pairs(pages) do p.Visible = false end
        pages[name].Visible = true
        if name == "Players" then updatePlayerList() end
    end)
end

nav("Main")
nav("Players")
nav("Settings")

-- Main Features
addBtn("Super Fly + NoClip", toggleFly, pMain)
addBtn("Auto-Report: OFF", function(b) 
    autoReport = not autoReport
    b.Text = autoReport and "Auto-Report: ON" or "Auto-Report: OFF"
    if autoReport then reportAll() end
end, pMain)
addBtn("Voice Chat Bypass", function() 
    pcall(function() game:GetService("VoiceChatService"):joinVoice() end)
    sendNotify("Voice Chat Access Forced", theme.gold)
end, pMain)

-- Login Action
kBtn.MouseButton1Click:Connect(function()
    if kBox.Text == "HanfmomentV1" then
        keyGui:Destroy()
        mainGui.Enabled = true
        sendNotify("omamilch V5 Loaded - Welcome HanfmomentV1", theme.gold)
    else
        kBox.Text = "INVALID KEY"
        task.wait(1)
        kBox.Text = ""
    end
end)

-- F3 Toggle
userInput.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mainGui.Enabled = not mainGui.Enabled end
end)
