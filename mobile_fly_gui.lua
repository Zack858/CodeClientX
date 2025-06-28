-- Mobile-Compatible Fly Script with Blue GUI

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- Player & Character Setup
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- Variables
local flying = false
local speed = 50
local bv, bg

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "FlyGUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 140, 0, 50)
frame.Position = UDim2.new(1, -160, 1, -110)
frame.BackgroundColor3 = Color3.fromRGB(0, 102, 255)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 1, 0)
button.Text = "Fly: OFF"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundTransparency = 1
button.Font = Enum.Font.GothamBold
button.TextSize = 20
button.Parent = frame

-- Fly Functions
local function startFly()
	if flying then return end
	flying = true
	button.Text = "Fly: ON"

	bv = Instance.new("BodyVelocity")
	bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
	bv.P = 1250
	bv.Parent = hrp

	bg = Instance.new("BodyGyro")
	bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
	bg.P = 3000
	bg.CFrame = hrp.CFrame
	bg.Parent = hrp

	coroutine.wrap(function()
		while flying and bv and bg do
			local cam = workspace.CurrentCamera
			local move = Vector3.zero

			-- Mobile Movement via virtual joystick
			if UIS:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
			if UIS:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
			if UIS:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
			if UIS:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
			if UIS:IsKeyDown(Enum.KeyCode.Space) then move += cam.CFrame.UpVector end
			if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move -= cam.CFrame.UpVector end

			bv.Velocity = move.Magnitude > 0 and move.Unit * speed or Vector3.zero
			bg.CFrame = cam.CFrame

			RunService.Heartbeat:Wait()
		end
	end)()
end

local function stopFly()
	flying = false
	button.Text = "Fly: OFF"
	if bv then bv:Destroy() end
	if bg then bg:Destroy() end
end

-- Touch Button Handler
button.MouseButton1Click:Connect(function()
	if flying then
		stopFly()
	else
		startFly()
	end
end)
