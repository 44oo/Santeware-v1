getgenv().Noclip = true 
game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().Noclip == true then 

                local RunService = game:GetService('RunService')
                RunService.Heartbeat:Connect(function(step)
                    if getgenv().Noclip == true then
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    end
                end)
