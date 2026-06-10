if _G.survivors_esp == nil then
	_G.survivors_esp = false
end

while _G.survivors_esp do
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
			if player.Team.Name == "Survivors" then
				if not workspace[player.Name]:FindFirstChild("SurvivorHighlight") then
					local h = Instance.new("Highlight")
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

for _, player in pairs(game.Players:GetPlayers()) do
	if workspace:FindFirstChild(player.Name) then
		local highlight = workspace[player.Name].SurvivorHighlight
		if highlight then
			highlight:Destroy()
		end
	end
end
