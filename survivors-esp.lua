while true do
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer then
			if workspace:FindFirstChild(player.Name) then
				if player.Team.Name == "Survivors" then
					if not workspace[player.Name]:FindFirstChild("Highlight") then
						h = Instance.new("Highlight")
						h.FillColor = player.TeamColor.Color
						h.OutlineColor = player.TeamColor.Color
						h.Parent = workspace[player.Name]
					end
				else
					if workspace[player.Name]:FindFirstChild("Highlight") then
						workspace[player.Name].Highlight:Destroy()
					end
				end
			end
		end
	end
	task.wait(1)
end
