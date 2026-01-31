-- [[ omamilch V5 ]] --
-- OWNER: HanfmomentV1
-- ZENTRALES ADMIN-SYSTEM

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local starterGui = game:GetService("StarterGui")

local theme = {
    bg = Color3.fromRGB(0, 0, 0),
    border = Color3.fromRGB(150, 0, 255),
    stars = Color3.fromRGB(255, 0, 0)
}

-- Alte GUIs entfernen
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Central" then v:Destroy() end
end

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "omamilchV5_Central"
screenGui.ResetOnSpawn = false

-- 1. PERMANENTER OWNER CHAT TAG
if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    TextChatService.OnIncomingMessage = function(message)
        local props = Instance.new("TextChatMessageProperties")
        if message.TextSource and message.TextSource.UserId == player.UserId then
            props.PrefixText = "<font color='#FF0000'><b>[OWNER]</b></font> " .. message.PrefixText
        end
        return props
    end
end

-- Hilfsfunktion für zentrierte Fenster
local function createFrame(name, size, pos)
    local f = Instance.new("Frame", screenGui)
    f.Name = name
    f.Size = size
    f.Position = pos
    f.BackgroundColor3 = theme.bg
    f.BackgroundTransparency = 0.15
    f.BorderSizePixel = 2
    f.BorderColor3 = theme.border
    f.Active = true
    f.Draggable = true
    
    local stars = Instance.new("TextLabel", f)
    stars.Size = UDim2.new(1, 0, 1, 0)
    stars.BackgroundTransparency = 1
    stars.Text = "★ * ★ * ★ * ★ * ★ * ★ * ★"
    stars.TextColor3 = theme.stars
    stars.TextTransparency = 0.7
    stars.TextScaled = true
    stars.ZIndex = 0
    return f
end

-- HAUPTFENSTER (Zentriert & Größer)
local main = createFrame("Main", UDim2.new(0, 280, 0, 400), UDim2.new(0.5, -140, 0.5, -200))
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundColor3 = theme.border
title.BackgroundTransparency = 0.2
title.Text = "[OWNER] omamilch V5"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22

local container = Instance.new("ScrollingFrame", main)
container.Size = UDim2.new(1, -10, 0.85, 0)
container.Position = UDim2.new(0, 5, 0.12, 5)
container.BackgroundTransparency = 1
container.CanvasSize = UDim2.new(0, 0, 2, 0)
container.ScrollBarThickness = 4
Instance.new("UIListLayout", container).Padding = UDim.new(0, 8)

-- SPIELERLISTE (Zentriert & Breit)
local pFrame = createFrame("PlayerAdmin", UDim2.new(0, 350, 0, 450), UDim2.new(0.5, -175, 0.5, -225))
pFrame.Visible = false

local pTitle = Instance.new("TextLabel", pFrame)
pTitle.Size = UDim2.new(1, 0, 0, 40)
pTitle.Text = "ADMIN PLAYER CONTROL"
pTitle.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
pTitle.TextColor3 = Color3.new(1,1,1)
pTitle.Font = Enum.Font.SourceSansBold

local pList = Instance.new("ScrollingFrame", pFrame)
pList.Size = UDim2.new(1, -10, 0.88, 0)
pList.Position = UDim2.new(0, 5, 0.1, 5)
pList.BackgroundTransparency = 1
pList.CanvasSize = UDim2.new(0, 0, 5, 0)
Instance.new("UIListLayout", pList).Padding = UDim.new(0, 5)

-- --- LOGIK-FUNKTIONEN ---

local flying = false
local flySpeed = 90
local bv, bg

local function toggleFly()
    flying = not flying
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    
    if flying then
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        bg.P = 40000 
        
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local dir = Vector3.new(0, 0.01, 0)
                
                if userInput:IsKeyDown(Enum.KeyCode.W) then dir = cam.LookVector
                elseif userInput:IsKeyDown(Enum.KeyCode.S) then dir = -cam.LookVector
                elseif userInput:IsKeyDown(Enum.KeyCode.A) then dir = -cam.RightVector
                elseif userInput:IsKeyDown(Enum.KeyCode.D) then dir = cam.RightVector end
                
                bv.Velocity = (dir.Magnitude > 0.1) and (dir * flySpeed) or Vector3.new(0,0,0)
                bg.CFrame = cam
                task.wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- Fixes Kick/Ban System (Lokal)
local function deepAdminAction(target, mode)
    if target and target ~= player then
        local name = target.Name
        if target.Character then target.Character:Destroy() end
        target:Destroy() -- Entfernt aus Player-Liste, Chat und Memory
        
        starterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[ADMIN] Spieler " .. name .. " wurde erfolgreich " .. mode .. "iert.",
            Color = Color3.new(1, 0, 0),
            Font = Enum.Font.SourceSansBold
        })
    end
end

-- Automatische Aktualisierung der Liste
local function updatePlayerList()
    for _, v in pairs(pList:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player then
            local row = Instance.new("Frame", pList)
            row.Size = UDim2.new(0.95, 0, 0, 50)
            row.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            row.BorderSizePixel = 1
            row.BorderColor3 = theme.border

            local nameLabel = Instance.new("TextLabel", row)
            nameLabel.Size = UDim2.new(0.4, 0, 1, 0)
            nameLabel.Text = p.DisplayName
            nameLabel.TextColor3 = Color3.new(1,1,1)
            nameLabel.TextScaled = true
            nameLabel.BackgroundTransparency = 1

            -- TP
            local tpBtn = Instance.new("TextButton", row)
            tpBtn.Size = UDim2.new(0.18, 0, 0.8, 0)
            tpBtn.Position = UDim2.new(0.42, 0, 0.1, 0)
            tpBtn.Text = "TP"
            tpBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
            tpBtn.MouseButton1Click:Connect(function() 
                player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame 
            end)

            -- KICK
            local kBtn = Instance.new("TextButton", row)
            kBtn.Size = UDim2.new(0.18, 0, 0.8, 0)
            kBtn.Position = UDim2.new(0.61, 0, 0.1, 0)
            kBtn.Text = "KICK"
            kBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 0)
            kBtn.MouseButton1Click:Connect(function() deepAdminAction(p, "KICK") end)

            -- BAN
            local bBtn = Instance.new("TextButton", row)
            bBtn.Size = UDim2.new(0.18, 0, 0.8, 0)
            bBtn.Position = UDim2.new(0.8, 0, 0.1, 0)
            bBtn.Text = "BAN"
            bBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            bBtn.MouseButton1Click:Connect(function() deepAdminAction(p, "BAN") end)
        end
    end
end

-- Automatische Aktualisierung alle 2 Sekunden
task.spawn(function()
    while true do
        if pFrame.Visible then updatePlayerList() end
        task.wait(2)
    end
end)

-- Main Buttons
local function addBtn(txt, func)
    local b = Instance.new("TextButton", container)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 18
    b.MouseButton1Click:Connect(func)
end

addBtn("Fly (WASD / Stop-Fix)", toggleFly)
addBtn("Emote: Bang", function() 
    local a = Instance.new("Animation") a.AnimationId = "rbxassetid://148840339"
    player.Character.Humanoid:LoadAnimation(a):Play() 
end)
addBtn("Emote: Suck", function() 
    local a = Instance.new("Animation") a.AnimationId = "rbxassetid://204328711"
    player.Character.Humanoid:LoadAnimation(a):Play() 
end)
addBtn("OPEN ADMIN LIST", function() 
    pFrame.Visible = not pFrame.Visible 
    if pFrame.Visible then updatePlayerList() end
end)
addBtn("Speed 100", function() player.Character.Humanoid.WalkSpeed = 100 end)
addBtn("Destroy GUI", function() screenGui:Destroy() end)

-- F3 Toggle
userInput.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.F3 then
        main.Visible = not main.Visible
        pFrame.Visible = false
    end
end)

starterGui:SetCore("ChatMakeSystemMessage", {
    Text = "[omamilch V5] Zentrales Owner-Panel geladen. Willkommen HanfmomentV1!",
    Color = theme.border
})
