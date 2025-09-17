local callback

---@class Answer
---@field id string?
---@field label string
---@field icon string

---@class AnswerItem
---@field name string
---@field label string
---@field imageUrl string

---@class Interaction
---@field question string
---@field answers Answer[]?
---@field answerItems AnswerItem[]?
---@field answerNumberInput string?

---@param action string
---@param interaction Interaction
---@param header { name: string, specifier: name }?
local function showPedUI(action, interaction, header)
    SendNUIMessage({
        action = action,
        header = header,
        question = interaction.question,
        answers = interaction.answers,
        answerNumberInput = interaction.answerNumberInput,
        answerItems = interaction.answerItems
    }) 
end

---@param ped integer
---@param header { name: string, specifier: string }
---@param interaction Interaction
---@param cb fun(answer: { id: string?, itemName: string, value: number })
function openPedInteractionMenu(ped, header, interaction, cb)
    if not ped then
        error("Invalid ped's entity!", ped)
    end

    SetNuiFocus(true, true)
    showPedUI('show_npc', interaction, header)

    callback = cb
end

exports('openPedInteractionMenu', openPedInteractionMenu)

---@param data { type: string?, id: string, value: number, itemName: string }
RegisterNUICallback('npc_response', function(data, cb)
    cb(1)
    
    if data.id then
        if string.sub(data.id, 1, 4) == "pos_" then
            data.id = string.sub(data.id, 5)
        elseif string.sub(data.id, 1, 4) == "neg_" then
            data.id = string.sub(data.id, 5)
        end
    end

    ---@type Interaction
    local question = callback(data)

    if data.type == 'escape' or not question then
        SetNuiFocus(false, false)
        SendNUIMessage({ action = "hide_npc" })

        return
    end

    showPedUI('next_question', question)
end)