local Players = game.Players
		local player = game.Players.LocalPlayer
        local Loop
        local OldFlingPos = player.Character.HumanoidRootPart.Position
        local loopFunction = function()
            local success,err = pcall(function()
                if getgenv().FlingAll == true then
                    local FlingEnemy = Players:FindFirstChild(getgenv().FlingAllTarget).Character
                    if FlingEnemy and player.Character then
                        FlingTorso = FlingEnemy.UpperTorso
                        local dis = 3.85
                        local increase = 6
                        if FlingEnemy.Humanoid.MoveDirection.X < 0 then
                            xchange = -increase
                        elseif FlingEnemy.Humanoid.MoveDirection.X > 0  then
                            xchange = increase
                        else
                            xchange = 0
                        end
                        if FlingEnemy.Humanoid.MoveDirection.Z < 0 then
                            zchange = -increase
                        elseif FlingEnemy.Humanoid.MoveDirection.Z > 0 then
                            zchange = increase
                        else
                            zchange = 0
                        end          
                game.Workspace:FindFirstChildWhichIsA('Camera').CameraSubject = game.Players:FindFirstChild(getgenv().FlingAllTarget).Character.HumanoidRootPart	
                        if player.Character then
                            player.Character.Humanoid:ChangeState(11)
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(FlingTorso.Position.X + math.random(-dis,dis) + xchange, FlingTorso.Position.Y, FlingTorso.Position.Z + math.random(-dis,dis) + zchange) * CFrame.Angles(math.rad(player.Character.HumanoidRootPart.Orientation.X + 350),math.rad(player.Character.HumanoidRootPart.Orientation.Y + 200),math.rad(player.Character.HumanoidRootPart.Orientation.Z + 240))
                            player.Character.HumanoidRootPart.Velocity = Vector3.new(500000,500000,500000)
                        end
                    end
            end
            end)
            if err then
                print('fling error : ' .. err)
            end
        end;
        local Start = function()    
            getgenv().OldFlingPos = player.Character.HumanoidRootPart.Position
            getgenv().Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
        end;
        Start()	
