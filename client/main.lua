exports('getUtils', function() return Utils end)

local LR = {
    notify = ShowNotification,
    showUI = ShowUI,
    hideUI = HideUI,
    progressBar = ShowProgressBar,
    isProgressActive = IsProgressActive,
    cancelProgress = CancelProgress,
    openPedInteractionMenu = openPedInteractionMenu
}

exports('getEditables', function() return LR end)