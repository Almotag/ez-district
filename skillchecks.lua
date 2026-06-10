local VirtualInputManager = game:GetService("VirtualInputManager")
local lplayer = game.Players.LocalPlayer

if _G.skillchecks == nil then
	_G.skillchecks = false
end

if _G.skillchecks then
    print("SKILLCHECKS ACTIVE")
end

while _G.skillchecks do
	local gui = lplayer.PlayerGui:FindFirstChild("SkillCheckPromptGui")
	
	if gui then
		local line = gui.Check.Line
		local goal = gui.Check.Goal

		if line.Rotation - 105 >= goal.Rotation then
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
		end
	end
	task.wait(0.1)
end
