if _G.gens_tp == nil then
    _G.gens_tp = false
end

while _G.gens_tp do
    local TweenService = game:GetService("TweenService")
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    
    local Player = Players.LocalPlayer
    local character = Player.Character or Player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local positions = {
        UDim2.new(0.5, -17, 0.5, -65),
        UDim2.new(0.5, 45, 0.5, 15),
        UDim2.new(0.5, -80, 0.5, 15)
    }
    
    local function getButtonPosition(index)
        return positions[index] or UDim2.new(0.5, -17, 0.5, -17)
    end
    
    local function simulateLeftClick()
        local camera = Workspace.CurrentCamera
        local viewport = camera.ViewportSize
        local x = viewport.X / 2
        local y = viewport.Y / 2
    
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)
    end
    
    local function createGeneratorMenu(generator)
        local generatorPoints = {}
    
        for _, child in ipairs(generator:GetChildren()) do
            if child:IsA("BasePart") and string.sub(child.Name, 1, 14) == "GeneratorPoint" then
                table.insert(generatorPoints, child)
            end
        end
    
        if #generatorPoints == 0 then
            return
        end
    
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "GeneratorMenu_" .. generator.Name
        billboard.Parent = Player:WaitForChild("PlayerGui")
        billboard:SetAttribute("GeneratorParent", generator.Name)
        billboard.Adornee = generator
        billboard.AlwaysOnTop = true
        billboard.Active = true
        billboard.Size = UDim2.fromOffset(200, 200)
        billboard.StudsOffset = Vector3.new(0, 4, 0)
    
        local mainButton = Instance.new("TextButton")
        mainButton.Parent = billboard
        mainButton.Size = UDim2.fromOffset(28, 28)
        mainButton.Position = UDim2.new(0.5, -14, 0.5, -14)
        mainButton.Text = ""
        mainButton.AutoButtonColor = true
        mainButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    
        local mainCorner = Instance.new("UICorner")
        mainCorner.CornerRadius = UDim.new(1, 0)
        mainCorner.Parent = mainButton
    
        local buttonEntries = {}
        for i, point in ipairs(generatorPoints) do
            local button = Instance.new("TextButton")
            button.Parent = billboard
            button.Size = UDim2.fromOffset(35, 35)
            button.Position = UDim2.new(0.5, -17, 0.5, -17)
            button.Text = tostring(i)
            button.Visible = false
            button.AutoButtonColor = true
            button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = button
    
            buttonEntries[i] = {
                button = button,
                cframe = point.CFrame,
                position = getButtonPosition(i)
            }
        end
    
        local opened = false
    
        local function openMenu()
            opened = true
            for _, entry in ipairs(buttonEntries) do
                entry.button.Visible = true
                TweenService:Create(entry.button, TweenInfo.new(0.2), {Position = entry.position}):Play()
            end
        end
    
        local function closeMenu()
            opened = false
            for _, entry in ipairs(buttonEntries) do
                local tween = TweenService:Create(entry.button, TweenInfo.new(0.2), {Position = UDim2.new(0.5, -17, 0.5, -17)})
                tween:Play()
                tween.Completed:Once(function()
                    if not opened then
                        entry.button.Visible = false
                    end
                end)
            end
        end
    
        local function teleportToPoint(pointCFrame)
            humanoidRootPart.CFrame = pointCFrame
            wait(0.2)
            simulateLeftClick()
        end
    
        mainButton.MouseButton1Click:Connect(function()
            if opened then
                closeMenu()
            else
                openMenu()
            end
        end)
    
        for _, entry in ipairs(buttonEntries) do
            entry.button.MouseButton1Click:Connect(function()
                teleportToPoint(entry.cframe)
                closeMenu()
            end)
        end
    end
    
    local generatorsFolder = Workspace.Map:FindFirstChild("Generators")
    if generatorsFolder then
        for _, generator in ipairs(generatorsFolder:GetChildren()) do
            createGeneratorMenu(generator)
        end
    else
        warn("generators folder not found in Workspace")
    end
    task.wait(1)
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local playerGui = Player and Player:FindFirstChild("PlayerGui")
if playerGui then
    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("BillboardGui") and string.sub(gui.Name, 1, 14) == "GeneratorMenu_" then
            gui:Destroy()
        end
    end
end
