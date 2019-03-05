local defm = require("src/app_defaults")
local ds = {}
defm.init(ds)

-- ===========================================================================

local rsc = {} -- red square settigs
rsc.kUp = "up"
rsc.kDown = "down"
rsc.kLeft = "left"
rsc.kRight = "right"
rsc.kNone = "none"

rsc.dirUp = 1
rsc.dirDown = 2
rsc.dirLeft = 3
rsc.dirRight = 4
rsc.dirStay = 0

-- ===========================================================================

RedSquare = Object:extend()

function RedSquare:drawSelf()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.baseX + self.x, self.baseY + self.y, 
                          self.size, self.size)
end

function RedSquare:new(x, y)
  self.x = x or 0
  self.y = y or 0

  self.baseX = x
  self.baseY = y

  self.gameAreaWidth = 50
  self.gameAreaHeight = 50

  self.color = {0.8,0.1,0.1,1}
  self.size = 20

  self.speed = 300 -- px per second

  self.direction = rsc.dirStay
end

function RedSquare:processKeyPressed(keyPressed)
  if (rsc.kUp==keyPressed) then
    self.direction = rsc.dirUp
  elseif (rsc.kDown==keyPressed) then
    self.direction = rsc.dirDown
  elseif (rsc.kLeft==keyPressed) then
    self.direction = rsc.dirLeft
  elseif (rsc.kRight==keyPressed) then
    self.direction = rsc.dirRight
  end
end

function RedSquare:processUpdate(diffTime)
  if (rsc.dirStay == self.direction) then
    return
  end

  local coordinateDiff = (self.speed * diffTime)
  local newX = self.x
  local newY = self.y

  if (rsc.dirRight==self.direction) then
    newX = self.x + coordinateDiff
  elseif (rsc.dirLeft==self.direction) then
    newX = self.x - coordinateDiff
  elseif (rsc.dirDown==self.direction) then
    newY = self.y + coordinateDiff
  elseif (rsc.dirUp==self.direction) then
    newY = self.y - coordinateDiff
  end

  if ((newX + self.size <= self.gameAreaWidth) and (newX >= 0) and
      (newY + self.size <= self.gameAreaHeight) and (newY >=0)) then
    self.x = newX
    self.y = newY
  end
end

function RedSquare:setGameArea(x,y, width, height)
  self.baseX = x
  self.baseY = y

  self.gameAreaWidth = width
  self.gameAreaHeight = height
end
