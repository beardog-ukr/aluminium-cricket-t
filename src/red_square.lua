
RedSquare = Object:extend()

function RedSquare:new(x, y)
  self.x = x or 0
  self.y = y or 0

  self.color = {0.8,0.1,0.1,1}
  self.size = 20

  self.speed = 300 -- px per second

  self.direction = "none"
end

function RedSquare:processKeyPressed(keyPressed)
  -- TODO: use constants here
  if ("right"==keyPressed) then
    self.direction = "right"
  elseif ("left"==keyPressed) then
    self.direction = "left"
  elseif ("down"==keyPressed) then
    self.direction = "down"
  elseif ("up"==keyPressed) then
    self.direction = "up"
  end
end

function RedSquare:processUpdate(diffTime)
  local coordinateDiff = (self.speed * diffTime)
  if ("right"==self.direction) then
    self.x = self.x + coordinateDiff
  elseif ("left"==self.direction) then
    self.x = self.x - coordinateDiff
  elseif ("down"==self.direction) then
    self.y = self.y + coordinateDiff
  elseif ("up"==self.direction) then
    self.y = self.y - coordinateDiff
  end  
end

function RedSquare:drawSelf()
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", self.x, self.y, self.size, self.size)
end

function RedSquare:boo()
  print("boo " .. self.x)
end