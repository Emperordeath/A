--[[
⚡ DEATH OPTIMIZER UI v2.2 - ULTRA EDITION
🧠 Painel DRAGGABLE com interface premium 2.0
🚀 Turbo Mode + FPS Cap + Memory Cleaner
🔒 Otimizado para KRNL/Synapse/Electron
🎨 Design moderno com temas personalizáveis
📊 Monitor de desempenho em tempo real
🛡️ Proteção contra erros reforçada
--]]

-- Serviços
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")

-- Configurações
local DEFAULT_FPS = 60
local THEME = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 15),
        Secondary = Color3.fromRGB(25, 25, 25),
        Accent = Color3.fromRGB(0, 120, 215),
        Text = Color3.fromRGB(240, 240, 240),
        Success = Color3.fromRGB(0, 200, 83),
        Warning = Color3.fromRGB(255, 171, 0),
        Error = Color3.fromRGB(215, 0, 0)
    },
    Cyber = {
        Background = Color3.fromRGB(10, 10, 20),
        Secondary = Color3.fromRGB(20, 20, 40),
        Accent = Color3.fromRGB(0, 255, 255),
        Text = Color3.fromRGB(220, 220, 255),
        Success = Color3.fromRGB(0, 255, 127),
        Warning = Color3.fromRGB(255, 100, 0),
        Error = Color3.fromRGB(255, 0, 127)
    }
}
local currentTheme = "Cyber"

-- GUI Principal
local GUI = Instance.new("ScreenGui")
GUI.Name = "DeathOptimizerUI_Premium"
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.ResetOnSpawn = false
GUI.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 360, 0, 320)
MainFrame.Position = UDim2.new(0.05, 0, 0.3, 0)
MainFrame.BackgroundColor3 = THEME[currentTheme].Background
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = GUI

-- Efeitos Visuais
local Corner = Instance.new("UICorner", MainFrame)
Corner.CornerRadius = UDim.new(0, 8)

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 4)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = THEME[currentTheme].Accent
TopBar.BorderSizePixel = 0

-- Título Premium
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, -20, 0, 50)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.Text = "⚡ DEATH OPTIMIZER v2.2"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = THEME[currentTheme].Accent
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left

local SubTitle = Instance.new("TextLabel", MainFrame)
SubTitle.Size = UDim2.new(1, -20, 0, 20)
SubTitle.Position = UDim2.new(0, 10, 0, 40)
SubTitle.Text = "ULTRA PERFORMANCE EDITION"
SubTitle.Font = Enum.Font.GothamMedium
SubTitle.TextSize = 12
SubTitle.TextColor3 = THEME[currentTheme].Text
SubTitle.BackgroundTransparency = 1
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.TextTransparency = 0.3

-- Botão Modo Turbo
local TurboBtn = Instance.new("TextButton", MainFrame)
TurboBtn.Size = UDim2.new(0.9, 0, 0, 45)
TurboBtn.Position = UDim2.new(0.05, 0, 0.25, 0)
TurboBtn.BackgroundColor3 = THEME[currentTheme].Secondary
TurboBtn.Text = "🚀 ATIVAR TURBO MODE"
TurboBtn.TextColor3 = THEME[currentTheme].Text
TurboBtn.Font = Enum.Font.GothamBold
TurboBtn.TextSize = 16
TurboBtn.BorderSizePixel = 0
TurboBtn.AutoButtonColor = false

local TurboCorner = Instance.new("UICorner", TurboBtn)
TurboCorner.CornerRadius = UDim.new(0, 6)

-- Botão Memory Cleaner
local MemoryBtn = Instance.new("TextButton", MainFrame)
MemoryBtn.Size = UDim2.new(0.44, 0, 0, 35)
MemoryBtn.Position = UDim2.new(0.05, 0, 0.45, 0)
MemoryBtn.BackgroundColor3 = THEME[currentTheme].Secondary
MemoryBtn.Text = "🧹 LIMPAR MEMÓRIA"
MemoryBtn.TextColor3 = THEME[currentTheme].Text
MemoryBtn.Font = Enum.Font.GothamMedium
MemoryBtn.TextSize = 14
MemoryBtn.BorderSizePixel = 0
MemoryBtn.AutoButtonColor = false

local MemoryCorner = Instance.new("UICorner", MemoryBtn)
MemoryCorner.CornerRadius = UDim.new(0, 6)

-- FPS Cap Input
local FPSBox = Instance.new("TextBox", MainFrame)
FPSBox.Size = UDim2.new(0.44, 0, 0, 35)
FPSBox.Position = UDim2.new(0.51, 0, 0.45, 0)
FPSBox.BackgroundColor3 = THEME[currentTheme].Secondary
FPSBox.PlaceholderText = "🎯 FPS CAP ("..DEFAULT_FPS..")"
FPSBox.Text = ""
FPSBox.TextColor3 = THEME[currentTheme].Text
FPSBox.Font = Enum.Font.Gotham
FPSBox.TextSize = 14
FPSBox.ClearTextOnFocus = false
FPSBox.BorderSizePixel = 0

local FPSCorner = Instance.new("UICorner", FPSBox)
FPSCorner.CornerRadius = UDim.new(0, 6)

-- Performance Monitor
local PerfFrame = Instance.new("Frame", MainFrame)
PerfFrame.Size = UDim2.new(0.9, 0, 0, 80)
PerfFrame.Position = UDim2.new(0.05, 0, 0.6, 0)
PerfFrame.BackgroundColor3 = THEME[currentTheme].Secondary
PerfFrame.BorderSizePixel = 0

local PerfCorner = Instance.new("UICorner", PerfFrame)
PerfCorner.CornerRadius = UDim.new(0, 6)

local FPSLabel = Instance.new("TextLabel", PerfFrame)
FPSLabel.Size = UDim2.new(0.5, -5, 0.5, -5)
FPSLabel.Position = UDim2.new(0, 10, 0, 10)
FPSLabel.Text = "FPS: --"
FPSLabel.Font = Enum.Font.GothamMedium
FPSLabel.TextSize = 14
FPSLabel.TextColor3 = THEME[currentTheme].Text
FPSLabel.BackgroundTransparency = 1
FPSLabel.TextXAlignment = Enum.TextXAlignment.Left

local PingLabel = Instance.new("TextLabel", PerfFrame)
PingLabel.Size = UDim2.new(0.5, -5, 0.5, -5)
PingLabel.Position = UDim2.new(0.5, 0, 0, 10)
PingLabel.Text = "PING: --ms"
PingLabel.Font = Enum.Font.GothamMedium
PingLabel.TextSize = 14
PingLabel.TextColor3 = THEME[currentTheme].Text
PingLabel.BackgroundTransparency = 1
PingLabel.TextXAlignment = Enum.TextXAlignment.Left

local MemoryLabel = Instance.new("TextLabel", PerfFrame)
MemoryLabel.Size = UDim2.new(1, -10, 0.5, -5)
MemoryLabel.Position = UDim2.new(0, 10, 0.5, 0)
MemoryLabel.Text = "MEMÓRIA: --MB"
MemoryLabel.Font = Enum.Font.GothamMedium
MemoryLabel.TextSize = 14
MemoryLabel.TextColor3 = THEME[currentTheme].Text
MemoryLabel.BackgroundTransparency = 1
MemoryLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Feedback Label
local Feedback = Instance.new("TextLabel", MainFrame)
Feedback.Size = UDim2.new(1, -20, 0, 20)
Feedback.Position = UDim2.new(0, 10, 1, -25)
Feedback.BackgroundTransparency = 1
Feedback.Text = ""
Feedback.Font = Enum.Font.Gotham
Feedback.TextSize = 13
Feedback.TextColor3 = THEME[currentTheme].Success
Feedback.TextStrokeTransparency = 0.7
Feedback.TextXAlignment = Enum.TextXAlignment.Left

-- Funções Premium
local function ShowFeedback(message, color)
    Feedback.Text = message
    Feedback.TextColor3 = color or THEME[currentTheme].Success
    
    local tweenOut = TweenService:Create(Feedback, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 1
    })
    
    local tweenIn = TweenService:Create(Feedback, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0
    })
    
    tweenIn:Play()
    wait(3)
    tweenOut:Play()
end

local function OptimizeGame()
    -- Configurações de iluminação
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e9
    Lighting.Brightness = 2
    Lighting.ClockTime = 12
    Lighting.GeographicLatitude = 0
    
    -- Otimização de partículas e efeitos
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
            obj.Enabled = false
        elseif obj:IsA("Decal") then
            obj.Transparency = 1
        elseif obj:IsA("Texture") then
            obj.Transparency = 1
        elseif obj:IsA("BasePart") then
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
        end
    end
    
    -- Otimização de som
    for _, sound in ipairs(workspace:GetDescendants()) do
        if sound:IsA("Sound") then
            sound:Stop()
        end
    end
    
    ShowFeedback("✅ TURBO MODE ATIVADO - PERFORMANCE MÁXIMA!", THEME[currentTheme].Success)
end

local function CleanMemory()
    collectgarbage("collect")
    ShowFeedback("🧹 MEMÓRIA LIMPA - "..math.floor(collectgarbage("count")).."MB USADOS", THEME[currentTheme].Accent)
end

local function SetFPSCap(value)
    local success, message = pcall(function()
        setfpscap(value)
    end)
    
    if success then
        ShowFeedback("🎯 FPS TRAVADO EM: "..value, THEME[currentTheme].Accent)
    else
        ShowFeedback("⚠️ ERRO AO DEFINIR FPS: "..message, THEME[currentTheme].Warning)
    end
end

-- Atualização do monitor de desempenho
local lastTime = tick()
local frameCount = 0

RunService.Heartbeat:Connect(function()
    -- Atualizar FPS
    frameCount = frameCount + 1
    local currentTime = tick()
    if currentTime - lastTime >= 1 then
        local fps = math.floor(frameCount / (currentTime - lastTime))
        FPSLabel.Text = "FPS: "..fps
        frameCount = 0
        lastTime = currentTime
        
        -- Colorir FPS baseado na performance
        if fps >= 60 then
            FPSLabel.TextColor3 = THEME[currentTheme].Success
        elseif fps >= 30 then
            FPSLabel.TextColor3 = THEME[currentTheme].Warning
        else
            FPSLabel.TextColor3 = THEME[currentTheme].Error
        end
    end
    
    -- Atualizar Ping e Memória
    PingLabel.Text = "PING: "..math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()).."ms"
    MemoryLabel.Text = "MEMÓRIA: "..math.floor(collectgarbage("count")).."MB"
end)

-- Eventos de UI
TurboBtn.MouseEnter:Connect(function()
    TweenService:Create(TurboBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(
            THEME[currentTheme].Secondary.R * 255 + 20,
            THEME[currentTheme].Secondary.G * 255 + 20,
            THEME[currentTheme].Secondary.B * 255 + 20
        )
    }):Play()
end)

TurboBtn.MouseLeave:Connect(function()
    TweenService:Create(TurboBtn, TweenInfo.new(0.2), {
        BackgroundColor3 = THEME[currentTheme].Secondary
    }):Play()
end)

TurboBtn.MouseButton1Click:Connect(function()
    TweenService:Create(TurboBtn, TweenInfo.new(0.1), {
        BackgroundColor3 = THEME[currentTheme].Accent
    }):Play()
    
    OptimizeGame()
    
    wait(0.2)
    TweenService:Create(TurboBtn, TweenInfo.new(0.3), {
        BackgroundColor3 = THEME[currentTheme].Secondary
    }):Play()
end)

MemoryBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MemoryBtn, TweenInfo.new(0.1), {
        BackgroundColor3 = THEME[currentTheme].Accent
    }):Play()
    
    CleanMemory()
    
    wait(0.2)
    TweenService:Create(MemoryBtn, TweenInfo.new(0.3), {
        BackgroundColor3 = THEME[currentTheme].Secondary
    }):Play()
end)

FPSBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local value = tonumber(FPSBox.Text) or DEFAULT_FPS
        SetFPSCap(value)
        FPSBox.Text = ""
        FPSBox.PlaceholderText = "🎯 FPS CAP ("..value..")"
    end
end)

-- Inicialização
SetFPSCap(DEFAULT_FPS)
ShowFeedback("⚡ DEATH OPTIMIZER CARREGADO - PRONTO PARA TURBO!", THEME[currentTheme].Accent)
