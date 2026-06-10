local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local currentState = 1

if _G.mouse_behavior == nil then
    _G.mouse_behavior = false
end

local function isSurvivor()
    local team = player.Team
    return team and team.Name == "Survivors"
end

local function applyState(state)
    if state == 1 then
        UserInputService.MouseIconEnabled = true
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    else
        UserInputService.MouseIconEnabled = false
        UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
    currentState = state
end

local function toggleState()
    if not isSurvivor() then
        return
    end

    if currentState == 1 then
        applyState(2)
    else
        applyState(1)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end

    if input.KeyCode == Enum.KeyCode.RightShift and _G.mouse_behavior then
        toggleState()
    end
end)

if _G.mouse_behavior and isSurvivor() then
    applyState(currentState)
end
