local Workspace = game:GetService("Workspace")
local map = Workspace:WaitForChild("Map")
local generatorsFolder = map:FindFirstChild("new Generators") or map:FindFirstChild("Generator") or map:FindFirstChild("Generators")

if _G.gens_esp == nil then
    _G.gens_esp = false
end

while _G.gens_esp do
    for _, generator in ipairs(generatorsFolder:GetChildren()) do
        if generator:IsA("Model") or generator:IsA("BasePart") then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = generator
            highlight.FillColor = Color3.fromRGB(255, 255, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
            highlight.FillTransparency = 0.6
            highlight.OutlineTransparency = 0.2
            highlight.Parent = Workspace
        end
    end
    task.wait(1)
end
