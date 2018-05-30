City = Class {}

function City:init(x, y, lb, rb)
	self.x = x
	self.y = y

	self.lbound = lb
	self.rbound = rb

	self.l_edge = self.x - self.lbound
	self.r_edge = self.x + self.rbound
end

function City:render()
	-- Draw the city
	love.graphics.setColor(0.6, 0.6, 0.6, 1)
	-- Left of centerpoint
	love.graphics.rectangle('fill', self.x - self.lbound, self.y - 70, self.lbound, 70)
	-- Right of centerpoint
	love.graphics.rectangle('fill', self.x, self.y - 45, self.rbound, 45)
end
