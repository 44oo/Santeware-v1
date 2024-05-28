  ["Eating"] = false,
    ["OldBuyPosition"] = nil,
    ["OldPosition"] = nil,
    ["ReturningHealth"] = 90,
    ["StartHealth"] = 80,
    ["Running"] = false
}

if game.Workspace:FindFirstChild("FoodPlate") then
    wait()
else
    FoodPlat = Instance.new("Part", game.Workspace)
    FoodPlat.Name = "FoodPlate"
    FoodPlat.Position = Vector3.new(0,-103,0)
    FoodPlat.Anchored = true
    FoodPlat.Size = Vector3.new(30,0.5,30)
end
function toPlate()
    pcall(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.FoodPlate.CFrame
    end)
end

function BuyChicken()
    pcall(function()
        local ChickenModel = game:GetService("Workspace").Ignored.Shop["[Chicken] - $7"]
        getgenv().Eat.OldBuyPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ChickenModel.Head.CFrame
        wait(0.3)
        fireclickdetector(ChickenModel.ClickDetector)
    end)
end
_G.ExecutedAutoeat = false
local Player = game.Players.LocalPlayer
local FoodTable = {
    "[Chicken]",
    "[Pizza]",
    "[Taco]",
    "[Hamburger]",
    "[Donut]"
}
Player.Character.Humanoid:GetPropertyChangedSignal("Health"):connect(function()
    if Player.Character.Humanoid.Health < getgenv().Eat.StartHealth then
        if getgenv().AutoEatToggle == true and Player.Character ~= nil then
            if getgenv().Eat.Running == false then
                getgenv().Eat.OldPosition = Player.Character.HumanoidRootPart.CFrame
                pcall(function()
                    repeat wait()
                        if not Player.Character:FindFirstChild("Humanoid") then
                            break;
                        end
                        getgenv().Eat.Running = true
                        if Player.Backpack:FindFirstChild("[Chicken]") then
                            toPlate()
                            Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("[Chicken]"))
                            wait(0.3)
                            if Player.Character and Player.Character:FindFirstChild("[Chicken]") then
                                Player.Character:FindFirstChild("[Chicken]"):Activate()
                            end
                            wait()
                        else
                            BuyChicken()
                            wait(0.3)
                            if Player.Backpack:FindFirstChild("[Chicken]") then
                                toPlate()
                                Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("[Chicken]"))
                                wait(0.1)
                                if Player.Character and Player.Character:FindFirstChild("[Chicken]") then
                                    Player.Character:FindFirstChild("[Chicken]"):Activate()
                                end
                                wait()
                            end
                        end
                    until Player.Character:WaitForChild("Humanoid").Health > getgenv().Eat.ReturningHealth or Player.Character == nil
                    getgenv().Eat.Running = false
                    if getgenv().Eat.OldPosition ~= "f" then
                        if not Player:FindFirstChild("JustAdded") then
                            Player.Character.HumanoidRootPart.CFrame = getgenv().Eat.OldPosition
                        end
                    end
                    getgenv().Eat.OldPosition = "f"
                    wait()
                end)
            end
        end
    end
end)
Player.CharacterAdded:connect(function()
    if getgenv().AutoEatToggle == true then
        Player.Character:WaitForChild("Humanoid")
        Player.Character:WaitForChild("UpperTorso")
        Player.Character:WaitForChild("Head")
        getgenv().Eat.OldPosition = "f"
        Player.Character.Humanoid:GetPropertyChangedSignal("Health"):connect(function()
            if getgenv().AutoEatToggle == true then
                if Player.Character.Humanoid.Health < getgenv().Eat.StartHealth then
                    if getgenv().AutoEatToggle == true and Player.Character ~= nil then
                        if getgenv().Eat.Running == false then
                            if getgenv().AutoEatToggle == true then
                                getgenv().Eat.OldPosition = Player.Character.HumanoidRootPart.CFrame
                                repeat wait()
                                    if not Player.Character:FindFirstChild("Humanoid") then
                                        break;
                                    end
                                    if getgenv().AutoEatToggle == false then
                                        getgenv().Eat.OldPosition = "f"
                                        break;
                                    end
                                    getgenv().Eat.Running = true
                                    if Player.Backpack:FindFirstChild("[Chicken]") then
                                        toPlate()
                                        Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("[Chicken]"))
                                        wait(0.3)
                                        if Player.Character and Player.Character:FindFirstChild("[Chicken]") then
                                            Player.Character:FindFirstChild("[Chicken]"):Activate()
                                        end
                                        wait()
                                    else
                                        BuyChicken()
                                        wait(0.3)
                                        if Player.Backpack:FindFirstChild("[Chicken]") then
                                            toPlate()
                                            Player.Character.Humanoid:EquipTool(Player.Backpack:FindFirstChild("[Chicken]"))
                                            wait(0.1)
                                            if Player.Character and Player.Character:FindFirstChild("[Chicken]") then
                                                Player.Character:FindFirstChild("[Chicken]"):Activate()
                                            end
                                            wait()
                                        end
                                    end
                                until Player.Character:WaitForChild("Humanoid").Health > getgenv().Eat.ReturningHealth or Player.Character == nil
                            end
                            getgenv().Eat.Running = false
                            if getgenv().Eat.OldPosition ~= "f" then
                                if not Player:FindFirstChild("JustAdded") then
                                    Player.Character.HumanoidRootPart.CFrame = getgenv().Eat.OldPosition
                                end
                            end
                            getgenv().Eat.OldPosition = "f"
                            wait()
                        end
                    end
                end
            end
        end)
    end
end)
