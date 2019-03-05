
require "src/red_square"
local redSquare = RedSquare(10, 20)

-- ===========================================================================
-- ===========================================================================

function love.load(arg)  
  redSquare.x=13
end

function love.update(diffTime)
  --  
end

local palette = {}
palette.emptyScreen = {0.5, 0.5, 0.8, 1} -- 

function love.draw()

  love.graphics.setColor(palette.emptyScreen)
  love.graphics.rectangle("fill", 0, 0, 10, 20)
end
