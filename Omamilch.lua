local p = game.Players.LocalPlayer
local u = game:GetService("UserInputService")
local r = game:GetService("RunService")
local t = game:GetService("TextChatService")
local s = game:GetService("StarterGui")

local theme = {bg = Color3.fromRGB(10,10,10), acc = Color3.fromRGB(150,0,255), gold = Color3.fromRGB(255,215,0)}

for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Classic" or v.Name == "omamilch_Key" then v:Destroy() end
end

local function notify(m, c)
    local g = Instance.new("ScreenGui", game.CoreGui)
    local l = Instance.new("TextLabel", g)
    l.Size = UDim2.new(1,0,0,60)
    l.Position = UDim2.new(0,0,0.4,0)
    l.Text = "!! " .. m .. " !!"
    l.TextColor3 = c or theme.gold
    l.TextSize = 35
    l.Font = Enum.Font.SourceSansBold
    l.BackgroundTransparency = 1
    task.delay(3, function() g:Destroy() end)
end

local kg = Instance.new("ScreenGui", game.CoreGui)
kg.Name = "omamilch_Key"
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0,300,0,160)
km.Position = UDim2.new(0.5,-150,0.5,-80)
km.BackgroundColor3 = theme.bg
km.BorderSizePixel = 2
km.BorderColor3 = theme.gold

local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8,0,0,40)
ki.Position = UDim2.new(0.1,0,0.3,0)
ki.PlaceholderText = "Key: HanfmomentV1"
ki.BackgroundColor3 = Color3.fromRGB(30,30,30)
ki.TextColor3 = Color3.new(1,1,1)

local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8,0,0,40)
kb.Position = UDim2.new(0.1,0,0.65,0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.gold

local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Classic"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0,580,0,430)
main.Position = UDim2.new(0.5,-290,0.5,-215)
main.BackgroundColor3 = theme.bg
main.BorderColor3 = theme.acc
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1,0,0,50)
tit.BackgroundColor3 = theme.acc
tit.Text = " [OWNER] omamilch V5 - HanfmomentV1"
tit.TextColor3 = Color3.new(1,1,1)
tit.Font = Enum.Font.SourceSansBold
tit.TextSize = 24
tit.TextXAlignment = Enum.TextXAlignment.Left

local cont = Instance.new("Frame", main)
cont.Size = UDim2.new(1,-10,1,-60)
cont.Position = UDim2.new(0,5,0,55)
cont.BackgroundTransparency = 1
Instance.new("UIListLayout", cont).FillDirection = Enum.FillDirection.Horizontal

local function col(n)
    local f = Instance.new("ScrollingFrame", cont)
    f.Size = UDim2.new(0.25,-5,1,0)
    f.BackgroundTransparency = 0.95
    f.ScrollBarThickness = 2
    Instance.new("UIListLayout", f).Padding = UDim.new(0,5)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1,0,0,30)
    t.Text = n:upper()
    t.TextColor3 = theme.gold
    t.Font = Enum.Font.SourceSansBold
    t.BackgroundTransparency = 1
    return f
end

local c1 = col("Move")
local c2 = col("TP")
local c3 = col("Ban")
local c4 = col("Misc")

pcall(function()
    t.OnIncomingMessage = function(m)
        local pr = Instance.new("TextChatMessageProperties")
        if m.TextSource and m.TextSource.UserId == p.UserId then
            pr.PrefixText = "<font color='#FF0000'>[OWNER]</font> " .. m.PrefixText
        end
        return pr
    end
end)

local fly, nocl = false, false
local bv, bg
local function tFly()
    fly = not fly
    nocl = fly
    local rtp = p.Character.HumanoidRootPart
    if fly then
        bv = Instance.new("BodyVelocity", rtp)
        bv.MaxForce = Vector3.new(1e6,1e6,1e6)
        bg = Instance.new("BodyGyro", rtp)
        bg.MaxTorque = Vector3.new(1e6,1e6,1e6)
        task.spawn(function()
            while fly do
                local c = workspace.CurrentCamera.CFrame
                local d = Vector3.new(0,0,0)
                if u:IsKeyDown(Enum.KeyCode.W) then d = d + c.LookVector end
                if u:IsKeyDown(Enum.KeyCode.S) then d = d - c.LookVector end
                bv.Velocity = d * 150
                bg.CFrame = c
                r.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

r.Stepped:Connect(function()
    if nocl and p.Character then
        for _, v in pairs(p.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

local function btn(t, f, pr, c)
    local b = Instance.new("TextButton", pr)
    b.Size = UDim2.new(1,-5,0,35)
    b.BackgroundColor3 = c or Color3.fromRGB(30,30,30)
    b.Text = t
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(f)
end

btn("Fly + NoClip", tFly, c1)
btn("Speed 150", function() p.Character.Humanoid.WalkSpeed = 150 end, c1)
btn("Speed Reset", function() p.Character.Humanoid.WalkSpeed = 16 end, c1)

local function ref()
    for _, v in pairs(c2:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(c3:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then
            btn(pl.Name, function() p.Character.HumanoidRootPart.CFrame = pl.Character.HumanoidRootPart.CFrame end, c2)
            btn("BAN "..pl.Name, function() 
                notify("ADMIN HANFMOMENTV1 BANNED "..pl.Name, Color3.new(1,0,0))
                pcall(function() pl:Destroy() end)
            end, c3, Color3.fromRGB(150,0,0))
        end
    end
end
task.spawn(function() while task.wait(5) do ref() end end)

btn("Auto-Report", function()
    for _, pl in pairs(game.Players:GetPlayers()) do
        if pl ~= p then pcall(function() p:ReportAbuse(pl, "Bullying", "omamilch") end) end
    end
    notify("REPORTS GESENDET")
end, c4)

kb.MouseButton1Click:Connect(function()
    if ki.Text == "HanfmomentV1" then
        kg:Destroy()
        mg.Enabled = true
        notify("WILLKOMMEN HANFMOMENTV1")
    else
        ki.Text = "ERROR"
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
