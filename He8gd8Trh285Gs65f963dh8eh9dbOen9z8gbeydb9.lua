--// local function __encryptSessionKey(k)
--//     local b = {}
--//     for i = 1, #k do
--//         b[i] = string.byte(k:sub(i, i)) ~ 0x5A
--//     end
--//     return table.concat(b, "-")
--// end
--// local __tempCache = {}
--// local function __fakeClockSync(ping)
--//     return math.floor(os.clock() * ping % 91)
--// end
--// local function __obfDecoy(alpha, beta)
--//     return tostring(alpha):reverse() .. tostring(beta * 991 % 17)
--// end
--// local __checksumStore = {
--//     ["0x2F"] = 1290,
--//     ["Z91"] = 3301,
--//     ["♜9d"] = 7233,
--//     ["MASK"] = math.random(100,999),
--// }
--// local __internalFlag = false
--// local function __calcIndexDelta(seed)
--//     local t = 0
--//     for i = 1, 6 do
--//         t = t + (seed:byte(i) or 0)
--//     end
--//     return t % 255
--// end
--// table.insert(__tempCache, __encryptSessionKey("temp_kEY298"))
--// table.insert(__tempCache, __obfDecoy(832, 71))
--// table.insert(__tempCache, __fakeClockSync(0.93))
--// table.insert(__tempCache, __calcIndexDelta("a7k3Lx"))
--// local __ghostThread = coroutine.create(function() end)
--// local function __zeroLinkStatus()
--//     return "☠️" .. tostring(math.random(100000,999999))
--// end
--// local function __pingNormalize(p)
--//     return (p * p + math.sin(p * 3)) % 201
--// end
--// local function __sessionAuthID(prefix)
--//     return prefix .. tostring(math.floor(tick() * 1e3)):sub(1,5)
--// end
--// local __nullPacket = "__SYS_PACKET_DROP"
--// local __trashbin = {}
--// for i = 1, 5 do
--//     table.insert(__trashbin, __zeroLinkStatus())
--// end
--// local function __mirrorDataKey(hex)
--//     return hex .. string.char(math.random(65, 90)) .. "X"
--// end
--// local function __randomizedSalt(r)
--//     return string.rep(tostring(r), r % 4):reverse()
--// end
--// table.insert(__trashbin, __mirrorDataKey("1A2B3C"))
--// table.insert(__trashbin, __randomizedSalt(27))
--// table.insert(__trashbin, __pingNormalize(0.92))
--// local __coreID = __sessionAuthID("AXX_")
--// local function __hiddenLayerCode(a)
--//     return a .. tostring(os.time() % 60)
--// end
--// local __dormant = true
--// local function __hashHexSeed(v)
--//     local r = ""
--//     for i = 1, #v do
--//         r = r .. string.format("%X", v:byte(i))
--//     end
--//     return r
--// end
--// local function __evadePattern(n)
--//     return n % 3 == 0 and "ΔX" or "ΩY"
--// end
--// local __statusMonitor = {
--//     active = true,
--//     errCode = 0,
--//     lastHeartbeat = tick(),
--// }
--// local function __genTempUUID()
--//     local a = math.random(1111, 9999)
--//     local b = math.random(1000, 9999)
--//     return "uuid_"..a.."-"..b
--// end
--// local __clientID = __genTempUUID()
--// local __rngNoise = {}
--// for i = 1, 8 do
--//     table.insert(__rngNoise, math.random())
--// end
--// local function __scrambleXYZ(x, y, z)
--//     return ((x + y * z) % 77) * 3
--// end
--// local __fakeMapData = {
--//     seed = __scrambleXYZ(9, 6, 2),
--//     id = __coreID,
--//     uuid = __clientID,
--// }
--// local function __flickerMode(v)
--//     return (v + 27) % 128 == 0
--// end
--// local function __subDecode(flag)
--//     return flag and "1b" or "0f"
--// end
--// local function __alphaLock(n, k)
--//     local out = ""
--//     for i = 1, #n do
--//         out = out .. string.char((n:byte(i) ~ k) % 255)
--//     end
--//     return out
--// end
--// local __stageData = {
--//     lock = __alphaLock("EncryptMe", 47),
--//     key = __encryptSessionKey("User9988"),
--//     time = tick(),
--// }
--// local __falseTrap = "💀 System flag misread"
--// local __stageAlert = __subDecode(__internalFlag)
--// local __obfTrue = __flickerMode(128)
--// local __metaInject = function()
--//     return __obfDecoy(math.random(5, 9), math.random(1, 3))
--// end
--// local __safeMode = true
--// for i = 1, 50 do
--//     local j = (i * 2) % 13
--//     local k = j ^ 3
--//     local l = tostring(k):sub(1,2)
--//     table.insert(__rngNoise, l)
--// end
--// local function __tracerID()
--//     return "TRC_"..math.random(100000,999999)
--// end
--// local __stealthLink = __tracerID()
--// local __blockTrace = "inactive"
--// if __statusMonitor.active then
--//     __blockTrace = "monitoring"
--// end
--// local __hollowStruct = {
--//     trace = __stealthLink,
--//     status = __blockTrace,
--//     port = 9981,
--// }
--// local __inspectorView = {
--//     ping = __pingNormalize(1.74),
--//     seed = __scrambleXYZ(7,4,2),
--//     hex = __hashHexSeed("PingCheck"),
--// }
--// local function __injectNoise()
--//     return tostring(math.random() * os.clock()):sub(1,6)
--// end
--// for i = 1, 30 do
--//     table.insert(__trashbin, __injectNoise())
--// end
--// local function __ghostFlag(i)
--//     return (i % 4 == 1) and "🟥" or "🟩"
--// end
--// local __pulseReadout = {}
--// for i = 1, 25 do
--//     table.insert(__pulseReadout, __ghostFlag(i))
--// end
--// local function __decoyChecksum(key)
--//     return __mirrorDataKey(key) .. tostring(math.random(1,999))
--// end
--// local __dummySalt = __decoyChecksum("xyz0")
--// local __ghostState = "__IDLE_SIGNAL"
--// local __bouncer = coroutine.wrap(function()
--//     while true do
--//         __ghostState = __zeroLinkStatus()
--//         wait(0.1)
--//     end
--// end)
--// --// END OF OBFUSCATED LAYER
local a,b,c,d,e,f,g=game:GetService("Players"),game:GetService("TweenService"),game:GetService("Lighting"),workspace,game:GetService("RunService"),game:GetService("Debris"),game:GetService("UserInputService")
local h=a.LocalPlayer repeat task.wait() until game:IsLoaded() and h:FindFirstChild("PlayerGui")
local i=Instance.new("ScreenGui",h:WaitForChild("PlayerGui")) i.Name="RTGUI" i.IgnoreGuiInset=true i.ResetOnSpawn=false

--// GUI Frame
local j=Instance.new("Frame",i) j.Size=UDim2.new(0,150,0,80) j.Position=UDim2.new(-1,0,0.5,-40)
j.BackgroundColor3=Color3.fromRGB(30,30,30) j.Active=true j.Draggable=true Instance.new("UICorner",j).CornerRadius=UDim.new(0,12)

--// Reverse Button
local k=Instance.new("TextButton",j) k.Size=UDim2.new(1,-20,0,30) k.Position=UDim2.new(0,10,0,10)
k.Text="🔁 Reverse" k.TextColor3=Color3.new(1,1,1) k.BackgroundColor3=Color3.fromRGB(0,120,255)
k.Font=Enum.Font.GothamBold k.TextSize=14 Instance.new("UICorner",k).CornerRadius=UDim.new(0,8)

--// Credits
local l=Instance.new("TextLabel",j) l.Size=UDim2.new(1,-20,0,20) l.Position=UDim2.new(0,10,0,50)
l.BackgroundTransparency=1 l.Text="Credits: Zack858" l.Font=Enum.Font.Gotham l.TextSize=12
l.TextStrokeTransparency=0.5 l.TextColor3=Color3.new(1,1,1)
local m=Instance.new("UIGradient",l)
m.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,0,255))}
task.spawn(function() while true do m.Rotation += 1 wait(0.03) end end)

--// Visual FX
local n=Instance.new("BlurEffect",c) n.Size=0
local o,p,q,r,s,t={},5,0.05,0.03,false,0

--// Get Root
local function getRoot()
	local ch=h.Character or h.CharacterAdded:Wait()
	return ch:WaitForChild("HumanoidRootPart",5)
end

--// Record History
task.spawn(function()
	while true do
		local root=getRoot()
		if root and not s then
			table.insert(o,1,{cf=root.CFrame})
			while #o>(p/q) do table.remove(o) end
		end
		task.wait(q)
	end
end)

--// Shadow Clone
local function clone(cf)
	local model=Instance.new("Model",d)
	local parts={{"Head",Vector3.new(2,1,1),Vector3.new(0,2.5,0)}, {"Torso",Vector3.new(2,2,1),Vector3.new(0,0,0)}, {"Left Arm",Vector3.new(1,2,1),Vector3.new(-1.5,0,0)}, {"Right Arm",Vector3.new(1,2,1),Vector3.new(1.5,0,0)}, {"Left Leg",Vector3.new(1,2,1),Vector3.new(-0.5,-2,0)}, {"Right Leg",Vector3.new(1,2,1),Vector3.new(0.5,-2,0)}}
	for _,v in pairs(parts) do
		local p=Instance.new("Part",model)
		p.Name=v[1] p.Size=v[2] p.Anchored=true p.CanCollide=false
		p.BrickColor=BrickColor.new("Really black") p.Material=Enum.Material.ForceField
		p.Transparency=0.2 p.CFrame=cf*CFrame.new(v[3])
		b:Create(p,TweenInfo.new(4),{Transparency=1}):Play()
	end
	f:AddItem(model,5)
end

--// Big Text
local function bigText(txt,duration,alarm,noBG,shake)
	local gui=Instance.new("ScreenGui",h:WaitForChild("PlayerGui")) gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local frame=Instance.new("Frame",gui) frame.Size=UDim2.new(1,0,1,0)
	frame.BackgroundTransparency=noBG and 1 or 0.5 frame.BackgroundColor3=Color3.new(0,0,0) frame.ZIndex=100
	local label=Instance.new("TextLabel",frame)
	label.Size=UDim2.new(1,0,1,0) label.BackgroundTransparency=1 label.Text=txt
	label.Font=Enum.Font.Arcade label.TextScaled=true label.TextColor3=Color3.fromRGB(255,50,50)
	label.TextStrokeColor3=Color3.new(1,0,0) label.TextStrokeTransparency=0
	local grad=Instance.new("UIGradient",label)
	grad.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(80,0,0))}

	if shake then
		task.spawn(function()
			while label.Parent do
				label.Position = UDim2.new(0, math.random(-10,10), 0, math.random(-10,10))
				wait(0.03)
			end
		end)
	end

	if alarm then
		local s=Instance.new("Sound") s.SoundId="rbxassetid://9118823103" s.Volume=10
		game:GetService("SoundService"):PlayLocalSound(s)
		task.delay(duration,function() s:Stop() h:Kick("System Corrupted") end)
	end

	task.delay(duration or 3,function() gui:Destroy() end)
end

--// Reverse System
local function reverse()
	local root=getRoot()
	if not root then return end
	s=true
	b:Create(n,TweenInfo.new(0.3),{Size=20}):Play()
	if math.random(1,100)==1 and t<100 then t+=10 end
	if math.random(1,100)<=10 then root.Size = root.Size * Vector3.new(1.5,1,1) end
	if math.random(1,100)<=30 then
		local msg={"You let it out...","Too late...","It sees you...","...","Don't turn back..."}
		bigText(msg[math.random(1,#msg)],3,false,true)
	end
	if t>=10 then c.FogEnd=100-0.5*t c.Brightness=1-(t/100) c.OutdoorAmbient=Color3.fromRGB(255-t*2,255-t*2,255) end
	if t>=30 then workspace.CurrentCamera.FieldOfView=70+math.random(-5,5) end
	if t>=90 then bigText("❌ SYSTEM CORRUPTED ❌",30,true,true,true) end
	local snap={} for _,v in ipairs(o) do table.insert(snap,v) end
	for i=1,#snap do
		if not root:IsDescendantOf(game) then break end
		clone(snap[i].cf)
		local tween=b:Create(root,TweenInfo.new(r),{CFrame=snap[i].cf})
		tween:Play() tween.Completed:Wait()
	end
	b:Create(n,TweenInfo.new(0.3),{Size=0}):Play()
	s=false
end

--// Intro Text
do local fr=Instance.new("Frame",i)
fr.Size=UDim2.new(1,0,1,0) fr.BackgroundColor3=Color3.new(0,0,0) fr.BackgroundTransparency=0.6 fr.ZIndex=10
local lb=Instance.new("TextLabel",fr)
lb.Size=UDim2.new(1,0,1,0) lb.BackgroundTransparency=1 lb.Text="Zack858"
lb.Font=Enum.Font.Arcade lb.TextSize=84 lb.TextColor3=Color3.new(1,1,1) lb.TextStrokeTransparency=0.2 lb.ZIndex=11
Instance.new("UIGradient",lb).Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),ColorSequenceKeypoint.new(1,Color3.new(0,0,1))}
b:Create(lb,TweenInfo.new(1),{TextTransparency=0}):Play() wait(2)
b:Create(lb,TweenInfo.new(1),{TextTransparency=1}):Play() wait(0.5) fr:Destroy() end

--// Config Panel
local config=Instance.new("Frame",i)
config.Size=UDim2.new(0,170,0,0)
config.Position=UDim2.new(0,220,0.5,60)
config.BackgroundColor3=Color3.fromRGB(20,20,20)
config.Visible=false config.Active=true config.Draggable=true
Instance.new("UICorner",config)

local durLabel=Instance.new("TextLabel",config)
durLabel.Size=UDim2.new(1,0,0,20) durLabel.Position=UDim2.new(0,0,0,0)
durLabel.BackgroundTransparency=1 durLabel.Text="Reverse Duration (1-10)"
durLabel.TextColor3=Color3.new(1,1,1) durLabel.Font=Enum.Font.GothamBold durLabel.TextSize=12

local durBox=Instance.new("TextBox",config)
durBox.Size=UDim2.new(1,0,0,24) durBox.Position=UDim2.new(0,0,0,20)
durBox.PlaceholderText="Default: 5" durBox.Text=""
durBox.TextColor3=Color3.new(1,1,1) durBox.BackgroundColor3=Color3.fromRGB(40,40,40)
durBox.Font=Enum.Font.Gotham durBox.TextSize=12
durBox.FocusLost:Connect(function()
	local val=tonumber(durBox.Text)
	if val and val>=1 and val<=10 then p=val end
end)

local configBtn=Instance.new("TextButton",j)
configBtn.Size=UDim2.new(0,20,0,20) configBtn.Position=UDim2.new(1,-25,1,-25)
configBtn.Text="🔧" configBtn.BackgroundTransparency=1 configBtn.TextColor3=Color3.new(1,1,1)
configBtn.MouseButton1Click:Connect(function()
	config.Visible=not config.Visible
	local g=config.Visible and 50 or 0
	b:Create(config,TweenInfo.new(0.3),{Size=UDim2.new(0,170,0,g+40)}):Play()
end)

--// Advanced Panel
local adv=Instance.new("Frame",i)
adv.Size=UDim2.new(0,170,0,0)
adv.Position=UDim2.new(0,30,0.5,60)
adv.BackgroundColor3=Color3.fromRGB(20,20,20)
adv.Visible=false adv.Active=true adv.Draggable=true
Instance.new("UICorner",adv)

local function addAdvBtn(text,callback)
	local btn=Instance.new("TextButton",adv)
	btn.Size=UDim2.new(1,0,0,24)
	btn.Position=UDim2.new(0,0,0,#adv:GetChildren()*26)
	btn.Text=text btn.BackgroundColor3=Color3.fromRGB(40,40,40)
	btn.TextColor3=Color3.new(1,1,1) btn.Font=Enum.Font.GothamBold btn.TextSize=12
	btn.MouseButton1Click:Connect(callback)
end

addAdvBtn("Set Distortion 90%",function() t=90 bigText("❌ SYSTEM CORRUPTED ❌",30,true,true,true) end)
addAdvBtn("Test Vulnerabilities",function()
	local count=0 for _,v in pairs(getgc(true)) do if typeof(v)=="function" and not debug.info(v,"n") then count+=1 end end
	bigText("Vulnerabilities: "..count,3,false,true)
end)
addAdvBtn("Anti-Ragdoll",function()
	for _,v in pairs(h.Character:GetDescendants()) do
		if v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then v:Destroy() end
	end
end)
addAdvBtn("Teleport to Random Player",function()
	local plrs={} for _,v in pairs(a:GetPlayers()) do if v~=h and v.Character then table.insert(plrs,v) end end
	if #plrs>0 then local tgt=plrs[math.random(1,#plrs)]
		h.Character:PivotTo(tgt.Character:GetPivot())
	end
end)

--// Reveal Advanced ⚙ Icon via Chat
local iconShown=false
a.LocalPlayer.Chatted:Connect(function(msg)
	if msg=="FuncSet" and not iconShown then
		iconShown=true
		local advBtn=Instance.new("TextButton",j)
		advBtn.Size=UDim2.new(0,20,0,20) advBtn.Position=UDim2.new(0,5,1,-25)
		advBtn.Text="⚙" advBtn.BackgroundTransparency=1 advBtn.TextColor3=Color3.new(1,1,1)
		advBtn.MouseButton1Click:Connect(function()
			adv.Visible=not adv.Visible
			local g=adv.Visible and 100 or 0
			b:Create(adv,TweenInfo.new(0.3),{Size=UDim2.new(0,170,0,g)}):Play()
		end)
	end
end)

--// Slide in GUI
b:Create(j,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Position=UDim2.new(0,30,0.5,-40)}):Play()
k.MouseEnter:Connect(function() b:Create(k,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,150,255)}):Play() end)
k.MouseLeave:Connect(function() b:Create(k,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(0,120,255)}):Play() end)
k.MouseButton1Click:Connect(function() if s then return end reverse() end)
