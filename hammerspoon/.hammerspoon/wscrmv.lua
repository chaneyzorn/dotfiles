local function moveWindowToNextScreen()
  local win = hs.window.focusedWindow()
  if not win then
    return
  end

  local screens = hs.screen.allScreens()
  if #screens < 2 then
    return
  end

  local currentScreen = win:screen()
  local currentIndex = 0
  for i, screen in ipairs(screens) do
    if screen == currentScreen then
      currentIndex = i
      break
    end
  end

  local nextIndex = currentIndex % #screens + 1
  local nextScreen = screens[nextIndex]

  win:moveToScreen(nextScreen)
end

local M = {}

function M.setup()
  hs.hotkey.bind({ "ctrl", "cmd" }, "n", moveWindowToNextScreen)
end

return M
