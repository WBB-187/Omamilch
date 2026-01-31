-- [[ omamilch V5 - THE FINAL OVERRIDE ]] --
-- Owner: HanfmomentV1 | Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

-- [[ 1. EXTREME CONSOLE & BUFFER CRASH ]] --
-- Greift die Admin-Konsole mit rekursiven Daten-Dumps an
task.spawn(function()
    local heavyData = {}
    for i = 1, 5000 do heavyData[i] = string.rep("CRASH_HANFMOMENTV1_", 20) end
    
    local logs = {
        "!!! KERNEL PANIC: DDOS BY HANFMOMENTV1 !!!",
        "!!! Admin tries to fix it, but it doesn't work. !!!",
        "!!! SYSTEM OVERLOAD: 10.4 TB/s INJECTED !!!",
        "ERROR: Admin-Console firewall bypassed.",
        "STATUS: Server belongs to HanfmomentV1 now."
    }
    
    while true do
        -- Massiver Batch-Spam, um das Log-Fenster zum Laggen zu bringen
        for i = 1, 500 do
            print(logs[math.random(1, #logs)], heavyData)
            warn("ADMIN_FAILURE: " .. logs[math.random(1, #logs)])
        end
        task.wait(0.0001)
    end
end)

local theme = {
    bg = Color3.fromRGB(5, 5, 5),
    acc = Color3.fromRGB(180, 0, 255),
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 20, 20),
    blue = Color3.fromRGB(0, 150, 255)
}

-- [[ 2. ULTRA-SMOOTH FLY SYSTEM ]] --
local flying = false
local flySpeed = 180
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

-- [[ 3. TROLLING & BAN FUNCTIONS ]] --
local function trollPlayer(target, mode)
    if not target or not target.Character then return end
    pcall(function()
        if mode == "Void" then
            target.Character:SetPrimaryPartCFrame(CFrame.new(0, -50000, 0))
        elseif mode == "Naked" then
            for _, v in pairs(target.Character:GetChildren()) do
                if v:IsA("Accessory") or v:IsA("Clothing") then v:Destroy() end
            end
        elseif mode == "Freeze" then
            target.Character.HumanoidRootPart.Anchored = true
        elseif mode == "Ban" then
            target:Kick("\n!!! DDOS BY HANFMOMENTV1 !!!\nAdmin tries to fix it, but it doesn't work.")
            target.Character:Destroy()
        end
    end)
end

-- [[ 4. MAIN INTERFACE (F3) ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_God"
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
header.Text = "  OMAMILCH V5 - OWNER: HANFMOMENTV1"
header.TextColor3 = Color3.new(1,1,1)
header.TextSize = 34
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
    t.Font = Enum.Font.SourceSansBold
    return f
end

local c1, c2, c3, c4 = createCol("Movement"), createCol("Trolling"), createCol("Annihilation"), createCol("System")

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 50)
    b.BackgroundColor3 = col or Color3.fromRGB(25, 25, 25)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(f)
end

-- Column 1: Movement
addBtn("Toggle Fly (Ultra)", toggleFly, c1, theme.acc)
addBtn("Speed 200", function() p.Character.Humanoid.WalkSpeed = 200 end, c1)

-- Player List Refresh
local function refresh()
    for _, col in pairs({c2, c3}) do
        for _, v in pairs(col:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            -- Trolling Buttons
            addBtn("TROLL "..pl.DisplayName, function() trollPlayer(pl, "Void") end, c2, theme.blue)
            -- Ban Buttons
            addBtn("BAN "..pl.Name, function() trollPlayer(pl, "Ban") end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("ADMIN CONSOLE CRASH", function() while true do print(string.rep("OVERFLOW_", 500)) task.wait() end end, c4, theme.red)

-- [[ 5. LOGIN ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 420, 0, 260)
km.Position = UDim2.new(0.5, -210, 0.5, -130)
km.BackgroundColor3 = theme.bg
Instance.new("UIStroke", km).Color = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 60)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "@@ KEY @@"
ki.Text = ""

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 60)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "EXECUTE"
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
