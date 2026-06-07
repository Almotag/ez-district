while true do
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
			if player.Team.Name == "Killer" then
				if not workspace[player.Name]:FindFirstChild("KillerHighlight") then
					h = Instance.new("Highlight")
					h.Name = "KillerHighlight"
					h.FillColor = player.TeamColor.Color
					h.OutlineColor = player.TeamColor.Color
					h.Parent = workspace[player.Name]
				end
			else
				if workspace[player.Name]:FindFirstChild("KillerHighlight") then
					workspace[player.Name].KillerHighlight:Destroy()
				end
			end
		end
	end
	task.wait(1)
end
