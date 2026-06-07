sruvivors_esp = nil
while sruvivors_esp do
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
			if player.Team.Name == "Survivors" then
				if not workspace[player.Name]:FindFirstChild("SurvivorHighlight") then
					h = Instance.new("Highlight")
					h.Name = "SurvivorHighlight"
					h.FillColor = player.TeamColor.Color
					h.OutlineColor = player.TeamColor.Color
					h.Parent = workspace[player.Name]
				end
			else
				if workspace[player.Name]:FindFirstChild("SurvivorHighlight") then
					workspace[player.Name].SurvivorHighlight:Destroy()
				end
			end
		end
	end
	task.wait(1)
end
