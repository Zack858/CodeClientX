-- Mobile Fly GUI with Speed Input, Clean Design, and Toggle Button

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local flying = false
local speedMultiplier = 1
local speed = 100
local bv, bg

local screenGui = Instance.new("ScreenGui", game.CoreGui)
screenGui.Name = "FlyUI"
screenGui.ResetOnSpawn = false

local flyFrame = Instance.new("Frame", screenGui)
flyFrame.Size = UDim2.new(0, 420, 0, 110)
flyFrame.Position = UDim2.new(1, -440, 1, -130)
flyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
flyFrame.Active = true
flyFrame.Draggable = true
flyFrame.ZIndex = 2
Instance.new("UICorner", flyFrame).CornerRadius = UDim.new(0,12)

local stroke = Instance.new("UIStroke", flyFrame)
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Thickness = 2

local glow = Instance.new("UIGradient", flyFrame)
glow.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 100))
}
glow.Rotation = 90

local flyBtn = Instance.new("TextButton", flyFrame)
flyBtn.Size = UDim2.new(1, -20, 0, 36)
flyBtn.Position = UDim2.new(0, 10, 0, 8)
flyBtn.Text = "Fly: OFF"
flyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 20
flyBtn.ZIndex = 2
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,8)

-- Speed input
local speedBox = Instance.new("TextBox", flyFrame)
speedBox.Size = UDim2.new(0, 80, 0, 30)
speedBox.Position = UDim2.new(0, 10, 0, 54)
speedBox.PlaceholderText = "Speed"
speedBox.Text = "1"
speedBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
speedBox.TextColor3 = Color3.new(0,0,0)
speedBox.Font = Enum.Font.Gotham
speedBox.TextSize = 18
speedBox.ClearTextOnFocus = false
Instance.new("UICorner", speedBox).CornerRadius = UDim.new(0,6)

local speedLabel = Instance.new("TextLabel", flyFrame)
speedLabel.Size = UDim2.new(0, 280, 0, 30)
speedLabel.Position = UDim2.new(0, 100, 0, 54)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed (x100 studs/sec)"
speedLabel.TextColor3 = Color3.new(1,1,1)
speedLabel.Font = Enum.Font.GothamBold
speedLabel.TextSize = 16
speedLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Credits
local creditLabel = Instance.new("TextLabel", flyFrame)
creditLabel.Size = UDim2.new(1,0,0,20)
creditLabel.Position = UDim2.new(0,0,0,88)
creditLabel.Text = "Credits: Zack858"
creditLabel.Font = Enum.Font.GothamBold
creditLabel.TextSize = 14
creditLabel.BackgroundTransparency = 1
creditLabel.TextColor3 = Color3.new(1,1,1)
creditLabel.ZIndex = 2
local UIGradient = Instance.new("UIGradient", creditLabel)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,255))
}

-- Toggle Button (X)
local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(1, -50, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleBtn.Text = "X"
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 20
toggleBtn.ZIndex = 3
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1,0)
toggleBtn.MouseButton1Click:Connect(function()
    flyFrame.Visible = not flyFrame.Visible
end)

-- Speed input validation
speedBox:GetPropertyChangedSignal("Text"):Connect(function()
    local num = speedBox.Text:gsub("%D", "")
    speedBox.Text = num
    if tonumber(num) then
        speedMultiplier = tonumber(num)
        speed = 100 * speedMultiplier
    end
end)

-- Fly logic
local function startFly()
    if flying then return end
    flying = true
    flyBtn.Text = "Fly: ON"
    local colorTween = TweenService:Create(flyBtn, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(0, 200, 50)})
    colorTween:Play()
    bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e9,1e9,1e9)
    bv.P = 1250
    bg = Instance.new("BodyGyro", hrp)
    bg.MaxTorque = Vector3.new(1e9,1e9,1e9)
    bg.P = 3000
    coroutine.wrap(function()
        while flying and bv and bg do
            local cam = workspace.CurrentCamera
            local dir = cam.CFrame.LookVector
            bg.CFrame = CFrame.new(hrp.Position, hrp.Position + dir)
            local move = Vector3.zero
            if UIS:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then move += cam.CFrame.UpVector end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move -= cam.CFrame.UpVector end
            bv.Velocity = (move.Magnitude > 0 and move.Unit * speed or Vector3.zero)
            RunService.Heartbeat:Wait()
        end
    end)()
end

local function stopFly()
    flying = false
    flyBtn.Text = "Fly: OFF"
    local colorTween = TweenService:Create(flyBtn, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(0, 140, 255)})
    colorTween:Play()
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
end

flyBtn.MouseButton1Click:Connect(function()
    if flying then stopFly() else startFly() end
end)
