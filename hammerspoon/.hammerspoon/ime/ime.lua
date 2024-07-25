local function setupAppWatch()
  local appIme = {
    ["/Applications/WezTerm.app"] = "com.apple.keylayout.ABC",
    ["/Applications/Neovide.app"] = "com.apple.keylayout.ABC",
  }
  hs.application.watcher
    .new(function(appName, eventType, appObject)
      if eventType == hs.application.watcher.activated then
        local focusAppPath = appObject:path()
        local expectedImeId = appIme[focusAppPath]
        if expectedImeId and hs.keycodes.currentSourceID() ~= expectedImeId then
          hs.keycodes.currentSourceID(expectedImeId)
        end
      end
    end)
    :start()
end

local function setupImeWatch()
  local appIme = {
    ["/Applications/WezTerm.app"] = "com.apple.keylayout.ABC",
    ["/Applications/Neovide.app"] = "com.apple.keylayout.ABC",
  }
  hs.keycodes.inputSourceChanged(function()
    local focusAppPath = hs.window.focusedWindow():application():path()
    local expectedImeId = appIme[focusAppPath]
    if expectedImeId and hs.keycodes.currentSourceID() ~= expectedImeId then
      hs.keycodes.currentSourceID(expectedImeId)
    end
  end)
end

local function setupKeymap()
  hs.hotkey.bind({ "ctrl", "cmd" }, ".", function()
    local focusedApp = hs.window.focusedWindow():application()
    local appName = focusedApp:name()
    local appPath = focusedApp:path()
    local imeId = hs.keycodes.currentSourceID()
    hs.notify.show(appName, appPath, "IME: " .. imeId)
  end)
end

local M = {
  setup = function()
    setupAppWatch()
    setupImeWatch()
    setupKeymap()
  end,
}

return M
