-- [[ omamilch V5 - TRIXO STYLE ]] --
-- OWNER: HanfmomentV1
-- KEY: HanfmomentV1

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local starterGui = game:GetService("StarterGui")
local teleportService = game:GetService("TeleportService")

-- Farbschema
local theme = {
    main = Color3.fromRGB(15, 15, 15),
    accent = Color3.fromRGB(150, 0, 255),
    danger = Color3.fromRGB(255, 0, 0),
    text = Color3.fromRGB(255, 255, 255)
}

-- Vorherige Instanzen säubern
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilch_V5_Final" then v:Destroy() end
end

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "omamilch_V5_Final"
screenGui.ResetOnSpawn = false

-- [[ FIX: CHAT TAG SAFETY ]] --
local function setupChat()
    pcall(function()
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            TextChatService.OnIncomingMessage = function(message)
                local props = Instance.new("TextChatMessageProperties")
                if message.TextSource and message.TextSource.UserId == player.UserId then
                    props.PrefixText = "<font color='#FF0000'><b>[OWNER]</b></font> " .. message.PrefixText
                end
                return props
            end
        end
    end)
end
setupChat()

-- [[ UI GENERATOR ]] --
local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 500, 0, 350)
main.Position = UDim2.new(0.5, -250, 0.5, -175)
main.BackgroundColor3 = theme.main
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Glow Effekt
local glow = Instance.new("Frame", main)
glow.Size = UDim2.new(1, 4, 1, 4)
glow.Position = UDim2.new(0, -2, 0, -2)
glow.BackgroundColor3 = theme.accent
glow.ZIndex = 0

local titleBar = Instance.new("TextLabel", main)
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = theme.accent
titleBar.Text = "  omamilch V5 | PREMIER ADMIN - OWNER: " .. player.Name
titleBar.TextColor3 = theme.text
titleBar.TextXAlignment = Enum.TextXAlignment.Left
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 18

-- Kategorien
local container = Instance.new("Frame", main)
container.Size = UDim2.new(1, -10, 1, -50)
container.Position = UDim2.new(0, 5, 0, 45)
container.BackgroundTransparency = 1

local list = Instance.new("UIListLayout", container)
list.FillDirection = Enum.FillDirection.Horizontal
list.Padding = UDim.new(0, 10)

local function createSection(name)
    local s = Instance.new("ScrollingFrame", container)
    s.Size = UDim2.new(0.31, 0, 1, 0)
    s.BackgroundTransparency = 0.9
    s.BackgroundColor3 = Color3.new(1,1,1)
    s.ScrollBarThickness = 2
    local l = Instance.new("UIListLayout", s)
    l.Padding = UDim.new(0, 5)
    
    local t = Instance.new("TextLabel", s)
    t.Size = UDim2.new(1, 0, 0, 25)
    t.Text = name:upper()
    t.TextColor3 = theme.accent
    t.Font = Enum.Font.GothamBold
    return s
end

local secMain = createSection("Movement")
local secAbuse = createSection("Abuse/Combat")
local secPlayer = createSection("Players")

-- [[ FUNKTIONEN ]] --

-- Ultra Fly
local flying = false
local noclip = false
local flySpeed = 100
local bv, bg

local function toggleFly()
    flying = not flying
    noclip = flying
    if flying then
        local root = player.Character.HumanoidRootPart
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        bg.P = 20000
        
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local dir = Vector3.new(0,0,0)
                if userInput:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.LookVector end
                if userInput:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.LookVector end
                if userInput:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.RightVector end
                if userInput:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.RightVector end
                
                bv.Velocity = dir * flySpeed
                bg.CFrame = cam
                runService.RenderStepped:Wait()
            end
        end)
    else
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end

-- NoClip Loop
runService.Stepped:Connect(function()
    if noclip and player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

-- Button Generator
local function addBtn(txt, f, parent)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -4, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = txt
    b.TextColor3 = theme.text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.MouseButton1Click:Connect(f)
end

-- --- MOVEMENT ---
addBtn("Advanced Fly", toggleFly, secMain)
addBtn("Speed (100)", function() player.Character.Humanoid.WalkSpeed = 100 end, secMain)
addBtn("Normal Speed", function() player.Character.Humanoid.WalkSpeed = 16 end, secMain)
addBtn("Infinite Jump", function()
    userInput.JumpRequest:Connect(function()
        player.Character.Humanoid:ChangeState("Jumping")
    end)
end, secMain)

-- --- ABUSE ---
addBtn("Emote: Bang", function()
    local a = Instance.new("Animation") a.AnimationId = "rbxassetid://148840339"
    player.Character.Humanoid:LoadAnimation(a):Play()
end, secAbuse)
addBtn("Kill Aura (Visual)", function()
    while task.wait(0.5) do
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character and (p.Character.Head.Position - player.Character.Head.Position).Magnitude < 20 then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = theme.danger
                task.wait(0.1)
                h:Destroy()
            end
        end
    end
end, secAbuse)

-- --- PLAYERS ---
addBtn("Server Hop", function()
    local x = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    for _, s in pairs(x.data) do
        if s.playing < s.maxPlayers then
            teleportService:TeleportToPlaceInstance(game.PlaceId, s.id)
        end
    end
end, secPlayer)
addBtn("Rejoin", function() teleportService:Teleport(game.PlaceId, player) end, secPlayer)

-- [[ F3 TOGGLE ]] --
userInput.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then
        main.Visible = not main.Visible
    end
end)

print("omamilch V5: Trixo Style Loaded for HanfmomentV1")
