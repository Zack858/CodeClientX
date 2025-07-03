local a=game:GetService("Players")
local b=game:GetService("TweenService")
local c=game:GetService("Lighting")
local d=game:GetService("Workspace")
local e=a.LocalPlayer
local f=Instance.new("ScreenGui")
f.Name="ReverseTimeGUI"
f.ResetOnSpawn=false
f.Parent=e:WaitForChild("PlayerGui")
f.Enabled=true
local g=Instance.new("Frame",f)
g.Size=UDim2.new(0,150,0,50)
g.Position=UDim2.new(0,30,0,130)
g.BackgroundColor3=Color3.fromRGB(30,30,30)
g.BorderSizePixel=0
g.Active=true
g.Draggable=true
Instance.new("UICorner",g).CornerRadius=UDim.new(0,12)
local h=Instance.new("TextButton",g)
h.Size=UDim2.new(1,-20,0,30)
h.Position=UDim2.new(0,10,0,10)
h.Text="🔁 Reverse"
h.TextColor3=Color3.new(1,1,1)
h.BackgroundColor3=Color3.fromRGB(0,120,255)
h.Font=Enum.Font.GothamBold
h.TextSize=14
Instance.new("UICorner",h).CornerRadius=UDim.new(0,8)
local i=Instance.new("Sound",d)
i.SoundId="rbxassetid://1837635124"
i.Volume=10
i.Name="c00lk1dForsakenSound"
i.Looped=false
i.PlayOnRemove=false
local j=Instance.new("BlurEffect",c)
j.Size=0
local k={}
local l=5
local m=0.05
local n=0.03
local o=false
local function p()
	local q=e.Character or e.CharacterAdded:Wait()
	return q:WaitForChild("HumanoidRootPart",5)
end
local function r(s)
	if s:FindFirstChild("Trail") then return end
	local t=Instance.new("Attachment",s)
	local u=Instance.new("Attachment",s)
	local v=Instance.new("Trail",s)
	v.Attachment0=t
	v.Attachment1=u
	v.Color=ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(0,255,255))
	v.Lifetime=0.3
	v.MinLength=0.1
	v.Enabled=false
end
task.spawn(function()
	while true do
		local w=p()
		if w and not o then
			table.insert(k,1,{cf=w.CFrame})
			while #k>(l/m) do table.remove(k) end
		end
		task.wait(m)
	end
end)
local function x()
	local y=p()
	if not y then return end
	r(y)
	local z=y:FindFirstChildOfClass("Trail")
	if z then z.Enabled=true end
	j.Size=20
	o=true
	local A={}
	for B,C in ipairs(k) do table.insert(A,C) end
	for D=1,#A do
		if not y:IsDescendantOf(game) then break end
		local E=b:Create(y,TweenInfo.new(n,Enum.EasingStyle.Quad),{CFrame=A[D].cf})
		E:Play()
		E.Completed:Wait()
	end
	if z then z.Enabled=false end
	j.Size=0
	o=false
end
h.MouseButton1Click:Connect(function()
	if not o then
		i:Stop()
		i.TimePosition=0
		i:Play()
		x()
	end
end)
e.CharacterAdded:Connect(function(F)
	task.wait(1)
	local G=F:WaitForChild("HumanoidRootPart",5)
	if G then r(G) end
end)
