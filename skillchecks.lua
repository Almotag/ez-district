local VirtualInputManager = game:GetService("VirtualInputManager")
local lplayer = game.Players.LocalPlayer

_G.skillchecks = nil

if _G.skillchecks == true do
	local gui = lplayer.PlayerGui:FindFirstChild("SkillCheckPromptGui")
	
	if gui then
		local line = gui.Check.Line
		local goal = gui.Check.Goal

		if line.Rotation - 105 >= goal.Rotation then
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
		end
	end
	print("SKILLCHECKS ACTIVE")
	task.wait(0.01)
end

print("Script fonctionnel")
