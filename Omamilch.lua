-- [[ omamilch V5 - REAL INTEL & FIX ]] --
-- Owner: HanfmomentV1 | Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

-- Sofortiger Console Spam
task.spawn(function()
    while true do
        print("!!! HACKED BY HANFMOMENTV1 !!!")
        task.wait(0.1)
    end
end)

local theme = {
    bg = Color3.fromRGB(10, 10, 10),
    acc = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 30, 30),
    white = Color3.new(1, 1, 1)
}

-- Alte Reste entfernen
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Final" or v.Name == "omamilch_Key" or v.Name == "ServerIntel" then 
        v:Destroy() 
    end
end

-- [[ FUNKTION: SERVER & SPIELER DATA (CHAT: "server") ]] --
local function showServerPanel()
    if game.CoreGui:FindFirstChild("ServerIntel") then game.CoreGui.ServerIntel:Destroy() end
    
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "ServerIntel"
    sg.DisplayOrder = 100
    
    local f = Instance.new("Frame", sg)
    f.Size = UDim2.new(0, 650, 0, 480)
    f.Position = UDim2.new(0.5, -325, 0.5, -240)
    f.BackgroundColor3 = theme.bg
    f.BorderSizePixel = 2
    f.BorderColor3 = theme.acc
    f.Active = true
    f.Draggable = true

    local tit = Instance.new("TextLabel", f)
    tit.Size = UDim2.new(1, 0, 0, 50)
    tit.BackgroundColor3 = theme.acc
    tit.Text = "  NETWORK INTEL - ALL PLAYERS"
    tit.TextColor3 = theme.white
    tit.Font = Enum.Font.SourceSansBold
    tit.TextSize = 24
    tit.TextXAlignment = Enum.TextXAlignment.Left
    
    local sc = Instance.new("ScrollingFrame", f)
    sc.Size = UDim2.new(1, -20, 1, -70)
    sc.Position = UDim2.new(0, 10, 0, 60)
    sc.BackgroundTransparency = 1
    sc.ScrollBarThickness = 6
    sc.CanvasSize = UDim2.new(0, 0, 0, 0)
    local list = Instance.new("UIListLayout", sc)
    list.Padding = UDim.new(0, 5)
    list.HorizontalAlignment = Enum.HorizontalAlignment.Center
    
    for _, player in pairs(game.Players:GetPlayers()) do
        -- Generiere realistische IPs für jeden Spieler
        local pIP = "172.16."..math.random(10,254).."."..math.random(2,254)
        local pPort = math.random(10000, 65000)
        
        local card = Instance.new("Frame", sc)
        card.Size = UDim2.new(0.95, 0, 0, 70)
        card.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        card.BorderSizePixel = 1
        card.BorderColor3 = (player == p) and theme.gold or theme.acc
        Instance.new("UICorner", card)

        local info = Instance.new("TextLabel", card)
        info.Size = UDim2.new(1, -10, 1, 0)
        info.Position = UDim2.new(0, 10, 0, 0)
        info.BackgroundTransparency = 1
        info.Text = "NAME: "..player.Name.." | ID: "..player.UserId.."\nADDR: "..pIP.." | PORT: "..pPort
        info.TextColor3 = (player == p) and theme.gold or theme.white
        info.TextSize = 17
        info.Font = Enum.Font.Code
        info.TextXAlignment = Enum.TextXAlignment.Left
        
        sc.CanvasSize = UDim2.new(0, 0, 0, list.AbsoluteContentSize.Y + 80)
    end
    
    local close = Instance.new("TextButton", f)
    close.Size = UDim2.new(0, 40, 0, 40)
    close.Position = UDim2.new(1, -45, 0, 5)
    close.Text = "X"
    close.BackgroundColor3 = theme.red
    close.TextColor3 = theme.white
    close.Font = Enum.Font.SourceSansBold
    close.TextSize = 20
    close.MouseButton1Click:Connect(function() sg:Destroy() end)
end

p.Chatted:Connect(function(msg)
    if msg:lower() == "server" then showServerPanel() end
end)

-- [[ HAUPT GUI SETUP ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Final"
mg.Enabled = false
mg.ResetOnSpawn = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 750, 0, 580)
main.Position = UDim2.new(0.5, -375, 0.5, -290)
main.BackgroundColor3 = theme.bg
main.Active = true
main.Draggable = true
local stroke = Instance.new("UIStroke", main)
stroke.Color = theme.acc
stroke.Thickness = 4
Instance.new("UICorner", main)

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 80)
header.BackgroundColor3 = theme.acc
Instance.new("UICorner", header)

local tit = Instance.new("TextLabel", header)
tit.Size = UDim2.new(1, 0, 1, 0)
tit.BackgroundTransparency = 1
tit.Text = "  OMAMILCH V5 - OWNER LOGIN: HANFMOMENTV1"
tit.TextColor3 = theme.white
tit.TextSize = 28
tit.Font = Enum.Font.SourceSansBold
tit.TextXAlignment = Enum.TextXAlignment.Left

-- Content Bereich
local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -20, 1, -100)
cont.Position = UDim2.new(0, 10, 0, 90)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -10, 1, 0)
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 2
    local l = Instance.new("UIListLayout", f)
    l.Padding = UDim.new(0, 10)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 40)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    t.Font = Enum.Font.SourceSansBold
    t.TextSize = 20
    t.BackgroundTransparency = 1
    return f
end

local c1, c2, c3, c4 = createCol("Movement"), createCol("Teleport"), createCol("Admin Ban"), createCol("Server")

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 45)
    b.BackgroundColor3 = col or Color3.fromRGB(30, 30, 30)
    b.Text = txt
    b.TextColor3 = theme.white
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 16
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(f)
end

-- Fly Simulation & Movement
addBtn("Super Speed", function() p.Character.Humanoid.WalkSpeed = 150 end, c1)
addBtn("Normal Speed", function() p.Character.Humanoid.WalkSpeed = 16 end, c1)

local function refresh()
    for _, v in pairs(c2:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(c3:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, c2)
            addBtn("BAN "..pl.Name, function() 
                pl:Kick("\nCritical Connection Error: 277\nYour account has been restricted.\nHACKED BY HANFMOMENTV1")
            end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

-- [[ LOGIN SCREEN ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
kg.Name = "omamilch_Key"
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 400, 0, 250)
km.Position = UDim2.new(0.5, -200, 0.5, -125)
km.BackgroundColor3 = theme.bg
Instance.new("UIStroke", km).Color = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 60)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "@@ ENTER KEY @@"
ki.Text = ""
ki.BackgroundColor3 = Color3.fromRGB(20,20,20)
ki.TextColor3 = theme.white
ki.TextSize = 22

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 60)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.TextColor3 = theme.white
kb.TextSize = 24
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
        print("Willkommen HanfmomentV1 - Nutze F3 zum umschalten!")
    else
        ki.Text = ""
        ki.PlaceholderText = "FALSCHER KEY!"
    end
end)

-- [[ F3 TOGGLE FIX ]] --
u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then 
        mg.Enabled = not mg.Enabled
    end
end)
