local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local starterGui = game:GetService("StarterGui")

local theme = {
    bg = Color3.fromRGB(10, 10, 10),
    accent = Color3.fromRGB(150, 0, 255),
    gold = Color3.fromRGB(255, 215, 0)
}

for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Classic" or v.Name == "omamilch_Key" then v:Destroy() end
end

local function serverNotify(msg, col)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    local l = Instance.new("TextLabel", sg)
    l.Size = UDim2.new(1, 0, 0, 60)
    l.Position = UDim2.new(0, 0, 0.4, 0)
    l.Text = "!! " .. msg .. " !!"
    l.TextColor3 = col or theme.gold
    l.TextSize = 35
    l.Font = Enum.Font.SourceSansBold
    l.BackgroundTransparency = 1
    task.delay(3, function() sg:Destroy() end)
end

local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.Name = "omamilch_Key"
local kMain = Instance.new("Frame", keyGui)
kMain.Size = UDim2.new(0, 300, 0, 160)
kMain.Position = UDim2.new(0.5, -150, 0.5, -80)
kMain.BackgroundColor3 = theme.bg
kMain.BorderSizePixel = 2
kMain.BorderColor3 = theme.gold

local kInput = Instance.new("TextBox", kMain)
kInput.Size = UDim2.new(0.8, 0, 0, 40)
kInput.Position = UDim2.new(0.1, 0, 0.3, 0)
kInput.PlaceholderText = "Key: HanfmomentV1"
kInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
kInput.TextColor3 = Color3.new(1,1,1)

local kBtn = Instance.new("TextButton", kMain)
kBtn.Size = UDim2.new(0.8, 0, 0, 40)
kBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
kBtn.Text = "LOGIN"
kBtn.BackgroundColor3 = theme.gold

local mainGui = Instance.new("ScreenGui", game.CoreGui)
mainGui.Name = "omamilchV5_Classic"
mainGui.Enabled = false

local main = Instance.new("Frame", mainGui)
main.Size = UDim2.new(0, 580, 0, 430)
main.Position = UDim2.new(0.5, -290, 0.5, -215)
main.BackgroundColor3 = theme.bg
main.BorderColor3 = theme.accent
main.BorderSizePixel = 2
main.Active = true
main.Draggable = true

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = theme.accent
title.Text = "  [OWNER] omamilch V5 - HanfmomentV1"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Left

local container = Instance.new("Frame", main)
container.Size = UDim2.new(1, -10, 1, -60)
container.Position = UDim2.new(0, 5, 0, 55)
container.BackgroundTransparency = 1
Instance.new("UIListLayout", container).FillDirection = Enum.FillDirection.Horizontal

local function createCol(name)
    local f = Instance.new("ScrollingFrame", container)
    f.Size = UDim2.new(0.25, -5, 1, 0)
    f.BackgroundTransparency = 0.95
    f.ScrollBarThickness = 2
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 30)
    t.Text = name:upper()
    t.TextColor3 = theme.gold
    t.Font = Enum.Font.SourceSansBold
    return f
end

local colMove = createCol("Movement")
local colAdmin = createCol("Admin TP")
local colAbuse = createCol("Ban / Kick")
local colMisc = createCol("Misc")

pcall(function()
    TextChatService.OnIncomingMessage = function(m)
        local p = Instance.new("TextChatMessageProperties")
        if m.TextSource and m.TextSource.UserId == player.UserId then
            p.PrefixText = "<font color='#FF0000'>[OWNER]</font> " .. m.PrefixText
        end
        return p
    end
end)

local flying, noclip = false, false
local bv, bg
local function toggleFly()
    flying = not flying
    noclip = flying
    local root = player.Character.HumanoidRootPart
    if flying then
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local dir = Vector3.new(0,0,0)
                if userInput:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
                if userInput:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
                if userInput:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.RightVector end
                if userInput:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.RightVector end
                bv.Velocity = dir * 150
                bg.CFrame = cam
                runService.RenderStepped:Wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end

runService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

local function addBtn(txt, f, p, color)
    local b = Instance.new("TextButton", p)
    b.Size = UDim2.new(1, -5, 0, 35)
    b.BackgroundColor3 = color or Color3.fromRGB(30,30,30)
    b.Text = txt
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(f)
end

addBtn("Fly + NoClip", toggleFly, colMove)
addBtn("Speed 150", function() player.Character.Humanoid.WalkSpeed = 150 end, colMove)
addBtn("Reset Speed", function() player.Character.Humanoid.WalkSpeed = 16 end, colMove)

local function refresh()
    for _, v in pairs(colAdmin:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in pairs(colAbuse:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player then
            addBtn(p.DisplayName, function() player.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame end, colAdmin)
            addBtn("BAN "..p.Name, function() 
                serverNotify("ADMIN HANFMOMENTV1 BANNED "..p.Name, Color3.new(1,0,0))
                pcall(function() p:Destroy() end)
            end, colAbuse, Color3.fromRGB(150, 0, 0))
        end
    end
end
task.spawn(function() while task.wait(5) do refresh() end end)

addBtn("Auto-Report All", function()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= player then pcall(function() player:ReportAbuse(p, "Bullying", "omamilch Detection") end) end
    end
    serverNotify("AUTO-REPORT AKTIVIERT", theme.gold)
end, colMisc)

kBtn.MouseButton1Click:Connect(function()
    if kInput.Text == "HanfmomentV1" then
        keyGui:Destroy()
        mainGui.Enabled = true
        serverNotify("WILLKOMMEN HANFMOMENTV1", theme.gold)
    else
        kInput.Text = "FALSCH!"
    end
end)

userInput.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mainGui.Enabled = not mainGui.Enabled end
end)
