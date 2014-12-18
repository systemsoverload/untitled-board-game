local Entity = class('Entity')

function Entity:initialize()
	print("Entity init")
end

function Entity:update()
end

function Entity:spawn()
	-- Spawn should be called when an entity ACTIVELY enters the game space
end

function Entity:cleanup()
	print("Entity cleanup")
end

return Entity
