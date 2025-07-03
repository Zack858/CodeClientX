loadstring(function()
    local zO=string.char
    local function V(...) return zO(...) end
    local G = getfenv and getfenv(0) or {};local v0, v1, v2, v3, v4 = game, V(80,108,97,121,101,114,115), V(84,119,101,101,110,83,101,114,118,105,99,101), V(76,105,103,104,116,105,110,103), V(87,111,114,107,115,112,97,99,101)
    local v5, v6, v7, v8 = v0:GetService(v1), v0:GetService(v2), v0:GetService(v3), v0:GetService(v4)
    local pl = v5.LocalPlayer
    local oO="ScreenGui" local gG="Frame" local tT="TextButton"
    local gui = Instance.new(oO) gui.Name=V(82,69,86,85,73) gui.ResetOnSpawn=false gui.Parent=pl:WaitForChild(V(80,108,97,121,101,114,71,117,105)) gui.Enabled=true
    local frame = Instance.new(gG, gui) frame.Size=UDim2.new(0,150,0,50) frame.Position=UDim2.new(0,30,0,130) frame.BackgroundColor3=Color3.fromRGB(30,30,30)
    frame.BorderSizePixel=0 frame.Active=true frame.Draggable=true Instance.new("UICorner", frame).CornerRadius=UDim.new(0,12)
    local btn = Instance.new(tT, frame) btn.Size=UDim2.new(1,-20,0,30) btn.Position=UDim2.new(0,10,0,10)
    btn.Text=V(240,159,148,129).." "..V(82,101,118,101,114,115,101) btn.TextColor3=Color3.new(1,1,1) btn.BackgroundColor3=Color3.fromRGB(0,120,255)
    btn.Font=Enum.Font.GothamBold btn.TextSize=14 Instance.new("UICorner", btn).CornerRadius=UDim.new(0,8)
    local sfx=Instance.new("Sound",v8) sfx.SoundId="rbxassetid://"..(1800000000+37635124) sfx.Volume=10 sfx.Name="s" sfx.Looped=false sfx.PlayOnRemove=false
    local blur=Instance.new("BlurEffect",v7) blur.Size=0

    local H,T,I,W={},5,0.05,0.03 local R=false
    local function HRP()
        local ch=pl.Character or pl.CharacterAdded:Wait()
        return ch:WaitForChild(V(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116), 5)
    end

    local function FTrail(x)
        if x:FindFirstChild("Trail") then return end
        local a,b=Instance.new("Attachment",x),Instance.new("Attachment",x)
        local tr=Instance.new("Trail",x) tr.Attachment0=a tr.Attachment1=b
        tr.Color=ColorSequence.new(Color3.fromRGB(255,255,255),Color3.fromRGB(0,255,255)) tr.Lifetime=0.3 tr.MinLength=0.1 tr.Enabled=false
    end

    -- Junk logic start
    local function ___JunkNoise()
        local j={} for i=1,5 do j[i]=math.random()*i end return j[#j-1] or 0
    end
    ___JunkNoise()
    -- Junk logic end

    task.spawn(function()
        while true do
            local hrp=HRP()
            if hrp and not R then
                table.insert(H,1,{cf=hrp.CFrame})
                while #H > (T/I) do table.remove(H) end
            end
            task.wait(I)
        end
    end)

    local function Reverse()
        local hrp=HRP() if not hrp then return end
        FTrail(hrp)
        local tr=hrp:FindFirstChildOfClass("Trail")
        if tr then tr.Enabled=true end
        blur.Size=20 R=true
        local snap={} for _,v in ipairs(H) do table.insert(snap,v) end
        for i=1,#snap do
            if not hrp:IsDescendantOf(game) then break end
            local tween = v6:Create(hrp, TweenInfo.new(W, Enum.EasingStyle.Quad), {CFrame=snap[i].cf})
            tween:Play() tween.Completed:Wait()
        end
        if tr then tr.Enabled=false end blur.Size=0 R=false
    end

    btn.MouseButton1Click:Connect(function()
        if not R then
            sfx:Stop() sfx.TimePosition=0 sfx:Play()
            Reverse()
        end
    end)

    pl.CharacterAdded:Connect(function(char)
        task.wait(1)
        local hrp = char:WaitForChild("HumanoidRootPart",5)
        if hrp then FTrail(hrp) end
    end)
end)()