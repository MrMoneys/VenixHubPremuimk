local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = Frame

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 40, 0, 40)
Close.Position = UDim2.new(1, -40, 0, 0)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextScaled = true
Close.TextColor3 = Color3.fromRGB(150, 150, 150)
Close.Parent = Frame
Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Text = "Venix Hub [Premium]💎"
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local Instructions = Instance.new("TextLabel")
Instructions.Size = UDim2.new(0.5, 0, 0, 30)
Instructions.Position = UDim2.new(0.27, 0, 0.2, 0)
Instructions.Text = "Enter Key To Access The Script"
Instructions.TextSize = 13
Instructions.TextColor3 = Color3.fromRGB(150, 150, 150)
Instructions.BackgroundTransparency = 1
Instructions.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.5, 0, 0.2, 0)
TextBox.Position = UDim2.new(0.25, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

local TextBoxCorner = Instance.new("UICorner")
TextBoxCorner.CornerRadius = UDim.new(0, 5)
TextBoxCorner.Parent = TextBox

local CheckKey = Instance.new("TextButton")
CheckKey.Size = UDim2.new(0.60, 0, 0.15, 0)
CheckKey.Position = UDim2.new(0.20, 0, 0.7, 0)
CheckKey.BackgroundColor3 = Color3.fromRGB(0, 25, 0)
CheckKey.Text = "Check Key"
CheckKey.TextSize = 18
CheckKey.TextColor3 = Color3.fromRGB(150, 150, 150)
CheckKey.Parent = Frame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 5)
CheckKeyCorner.Parent = CheckKey

-- Lista de chaves válidas (pode ser criptografada ou armazenada no servidor)
local validKeys = {
    "zAquNaYERUDateTawu33",
    "vaMusejuPEWAfUgAxA23",
    "LabAKenEFuyewEPepA45",
    "WUsEqUSAFEwAyuZeZe29"
}

-- Função para validar a chave
local function validateKey(key)
    for _, validKey in ipairs(validKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

-- Contador de tentativas
local attempts = 0
local maxAttempts = 3

CheckKey.MouseButton1Click:Connect(function()
    local enteredKey = TextBox.Text
    if validateKey(enteredKey) then
        TextBox.PlaceholderText = "Correct Key!"
        TextBox.Text = ""
        wait(1)
        ScreenGui:Destroy()

        -- Carregar o script após a chave ser validada
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MrMoneys/VenixHub-Premium-/refs/heads/main/README.lua"))()
        
    else
        attempts = attempts + 1
        if attempts >= maxAttempts then
            TextBox.PlaceholderText = "Max attempts reached. Please try again later."
            TextBox.Text = ""
            CheckKey.Visible = false -- Desativa o botão após muitas tentativas 
            game.Players.LocalPlayer:Kick("Max attempts!")
            end

              
        else
            TextBox.PlaceholderText = "Invalid key. " .. (maxAttempts - attempts) .. " attempts left."
            TextBox.Text = ""
            wait(1)
            TextBox.PlaceholderText = "Enter Key..."
            TextBox.Text = ""
        end
    end
end)
