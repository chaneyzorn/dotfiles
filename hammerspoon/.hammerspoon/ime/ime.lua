local function setupAppWatch()
  local appIme = {
    ["WezTerm"] = "com.apple.keylayout.ABC",
    ["Neovide"] = "com.apple.keylayout.ABC",
  }
  hs.application.watcher
    .new(function(appName, eventType, appObject)
      if eventType == hs.application.watcher.activated then
        local expectedImeId = appIme[appName]
        if expectedImeId and hs.keycodes.currentSourceID() ~= expectedImeId then
          hs.keycodes.currentSourceID(expectedImeId)
        end
      end
    end)
    :start()
end

local function setupImeWatch()
  local appIme = {
    ["WezTerm"] = "com.apple.keylayout.ABC",
    ["Neovide"] = "com.apple.keylayout.ABC",
  }
  hs.keycodes.inputSourceChanged(function()
    local appName = hs.window.focusedWindow():application():name()
    local expectedImeId = appIme[appName]
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
