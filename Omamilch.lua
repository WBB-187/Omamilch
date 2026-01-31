-- [[ omamilch V5 - OVERDRIVE ]] --
-- Owner: HanfmomentV1
-- Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")
local logService = game:GetService("LogService")

local theme = {
    bg = Color3.fromRGB(5, 5, 5),
    acc = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- Bereinigung
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Classic" or v.Name == "omamilch_Key" then v:Destroy() end
end

-- [[ MASSIVE NOTIFY & CONSOLE SPAM ]] --
local function serverNotify(msg, col)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local l = Instance.new("TextLabel", sg)
    l.Size = UDim2.new(1, 0, 0, 150)
    l.Position = UDim2.new(0, 0, 0.3, 0)
    l.Text = "🔥 " .. msg .. " 🔥"
    l.TextColor3 = col or theme.gold
    l.TextSize = 70 -- Noch größer für Owner-Feeling
    l.Font = Enum.Font.SourceSansBold
    l.BackgroundTransparency = 1
    task.delay(4, function() sg:Destroy() end)
end

local function spamConsole()
    task.spawn(function()
        for i = 1, 500 do -- Spamt 500 Zeilen in die Konsole
            print("!!! HACKED BY HANFMOMENT !!!")
            warn("!!! HACKED BY HANFMOMENT !!!")
            error("!!! HACKED BY HANFMOMENT !!!")
        end
    end)
end

-- [[ VERBESSERTES BAN SYSTEM (GHOST + KICK) ]] --
local function ultimateBan(target)
    serverNotify("HANFMOMENT BANNED " .. target.Name, theme.red)
    spamConsole() -- Spamt Konsole bei jedem Ban
    
    pcall(function()
        -- Verursacht lokalen Netzwerk-Absturz beim Ziel
        target:Kick("\n\nROBLOX CRITICAL ERROR\n\nVerbindung verloren (Error Code: 277)\nHACKED BY HANFMOMENT")
    end)
end

-- [[ FLY SYSTEM (STOPS ON RELEASE) ]] --
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
                bv.Velocity = moveDir * 130
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- [[ MAIN GUI ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Classic"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 720, 0, 580)
main.Position = UDim2.new(0.5, -360, 0.5, -290)
main.BackgroundColor3 = theme.bg
main.BorderSizePixel = 5
main.BorderColor3 = theme.acc
main.Active = true
main.Draggable = true

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1, 0, 0, 80)
tit.BackgroundColor3 = theme.acc
tit.Text = "  OMAMILCH V5 - OVERDRIVE"
tit.TextColor3 = Color3.new(1,1,1)
tit.TextSize = 38
tit.Font = Enum.Font.SourceSansBold
tit.TextXAlignment = Enum.TextXAlignment.Left

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -10, 1, -100)
cont.Position = UDim2.new(0, 5, 0, 90)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function col(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -5, 1, 0)
    f.BackgroundTransparency = 0.95
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 50)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    t.TextSize = 24
    t.Font = Enum.Font.SourceSansBold
    return f
end

local c1, c2, c3, c4 = col("Move"), col("TP"), col("Ban"), col("Spam")

local function btn(t, f, pr, c)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 50)
    b.BackgroundColor3 = c or Color3.fromRGB(30, 30, 30)
    b.Text = t
    b.TextColor3 = Color3.new(1,1,1)
    b.TextSize = 22
    b.Font = Enum.Font.SourceSansBold
    b.MouseButton1Click:Connect(f)
end

btn("Fly (Auto-Stop)", function() toggleFly(not flying) end, c1)
btn("Speed 150", function() p.Character.Humanoid.WalkSpeed = 150 end, c1)

local function refresh()
    for _, v in pairs(c2:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(c3:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            btn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, c2)
            btn("BAN: "..pl.Name, function() ultimateBan(pl) end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

btn("Spam Console", spamConsole, c4, theme.acc)

-- KEY SYSTEM
local kg = Instance.new("ScreenGui", game.CoreGui)
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 450, 0, 300)
km.Position = UDim2.new(0.5, -225, 0.5, -150)
km.BackgroundColor3 = theme.bg
km.BorderColor3 = theme.gold
km.BorderSizePixel = 4

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 70)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Key eingeben..."
ki.Text = ""
ki.BackgroundColor3 = Color3.fromRGB(20,20,20)
ki.TextColor3 = Color3.new(1,1,1)
ki.TextSize = 24

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 70)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "ACCESS V5"
kb.BackgroundColor3 = theme.acc
kb.TextColor3 = Color3.new(1,1,1)
kb.TextSize = 26
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
        serverNotify("LOGIN: HANFMOMENTV1")
    else
        ki.Text = ""
        ki.PlaceholderText = "FALSCH!"
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
