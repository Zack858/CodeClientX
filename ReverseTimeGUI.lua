
-- Lightly obfuscated Reverse Time GUI (Delta Compatible)
local a=game:GetService("Players")
local b=game:GetService("TweenService")
local c=game:GetService("Lighting")
local d=game:GetService("Workspace")
local e=a.LocalPlayer
local f=Instance.new("ScreenGui",e:WaitForChild("PlayerGui"))
f.Name="RTGUI"
f.ResetOnSpawn=false
f.IgnoreGuiInset=true

local g=Instance.new("Frame",f)
g.Size=UDim2.new(0,150,0,80)
g.Position=UDim2.new(-1,0,0.5,-40)
g.BackgroundColor3=Color3.fromRGB(30,30,30)
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

local i=Instance.new("TextLabel",g)
i.Size=UDim2.new(1,-20,0,20)
i.Position=UDim2.new(0,10,0,50)
i.BackgroundTransparency=1
i.Text="Credits: Zack858"
i.Font=Enum.Font.Gotham
i.TextSize=12
i.TextStrokeTransparency=0.5
i.TextColor3=Color3.new(1,1,1)

local j=Instance.new("UIGradient",i)
j.Color=ColorSequence.new{
	ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),
	ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,0)),
	ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,255))
}
task.spawn(function() while true do j.Rotation += 1 wait(0.03) end end)

local k=Instance.new("Sound",d)
k.SoundId="rbxassetid://1837635124"
k.Volume=3
local l=Instance.new("Sound",d)
l.SoundId="rbxassetid://1837635124"
l.Volume=10

local m=Instance.new("BlurEffect",c)
m.Size=0
local n,o,p,q,r={},5,0.05,0.03,false
local s=0

local function t()
	local u=e.Character or e.CharacterAdded:Wait()
	return u:WaitForChild("HumanoidRootPart",5)
end

local function v(w)
	if w:FindFirstChild("Trail") then return end
	local x=Instance.new("Attachment",w)
	local y=Instance.new("Attachment",w)
	local z=Instance.new("Trail",w)
	z.Attachment0=x
	z.Attachment1=y
	z.Color=ColorSequence.new(Color3.new(1,1,1),Color3.new(0,1,1))
	z.Lifetime=0.3
	z.MinLength=0.1
	z.Enabled=false
end

task.spawn(function()
	while true do
		local A=t()
		if A and not r then
			table.insert(n,1,{cf=A.CFrame})
			while #n>(o/p) do table.remove(n) end
		end
		wait(p)
	end
end)

local function B(cf)
	local C=Instance.new("Part",workspace)
	C.Anchored=true
	C.CanCollide=false
	C.Transparency=0.2
	C.Size=Vector3.new(2,3,1)
	C.CFrame=cf
	C.BrickColor=BrickColor.new("Really black")
	C.Material=Enum.Material.ForceField
	b:Create(C,TweenInfo.new(2),{Transparency=1}):Play()
	game:GetService("Debris"):AddItem(C,5)
end

local function CREEPY(msg)
	local D=Instance.new("ScreenGui",f)
	local E=Instance.new("Frame",D)
	E.BackgroundColor3=Color3.new(0,0,0)
	E.BackgroundTransparency=0.7
	E.Size=UDim2.new(1,0,1,0)
	E.ZIndex=20
	local F=Instance.new("TextLabel",E)
	F.Size=UDim2.new(1,0,1,0)
	F.Text=msg
	F.TextColor3=Color3.new(0,0,0)
	F.TextStrokeColor3=Color3.new(1,0,0)
	F.TextStrokeTransparency=0
	F.TextTransparency=0.3
	F.Font=Enum.Font.Arcade
	F.TextScaled=true
	F.BackgroundTransparency=1
	F.ZIndex=21
	local G=Instance.new("UIGradient",F)
	G.Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),
		ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,255))
	}
	for H=1,8 do
		F.TextTransparency=(H%2==0 and 0.3 or 1)
		wait(0.1)
	end
	D:Destroy()
end

local function reverse()
	local I=t() if not I then return end
	v(I)
	local J=I:FindFirstChildOfClass("Trail")
	if J then J.Enabled=true end
	b:Create(m,TweenInfo.new(0.3),{Size=20}):Play()
	r=true

	local K=math.random(1,100)
	if K<=10 then I.Size=I.Size*Vector3.new(1.5,1,1) end
	if K<=30 then
		local L={"You let it out...","Too late...","It sees you...","...","Don't turn back..."}
		CREEPY(L[math.random(1,#L)])
	end

	if math.random(1,100)<=1 then s=math.min(100,s+10) end

	local M={} for _,N in ipairs(n) do table.insert(M,N) end
	for O=1,#M do
		if not I:IsDescendantOf(game) then break end
		B(M[O].cf)
		local P=b:Create(I,TweenInfo.new(q),{CFrame=M[O].cf})
		P:Play() P.Completed:Wait()
	end

	if J then J.Enabled=false end
	b:Create(m,TweenInfo.new(0.3),{Size=0}):Play()
	r=false
end

do
	local Q=Instance.new("Frame",f)
	Q.Size=UDim2.new(1,0,1,0)
	Q.BackgroundTransparency=1
	Q.ZIndex=10
	local R=Instance.new("Frame",Q)
	R.Size=UDim2.new(1,0,1,0)
	R.BackgroundColor3=Color3.new(0,0,0)
	R.BackgroundTransparency=0.3
	R.ZIndex=10
	local S=Instance.new("TextLabel",Q)
	S.Size=UDim2.new(1,0,1,0)
	S.BackgroundTransparency=1
	S.Text="Zack858"
	S.Font=Enum.Font.Arcade
	S.TextSize=84
	S.TextColor3=Color3.new(1,1,1)
	S.TextStrokeTransparency=0.2
	S.ZIndex=11
	local T=Instance.new("UIGradient",S)
	T.Color=ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),
		ColorSequenceKeypoint.new(1,Color3.new(0,0,1))
	}
	b:Create(S,TweenInfo.new(1),{TextTransparency=0}):Play()
	wait(2)
	b:Create(S,TweenInfo.new(1),{TextTransparency=1}):Play()
	wait(0.5)
	Q:Destroy()
end

f.Parent=e:WaitForChild("PlayerGui")
b:Create(g,TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 30, 0.5, -40)}):Play()

h.MouseEnter:Connect(function()
	b:Create(h,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,150,255)}):Play()
end)
h.MouseLeave:Connect(function()
	b:Create(h,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,120,255)}):Play()
end)
h.MouseButton1Click:Connect(function()
	if r then return end
	k:Play()
	l.TimePosition=0
	l:Play()
	reverse()
end)

e.CharacterAdded:Connect(function()
	wait(1)
	local U=t()
	if U then v(U) end
end)
