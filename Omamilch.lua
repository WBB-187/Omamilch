-- [[ omamilch V5 - ORIGINAL CLASSIC ]] --
-- Owner: HanfmomentV1
-- NEW KEY:

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")
local t = game:GetService("TextChatService")

local theme = {
    bg = Color3.fromRGB(10, 10, 10),
    acc = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- Reinigung
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Classic" or v.Name == "omamilch_Key" then v:Destroy() end
end

-- [[ BIG NOTIFY SYSTEM ]] --
local function serverNotify(msg, col)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local l = Instance.new("TextLabel", sg)
    l.Size = UDim2.new(1, 0, 0, 120)
    l.Position = UDim2.new(0, 0, 0.4, 0)
    l.Text = "⚠️ " .. msg .. " ⚠️"
    l.TextColor3 = col or theme.gold
    l.TextSize = 55 -- Extra Großer Text
    l.Font = Enum.Font.SourceSansBold
    l.BackgroundTransparency = 1
    l.TextStrokeTransparency = 0
    task.delay(4, function() sg:Destroy() end)
end

-- [[ KEY SYSTEM ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
kg.Name = "omamilch_Key"
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 350, 0, 200)
km.Position = UDim2.new(0.5, -175, 0.5, -100)
km.BackgroundColor3 = theme.bg
km.BorderSizePixel = 3
km.BorderColor3 = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 50)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Hier Key eingeben..."
ki.Text = "" -- Jetzt komplett leer
ki.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ki.TextColor3 = Color3.new(1,1,1)
ki.TextSize = 18

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 50)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.TextColor3 = Color3.new(1,1,1)
kb.Font = Enum.Font.SourceSansBold
kb.TextSize = 20

-- [[ MAIN GUI ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Classic"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 650, 0, 500) -- Größeres Fenster
main.Position = UDim2.new(0.5, -325, 0.5, -250)
main.BackgroundColor3 = theme.bg
main.BorderColor3 = theme.acc
main.BorderSizePixel = 4
main.Active = true
main.Draggable = true

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1, 0, 0, 60)
tit.BackgroundColor3 = theme.acc
tit.Text = "  OMAMILCH V5 - [ADMIN ACCESS]"
tit.TextColor3 = Color3.new(1,1,1)
tit.Font = Enum.Font.SourceSansBold
tit.TextSize = 28 -- Größerer Titel
tit.TextXAlignment = Enum.TextXAlignment.Left

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -10, 1, -70)
cont.Position = UDim2.new(0, 5, 0, 65)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -5, 1, 0)
    f.BackgroundTransparency = 0.95
    f.ScrollBarThickness = 4
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 40)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    t.Font = Enum.Font.SourceSansBold
    t.TextSize = 18
    return f
end

local cMove = createCol("Movement")
local cAdmin = createCol("Teleport")
local cBan = createCol("Ban-System")
local cMisc = createCol("Abuse")

-- [[ LOGIC ]] --
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
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 120
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
    b.Size = UDim2.new(1, -5, 0, 40)
    b.BackgroundColor3 = col or Color3.fromRGB(30, 30, 30)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 17
    b.MouseButton1Click:Connect(f)
end

-- BUTTONS
addBtn("Fly + NoClip", function() toggleFly(not flying) end, cMove)
addBtn("Speed 150", function() p.Character.Humanoid.WalkSpeed = 150 end, cMove)

local function refresh()
    for _, v in pairs(cAdmin:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(cBan:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, cAdmin)
            addBtn("BAN "..pl.Name, function() 
                serverNotify("ADMIN HANFMOMENTV1 BANNED "..pl.Name, theme.red)
                pcall(function() pl:Destroy() end)
            end, cBan, Color3.fromRGB(150, 0, 0))
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("Report All Players", function()
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then pcall(function() p:ReportAbuse(pl, "Bullying", "omamilch V5") end) end
    end
    serverNotify("REPORTS AN ROBLOX GESENDET", theme.gold)
end, cMisc)

-- LOGIN
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
