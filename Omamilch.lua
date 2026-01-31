-- [[ omamilch V5 - SERVER INTEL ]] --
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
    white = Color3.new(1, 1, 1)
}

-- Daten generieren
local sIP = "185.242."..math.random(10,255).."."..math.random(1,255)
local sPort = math.random(10000, 65000)

-- [[ SERVER INFO FUNKTION (CHAT: "server") ]] --
local function showServerPanel()
    if game.CoreGui:FindFirstChild("ServerIntel") then game.CoreGui.ServerIntel:Destroy() end
    
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = "ServerIntel"
    
    local f = Instance.new("Frame", sg)
    f.Size = UDim2.new(0, 500, 0, 400)
    f.Position = UDim2.new(0.5, -250, 0.5, -200)
    f.BackgroundColor3 = theme.bg
    f.BorderSizePixel = 2
    f.BorderColor3 = theme.acc
    
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 40)
    t.BackgroundColor3 = theme.acc
    t.Text = "SERVER DATEN & SPIELER LISTE"
    t.TextColor3 = theme.white
    t.Font = Enum.Font.SourceSansBold
    t.TextSize = 22
    
    local info = Instance.new("TextLabel", f)
    info.Size = UDim2.new(1, -20, 0, 60)
    info.Position = UDim2.new(0, 10, 0, 45)
    info.BackgroundTransparency = 1
    info.Text = "IP: " .. sIP .. "\nPORT: " .. sPort
    info.TextColor3 = theme.gold
    info.TextSize = 20
    info.Font = Enum.Font.SourceSansBold
    
    local sc = Instance.new("ScrollingFrame", f)
    sc.Size = UDim2.new(1, -20, 1, -120)
    sc.Position = UDim2.new(0, 10, 0, 110)
    sc.BackgroundTransparency = 1
    sc.ScrollBarThickness = 4
    local list = Instance.new("UIListLayout", sc)
    
    for _, player in pairs(game.Players:GetPlayers()) do
        local pl = Instance.new("TextLabel", sc)
        pl.Size = UDim2.new(1, 0, 0, 30)
        pl.BackgroundTransparency = 1
        pl.Text = "NAME: " .. player.Name .. " | ID: " .. player.UserId
        pl.TextColor3 = theme.white
        pl.TextSize = 16
        pl.Font = Enum.Font.SourceSans
        pl.TextXAlignment = Enum.TextXAlignment.Left
    end
    
    local close = Instance.new("TextButton", f)
    close.Size = UDim2.new(1, 0, 0, 30)
    close.Position = UDim2.new(0, 0, 1, -30)
    close.Text = "SCHLIESSEN"
    close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    close.TextColor3 = theme.white
    close.MouseButton1Click:Connect(function() sg:Destroy() end)
end

-- Chat Befehl Erkennung
p.Chatted:Connect(function(msg)
    if msg:lower() == "server" then
        showServerPanel()
    end
end)

-- [[ MAIN GUI ]] -- (Rest des Codes wie gehabt)
local mg = Instance.new("ScreenGui", game.CoreGui)
mg.Name = "omamilchV5_Final"
mg.Enabled = false

local main = Instance.new("Frame", mg)
main.Size = UDim2.new(0, 780, 0, 620)
main.Position = UDim2.new(0.5, -390, 0.5, -310)
main.BackgroundColor3 = theme.bg
Instance.new("UIStroke", main).Color = theme.acc

local tit = Instance.new("TextLabel", main)
tit.Size = UDim2.new(1, 0, 0, 70)
tit.BackgroundColor3 = theme.acc
tit.Text = "  OMAMILCH V5 - OWNER LOGIN"
tit.TextColor3 = theme.white
tit.TextSize = 30
tit.Font = Enum.Font.SourceSansBold

-- Key System (Eingekürzt zur Übersicht)
local kg = Instance.new("ScreenGui", game.CoreGui)
local km = Instance.new("Frame", kg)
km.Size = UDim2.new(0, 400, 0, 200)
km.Position = UDim2.new(0.5, -200, 0.5, -100)
km.BackgroundColor3 = theme.bg
local ki = Instance.new("TextBox", km)
ki.Size = UDim2.new(0.8, 0, 0, 50)
ki.Position = UDim2.new(0.1, 0, 0.3, 0)
ki.PlaceholderText = "Key: @@25g78D99##44"
local kb = Instance.new("TextButton", km)
kb.Size = UDim2.new(0.8, 0, 0, 50)
kb.Position = UDim2.new(0.1, 0, 0.6, 0)
kb.Text = "LOGIN"
kb.BackgroundColor3 = theme.acc

kb.MouseButton1Click:Connect(function()
    if ki.Text == "@@25g78D99##44" then
        kg:Destroy()
        mg.Enabled = true
        print("Willkommen HanfmomentV1")
    end
end)

u.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then mg.Enabled = not mg.Enabled end
end)
