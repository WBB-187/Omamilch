-- [[ omamilch V5 - ADVANCED FLY UPDATE ]] --
-- Verbessertes Flug-System für HanfmomentV1

local player = game.Players.LocalPlayer
local userInput = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Flug-Variablen
local flying = false
local speed = 100 -- Standardgeschwindigkeit
local bv, bg -- Physik-Objekte

local function stopFlying()
    flying = false
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.PlatformStand = false
    end
end

local function startFlying()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    
    flying = true
    local root = player.Character.HumanoidRootPart
    local hum = player.Character.Humanoid
    hum.PlatformStand = true -- Verhindert, dass der Charakter "läuft" während er fliegt

    -- Erstelle die Physik-Kräfte für stabiles Fliegen
    bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
    bv.Velocity = Vector3.new(0, 0, 0)
    bv.Parent = root

    bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(1e6, 1e6, 1e6)
    bg.P = 15000 -- Sanfte Drehung
    bg.D = 500   -- Dämpfung für weniger Wackeln
    bg.CFrame = root.CFrame
    bg.Parent = root

    -- Der Flug-Loop
    task.spawn(function()
        while flying do
            local camera = workspace.CurrentCamera
            local direction = Vector3.new(0, 0, 0)
            
            -- Tastatur-Abfrage für Bewegung
            if userInput:IsKeyDown(Enum.KeyCode.W) then
                direction = direction + camera.CFrame.LookVector
            end
            if userInput:IsKeyDown(Enum.KeyCode.S) then
                direction = direction - camera.CFrame.LookVector
            end
            if userInput:IsKeyDown(Enum.KeyCode.A) then
                direction = direction - camera.CFrame.RightVector
            end
            if userInput:IsKeyDown(Enum.KeyCode.D) then
                direction = direction + camera.CFrame.RightVector
            end
            if userInput:IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if userInput:IsKeyDown(Enum.KeyCode.LeftControl) then
                direction = direction - Vector3.new(0, 1, 0)
            end

            -- Geschwindigkeit anwenden (Gleiteffekt)
            if direction.Magnitude > 0 then
                bv.Velocity = direction.Unit * speed
            else
                bv.Velocity = Vector3.new(0, 0.1, 0) -- Minimaler Auftrieb gegen Gravitation
            end

            -- Charakter zur Kamera ausrichten
            bg.CFrame = camera.CFrame
            
            runService.RenderStepped:Wait()
        end
    end)
end

-- Toggle Funktion für deinen Fly-Button
local function toggleFly()
    if flying then
        stopFlying()
        print("Fly Deaktiviert")
    else
        startFlying()
        print("Fly Aktiviert")
    end
end

-- Beispiel: Integration in dein Menü-System
-- addBtn("Advanced Fly", toggleFly)
