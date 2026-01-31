-- [[ omamilch V5 - NO-CLIP EDITION ]] --
-- Credits: HanfmomentV1 | Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

-- [[ 1. ULTIMATE CONSOLE CRASH (BUFFER OVERFLOW) ]] --
task.spawn(function()
    local heavyTable = {}
    for i = 1, 10000 do heavyTable[i] = "HANFMOMENTV1_SYSTEM_OVERRIDE_" .. i end
    
    local ddosLogs = {
        "!!! CRITICAL KERNEL PANIC !!!",
        "!!! Admin tries to fix it, but it doesn't work. !!!",
        "!!! DDOS STATUS: 12.5 TB/s - CONSOLE FROZEN !!!",
        "!!! SERVER OWNED BY HANFMOMENTV1 !!!",
        "MEMORY_ERROR: 0xFFFFFFFF - BUFFER_OVERFLOW"
    }
    
    while true do
        for i = 1, 1000 do
            print(ddosLogs[math.random(1, #ddosLogs)], heavyTable)
            warn("KERNEL_FAILURE: " .. ddosLogs[math.random(1, #ddosLogs)])
        end
        task.wait(0.0001)
    end
end)

local theme = {
    bg = Color3.fromRGB(5, 5, 5),
    acc = Color3.fromRGB(180, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- [[ 2. FLY & NOCLIP SYSTEM (FIXED) ]] --
local flying = false
local noclip = false
local flySpeed = 180
local bv, bg

-- NoClip Loop
r.Stepped:Connect(function()
    if noclip and p.Character then
        for _, part in pairs(p.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local function toggleFlyClip()
    flying = not flying
    noclip = flying -- NoClip aktiviert sich zusammen mit Fly
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
                if u:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
                if u:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end
                
                bv.Velocity = move * flySpeed
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- [[ 3. MAIN GUI ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_NoClip"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 850, 0, 650)
main.Position = UDim2.new(0.5, -425, 0.5, -325)
main.BackgroundColor3 = theme.bg
Instance.new("UIStroke", main).Color = theme.acc
main.Active, main.Draggable = true, true

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1, 0, 0, 90)
header.BackgroundColor3 = theme.acc
header.Text = "  OMAMILCH V5 - NOCLIP & OVERRIDE"
header.TextColor3 = Color3.new(1,1,1)
header.TextSize = 32
header.Font = Enum.Font.SourceSansBold

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -20, 1, -110)
cont.Position = UDim2.new(0, 10, 0, 100)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25, -10, 1, 0)
    f.BackgroundTransparency = 1
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 8)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 45)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    return f
end

local c1, c2, c3, c4 = createCol("Exploits"), createCol("Trolling"), createCol("Ban"), createCol("System")

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 50)
    b.BackgroundColor3 = col or Color3.fromRGB(30, 30, 30)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(f)
end

-- Spalte 1: Movement mit NoClip
addBtn("FLY & NOCLIP", toggleFlyClip, c1, theme.acc)
addBtn("SPEED 200", function() p.Character.Humanoid.WalkSpeed = 200 end, c1)

-- Spalte 2 & 3: Trolling & Ban
local function refresh()
    for _, col in pairs({c2, c3}) do
        for _, v in pairs(col:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn("VOID "..pl.DisplayName, function() pl.Character:SetPrimaryPartCFrame(CFrame.new(0,-50000,0)) end, c2)
            addBtn("BAN "..pl.Name, function() 
                pl:Kick("\n!!! DDOS BY HANFMOMENTV1 !!!\nAdmin tries to fix it, but it doesn't work.")
                pl.Character:Destroy()
            end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("FORCE CONSOLE CRASH", function() while true do print(string.rep("OVERFLOW_", 1000)) task.wait() end end, c4, theme.red)

-- Login System
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
local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 60)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then kg:Destroy() mg.Enabled = true end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
