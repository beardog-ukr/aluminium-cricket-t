local def_m = require("src/app_defaults")
local ds = {}
def_m.init(ds)

local tween_m = require '../thirdparty/tween_lua-master/tween'

-- ===========================================================================

local rsc = {} -- red square settigs
rsc.kUp = "w"
rsc.kDown = "s"
rsc.kLeft = "a"
rsc.kRight = "d"
rsc.kNone = "none"

rsc.dirUp = 1
rsc.dirDown = 2
rsc.dirLeft = 3
rsc.dirRight = 4
rsc.dirStay = 0

-- ===========================================================================

GreenSquare = Object:extend()

function GreenSquare:drawSelf()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.baseX + self.x, self.baseY + self.y,
                          ds.cellSize, ds.cellSize)
end

function GreenSquare:new(x, y)
  self.x = x or 0
  self.y = y or 0

  self.baseX = x
  self.baseY = y

  self.gameAreaWidth = 50
  self.gameAreaHeight = 50

  self.color = {0.1,0.4,0.1,1}

  self.tween = nil

  self.directionCandidate = rsc.dirStay
  self.direction = rsc.dirStay
end

local function getDirectionFromKey(key)
  local result = nil

  if (rsc.kUp==key) then
    result = rsc.dirUp
  elseif (rsc.kDown==key) then
    result = rsc.dirDown
  elseif (rsc.kLeft==key) then
    result = rsc.dirLeft
  elseif (rsc.kRight==key) then
    result = rsc.dirRight
  end

  return result
end

local function startMove(square, newDirection)
  -- start new move
  local newX = square.x
  local newY = square.y
  local coordinateDiff = ds.cellSize + ds.cellDiscance

  if (rsc.dirRight==newDirection) then
    newX = square.x + coordinateDiff
  elseif (rsc.dirLeft==newDirection) then
    newX = square.x - coordinateDiff
  elseif (rsc.dirDown==newDirection) then
    newY = square.y + coordinateDiff
  elseif (rsc.dirUp==newDirection) then
    newY = square.y - coordinateDiff
  end

  if ((newX < square.gameAreaWidth) and (newX >= 0) and
      (newY < square.gameAreaHeight) and (newY >=0)) then
    print("starting tween")
    square.tween =  tween_m.new(5, square, {x = newX, y=newY})
  end
end

function GreenSquare:processKeyPressed(keyPressed)
  local newDirection = getDirectionFromKey(keyPressed)
  if (newDirection == nil) then
    print("Ignored " .. keyPressed)
    return -- key will be ignored
  end
  -- else
  if (self.tween == nil) then
    startMove(self, newDirection)
  else
    self.directionCandidate = newDirection
  end

end

function GreenSquare:processUpdate(diffTime)
  if (self.tween ~= nil) then
    local complete = self.tween:update(diffTime)
    if complete then
      if (self.directionCandidate ~= rsc.dirStay) then
        startMove(self, self.directionCandidate)
        self.directionCandidate = rsc.dirStay
      else
        self.tween = nil
      end
    end
  end
end

function GreenSquare:setGameArea(x,y, width, height)
  self.baseX = x
  self.baseY = y

  self.gameAreaWidth = width
  self.gameAreaHeight = height
end
