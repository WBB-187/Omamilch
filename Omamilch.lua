-- [[ omamilch V5 - EXCLUSIVE ]] --
-- Owner: HanfmomentV1
-- FIXED KEY: 

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

local theme = {
    bg = Color3.fromRGB(10, 10, 10),
    acc = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- Vorherige GUIs entfernen
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Classic" or v.Name == "omamilch_Key" then v:Destroy() end
end

-- [[ GROSSE BENACHRICHTIGUNG ]] --
local function serverNotify(msg, col)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local l = Instance.new("TextLabel", sg)
    l.Size = UDim2.new(1, 0, 0, 130)
    l.Position = UDim2.new(0, 0, 0.4, 0)
    l.Text = "⚠️ " .. msg .. " ⚠️"
    l.TextColor3 = col or theme.gold
    l.TextSize = 60 -- Massiver Text
    l.Font = Enum.Font.SourceSansBold
    l.BackgroundTransparency = 1
    l.TextStrokeTransparency = 0
    task.delay(4, function() sg:Destroy() end)
end

-- [[ KEY SYSTEM (FIXED PASSWORD) ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
kg.Name = "omamilch_Key"
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 380, 0, 220)
km.Position = UDim2.new(0.5, -190, 0.5, -110)
km.BackgroundColor3 = theme.bg
km.BorderSizePixel = 3
km.BorderColor3 = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 55)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Key eingeben..."
ki.Text = "" -- Leer, damit man ihn eingeben muss
ki.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ki.TextColor3 = Color3.new(1,1,1)
ki.TextSize = 20

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 55)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.TextColor3 = Color3.new(1,1,1)
kb.Font = Enum.Font.SourceSansBold
kb.TextSize = 22

-- [[ HAUPT GUI ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Classic"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 680, 0, 520) -- Massive GUI
main.Position = UDim2.new(0.5, -340, 0.5, -260)
main.BackgroundColor3 = theme.bg
main.BorderColor3 = theme.acc
main.BorderSizePixel = 4
main.Active = true
main.Draggable = true

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1, 0, 0, 70)
tit.BackgroundColor3 = theme.acc
tit.Text = "  OMAMILCH V5 - OWNER LOGIN"
tit.TextColor3 = Color3.new(1,1,1)
tit.Font = Enum.Font.SourceSansBold
tit.TextSize = 32
tit.TextXAlignment = Enum.TextXAlignment.Left

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -10, 1, -80)
cont.Position = UDim2.new(0, 5, 0, 75)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -5, 1, 0)
    f.BackgroundTransparency = 0.95
    f.ScrollBarThickness = 5
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 45)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    t.Font = Enum.Font.SourceSansBold
    t.TextSize = 20
    return f
end

local cMove = createCol("Move")
local cTP = createCol("Teleport")
local cBan = createCol("Ban-System")
local cMisc = createCol("Abuse")

-- [[ FUNKTIONEN ]] --
local flying, noclip = false, false
local function toggleFly(s)
    flying = s
    noclip = s
    local root = p.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        local bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        local bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while flying do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 130
                bg.CFrame = workspace.CurrentCamera.CFrame
                r.RenderStepped:Wait()
            end
            bv:Destroy() bg:Destroy()
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

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 45)
    b.BackgroundColor3 = col or Color3.fromRGB(35, 35, 35)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 19
    b.MouseButton1Click:Connect(f)
end

-- MOVEMENT
addBtn("Fly + NoClip", function() toggleFly(not flying) end, cMove)
addBtn("Speed 150", function() p.Character.Humanoid.WalkSpeed = 150 end, cMove)

-- SPIELER LISTE (TP & BAN)
local function refresh()
    for _, v in pairs(cTP:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(cBan:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, cTP)
            addBtn("BAN "..pl.Name, function() 
                serverNotify("ADMIN HANFMOMENTV1 BANNED "..pl.Name, theme.red)
                pcall(function() pl:Destroy() end)
            end, cBan, Color3.fromRGB(150, 0, 0))
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("Report All", function()
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then pcall(function() p:ReportAbuse(pl, "Bullying", "omamilch V5") end) end
    end
    serverNotify("REPORTS GESENDET", theme.gold)
end, cMisc)

-- LOGIN CHECK (DER NEUE KEY)
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
        serverNotify("WILLKOMMEN HANFMOMENTV1", theme.gold)
    else
        ki.Text = ""
        ki.PlaceholderText = "FALSCHER KEY!"
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
