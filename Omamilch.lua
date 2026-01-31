-- [[ omamilch V5 - ORIGINAL CLASSIC ]] --
-- Key: HanfmomentV1 | Owner: HanfmomentV1

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")
local t = game:GetService("TextChatService")
local s = game:GetService("StarterGui")

local theme = {
    bg = Color3.fromRGB(10, 10, 10),
    acc = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- Alte Reste entfernen
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Classic" or v.Name == "omamilch_Key" then v:Destroy() end
end

-- [[ NOTIFICATIONS ]] --
local function serverNotify(msg, col)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local l = Instance.new("TextLabel", sg)
    l.Size = UDim2.new(1, 0, 0, 60)
    l.Position = UDim2.new(0, 0, 0.4, 0)
    l.Text = "★ " .. msg .. " ★"
    l.TextColor3 = col or theme.gold
    l.TextSize = 38
    l.Font = Enum.Font.SourceSansBold
    l.BackgroundTransparency = 1
    l.TextStrokeTransparency = 0
    task.delay(4, function() sg:Destroy() end)
end

-- [[ KEY SYSTEM ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
kg.Name = "omamilch_Key"
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 320, 0, 180)
km.Position = UDim2.new(0.5, -160, 0.5, -90)
km.BackgroundColor3 = theme.bg
km.BorderColor3 = theme.gold
km.BorderSizePixel = 2

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 45)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Key: HanfmomentV1"
ki.Text = ""
ki.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ki.TextColor3 = Color3.new(1,1,1)

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 45)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.TextColor3 = Color3.new(1,1,1)
kb.Font = Enum.Font.SourceSansBold

-- [[ MAIN GUI (ALTE ART) ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Classic"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 600, 0, 450)
main.Position = UDim2.new(0.5, -300, 0.5, -225)
main.BackgroundColor3 = theme.bg
main.BorderColor3 = theme.acc
main.BorderSizePixel = 3
main.Active = true
main.Draggable = true

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1, 0, 0, 50)
tit.BackgroundColor3 = theme.acc
tit.Text = "  OMAMILCH V5 - OWNER: HANFMOMENTV1"
tit.TextColor3 = Color3.new(1,1,1)
tit.Font = Enum.Font.SourceSansBold
tit.TextSize = 24
tit.TextXAlignment = Enum.TextXAlignment.Left

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -10, 1, -60)
cont.Position = UDim2.new(0, 5, 0, 55)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -5, 1, 0)
    f.BackgroundTransparency = 0.95
    f.ScrollBarThickness = 3
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 35)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    t.Font = Enum.Font.SourceSansBold
    t.BackgroundTransparency = 1
    return f
end

local cMove = createCol("Movement")
local cAdmin = createCol("Admin TP")
local cBan = createCol("Ban/Kick")
local cMisc = createCol("Misc")

-- [[ FLY & NOCLIP LOGIC ]] --
local flying, noclip = false, false
local flySpeed = 100
local bv, bg

local function toggleFly(s)
    flying = s
    noclip = s
    local root = p.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local dir = Vector3.new(0,0,0)
                if u:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
                bv.Velocity = dir * flySpeed
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

r.Stepped:Connect(function()
    if noclip and p.Character then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- [[ CHAT COMMANDS ]] --
p.Chatted:Connect(function(msg)
    local m = msg:lower()
    if m == "fly" then toggleFly(true)
    elseif m == "nofly" then toggleFly(false)
    elseif m == "noclip" then noclip = true
    elseif m == "ausclip" then noclip = false end
end)

-- [[ UI BUTTONS ]] --
local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 35)
    b.BackgroundColor3 = col or Color3.fromRGB(30, 30, 30)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSans
    b.TextSize = 17
    b.MouseButton1Click:Connect(f)
end

-- MOVEMENT
addBtn("Fly (Click/Chat)", function() toggleFly(not flying) end, cMove)
addBtn("Speed 150", function() p.Character.Humanoid.WalkSpeed = 150 end, cMove)
addBtn("Speed Reset", function() p.Character.Humanoid.WalkSpeed = 16 end, cMove)

-- REFRESH PLAYERS (TP & BAN)
local function refresh()
    for _, v in pairs(cAdmin:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(cBan:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, cAdmin)
            addBtn("BAN: "..pl.Name, function() 
                serverNotify("ADMIN HANFMOMENTV1 BANNED "..pl.Name, theme.red)
                pcall(function() pl:Destroy() end)
            end, cBan, Color3.fromRGB(150, 0, 0))
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

-- MISC
addBtn("Auto-Report All", function()
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then pcall(function() p:ReportAbuse(pl, "Bullying", "omamilch V5") end) end
    end
    serverNotify("ALLE SPIELER GEMELDET", theme.gold)
end, cMisc)
addBtn("Voice Bypass", function() pcall(function() game:GetService("VoiceChatService"):joinVoice() end) end, cMisc)

-- LOGIN LOGIK
kb.MouseButton1Click:Connect(function()
    if ki.Text == "HanfmomentV1" then
        kg:Destroy()
        mg.Enabled = true
        serverNotify("WILLKOMMEN HANFMOMENTV1", theme.gold)
    else
        ki.Text = "KEY FALSCH!"
    end
end)

-- F3 Toggle
u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
