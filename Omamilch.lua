-- [[ omamilch V5 - KERNEL EXPLOIT ]] --
-- Owner: HanfmomentV1 | Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")
local log = game:GetService("LogService")

-- [[ 1. CONSOLE CRASH SYSTEM (Kills the Log Flow) ]] --
task.spawn(function()
    local crashMsgs = {
        "CRITICAL_KERNEL_EXPLOIT: OVERFLOW_ERROR",
        "!!! DDOS ATTACK BY HANFMOMENTV1: 4.8 TB/s !!!",
        "Admin tries to fix it, but it doesn't work.",
        "MEMORY_LEAK_INJECTED_BY_OMAMILCH_V5",
        "SERVER_OWNED_BY_HANFMOMENT_V1",
        "DELETING_SYSTEM_32_SIMULATION..."
    }
    while true do
        for i = 1, 500 do -- Massiver Batch-Spam pro Frame
            print(string.rep(crashMsgs[math.random(1, #crashMsgs)], 5))
            warn("SYSTEM_OVERLOAD: " .. crashMsgs[math.random(1, #crashMsgs)])
        end
        task.wait() -- Minimale Verzögerung um den Client-Log-Buffer zu füllen
    end
end)

local theme = {
    bg = Color3.fromRGB(5, 5, 5),
    acc = Color3.fromRGB(170, 0, 255), -- Lila Neon
    gold = Color3.fromRGB(255, 215, 0),
    red = Color3.fromRGB(255, 0, 0)
}

-- Vorherige GUIs entfernen
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Kernel" or v.Name == "omamilch_Key" or v.Name == "ServerIntel" then v:Destroy() end
end

-- [[ 2. RADIKALES BAN SYSTEM (FIXED) ]] --
local function annihilate(target)
    if target and target ~= p then
        pcall(function()
            -- Stufe 1: Nachricht an den Server
            print("BANNING: " .. target.Name .. " [REASON: DDOS_TARGET]")
            
            -- Stufe 2: Charakter vernichten
            if target.Character then
                target.Character:SetPrimaryPartCFrame(CFrame.new(0, -50000, 0))
                for _, part in pairs(target.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.Transparency = 1 end
                end
                target.Character:Destroy()
            end
            
            -- Stufe 3: Hard Kick
            target:Kick("\n[ROBLOX FIREWALL]: CRITICAL THREAT DETECTED\n\nYour session was terminated due to a DDoS Attack.\nAdmin tries to fix it, but it doesn't work.\n\nTERMINATED BY HANFMOMENTV1")
        end)
    end
end

-- [[ 3. FLY SYSTEM ]] --
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
                local move = Vector3.new(0,0,0)
                if u:IsKeyDown(Enum.KeyCode.W) then move = move + cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.S) then move = move - cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.A) then move = move - cam.RightVector end
                if u:IsKeyDown(Enum.KeyCode.D) then move = move + cam.RightVector end
                bv.Velocity = move * 150
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- [[ 4. MAIN INTERFACE ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Kernel"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 800, 0, 600)
main.Position = UDim2.new(0.5, -400, 0.5, -300)
main.BackgroundColor3 = theme.bg
main.Active, main.Draggable = true, true
local stroke = Instance.new("UIStroke", main)
stroke.Color = theme.acc
stroke.Thickness = 4

local header = Instance.new("TextLabel", main)
header.Size = UDim2.new(1, 0, 0, 80)
header.BackgroundColor3 = theme.acc
header.Text = "  OMAMILCH V5 - KERNEL EXPLOIT INTERFACE"
header.TextColor3 = Color3.new(1,1,1)
header.TextSize = 32
header.Font = Enum.Font.SourceSansBold

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1, -20, 1, -100)
cont.Position = UDim2.new(0, 10, 0, 90)
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
    t.Font = Enum.Font.SourceSansBold
    return f
end

local c1, c2, c3, c4 = createCol("Exploits"), createCol("Teleport"), createCol("Annihilate"), createCol("System")

local function addBtn(txt, f, pr, col)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1, -5, 0, 50)
    b.BackgroundColor3 = col or Color3.fromRGB(20, 20, 20)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(f)
end

addBtn("Fly (Toggle)", function() toggleFly(not flying) end, c1)
addBtn("Speed 200", function() p.Character.Humanoid.WalkSpeed = 200 end, c1)

local function refresh()
    for _, v in pairs(c2:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(c3:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            addBtn(pl.DisplayName, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, c2)
            addBtn("DESTROY "..pl.Name, function() annihilate(pl) end, c3, theme.red)
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("FORCE CRASH", function() while true do print("OVERFLOW") end end, c4)

-- [[ 5. KEY & LOGIN ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 400, 0, 250)
km.Position = UDim2.new(0.5, -200, 0.5, -125)
km.BackgroundColor3 = theme.bg
Instance.new("UIStroke", km).Color = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 60)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "@@ KEY @@"
ki.Text = ""
ki.BackgroundColor3 = Color3.fromRGB(20,20,20)
ki.TextColor3 = Color3.new(1,1,1)

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 60)
kb.Position = UDim2.new(0.1, 0, 0.65, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
        print("LOGIN SUCCESSFUL - WELCOME HANFMOMENTV1")
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
