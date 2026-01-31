-- [[ omamilch V5 - FINAL REPAIR ]] --
-- OWNER: HanfmomentV1

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local TextChatService = game:GetService("TextChatService")
local starterGui = game:GetService("StarterGui")

local theme = {
    bg = Color3.fromRGB(10, 10, 10),
    border = Color3.fromRGB(150, 0, 255),
    accent = Color3.fromRGB(255, 0, 0)
}

-- ALTE GUIs LÖSCHEN
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "omamilchV5_Ultimate" then v:Destroy() end
end

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "omamilchV5_Ultimate"
screenGui.ResetOnSpawn = false

-- --- FIX: CHAT TAG ERROR ---
pcall(function()
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.OnIncomingMessage = function(message)
            local props = Instance.new("TextChatMessageProperties")
            if message.TextSource and message.TextSource.UserId == player.UserId then
                props.PrefixText = "<font color='#FF0000'><b>[OWNER]</b></font> " .. message.PrefixText
            end
            return props -- WICHTIG: Muss immer zurückgegeben werden
        end
    end
end)

-- --- FENSTER GENERATOR ---
local function createFrame(name, titleText, size, pos)
    local f = Instance.new("Frame", screenGui)
    f.Name = name
    f.Size = size
    f.Position = pos
    f.BackgroundColor3 = theme.bg
    f.BorderSizePixel = 2
    f.BorderColor3 = theme.border
    f.Active = true
    f.Draggable = true

    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(1, 0, 0, 35)
    t.BackgroundColor3 = theme.border
    t.Text = titleText
    t.TextColor3 = Color3.new(1,1,1)
    t.Font = Enum.Font.SourceSansBold
    t.TextSize = 18
    
    local c = Instance.new("ScrollingFrame", f)
    c.Name = "Container"
    c.Size = UDim2.new(1, -10, 1, -45)
    c.Position = UDim2.new(0, 5, 0, 40)
    c.BackgroundTransparency = 1
    c.ScrollBarThickness = 2
    Instance.new("UIListLayout", c).Padding = UDim.new(0, 5)
    
    return f
end

-- --- GUIs ERSTELLEN ---
local main = createFrame("Main", "[OWNER] MAIN", UDim2.new(0, 200, 0, 300), UDim2.new(0.5, -310, 0.5, -150))
local speedFrame = createFrame("SpeedGUI", "SPEED SETTINGS", UDim2.new(0, 200, 0, 200), UDim2.new(0.5, -100, 0.5, -100))
speedFrame.Visible = false

-- --- FLY & NOCLIP LOGIK ---
local flying = false
local noclip = false
local flySpeed = 80
local bv, bg

local function toggleFly()
    flying = not flying
    noclip = flying -- NoClip geht mit Fly an/aus
    local char = player.Character or player.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    
    if flying then
        bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bg = Instance.new("BodyGyro", root)
        bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
        bg.P = 15000
        
        task.spawn(function()
            while flying do
                local cam = workspace.CurrentCamera.CFrame
                local dir = Vector3.new(0,0.1,0)
                if userInput:IsKeyDown(Enum.KeyCode.W) then dir = cam.LookVector
                elseif userInput:IsKeyDown(Enum.KeyCode.S) then dir = -cam.LookVector end
                bv.Velocity = (dir.Magnitude > 0.1) and (dir * flySpeed) or Vector3.new(0,0,0)
                bg.CFrame = cam
                task.wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
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

-- --- SPEED SETTINGS ---
local speedVal = Instance.new("TextBox", speedFrame.Container)
speedVal.Size = UDim2.new(1, 0, 0, 35)
speedVal.PlaceholderText = "Zahl eingeben..."
speedVal.Text = "16"
speedVal.BackgroundColor3 = Color3.fromRGB(30,30,30)
speedVal.TextColor3 = Color3.new(1,1,1)

local applySpeed = Instance.new("TextButton", speedFrame.Container)
applySpeed.Size = UDim2.new(1, 0, 0, 35)
applySpeed.Text = "SPEED ÜBERNEHMEN"
applySpeed.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
applySpeed.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = tonumber(speedVal.Text) or 16
end)

local resetSpeed = Instance.new("TextButton", speedFrame.Container)
resetSpeed.Size = UDim2.new(1, 0, 0, 35)
resetSpeed.Text = "STOP / RESET (16)"
resetSpeed.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
resetSpeed.MouseButton1Click:Connect(function()
    player.Character.Humanoid.WalkSpeed = 16
    speedVal.Text = "16"
end)

-- --- MAIN BUTTONS ---
local function addBtn(txt, f, parent)
    local b = Instance.new("TextButton", parent or main.Container)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.Text = txt
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)
    b.MouseButton1Click:Connect(f)
end

addBtn("FLY + NOCLIP", toggleFly)
addBtn("SPEED MENÜ", function() speedFrame.Visible = not speedFrame.Visible end)
addBtn("EMOTE: BANG (Fixed)", function()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://148840339"
    local load = player.Character.Humanoid:LoadAnimation(anim)
    load:Play()
    load:AdjustSpeed(4)
end)

-- --- FIX: F3 ZUM ÖFFNEN ---
userInput.InputBegan:Connect(function(i, g)
    if not g and i.KeyCode == Enum.KeyCode.F3 then
        main.Visible = not main.Visible
        if not main.Visible then 
            speedFrame.Visible = false 
        end
    end
end)

starterGui:SetCore("ChatMakeSystemMessage", {Text = "[omamilch V5] Fixes geladen. F3 zum Ein/Ausblenden.", Color = theme.border})
