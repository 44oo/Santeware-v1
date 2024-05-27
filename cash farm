getgenv().CashFarm = false
for c,p in pairs(Workspace:GetDescendants()) do
  if p:IsA("Seat") then
    p:Destroy()
  end
end
local Cashiers = game.Workspace.Cashiers
function checkTool(tool)
    for _,item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if item.Name == tool then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            local Humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
            Humanoid:EquipTool(item)
        end
    end
end
function find(path, child)
    _G.Found = nil
    if path:FindFirstChild(child) then
        _G.Found = true
    else
        _G.Found = false
    end
end
function findCash(cashier, radius)
    for _,x in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
        if x.Name == "MoneyDrop" then
            if (cashier.Head.Position - x.Position).Magnitude < radius then
                local FinalProduct = (cashier.Head.Position - x.Position).Magnitude
                x.Name = "CashDrop"
            else
                x.Name = "e"
            end
        else
            x.Name = "e"
        end
    end
end
function grabCash()
    repeat wait()
        find(game.Workspace.Ignored.Drop, "CashDrop")
        if _G.Found == true then
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(game.Workspace.Ignored.Drop:FindFirstChild("CashDrop").Position)
            if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position.Y < 12 then
                game.Workspace.Ignored.Drop:FindFirstChild("CashDrop"):Destroy()
            end
            wait(.2)
            if game.Workspace.Ignored.Drop:FindFirstChild("CashDrop") then
                if _G.LastPickupPos == Vector3.new(0,0,0) then
                    _G.LastPickupPos = game.Workspace.Ignored.Drop:FindFirstChild("CashDrop").Position
                    fireclickdetector(game.Workspace.Ignored.Drop:FindFirstChild("CashDrop").ClickDetector)
                else
                    if (_G.LastPickupPos - game.Workspace.Ignored.Drop:FindFirstChild("CashDrop").Position).magnitude < 25 then
                        _G.LastPickupPos = game.Workspace.Ignored.Drop:FindFirstChild("CashDrop").Position
                        fireclickdetector(game.Workspace.Ignored.Drop:FindFirstChild("CashDrop").ClickDetector)
                    else
                        break;
                    end
                end
            else
                -- do nothing
            end
        else
            break;
        end
    until _G.NeverDone == true
end
function Charge()
    local MainEvent = game.ReplicatedStorage:WaitForChild("MainEvent")
    MainEvent:FireServer("ChargeButton")
end
function SitCheck()
    local Character = game.Players.LocalPlayer.Character
    local Humanoid = Character:WaitForChild("Humanoid")
    if Humanoid.Sit == true then
        Character:MoveTo(Vector3.new(100,100,100))
        Humanoid.Sit = false
    else
        --do nothing
    end
end

while wait() do
    if getgenv().CashFarm == true then
        checkTool("Combat")
        for _,v in pairs(Cashiers:GetChildren()) do
            if getgenv().CashFarm == false then
                break;
            end
            local CurrentATM = v
            if v.Humanoid.Health > 0 and v.Open.CFrame ~= CFrame.new(-624.59845, 22.8500214, -286.658203, -1, 0, 0, 0, 1, 0, 0, 0, -1) then
                checkTool("Combat")
                repeat
                    if getgenv().CashFarm == true then
                        checkTool("Combat")
                        wait()
                        Charge()
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.Open.CFrame
                    elseif getgenv().CashFarm == false then
                        wait()
                        break;
                    end
                until v.Humanoid.Health <= 0
                _G.LastPickupPos = game.Players.LocalPlayer.Character.Head.Position
                wait(2.4)
                findCash(CurrentATM, 20)
                wait(.2)
                grabCash()
            else
                wait()
            end
        end
    end
end
