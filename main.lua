
Object = require "thirdparty/classic-master/classic"

require "src/red_square"
local redSquare = RedSquare(10, 20)

-- ===========================================================================
-- ===========================================================================

function love.keypressed(key)
  redSquare:processKeyPressed(key)
end

function love.load(arg)  
  --
end

local palette = {}
palette.emptyScreen = {0.5, 0.5, 0.8, 1} -- 

function love.draw()
  local cww = love.graphics.getWidth(); -- current window width
  local cwh = love.graphics.getHeight();-- current window height 

  love.graphics.setColor(palette.emptyScreen)
  love.graphics.rectangle("fill", 0, 0, cww, cwh)

  --
  redSquare:drawSelf()
end

function love.update(diffTime)
  redSquare:processUpdate(diffTime)  
end
