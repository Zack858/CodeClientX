-- Reverse Time GUI with Rounded Corners and LOUD c00lk1d Sound (Delta-Compatible)

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

-- Create GUI
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "ReverseTimeGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 150, 0, 50)
frame.Position = UDim2.new(0, 30, 0, 130)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 12)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 10)
button.Text = "🔁 Reverse"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 14

local buttonCorner = Instance.new("UICorner", button)
buttonCorner.CornerRadius = UDim.new(0, 8)

-- LOUD Sound
local sound = Instance.new("Sound", game:GetService("Workspace")) -- use Workspace for guaranteed playback
sound.SoundId = "rbxassetid://1837635124"
sound.Volume = 10 -- max volume
sound.Name = "c00lk1dForsakenSound"
sound.Looped = false
sound.PlayOnRemove = false

-- Blur
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = game:GetService("Lighting")

-- Settings
local history = {}
local rewindDuration = 5
local interval = 0.05
local tweenSpeed = 0.03
local isRewinding = false

-- Get HumanoidRootPart
local function getHRP()
	local char = lp.Character or lp.CharacterAdded:Wait()
	local hrp = char:WaitForChild("HumanoidRootPart", 5)
	return hrp
end

-- Create Trail
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

-- Record loop
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

-- Rewind function
local function reverseTime()
	local hrp = getHRP()
	if not hrp then return end
	createTrail(hrp)
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
end

-- Button Click with sound restart fix
button.MouseButton1Click:Connect(function()
	if not isRewinding then
		sound:Stop()          -- stop sound if playing
		sound.TimePosition = 0 -- rewind to start
		sound:Play()          -- play fresh
		reverseTime()
	end
end)

-- Respawn handler
lp.CharacterAdded:Connect(function(char)
	task.wait(1)
	local hrp = char:WaitForChild("HumanoidRootPart", 5)
	if hrp then createTrail(hrp) end
end)