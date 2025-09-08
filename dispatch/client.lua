RegisterNetEvent('paradox_bridge:dispatch:call')
AddEventHandler('paradox_bridge:dispatch:call', function(coords, data)
    if Utils.isPolice() then
        lib.notify({
            title = data.Code,
            description = data.Message,
            position = 'top-right',
            duration = 10000,
            style = {
                width = 330,
                backgroundColor = '#0d3482',
                color = '#FFFFFF',
                padding = 20,
            },
            icon = 'shield-halved',
        })
        local blip = Utils.createBlip(coords, {
            name = data.Title,
            sprite = data.Sprite or 161, 
            scale = 2.0, 
            color = 0
        })
        Citizen.SetTimeout(30000, function()
            RemoveBlip(blip)
        end)
    end
end)