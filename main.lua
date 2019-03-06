local defm = require("src/app_defaults")
local ds = {}
defm.init(ds)

-- ===========================================================================

Object = require "thirdparty/classic-master/classic"

require "src/red_square"
local redSquare = RedSquare(10, 20)

-- ===========================================================================

function love.keypressed(key)
  redSquare:processKeyPressed(key)
end

function love.load(arg)
  local success = love.window.setMode(ds.windowWidth, ds.windowHeight,
                                      {resizable=false, minwidth=100, minheight=300})
  if (not success) then
    print("Failed to set window mode")
  end

  redSquare:setGameArea(ds.largeFrameSize, ds.largeFrameSize,
                        ds.gameAreaWidth, ds.gameAreaHeight)
end

function love.draw()
  local cww = love.graphics.getWidth(); -- current window width
  local cwh = love.graphics.getHeight();-- current window height

  love.graphics.setColor(ds.palette.emptyScreen)
  love.graphics.rectangle("fill", 0, 0, cww, cwh)

  --
  love.graphics.setColor(ds.palette.gameAreaBorder)
  love.graphics.rectangle("fill",
                          ds.largeFrameSize - ds.smallFrameSize, ds.largeFrameSize - ds.smallFrameSize,
                          ds.gameAreaWidth + ds.smallFrameSize*2, ds.smallFrameSize)
  love.graphics.rectangle("fill",
                          ds.largeFrameSize - ds.smallFrameSize, ds.largeFrameSize + ds.gameAreaHeight,
                          ds.gameAreaWidth + ds.smallFrameSize*2, ds.smallFrameSize)
  love.graphics.rectangle("fill",
                          ds.largeFrameSize - ds.smallFrameSize, ds.largeFrameSize,
                          ds.smallFrameSize, ds.gameAreaHeight)
  love.graphics.rectangle("fill",
                          ds.largeFrameSize + ds.gameAreaWidth, ds.largeFrameSize,
                          ds.smallFrameSize, ds.gameAreaHeight)
  --
  redSquare:drawSelf()
end

function love.update(diffTime)
  redSquare:processUpdate(diffTime)
end
