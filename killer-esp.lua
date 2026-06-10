if _G.killer_esp == nil then
	_G.killer_esp = false
end
if _G.killer_esp then
	print("ESP Active")
end

while _G.killer_esp do
	for _, player in pairs(game.Players:GetPlayers()) do
		if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
			if player.Team.Name == "Killer" then
				if not workspace[player.Name]:FindFirstChild("KillerHighlight") then
					local h = Instance.new("Highlight")
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

for _, player in pairs(game.Players:GetPlayers()) do
	if player ~= game.Players.LocalPlayer and workspace:FindFirstChild(player.Name) then
		local highlight = workspace[player.Name]:FindFirstChild("KillerHighlight")
		if highlight then
			highlight:Destroy()
		end
	end
end
