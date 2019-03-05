local Object = require "../thirdparty/classic-master/classic"

RedSquare = Object:extend()

function RedSquare:new(x, y)
  self.x = x or 0
  self.y = y or 0
end