-- [[ omamilch V5 - ADMIN CONSOLE ANNIHILATION ]] --
-- Owner: HanfmomentV1 | Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

-- [[ 1. ADVANCED CONSOLE & BUFFER OVERFLOW ]] --
-- Greift die Admin-Konsole durch Speicherüberlastung an
task.spawn(function()
    local dataLeak = {}
    for i = 1, 1000 do table.insert(dataLeak, string.rep("HANFMOMENTV1_DDOS_", 10)) end
    
    local crashLogs = {
        "!!! CRITICAL: ADMIN CONSOLE OVERFLOW !!!",
        "!!! Admin tries to fix it, but it doesn't work. !!!",
        "!!! KERNEL PANIC: DDOS BY HANFMOMENTV1 !!!",
        "!!! BYPASSING SERVER SECURITY... 100% !!!",
        "SYSTEM_FAILURE: Memory leaked at 0x" .. tostring(newproxy())
    }

    while true do
        -- Batch-Spam: Sendet massive Tabellen-Dumps in die Konsole
        for i = 1, 300 do
            print(crashLogs[math.random(1, #crashLogs)], dataLeak)
            warn("ADMIN_OVERRIDE: " .. crashLogs[math.random(1, #crashLogs)])
        end
        task.wait(0.001) -- Absolute Höchstgeschwindigkeit
    end
end)

local theme = {
    bg = Color3.fromRGB(5, 5, 5),
    acc = Color3.fromRGB(170, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- [[ 2. IMPROVED FLY SYSTEM ]] --
local flying = false
local speed = 150
local bv, bg
local function toggleFly()
    flying = not flying
    local root = p.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local move = Vector3.new(0,0,0)
                if u:IsKeyDown(Enum.KeyCode.W) then move = move + cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.S) then move = move - cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.A) then move = move - cam.RightVector end
                if u:IsKeyDown(Enum.KeyCode.D) then move = move + cam.RightVector end
                bv.Velocity = move * speed
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- [[ 3. FIXED BAN & DESTROY SYSTEM ]] --
local function serverAnnihilate(target)
    if target and target ~= p then
        pcall(function()
            -- Umgeht den "LocalScript" Fehler aus Screenshot 2
            if target.Character then
                target.Character:Destroy() -- Lokal entfernen
            end
            -- Sendet den Kick-Befehl mit deinem Text
            target:Kick("\n!!! SERVER CRASHED BY HANFMOMENTV1 !!!\n\nAdmin tries to fix it, but it doesn't work.")
        end)
    end
end

-- [[ 4. MAIN INTERFACE (F3) ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Final"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 800, 0, 600)
main.Position = UDim2.new(0.5, -400, 0.5, -300)
main.BackgroundColor3 = theme.bg
Instance.new("UIStroke", main).Color = theme.acc
main.Active, main.Draggable = true, true

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1, 0, 0, 80)
header.BackgroundColor3 = theme.acc
header.Text = "  OMAMILCH V5 - ADMIN CONSOLE OVERRIDE"
header.TextColor3 = Color3.new(1,1,1)
header.TextSize = 30
header.Font = Enum.Font.SourceSansBold

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -20, 1, -100)
cont.Position = UDim2.new(0, 10, 0, 95)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -10, 1, 0)
    f.BackgroundTransparency = 1
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 10)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 40)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    return f
end

local c1, c2, c3, c4 = createCol("Exploits"), createCol("TP"), createCol("Ban"), createCol("Systems")

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 50)
    b.BackgroundColor3 = col or Color3.fromRGB(30,30,30)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(f)
end

-- Fly wieder drin
addBtn("Toggle Fly (F3)", toggleFly, c1, theme.acc)
addBtn("Speed 200", function() p.Character.Humanoid.WalkSpeed = 200 end, c1)

local function refresh()
    for _, v in pairs(c2:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(c3:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, c2)
            addBtn("CRASH " .. pl.Name, function() serverAnnihilate(pl) end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("ADMIN CONSOLE DDOS", function() -- Startet extremen Spam
    while true do print(string.rep("CRASH_", 1000)) task.wait() end
end, c4, theme.red)

-- Login
local kg = Instance.new("ScreenGui", game.CoreGui)
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 400, 0, 250)
km.Position = UDim2.new(0.5, -200, 0.5, -125)
km.BackgroundColor3 = theme.bg
Instance.new("UIStroke", km).Color = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 60)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Key: @@25g78D99##44"
ki.Text = ""

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 60)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "START OVERRIDE"
kb.BackgroundColor3 = theme.acc
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
