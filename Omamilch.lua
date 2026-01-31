-- [[ omamilch V5 - THE FINAL FIX ]] --
-- Owner: HanfmomentV1
-- Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")
local stats = game:GetService("Stats")

local theme = {
    bg = Color3.fromRGB(15, 15, 15),
    acc = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 30, 30),
    glow = Color3.fromRGB(200, 50, 255)
}

-- Reinigung
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Final" or v.Name == "omamilch_Key" then v:Destroy() end
end

-- [[ AUTOMATISCHER CONSOLE SPAM ]] --
local function autoSpam()
    task.spawn(function()
        while true do
            print("!!! HACKED BY HANFMOMENT !!!")
            warn("!!! HACKED BY HANFMOMENT !!!")
            error("!!! HACKED BY HANFMOMENT !!!")
            task.wait(0.5)
        end
    end)
end

-- [[ RADIKALES BAN SYSTEM ]] --
local function ultimateBan(target)
    if target then
        pcall(function()
            -- Kickt den Spieler mit Netzwerk-Fehler
            target:Kick("\n[ROBLOX ERROR]\nVerbindung zum Server unterbrochen.\nFehlercode: 277\nHACKED BY HANFMOMENT")
            -- Falls Kick fehlschlägt, verstecke ihn lokal (Ghosting)
            if target.Character then target.Character:Destroy() end
        end)
    end
end

-- [[ SERVER INFO ]] --
local function getServerData()
    local ip = "185.242."..math.random(10,255).."."..math.random(1,255)
    local port = "64231"
    return ip, port
end

-- [[ ESP & USER ID ]] --
local function addESP(pl)
    if pl.Character and not pl.Character:FindFirstChild("HanfID") then
        local bg = Instance.new("BillboardGui", pl.Character)
        bg.Name = "HanfID"
        bg.Size = UDim2.new(0, 200, 0, 50)
        bg.AlwaysOnTop = true
        bg.ExtentsOffset = Vector3.new(0, 3, 0)
        local tl = Instance.new("TextLabel", bg)
        tl.Size = UDim2.new(1, 0, 1, 0)
        tl.BackgroundTransparency = 1
        tl.Text = pl.Name .. "\nID: " .. pl.UserId
        tl.TextColor3 = theme.gold
        tl.TextSize = 16
        tl.Font = Enum.Font.SourceSansBold
    end
end

-- [[ FLY SYSTEM (AUTO-STOP) ]] --
local flying = false
local bv, bg
local function toggleFly(state)
    flying = state
    local root = p.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local moveDir = Vector3.new(0,0,0)
                if u:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.RightVector end
                if u:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.RightVector end
                bv.Velocity = moveDir * 150
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- [[ SCHÖNE GUI ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Final"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 750, 0, 600)
main.Position = UDim2.new(0.5, -375, 0.5, -300)
main.BackgroundColor3 = theme.bg
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 15)

local stroke = Instance.new("UIStroke", main)
stroke.Color = theme.acc
stroke.Thickness = 3

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1, 0, 0, 80)
tit.BackgroundColor3 = theme.acc
tit.Text = "  OMAMILCH V5 - OWNER INTERFACE"
tit.TextColor3 = Color3.new(1,1,1)
tit.TextSize = 32
tit.Font = Enum.Font.SourceSansBold
tit.TextXAlignment = Enum.TextXAlignment.Left
Instance.new("UICorner", tit).CornerRadius = UDim.new(0, 15)

-- IP Display
local ipLabel = Instance.new("TextLabel", main)
ipLabel.Size = UDim2.new(1, 0, 0, 30)
ipLabel.Position = UDim2.new(0, 0, 0, 80)
local curIP, curPort = getServerData()
ipLabel.Text = "SERVER-IP: " .. curIP .. " | PORT: " .. curPort
ipLabel.TextColor3 = theme.gold
ipLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ipLabel.BackgroundTransparency = 0.5

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -20, 1, -130)
cont.Position = UDim2.new(0, 10, 0, 120)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -10, 1, 0)
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 2
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 8)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 45)
    t.Text = name:upper()
    t.TextColor3 = theme.acc
    t.TextSize = 20
    t.Font = Enum.Font.SourceSansBold
    return f
end

local c1, c2, c3, c4 = createCol("Move"), createCol("Players"), createCol("Ban"), createCol("Self")

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 50)
    b.BackgroundColor3 = col or Color3.fromRGB(30, 30, 30)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 18
    b.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(f)
end

addBtn("Ultimate Fly", function() toggleFly(not flying) end, c1)
addBtn("Super Speed", function() p.Character.Humanoid.WalkSpeed = 150 end, c1)

local function refresh()
    for _, v in pairs(c2:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(c3:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addESP(pl)
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, c2)
            addBtn("BAN "..pl.Name, function() ultimateBan(pl) end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

-- LOGIN SYSTEM
local kg = Instance.new("ScreenGui", game.CoreGui)
kg.Name = "omamilch_Key"
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 400, 0, 250)
km.Position = UDim2.new(0.5, -200, 0.5, -125)
km.BackgroundColor3 = theme.bg
local ksc = Instance.new("UICorner", km)
ksc.CornerRadius = UDim.new(0, 15)
local kst = Instance.new("UIStroke", km)
kst.Color = theme.gold
kst.Thickness = 2

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 60)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "@@ ENTER KEY @@"
ki.Text = ""
ki.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ki.TextColor3 = Color3.new(1,1,1)
ki.TextSize = 22
Instance.new("UICorner", ki).CornerRadius = UDim.new(0, 8)

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 60)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.TextColor3 = Color3.new(1,1,1)
kb.TextSize = 24
Instance.new("UICorner", kb).CornerRadius = UDim.new(0, 8)

kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
        autoSpam() -- Startet Spam sofort nach Login
        print("LOGIN ERFOLGREICH - WILLKOMMEN HANFMOMENTV1")
    else
        ki.Text = ""
        ki.PlaceholderText = "FALSCHER KEY!"
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
