local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local Plr
local Enabled = true
local Prediction = 0.1398
local AimPart = "UpperTorso"
local bubble = Instance.new("Part", game.Workspace)
bubble.Name = "SilentAimBubble"
bubble.Size = Vector3.new(7,7,7)
bubble.Color = getgenv().Color
bubble.Material = "ForceField"
bubble.Transparency = .3
bubble.CanCollide = false
bubble.Shape = "Ball"
local Tool = Instance.new("Tool")
Tool.RequiresHandle = false
Tool.Name = "AgentToolLock"
Tool.TextureId = "http://www.roblox.com/asset/?id=12747011665"
function FindClosestPlayer()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
            v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end
function HighlightPlayer(t)
    for i, v in pairs(t:GetChildren()) do
        if v:IsA("BasePart") then
            local h = Instance.new("Highlight", v)
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Name = "Glow"
        end
    end
end
Tool.Activated:Connect(function()
    if Enabled == true then
        Enabled = false
        for i, v in pairs(game.Players[TargetPlayer].Character:GetChildren()) do
            if v:IsA("BasePart") then
                local item = v:FindFirstChild('Glow')
                if item then 
                    item:Destroy() 
                end
            end
        end
        Plr = FindClosestPlayer()
        TargetPlayer = tostring(Plr)
        AGENTUI:Noti("Unlocked!")
    else
        Plr = FindClosestPlayer()
        TargetPlayer = tostring(Plr)
        Enabled = true
        Plr = FindClosestPlayer()
        TargetPlayer = tostring(Plr)
        AGENTUI:Noti("Locking On : "..tostring(TargetPlayer))
        HighlightPlayer(game.Players[tostring(TargetPlayer)].Character)
    end
end)
game:GetService("RunService").Stepped:Connect(function()
    pcall(function()
        if Enabled == true then
            bubble.Position = game.Players[TargetPlayer].Character.HumanoidRootPart.Position
        else
            bubble.CFrame = CFrame.new(0, -9999, 0)
        end
        bubble.Color = getgenv().Color
    end)
end)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = { ... }

    if Enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = game.Players[TargetPlayer].Character[AimPart].Position +

            (game.Players[TargetPlayer].Character[AimPart].Velocity * Prediction)

        return old(unpack(args))
    end
    return old(...)
end)

Tool.Parent = game.Players.LocalPlayer.Backpack
