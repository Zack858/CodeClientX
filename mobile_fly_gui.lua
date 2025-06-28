
-- Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
screenGui.Name = "FlyGUI"
local flyFrame = Instance.new("Frame", screenGui)
flyFrame.Size = UDim2.new(0, 210, 0, 130)
flyFrame.Position = UDim2.new(1, -230, 1, -150)
flyFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
flyFrame.BorderSizePixel = 0

local uiStroke = Instance.new("UIStroke", flyFrame)
uiStroke.Color = Color3.fromRGB(255, 0, 0)
uiStroke.Thickness = 2

local toggleBtn = Instance.new("TextButton", screenGui)
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(1, -50, 0, 20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleBtn.Text = ""
toggleBtn.ZIndex = 3
toggleBtn.Draggable = true

local toggleIcon = Instance.new("ImageLabel", toggleBtn)
toggleIcon.Size = UDim2.new(1, 0, 1, 0)
toggleIcon.BackgroundTransparency = 1
toggleIcon.Image = "rbxassetid://16758323333"

toggleBtn.MouseButton1Click:Connect(function()
    flyFrame.Visible = not flyFrame.Visible
end)

local flyBtn = Instance.new("TextButton", flyFrame)
flyBtn.Size = UDim2.new(1, -20, 0, 36)
flyBtn.Position = UDim2.new(0, 10, 0, 10)
flyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
flyBtn.Text = "Fly: OFF"
flyBtn.TextColor3 = Color3.new(1, 1, 1)
flyBtn.Font = Enum.Font.GothamBold
flyBtn.TextSize = 18
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 6)

local speedBox = Instance.new("TextBox", flyFrame)
speedBox.Size = UDim2.new(0, 60, 0, 30)
speedBox.Position = UDim2.new(0, 10, 0, 54)
speedBox.PlaceholderText = "1"
speedBox.Text = ""
speedBox.ClearTextOnFocus = false
speedBox.TextColor3 = Color3.new(0,0,0)
speedBox.BackgroundColor3 = Color3.new(1,1,1)
speedBox.TextScaled = true

local speedLabel = Instance.new("TextLabel", flyFrame)
speedLabel.Size = UDim2.new(0, 120, 0, 30)
speedLabel.Position = UDim2.new(0, 80, 0, 54)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed (x100)"
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 14
speedLabel.TextXAlignment = Enum.TextXAlignment.Left

local credits = Instance.new("TextLabel", flyFrame)
credits.Size = UDim2.new(1, 0, 0, 20)
credits.Position = UDim2.new(0, 0, 1, -22)
credits.BackgroundTransparency = 1
credits.Text = "Credits: Zack858"
credits.TextColor3 = Color3.fromRGB(255, 60, 255)
credits.Font = Enum.Font.GothamSemibold
credits.TextSize = 13

local flying = false
local bv, bg

local function toggleFly()
    flying = not flying
    flyBtn.Text = "Fly: " .. (flying and "ON" or "OFF")
    local speedVal = tonumber(speedBox.Text) or 1
    local speed = math.clamp(speedVal, 0.1, 10) * 100

    if flying then
        bv = Instance.new("BodyVelocity", hrp)
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(1, 1, 1) * 1e5

        bg = Instance.new("BodyGyro", hrp)
        bg.MaxTorque = Vector3.new(1, 1, 1) * 1e5
        bg.P = 10000
        bg.CFrame = hrp.CFrame

        coroutine.wrap(function()
            while flying and bv and bg do
                local cam = workspace.CurrentCamera
                local move = Vector3.zero
                if UIS:IsKeyDown(Enum.KeyCode.W) then move += cam.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.S) then move -= cam.CFrame.LookVector end
                if UIS:IsKeyDown(Enum.KeyCode.A) then move -= cam.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.D) then move += cam.CFrame.RightVector end
                if UIS:IsKeyDown(Enum.KeyCode.Space) then move += cam.CFrame.UpVector end
                if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then move -= cam.CFrame.UpVector end

                if move.Magnitude > 0 then
                    move = move.Unit * speed
                    bv.Velocity = move
                    bg.CFrame = CFrame.new(hrp.Position, hrp.Position + move)
                else
                    bv.Velocity = Vector3.zero
                end

                RunService.Heartbeat:Wait()
            end
        end)()
    else
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end
end

flyBtn.MouseButton1Click:Connect(toggleFly)
