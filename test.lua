local class = require 'lib.middleclass'

local Fruit = class('Fruit') -- 'Fruit' is the class' name

function Fruit:initialize(sweetness)
  print("fruit initialized")
  self.sweetness = sweetness
end

Fruit.static.sweetness_threshold = 5 -- class variable (also admits methods)

function Fruit:isSweet()
  return self.sweetness > Fruit.sweetness_threshold
end

local Lemon = class('Lemon', Fruit) -- subclassing

function Lemon:initialize()
  print("lemon initialized")
  Fruit.initialize(self, 1) -- invoking the superclass' initializer
end

local lemon = Lemon()
print(lemon)

print(lemon:isSweet()) -- false
