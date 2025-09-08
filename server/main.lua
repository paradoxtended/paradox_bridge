local function getConfig()
    if not lib then
        error('ox_lib not found! did you modify fxmanifest?')
    end
    
    local oldCfg = _G['Config']
    require '@paradox_bridge.config.config'
    local cfg = _G['Config']
    _G['Config'] = oldCfg

    return cfg
end

exports('getConfig', getConfig)
exports('getUtils', function() return Utils end)