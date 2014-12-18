local Entity = require 'entities.entity'


local function card(name)
	local _card = {}
	local card_mt = {move=1, attack=1, name=name}
	setmetatable(_card, card_mt)
	return _card
end

local cards = {
	card("Card 1"),
	card("Card 2"),
	card("Card 3"),
	card("Card 4"),
	card("Card 5"),
	card("Card 6"),
}


---------------
-- Deck Stub --
---------------
local Deck = class('Deck')
function Deck:initialize()
	self.deck = {cards[1], cards[2]}
	self.hand = {cards[3],  cards[4]}
	self.trash = {cards[5], cards[6]}
end

function Deck:getDeck()
	return self.deck
end

function Deck:getHand()
	return self.hand
end

function Deck:getTrash()
	return self.trash
end

function Deck:drawHand()
	self.trashHand()
	for i=1,3 do
		table.insert(self.hand, i)
		table.remove(self.deck, i)
	end
end

function Deck:trashHand()
	for _, card in ipairs(self.hand) do
		table.insert(self.trash, card)
		table.remove(self.hand, card)
	end
end

function Deck:shuffle()
	for i=1,#self.hand do
		table.insert(self.deck, self.trash[i])
		table.remove(self.trash, i)
	end

	local n = #self.deck
	while n >= 2 do
		-- n is now the last pertinent index
		local k = math.random(n) -- 1 <= k <= n
		-- Quick swap
		self.deck[n], self.deck[k] = self.deck[k], self.deck[n]
		n = n - 1
	end
	print(inspect(self.deck))
end


-----------------
-- Player Stub --
-----------------
local Player = class('Player', Entity)
function Player:initialize()
	self.deck = Deck()
	print(inspect(self.deck:getDeck()))
	print("Now shuffle")
	self.deck:shuffle()
end

function Player:getDeck()
	return self.deck:getDeck()
end

function Player:getHand()
	return self.deck:getHand()
end

function Player:getTrash()
	return self.deck:getTrash()
end

return Player
