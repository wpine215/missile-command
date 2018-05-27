City = Class {}

function City:init(x, y)
	self.x = x
	self.y = y
end

function City:render()
	-- Draw the city
	love.graphics.setColor(0.7, 0.7, 0.7, 1)
	-- Left of centerpoint
	love.graphics.rectangle('fill', self.x - 24, self.y - 40, 12, 40)
	love.graphics.rectangle('fill', self.x - 12, self.y - 75, 12, 75)
	-- Right of centerpoint
	love.graphics.rectangle('fill', self.x, self.y - 60, 20, 60)
	love.graphics.rectangle('fill', self.x + 20, self.y - 25, 20, 25)
end
