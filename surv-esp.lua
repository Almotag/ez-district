if _G.survivors_esp == nil then
	_G.survivors_esp = false
end
if _G.survivors_esp then
	print("ESP Active")
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
