-- [[ omamilch V5 - ULTIMATE MOBILE & PC HYBRID ]] --
-- Owner: HanfmomentV1 | Key: @@25g78D99##44

local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")

local theme = {
    bg = Color3.fromRGB(10, 0, 0),
    acc = Color3.fromRGB(255, 0, 0), -- Reines Rot
    gold = Color3.fromRGB(255, 215, 0),
    white = Color3.new(1, 1, 1)
}

-- [[ 1. ANIMIERTER STERNEN-HINTERGRUND ]] --
local function createStars(parent)
    for i = 1, 50 do
        local star = Instance.new("Frame", parent)
        star.Size = UDim2.new(0, 2, 0, 2)
        star.BackgroundColor3 = Color3.fromRGB(255, math.random(0, 50), math.random(0, 50))
        star.Position = UDim2.new(math.random(), 0, math.random(), 0)
        star.BorderSizePixel = 0
        
        task.spawn(function()
            while task.wait(math.random(1, 3)) do
                local tween = game:GetService("TweenService"):Create(star, TweenInfo.new(1), {BackgroundTransparency = 1})
                tween:Play()
                tween.Completed:Wait()
                star.Position = UDim2.new(math.random(), 0, math.random(), 0)
                game:GetService("TweenService"):Create(star, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
            end
        end)
    end
end

-- [[ 2. DDOS SYSTEM (STOPPBAR) ]] --
local ddosActive = false
local function startDDoS()
    task.spawn(function()
        local heavyData = string.rep("HANFMOMENTV1_OVERFLOW_", 100)
        while ddosActive do
            print("!!! DDOS ATTACK BY HANFMOMENTV1: 15.4 TB/s !!!", heavyData)
            warn("Admin tries to fix it, but it doesn't work.")
            task.wait(0.001)
        end
    end)
end

-- [[ 3. FLY & NOCLIP (PC & MOBILE) ]] --
local flying = false
local flySpeed = 50
local bv, bg

r.Stepped:Connect(function()
    if flying and p.Character then
        for _, part in pairs(p.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

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
                
                -- PC Steuerung
                if u:IsKeyDown(Enum.KeyCode.W) then move = move + cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.S) then move = move - cam.LookVector end
                if u:IsKeyDown(Enum.KeyCode.A) then move = move - cam.RightVector end
                if u:IsKeyDown(Enum.KeyCode.D) then move = move + cam.RightVector end
                
                bv.Velocity = move * flySpeed
                bg.CFrame = cam
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

-- [[ 4. HAUPT GUI (RED DESIGN) ]] --
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Mobile"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 600, 0, 400) -- Kompakter für Mobile
main.Position = UDim2.new(0.5, -300, 0.5, -200)
main.BackgroundColor3 = theme.bg
main.BorderSizePixel = 0
main.Active, main.Draggable = true, true
Instance.new("UICorner", main)
local stroke = Instance.new("UIStroke", main)
stroke.Color = theme.acc
stroke.Thickness = 3

createStars(main)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = theme.acc
title.Text = "OMAMILCH V5 - MOBILE & PC"
title.TextColor3 = theme.white
title.Font = Enum.Font.SourceSansBold
title.TextSize = 25
Instance.new("UICorner", title)

local container = Instance.new("ScrollingFrame", main)
container.Size = UDim2.new(1, -20, 1, -70)
container.Position = UDim2.new(0, 10, 0, 60)
container.BackgroundTransparency = 1
container.CanvasSize = UDim2.new(0, 0, 2, 0)
local list = Instance.new("UIListLayout", container)
list.Padding = UDim.new(0, 10)

-- Funktion für Buttons & Slider
local function addToggle(txt, callback)
    local btn = Instance.new("TextButton", container)
    btn.Size = UDim2.new(1, -10, 0, 45)
    btn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    btn.Text = txt
    btn.TextColor3 = theme.white
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 18
    Instance.new("UICorner", btn)
    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.BackgroundColor3 = active and theme.acc or Color3.fromRGB(40, 0, 0)
        callback(active)
    end)
end

-- FUNKTIONEN HINZUFÜGEN
addToggle("Fly & NoClip (Universal)", function(s) toggleFly(s) end)

addToggle("DDoS Attack Console", function(s) 
    ddosActive = s
    if s then startDDoS() end
end)

addToggle("Speed Boost (200)", function(s) 
    p.Character.Humanoid.WalkSpeed = s and 200 or 16
end)

addToggle("Infinite Jump", function(s) 
    u.JumpRequest:Connect(function() if s then p.Character.Humanoid:ChangeState("Jumping") end end)
end)

-- [[ 5. LOGIN SYSTEM ]] --
local kg = Instance.new("ScreenGui", game.CoreGui)
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 300, 0, 200)
km.Position = UDim2.new(0.5, -150, 0.5, -100)
km.BackgroundColor3 = theme.bg
Instance.new("UIStroke", km).Color = theme.acc

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 40)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Key hier..."
ki.Text = ""

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 40)
kb.Position = UDim2.new(0.1, 0, 0.6, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc
kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
    end
end)

-- F3 Toggle für PC
u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)

-- Mobile Button zum Öffnen (unten rechts)
local mobileOpen = Instance.new("TextButton", mg)
mobileOpen.Size = UDim2.new(0, 60, 0, 60)
mobileOpen.Position = UDim2.new(1, -70, 0.5, -30)
mobileOpen.Text = "MENU"
mobileOpen.BackgroundColor3 = theme.acc
mobileOpen.TextColor3 = theme.white
Instance.new("UICorner", mobileOpen)
mobileOpen.MouseButton1Click:Connect(function() mg.Enabled = not mg.Enabled end)
