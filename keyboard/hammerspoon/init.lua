local log = hs.logger.new('init.lua', 'debug')

-- Use Control+` to reload Hammerspoon config
hs.hotkey.bind({'ctrl'}, 'å', nil, function()
  hs.reload()
end)

keyUpDown = function(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end

message = require('keyboard.status-message')
statusMessage = message.new('Config reloaded!')
statusMessage:notify(1)

-- Load submodules
require('keyboard.hyper')
require('keyboard.app-mode')

-- Vim Spoon
-- vim = hs.loadSpoon('VimMode')
-- vim:enableKeySequence('j', 'k')


hs.notify.new({title='Hammerspoon', informativeText='Ready to rock 🤓🤘'}):send()