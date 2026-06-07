local VirtualInputManager = game:GetService("VirtualInputManager")
lplayer = game.Players.LocalPlayer
line = lplayer.PlayerGui.SkillCheckPromptGui.Check.Line
goal = lplayer.PlayerGui.SkillCheckPromptGui.Check.Goal
while true do
	if line.Rotation-105 >= goal.Rotation then
		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
	end
	task.wait(0.01)
end
