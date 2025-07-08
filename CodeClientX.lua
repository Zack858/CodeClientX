local OrionLib = (function()
local Orion = {}

function Orion:CreateOrion(orionName)
    orionName = orionName or "Orion"
    local isClosed = false
    
    local ScreenGui = Instance.new("ScreenGui")
    local MainWhiteFrame = Instance.new("Frame")
    local mainCorner = Instance.new("UICorner")
    local MainWhiteFrame_2 = Instance.new("Frame")
    local mainCorner_2 = Instance.new("UICorner")
    local tabFrame = Instance.new("Frame")
    local tabList = Instance.new("UIListLayout")
    local tabPadd = Instance.new("UIPadding")
    local header = Instance.new("Frame")
    local mainCorner_4 = Instance.new("UICorner")
    local libTitle = Instance.new("TextLabel")
    local closeLib = Instance.new("ImageButton")
    local elementContainer = Instance.new("Frame")
    local mainCorner_5 = Instance.new("UICorner")
    local mainList = Instance.new("UIListLayout")
    local pagesFolder = Instance.new("Folder")


    
    local UserInputService = game:GetService("UserInputService")

    local TopBar = header

    local Camera = workspace:WaitForChild("Camera")

    local DragMousePosition
    local FramePosition
    local Draggable = false
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Draggable = true
            DragMousePosition = Vector2.new(input.Position.X, input.Position.Y)
            FramePosition = Vector2.new(MainWhiteFrame.Position.X.Scale, MainWhiteFrame.Position.Y.Scale)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if Draggable == true then
            local NewPosition = FramePosition + ((Vector2.new(input.Position.X, input.Position.Y) - DragMousePosition) / Camera.ViewportSize)
            MainWhiteFrame.Position = UDim2.new(NewPosition.X, 0, NewPosition.Y, 0)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Draggable = false
        end
    end)

    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    MainWhiteFrame.Name = "MainWhiteFrame"
    MainWhiteFrame.Parent = ScreenGui
    MainWhiteFrame.BackgroundColor3 = Color3.fromRGB(139, 0, 23)
    MainWhiteFrame.BorderSizePixel = 0
    MainWhiteFrame.ClipsDescendants = true
    MainWhiteFrame.Position = UDim2.new(0.236969739, 0, 0.360436916, 0)
    MainWhiteFrame.Size = UDim2.new(0, 528, 0, 310)

    mainCorner.CornerRadius = UDim.new(0, 3)
    mainCorner.Name = "mainCorner"
    mainCorner.Parent = MainWhiteFrame

    MainWhiteFrame_2.Name = "MainWhiteFrame"
    MainWhiteFrame_2.Parent = MainWhiteFrame
    MainWhiteFrame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainWhiteFrame_2.BorderSizePixel = 0
    MainWhiteFrame_2.ClipsDescendants = true
    MainWhiteFrame_2.Position = UDim2.new(0.0113636367, 0, 0, 0)
    MainWhiteFrame_2.Size = UDim2.new(0, 525, 0, 310)

    mainCorner_2.CornerRadius = UDim.new(0, 3)
    mainCorner_2.Name = "mainCorner"
    mainCorner_2.Parent = MainWhiteFrame_2

    tabFrame.Name = "tabFrame"
    tabFrame.Parent = MainWhiteFrame_2
    tabFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    tabFrame.BorderColor3 = Color3.fromRGB(53, 53, 53)
    tabFrame.ClipsDescendants = true
    tabFrame.Size = UDim2.new(0, 100, 0, 309)

    tabList.Name = "tabList"
    tabList.Parent = tabFrame
    tabList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.Padding = UDim.new(0, 2)

    tabPadd.Name = "tabPadd"
    tabPadd.Parent = tabFrame
    tabPadd.PaddingRight = UDim.new(0, 2)
    tabPadd.PaddingTop = UDim.new(0, 5)

    header.Name = "header"
    header.Parent = MainWhiteFrame_2
    header.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
    header.Position = UDim2.new(0.207619041, 0, 0.0258064512, 0)
    header.Size = UDim2.new(0, 408, 0, 43)

    mainCorner_4.CornerRadius = UDim.new(0, 3)
    mainCorner_4.Name = "mainCorner"
    mainCorner_4.Parent = header

    libTitle.Name = "libTitle"
    libTitle.Parent = header
    libTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    libTitle.BackgroundTransparency = 1.000
    libTitle.Position = UDim2.new(0.0294117648, 0, 0, 0)
    libTitle.Size = UDim2.new(0, 343, 0, 43)
    libTitle.Font = Enum.Font.GothamSemibold
    libTitle.Text = orionName
    libTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    libTitle.TextSize = 18.000
    libTitle.TextXAlignment = Enum.TextXAlignment.Left

    closeLib.Name = "closeLib"
    closeLib.Parent = header
    closeLib.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    closeLib.BackgroundTransparency = 1.000
    closeLib.Position = UDim2.new(0.91911763, 0, 0.209302321, 0)
    closeLib.Size = UDim2.new(0, 25, 0, 25)
    closeLib.Image = "rbxassetid://4988112250"
    closeLib.MouseButton1Click:Connect(function()
        isClosed = not isClosed
        if isClosed then
            closeLib.Image = "rbxassetid://5165666242"
            game.TweenService:Create(closeLib, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                Rotation = 360
            }):Play()
            MainWhiteFrame:TweenSize(UDim2.new(0, 424,0, 58), "In", "Linear", 0.12)
            game.TweenService:Create(MainWhiteFrame_2, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                BackgroundTransparency = 1
            }):Play()
            game.TweenService:Create(MainWhiteFrame, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                BackgroundTransparency = 1
            }):Play()
        else
            closeLib.Image = "rbxassetid://4988112250"
            game.TweenService:Create(closeLib, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                Rotation = 0
            }):Play()
            MainWhiteFrame:TweenSize(UDim2.new(0, 528,0, 310), "In", "Linear", 0.12)
            game.TweenService:Create(MainWhiteFrame_2, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                BackgroundTransparency = 0
            }):Play()
            game.TweenService:Create(MainWhiteFrame, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                BackgroundTransparency = 0
            }):Play()
        end
    end)

    elementContainer.Name = "elementContainer"
    elementContainer.Parent = MainWhiteFrame_2
    elementContainer.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    elementContainer.Position = UDim2.new(0.207619041, 0, 0.187096775, 0)
    elementContainer.Size = UDim2.new(0, 408, 0, 243)

    mainCorner_5.CornerRadius = UDim.new(0, 3)
    mainCorner_5.Name = "mainCorner"
    mainCorner_5.Parent = elementContainer

    mainList.Name = "mainList"
    mainList.Parent = MainWhiteFrame
    mainList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    mainList.SortOrder = Enum.SortOrder.LayoutOrder

    pagesFolder.Parent = elementContainer

    local SectionHandler = {}

    function SectionHandler:CreateSection(secName)
        secName = secName or "Tab"

        -- Tab Button Instances
        local tabBtn = Instance.new("TextButton")
        local mainCorner_3 = Instance.new("UICorner")

        tabBtn.Name = "tabBtn"..secName
        tabBtn.Parent = tabFrame
        tabBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
        tabBtn.BorderColor3 = Color3.fromRGB(53, 53, 53)
        tabBtn.Position = UDim2.new(0.0599999987, 0, 0.0323624611, 0)
        tabBtn.Size = UDim2.new(0, 95, 0, 32)
        tabBtn.Font = Enum.Font.GothamSemibold
        tabBtn.Text = secName
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.TextSize = 14.000
        tabBtn.AutoButtonColor = false
    
        mainCorner_3.CornerRadius = UDim.new(0, 3)
        mainCorner_3.Name = "mainCorner"
        mainCorner_3.Parent = tabBtn

        -- New Section Frame Instances
        local newPage = Instance.new("ScrollingFrame")
        local pageItemList = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")

        newPage.Name = "newPage"..secName
        newPage.Parent = pagesFolder
        newPage.Active = true
        newPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        newPage.BackgroundTransparency = 1.000
        newPage.BorderSizePixel = 0
        newPage.Size = UDim2.new(1, 0, 1, 0)
        newPage.ScrollBarThickness = 5
        newPage.ScrollBarImageColor3 = Color3.fromRGB(255, 2, 40)
        newPage.Visible = false

        pageItemList.Name = "pageItemList"
        pageItemList.Parent = newPage
        pageItemList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        pageItemList.SortOrder = Enum.SortOrder.LayoutOrder
        pageItemList.Padding = UDim.new(0, 3)

        UIPadding.Parent = newPage
        UIPadding.PaddingRight = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)

        local function UpdateSize()
            local cS = pageItemList.AbsoluteContentSize

            game.TweenService:Create(newPage, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                CanvasSize = UDim2.new(0,cS.X,0,cS.Y + 10)
            }):Play()
        end
    
        newPage.ChildAdded:Connect(UpdateSize)
        newPage.ChildRemoved:Connect(UpdateSize)
        UpdateSize()

        tabBtn.MouseButton1Click:Connect(function()
            UpdateSize()
            for i,v in next, pagesFolder:GetChildren() do
                v.Visible = false
                UpdateSize()
            end
            newPage.Visible = true

            for i,v in next, tabFrame:GetChildren() do
                if v:IsA("TextButton") then
                    UpdateSize()
                    game.TweenService:Create(v, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{
                        BackgroundColor3 = Color3.fromRGB(25,25,25)
                    }):Play()
                end
            end
            game.TweenService:Create(tabBtn, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{
                BackgroundColor3 = Color3.fromRGB(139, 0, 23)
            }):Play()
        end)

        local ElementHandler = {}

        function ElementHandler:TextLabel(labelText)
            labelText = labelText or ""

            local labelFrame = Instance.new("Frame")
            local mainCorner = Instance.new("UICorner")
            local txtLabel = Instance.new("TextLabel")

            labelFrame.Name = "labelFrame"
            labelFrame.Parent = newPage
            labelFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            labelFrame.Position = UDim2.new(0.0367647074, 0, 0.0185185187, 0)
            labelFrame.Size = UDim2.new(0, 394, 0, 42)

            mainCorner.CornerRadius = UDim.new(0, 3)
            mainCorner.Name = "mainCorner"
            mainCorner.Parent = labelFrame

            txtLabel.Name = "txtLabel"
            txtLabel.Parent = labelFrame
            txtLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            txtLabel.BackgroundTransparency = 1.000
            txtLabel.Position = UDim2.new(0, 0, 0.0238095243, 0)
            txtLabel.Size = UDim2.new(0, 395, 0, 41)
            txtLabel.Font = Enum.Font.GothamSemibold
            txtLabel.Text = labelText
            txtLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            txtLabel.TextSize = 14.000
        end

        function ElementHandler:TextButton(buttonText, buttonInfo, callback)
            buttonText = buttonText or ""
            buttonInfo = buttonInfo or ""
            callback = callback or function() end

            local textButtonFrame = Instance.new("Frame")
            local mainCorner = Instance.new("UICorner")
            local TextButton = Instance.new("TextButton")
            local mainCorner_2 = Instance.new("UICorner")
            local textButtonInfo = Instance.new("TextLabel")

            textButtonFrame.Name = "textButtonFrame"
            textButtonFrame.Parent = newPage
            textButtonFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            textButtonFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            textButtonFrame.Size = UDim2.new(0, 394, 0, 42)

            mainCorner.CornerRadius = UDim.new(0, 3)
            mainCorner.Name = "mainCorner"
            mainCorner.Parent = textButtonFrame

            TextButton.Parent = textButtonFrame
            TextButton.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            TextButton.Position = UDim2.new(0.017766498, 0, 0.166666672, 0)
            TextButton.Size = UDim2.new(0, 141, 0, 27)
            TextButton.Font = Enum.Font.GothamSemibold
            TextButton.Text = buttonText
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextSize = 14.000

            mainCorner_2.CornerRadius = UDim.new(0, 3)
            mainCorner_2.Name = "mainCorner"
            mainCorner_2.Parent = TextButton

            textButtonInfo.Name = "textButtonInfo"
            textButtonInfo.Parent = textButtonFrame
            textButtonInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textButtonInfo.BackgroundTransparency = 1.000
            textButtonInfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            textButtonInfo.Size = UDim2.new(0, 226, 0, 41)
            textButtonInfo.Font = Enum.Font.GothamSemibold
            textButtonInfo.Text = buttonInfo
            textButtonInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
            textButtonInfo.TextSize = 14.000
            textButtonInfo.TextXAlignment = Enum.TextXAlignment.Right

            TextButton.MouseButton1Click:Connect(function()
                callback()
            end)
        end

            function ElementHandler:Toggle(togInfo, callback)
                togInfo = togInfo or ""
                callback = callback or function() end

                local toggleFrame = Instance.new("Frame")
                local mainCorner = Instance.new("UICorner")
                local toggleInfo = Instance.new("TextLabel")
                local toggleInerFrame = Instance.new("Frame")
                local mainCorner_2 = Instance.new("UICorner")
                local toggleInnerFrame1 = Instance.new("Frame")
                local mainCorner_3 = Instance.new("UICorner")
                local toggleBtn = Instance.new("TextButton")
                local mainCorner_4 = Instance.new("UICorner")
                local UIListLayout = Instance.new("UIListLayout")
                local UIListLayout_2 = Instance.new("UIListLayout")

                toggleFrame.Name = "toggleFrame"
                toggleFrame.Parent = newPage
                toggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                toggleFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
                toggleFrame.Size = UDim2.new(0, 394, 0, 42)

                mainCorner.CornerRadius = UDim.new(0, 3)
                mainCorner.Name = "mainCorner"
                mainCorner.Parent = toggleFrame

                toggleInfo.Name = "toggleInfo"
                toggleInfo.Parent = toggleFrame
                toggleInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                toggleInfo.BackgroundTransparency = 1.000
                toggleInfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
                toggleInfo.Size = UDim2.new(0, 226, 0, 41)
                toggleInfo.Font = Enum.Font.GothamSemibold
                toggleInfo.Text = togInfo
                toggleInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
                toggleInfo.TextSize = 14.000
                toggleInfo.TextXAlignment = Enum.TextXAlignment.Right

                toggleInerFrame.Name = "toggleInerFrame"
                toggleInerFrame.Parent = toggleFrame
                toggleInerFrame.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
                toggleInerFrame.Position = UDim2.new(0.0177664906, 0, 0.166666672, 0)
                toggleInerFrame.Size = UDim2.new(0, 27, 0, 27)

                mainCorner_2.CornerRadius = UDim.new(0, 3)
                mainCorner_2.Name = "mainCorner"
                mainCorner_2.Parent = toggleInerFrame

                toggleInnerFrame1.Name = "toggleInnerFrame1"
                toggleInnerFrame1.Parent = toggleInerFrame
                toggleInnerFrame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                toggleInnerFrame1.Position = UDim2.new(0.0177664906, 0, -0.0185185075, 0)
                toggleInnerFrame1.Size = UDim2.new(0, 25, 0, 25)

                mainCorner_3.CornerRadius = UDim.new(0, 3)
                mainCorner_3.Name = "mainCorner"
                mainCorner_3.Parent = toggleInnerFrame1

                toggleBtn.Name = "toggleBtn"
                toggleBtn.Parent = toggleInnerFrame1
                toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                toggleBtn.Position = UDim2.new(2.2399888, 0, -0.0185185149, 0)
                toggleBtn.Size = UDim2.new(0, 23, 0, 23)
                toggleBtn.Font = Enum.Font.GothamSemibold
                toggleBtn.Text = ""
                toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                toggleBtn.TextSize = 14.000
                toggleBtn.AutoButtonColor = false

                mainCorner_4.CornerRadius = UDim.new(0, 3)
                mainCorner_4.Name = "mainCorner"
                mainCorner_4.Parent = toggleBtn

                UIListLayout.Parent = toggleInnerFrame1
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

                UIListLayout_2.Parent = toggleInerFrame
                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

                local toggled = false
                toggleBtn.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    callback(toggled)
                    if toggled then
                        game.TweenService:Create(toggleBtn, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{
                            BackgroundColor3 = Color3.fromRGB(181, 1, 31)
                        }):Play()
                    else
                        game.TweenService:Create(toggleBtn, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),{
                            BackgroundColor3 = Color3.fromRGB(25,25,25)
                        }):Play()
                    end 
                end)
            end

                function ElementHandler:Slider(sliderin, minvalue, maxvalue, callback)
                    minvalue = minvalue or 0
                    maxvalue = maxvalue or 500
                    callback = callback or function() end
                    sliderin = sliderin or "info ok"

                    local sliderFrame = Instance.new("Frame")
                    local mainCorner = Instance.new("UICorner")
                    local sliderInfo = Instance.new("TextLabel")
                    local sliderValue = Instance.new("TextLabel")
                    local sliderBtn = Instance.new("TextButton")
                    local sliderdragfrm = Instance.new("UIListLayout")
                    local sliderMainFrm = Instance.new("Frame")
                    local sliderlist = Instance.new("UIListLayout")
                    local mainCorner_2 = Instance.new("UICorner")
                    local mainCorner_3 = Instance.new("UICorner")

                    sliderFrame.Name = "sliderFrame"
                    sliderFrame.Parent = newPage
                    sliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    sliderFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
                    sliderFrame.Size = UDim2.new(0, 394, 0, 42)

                    mainCorner.CornerRadius = UDim.new(0, 3)
                    mainCorner.Name = "mainCorner"
                    mainCorner.Parent = sliderFrame

                    sliderInfo.Name = "sliderInfo"
                    sliderInfo.Parent = sliderFrame
                    sliderInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    sliderInfo.BackgroundTransparency = 1.000
                    sliderInfo.Position = UDim2.new(0.570575714, 0, 0.0238095243, 0)
                    sliderInfo.Size = UDim2.new(0, 157, 0, 41)
                    sliderInfo.Font = Enum.Font.GothamSemibold
                    sliderInfo.Text = sliderin
                    sliderInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
                    sliderInfo.TextSize = 14.000
                    sliderInfo.TextXAlignment = Enum.TextXAlignment.Right

                    sliderValue.Name = "sliderValue"
                    sliderValue.Parent = sliderFrame
                    sliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    sliderValue.BackgroundTransparency = 1.000
                    sliderValue.Position = UDim2.new(0.395939082, 0, 0.285714298, 0)
                    sliderValue.Size = UDim2.new(0, 68, 0, 17)
                    sliderValue.Font = Enum.Font.GothamSemibold
                    sliderValue.Text = minvalue.."/"..maxvalue
                    sliderValue.TextColor3 = Color3.fromRGB(199, 0, 33)
                    sliderValue.TextSize = 14.000
                    sliderValue.TextXAlignment = Enum.TextXAlignment.Left

                    sliderBtn.Name = "sliderBtn"
                    sliderBtn.Parent = sliderFrame
                    sliderBtn.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                    sliderBtn.BorderSizePixel = 0
                    sliderBtn.Position = UDim2.new(0.0179999992, 0, 0.381000012, 0)
                    sliderBtn.Size = UDim2.new(0, 141, 0, 10)
                    sliderBtn.AutoButtonColor = false
                    sliderBtn.Font = Enum.Font.SourceSans
                    sliderBtn.Text = ""
                    sliderBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
                    sliderBtn.TextSize = 14.000

                    sliderdragfrm.Name = "sliderdragfrm"
                    sliderdragfrm.Parent = sliderBtn
                    sliderdragfrm.SortOrder = Enum.SortOrder.LayoutOrder
                    sliderdragfrm.VerticalAlignment = Enum.VerticalAlignment.Center

                    sliderMainFrm.Name = "sliderMainFrm"
                    sliderMainFrm.Parent = sliderBtn
                    sliderMainFrm.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
                    sliderMainFrm.BorderColor3 = Color3.fromRGB(181, 1, 31)
                    sliderMainFrm.BorderSizePixel = 0
                    sliderMainFrm.Size = UDim2.new(0, 0, 0, 10)

                    sliderlist.Name = "sliderlist"
                    sliderlist.Parent = sliderMainFrm
                    sliderlist.HorizontalAlignment = Enum.HorizontalAlignment.Right
                    sliderlist.SortOrder = Enum.SortOrder.LayoutOrder
                    sliderlist.VerticalAlignment = Enum.VerticalAlignment.Center

                    mainCorner_2.CornerRadius = UDim.new(0, 5)
                    mainCorner_2.Name = "mainCorner"
                    mainCorner_2.Parent = sliderMainFrm
                    mainCorner_2.Archivable = false

                    mainCorner_3.CornerRadius = UDim.new(0, 3)
                    mainCorner_3.Name = "mainCorner"
                    mainCorner_3.Parent = sliderBtn

                    local mouse = game.Players.LocalPlayer:GetMouse()
                        local uis = game:GetService("UserInputService")
                        local Value;

                        sliderBtn.MouseButton1Down:Connect(function()
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 141) * sliderMainFrm.AbsoluteSize.X) + tonumber(minvalue)) or 0
                            pcall(function()
                                callback(Value)
                            end)
                            sliderMainFrm.Size = UDim2.new(0, math.clamp(mouse.X - sliderMainFrm.AbsolutePosition.X, 0, 141), 0, 10)
                            moveconnection = mouse.Move:Connect(function()
                                sliderValue.Text = Value.."/"..maxvalue
                                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 141) * sliderMainFrm.AbsoluteSize.X) + tonumber(minvalue))
                                pcall(function()
                                    callback(Value)
                                end)
                                sliderMainFrm.Size = UDim2.new(0, math.clamp(mouse.X - sliderMainFrm.AbsolutePosition.X, 0, 141), 0, 10)
                            end)
                            releaseconnection = uis.InputEnded:Connect(function(Mouse)
                                if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 141) * sliderMainFrm.AbsoluteSize.X) + tonumber(minvalue))
                                    pcall(function()
                                        callback(Value)
                                    end)
                                    sliderValue.Text = Value.."/"..maxvalue
                                    sliderMainFrm.Size = UDim2.new(0, math.clamp(mouse.X - sliderMainFrm.AbsolutePosition.X, 0, 141), 0, 10)
                                    moveconnection:Disconnect()
                                    releaseconnection:Disconnect()
                                end
                            end)
                        end)
                    end

                        function ElementHandler:KeyBind(keInfo, firstt, callback)
                            local oldKey = firstt.Name
                            keInfo = keInfo or ""
                            callback = callback or function() end

                            local keybindFrame = Instance.new("Frame")
                            local mainCorner = Instance.new("UICorner")
                            local TextButton = Instance.new("TextButton")
                            local mainCorner_2 = Instance.new("UICorner")
                            local keybindinfo = Instance.new("TextLabel")

                            keybindFrame.Name = "keybindFrame"
                            keybindFrame.Parent = newPage
                            keybindFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                            keybindFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
                            keybindFrame.Size = UDim2.new(0, 394, 0, 42)

                            mainCorner.CornerRadius = UDim.new(0, 3)
                            mainCorner.Name = "mainCorner"
                            mainCorner.Parent = keybindFrame

                            TextButton.Parent = keybindFrame
                            TextButton.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
                            TextButton.Position = UDim2.new(0.017766498, 0, 0.166666672, 0)
                            TextButton.Size = UDim2.new(0, 76, 0, 27)
                            TextButton.Font = Enum.Font.GothamSemibold
                            TextButton.Text = oldKey
                            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                            TextButton.TextSize = 14.000

                            mainCorner_2.CornerRadius = UDim.new(0, 3)
                            mainCorner_2.Name = "mainCorner"
                            mainCorner_2.Parent = TextButton

                            keybindinfo.Name = "keybindinfo"
                            keybindinfo.Parent = keybindFrame
                            keybindinfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            keybindinfo.BackgroundTransparency = 1.000
                            keybindinfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
                            keybindinfo.Size = UDim2.new(0, 226, 0, 41)
                            keybindinfo.Font = Enum.Font.GothamSemibold
                            keybindinfo.Text = keInfo
                            keybindinfo.TextColor3 = Color3.fromRGB(198, 198, 198)
                            keybindinfo.TextSize = 14.000
                            keybindinfo.TextXAlignment = Enum.TextXAlignment.Right

                            TextButton.MouseButton1Click:connect(function(e) 
                                TextButton.Text = ". . ."
                                local a, b = game:GetService('UserInputService').InputBegan:wait();
                                if a.KeyCode.Name ~= "Unknown" then
                                    TextButton.Text = a.KeyCode.Name
                                    oldKey = a.KeyCode.Name;
                                end
                            end)
                    
                            game:GetService("UserInputService").InputBegan:connect(function(current, ok) 
                                if not ok then 
                                    if current.KeyCode.Name == oldKey then 
                                        callback()
                                    end
                                end
                            end)
                        end

                            function ElementHandler:TextBox(textInfo, placeHolderText1, callback)
                                textInfo = textInfo or ""
                                placeHolderText1 = placeHolderText1 or ""
                                callback = callback or function() end
                                local textBoxFrame = Instance.new("Frame")
                                local mainCorner = Instance.new("UICorner")
                                local textboxInfo = Instance.new("TextLabel")
                                local texboxInner = Instance.new("Frame")
                                local mainCorner_2 = Instance.new("UICorner")
                                local textboxinneer = Instance.new("Frame")
                                local mainCorner_3 = Instance.new("UICorner")
                                local UIListLayout = Instance.new("UIListLayout")
                                local TextBox = Instance.new("TextBox")
                                local UIListLayout_2 = Instance.new("UIListLayout")

                                --Properties:

                                textBoxFrame.Name = "textBoxFrame"
                                textBoxFrame.Parent = newPage
                                textBoxFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                textBoxFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
                                textBoxFrame.Size = UDim2.new(0, 394, 0, 42)

                                mainCorner.CornerRadius = UDim.new(0, 3)
                                mainCorner.Name = "mainCorner"
                                mainCorner.Parent = textBoxFrame

                                textboxInfo.Name = "textboxInfo"
                                textboxInfo.Parent = textBoxFrame
                                textboxInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                textboxInfo.BackgroundTransparency = 1.000
                                textboxInfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
                                textboxInfo.Size = UDim2.new(0, 226, 0, 41)
                                textboxInfo.Font = Enum.Font.GothamSemibold
                                textboxInfo.Text = textInfo
                                textboxInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
                                textboxInfo.TextSize = 14.000
                                textboxInfo.TextXAlignment = Enum.TextXAlignment.Right

                                texboxInner.Name = "texboxInner"
                                texboxInner.Parent = textBoxFrame
                                texboxInner.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
                                texboxInner.Position = UDim2.new(0.017766498, 0, 0.166666672, 0)
                                texboxInner.Size = UDim2.new(0, 141, 0, 27)

                                mainCorner_2.CornerRadius = UDim.new(0, 3)
                                mainCorner_2.Name = "mainCorner"
                                mainCorner_2.Parent = texboxInner

                                textboxinneer.Name = "textboxinneer"
                                textboxinneer.Parent = texboxInner
                                textboxinneer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                textboxinneer.ClipsDescendants = true
                                textboxinneer.Position = UDim2.new(0.411347508, 0, 0.0370370373, 0)
                                textboxinneer.Size = UDim2.new(0, 139, 0, 25)

                                mainCorner_3.CornerRadius = UDim.new(0, 3)
                                mainCorner_3.Name = "mainCorner"
                                mainCorner_3.Parent = textboxinneer

                                UIListLayout.Parent = textboxinneer
                                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

                                TextBox.Parent = textboxinneer
                                TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                TextBox.BackgroundTransparency = 1.000
                                TextBox.Size = UDim2.new(1, 0, 1, 0)
                                TextBox.Font = Enum.Font.GothamSemibold
                                TextBox.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
                                TextBox.PlaceholderText = placeHolderText1
                                TextBox.Text = ""
                                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                                TextBox.TextSize = 13.000
                                TextBox.TextWrapped = true

                                UIListLayout_2.Parent = texboxInner
                                UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
                                UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

                                TextBox.FocusLost:Connect(function(EnterPressed)
                                    if not EnterPressed then return end
                                    callback(TextBox.Text)
                                    TextBox.Text = ""
                                end)
                            end 

                                function ElementHandler:Dropdown(dInfo, list, callback)
                                    dInfo = dInfo or ""
                                    list = list or {}
                                    callback = callback or function() end

                                    local isDropped = false

                                    local dropDownFrame = Instance.new("Frame")
                                    local mainCorner = Instance.new("UICorner")
                                    local dropdownmain = Instance.new("Frame")
                                    local mainCorner_2 = Instance.new("UICorner")
                                    local dropdownItem = Instance.new("TextLabel")
                                    local ImageButton = Instance.new("ImageButton")
                                    local UIListLayout = Instance.new("UIListLayout")

                                    local DropYSize = 42

                                    dropDownFrame.Name = "dropDownFrame"
                                    dropDownFrame.Parent = newPage
                                    dropDownFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                                    dropDownFrame.ClipsDescendants = true
                                    dropDownFrame.Position = UDim2.new(0.011029412, 0, 0.0205760058, 0)
                                    dropDownFrame.Size = UDim2.new(0, 394, 0, 42)

                                    mainCorner.CornerRadius = UDim.new(0, 3)
                                    mainCorner.Name = "mainCorner"
                                    mainCorner.Parent = dropDownFrame

                                    dropdownmain.Name = "dropdownmain"
                                    dropdownmain.Parent = dropDownFrame
                                    dropdownmain.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                                    dropdownmain.Size = UDim2.new(0, 394, 0, 42)

                                    mainCorner_2.CornerRadius = UDim.new(0, 3)
                                    mainCorner_2.Name = "mainCorner"
                                    mainCorner_2.Parent = dropdownmain

                                    dropdownItem.Name = "dropdownItem"
                                    dropdownItem.Parent = dropdownmain
                                    dropdownItem.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    dropdownItem.BackgroundTransparency = 1.000
                                    dropdownItem.Position = UDim2.new(0.0223523453, 0, 0, 0)
                                    dropdownItem.Size = UDim2.new(0, 291, 0, 41)
                                    dropdownItem.Font = Enum.Font.GothamSemibold
                                    dropdownItem.Text = dInfo
                                    dropdownItem.TextColor3 = Color3.fromRGB(255, 1, 43)
                                    dropdownItem.TextSize = 14.000
                                    dropdownItem.TextXAlignment = Enum.TextXAlignment.Left

                                    ImageButton.Parent = dropdownmain
                                    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                    ImageButton.BackgroundTransparency = 1.000
                                    ImageButton.Position = UDim2.new(0.89974618, 0, 0.238095239, 0)
                                    ImageButton.Size = UDim2.new(0, 27, 0, 21)
                                    ImageButton.Image = "rbxassetid://5165666242"
                                    ImageButton.ImageColor3 = Color3.fromRGB(181, 1, 31)
                                    ImageButton.MouseButton1Click:Connect(function()
                                        if isDropped then
                                            isDropped = false
                                            dropDownFrame:TweenSize(UDim2.new(0, 394, 0, 42), "In", "Quint", 0.10)
                                            game.TweenService:Create(ImageButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                                                Rotation = 0
                                            }):Play()
                                            wait(0.10)
                                            UpdateSize()
                                        else
                                            isDropped = true
                                            dropDownFrame:TweenSize(UDim2.new(0, 394, 0, DropYSize), "In", "Quint", 0.10)
                                            game.TweenService:Create(ImageButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                                                Rotation = 180
                                            }):Play()
                                            wait(0.10)
                                            UpdateSize()
                                        end
                                    end)


                                    UIListLayout.Parent = dropDownFrame
                                    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                                    UIListLayout.Padding = UDim.new(0, 5)

                                    for i,v in next, list do
                                        local optionBtn = Instance.new("TextButton")
                                        local mainCorner_3 = Instance.new("UICorner")

                                        optionBtn.Name = "optionBtn"
                                        optionBtn.Parent = dropDownFrame
                                        optionBtn.BackgroundColor3 = Color3.fromRGB(118, 0, 20)
                                        optionBtn.Position = UDim2.new(0.0253807101, 0, 0.311258286, 0)
                                        optionBtn.Size = UDim2.new(0, 377, 0, 39)
                                        optionBtn.Font = Enum.Font.GothamSemibold
                                        optionBtn.Text = "   "..v
                                        optionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        optionBtn.TextSize = 14.000
                                        optionBtn.TextXAlignment = Enum.TextXAlignment.Left
                                        DropYSize = DropYSize + 48
                                        mainCorner_3.CornerRadius = UDim.new(0, 3)
                                        mainCorner_3.Name = "mainCorner"
                                        mainCorner_3.Parent = optionBtn

                                        optionBtn.MouseButton1Click:Connect(function()
                                            callback(v)
                                            dropdownItem.Text = dInfo..": "..v
                                            dropDownFrame:TweenSize(UDim2.new(0, 394, 0, 42), "In", "Quint", 0.10)
                                            wait(0.10)
                                            UpdateSize()
                                            game.TweenService:Create(ImageButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{
                                                Rotation = 0
                                            }):Play()
                                            isDropped = false
                                        end)
                                    end
        end
        return ElementHandler
    end
    return SectionHandler
end 

return Orion
local OrionLib = Orion
end)()

--// Orion Window
local Window = OrionLib:MakeWindow({
	Name = "🌊 CodeClientX | Hub",
	HidePremium = false,
	SaveConfig = false,
	ConfigFolder = "CodeClientX"
})

local minimized = false
toggleBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	local main = game:GetService("CoreGui"):FindFirstChild("Orion"):FindFirstChild("Orion")
	if main then
		local goalSize = minimized and UDim2.new(0, 0, 0, 0) or UDim2.new(0, 500, 0, 400)
		local goalTrans = minimized and 1 or 0
		for _, obj in ipairs(main:GetDescendants()) do
			if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
				game:GetService("TweenService"):Create(obj, TweenInfo.new(0.3), {Size = goalSize, BackgroundTransparency = goalTrans}):Play()
			elseif obj:IsA("TextLabel") or obj:IsA("TextButton") then
				game:GetService("TweenService"):Create(obj, TweenInfo.new(0.3), {TextTransparency = goalTrans}):Play()
			end
		end
	end
end)

--// Tabs
local FarmTab = Window:MakeTab({Name = "🌱 Farm", Icon = "", PremiumOnly = false})
local PetsTab = Window:MakeTab({Name = "🐾 Pets", Icon = "", PremiumOnly = false})
local ShopTab = Window:MakeTab({Name = "🛒 Shop", Icon = "", PremiumOnly = false})

--// Logic Variables
local rep = game:GetService("ReplicatedStorage")
local crops = workspace:WaitForChild("Crops")
local gearShop = workspace:WaitForChild("Shop"):WaitForChild("Gear")
local seedShop = workspace:WaitForChild("Shop"):WaitForChild("Seeds")
local events = rep:WaitForChild("Events")

local auto1, auto2, autosell, autofeed, autobuyseed, autobuygear = false, false, false, false, false, false
local selectedSeed = "CarrotSeed"

--// Farm
FarmTab:AddToggle({Name = "Auto Harvest V1 (Instant)", Default = false, Callback = function(v) auto1 = v end})
FarmTab:AddToggle({Name = "Auto Harvest V2 (5/sec)", Default = false, Callback = function(v) auto2 = v end})
FarmTab:AddToggle({Name = "Auto Sell", Default = false, Callback = function(v) autosell = v end})

--// Pets
PetsTab:AddToggle({Name = "Auto Feed Pets", Default = false, Callback = function(v) autofeed = v end})

--// Shop
ShopTab:AddDropdown({
	Name = "Select Seed",
	Default = selectedSeed,
	Options = {"CarrotSeed", "TomatoSeed", "CornSeed", "CabbageSeed"},
	Callback = function(v) selectedSeed = v
end})

ShopTab:AddToggle({Name = "Auto Buy Selected Seed", Default = false, Callback = function(v) autobuyseed = v end})
ShopTab:AddToggle({Name = "Auto Buy Gear (if in stock)", Default = false, Callback = function(v) autobuygear = v end})

ShopTab:AddButton({Name = "🛒 Show Shop UI", Callback = function()
	local g = lp.PlayerGui:FindFirstChild("ShopUI")
	if g then g.Enabled = not g.Enabled end
end})

ShopTab:AddButton({Name = "📜 Show Quests", Callback = function()
	local q = lp.PlayerGui:FindFirstChild("Quests")
	if q then q.Enabled = not q.Enabled end
end})

ShopTab:AddButton({Name = "🦖 Show Prehistoric Quest", Callback = function()
	local pq = lp.PlayerGui:FindFirstChild("PrehistoricQuestUI")
	if pq then pq.Enabled = not pq.Enabled end
end})

ShopTab:AddButton({Name = "🎪 Show Traveling Merchants", Callback = function()
	for _,v in ipairs({"HoneyStand","AirBalloon","MerchantTent"}) do
		local m = lp.PlayerGui:FindFirstChild(v)
		if m then m.Enabled = not m.Enabled end
	end
end})

--// Blur background
local Lighting = game:GetService("Lighting")
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 10

--// Toggle Button GUI
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local pg = lp:WaitForChild("PlayerGui")

local toggleGui = Instance.new("ScreenGui", pg)
toggleGui.Name = "CodeClientX_Toggle"
toggleGui.ResetOnSpawn = false

local toggleBtn = Instance.new("TextButton", toggleGui)
toggleBtn.Size = UDim2.new(0, 160, 0, 40)
toggleBtn.Position = UDim2.new(0, 20, 0.7, 0)
toggleBtn.Text = "CodeClientX V1"
toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 153, 204)
toggleBtn.TextColor3 = Color3.new(1, 1, 1)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 18
toggleBtn.AutoButtonColor = true
toggleBtn.Draggable = false
toggleBtn.Active = true
toggleBtn.ZIndex = 99

-- Rounded corners
local corner = Instance.new("UICorner", toggleBtn)
corner.CornerRadius = UDim.new(0, 10)

-- Drag support
local dragging, offset
toggleBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		offset = input.Position - toggleBtn.AbsolutePosition
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local pos = UDim2.new(0, input.Position.X - offset.X, 0, input.Position.Y - offset.Y)
		toggleBtn.Position = pos
	end
end)

UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = false
	end
end)

--// Main loop
task.spawn(function()
	while task.wait(1) do
		if auto1 then
			for _,crop in ipairs(crops:GetDescendants()) do
				if crop:IsA("Model") and crop:FindFirstChild("Owner") and crop.Owner.Value == lp then
					events.CropHarvest:FireServer(crop)
				end
			end
		end
		if auto2 then
			local count = 0
			for _,crop in ipairs(crops:GetDescendants()) do
				if count >= 5 then break end
				if crop:IsA("Model") and crop:FindFirstChild("Owner") and crop.Owner.Value == lp then
					events.CropHarvest:FireServer(crop)
					count += 1
				end
			end
		end
		if autosell and lp.Character then
			for _,z in pairs(workspace:GetDescendants()) do
				if z:IsA("BasePart") and z.Name == "SellZone" then
					lp.Character:PivotTo(z.CFrame + Vector3.new(0,3,0))
					break
				end
			end
		end
		if autofeed then
			for _,p in ipairs(workspace:GetDescendants()) do
				if p:IsA("Model") and p.Name == "Pet" and p:FindFirstChild("Owner") and p.Owner.Value == lp then
					events.PetFeed:FireServer(p)
				end
			end
		end
		if autobuyseed and selectedSeed then
			local seedObj = seedShop:FindFirstChild(selectedSeed)
			if seedObj and seedObj:FindFirstChild("Stock") and seedObj.Stock.Value > 0 then
				events.SeedBuy:FireServer(selectedSeed)
			end
		end
		if autobuygear then
			for _,gear in ipairs({"Shovel", "WateringCan"}) do
				local gearObj = gearShop:FindFirstChild(gear)
				if gearObj and gearObj:FindFirstChild("Stock") and gearObj.Stock.Value > 0 then
					events.GearBuy:FireServer(gear)
				end
			end
		end
	end
end)

-- Final Orion Init
OrionLib:Init()
