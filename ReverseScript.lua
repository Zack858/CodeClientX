-- Reverse Time GUI with Shadow Clone, Trail, Blur, and Forsaken Sound

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local Lighting = game:GetService("Lighting")
local lp = Players.LocalPlayer

-- GUI setup
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "ReverseTimeGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 150, 0, 50)
frame.Position = UDim2.new(0, 30, 0, 130)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "🔁 Reverse"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 14

Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

-- Sound setup
local sound = Instance.new("Sound", workspace)
sound.SoundId = "rbxassetid://1837635124" -- Forsaken sound
sound.Volume = 10
sound.Name = "c00lk1dForsakenSound"
sound.Looped = false
sound.PlayOnRemove = false

-- Blur setup
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting

-- Rewind settings
local history = {}
local rewindDuration = 5
local interval = 0.05
local tweenSpeed = 0.03
local isRewinding = false

-- Get HumanoidRootPart
local function getHRP()
	local char = lp.Character or lp.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart", 5)
end

-- Trail visual
local function createTrail(hrp)
	if hrp:FindFirstChild("Trail") then return end
	local a0 = Instance.new("Attachment", hrp)
	local a1 = Instance.new("Attachment", hrp)
	local trail = Instance.new("Trail", hrp)
	trail.Attachment0 = a0
	trail.Attachment1 = a1
	trail.Color = ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(0,255,255))
	trail.Lifetime = 0.3
	trail.MinLength = 0.1
	trail.Enabled = false
end

-- Auto record position history
task.spawn(function()
	while true do
		local hrp = getHRP()
		if hrp and not isRewinding then
			table.insert(history, 1, {cf = hrp.CFrame})
			while #history > (rewindDuration / interval) do
				table.remove(history)
			end
		end
		task.wait(interval)
	end
end)

-- Shadow clone effect
local function spawnShadow()
	local clone = lp.Character:Clone()
	for _, part in ipairs(clone:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 0.5
		elseif part:IsA("Decal") then
			part.Transparency = 1
		elseif part:IsA("Trail") or part:IsA("ParticleEmitter") then
			part.Enabled = false
		end
	end
	clone.Name = "ShadowClone"
	clone.Parent = workspace
	Debris:AddItem(clone, 3) -- auto-delete
end

-- Reverse logic
local function reverseTime()
	local hrp = getHRP()
	if not hrp then return end

	createTrail(hrp)
	spawnShadow() -- Add shadow here

	local trail = hrp:FindFirstChildOfClass("Trail")
	if trail then trail.Enabled = true end

	blur.Size = 20
	isRewinding = true

	local copy = {}
	for _, v in ipairs(history) do
		table.insert(copy, v)
	end

	for i = 1, #copy do
		if not hrp:IsDescendantOf(game) then break end
		local tween = TweenService:Create(hrp, TweenInfo.new(tweenSpeed, Enum.EasingStyle.Quad), {CFrame = copy[i].cf})
		tween:Play()
		tween.Completed:Wait()
	end

	if trail then trail.Enabled = false end
	blur.Size = 0
	isRewinding = false

	history = {} -- Clear after rewind
end

-- Button click
button.MouseButton1Click:Connect(function()
	if not isRewinding then
		sound:Stop()
		sound.TimePosition = 0
		sound:Play()
		reverseTime()
	end
end)

-- Reapply trail on respawn
lp.CharacterAdded:Connect(function(char)
	task.wait(1)
	local hrp = char:WaitForChild("HumanoidRootPart", 5)
	if hrp then createTrail(hrp) end
end)