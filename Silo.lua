Silo = Class {}

function Silo:init(x, y)
	self.x = x
	self.y = y
	self.radius = 25
	self.height = 50

	self.l_edge = self.x - self.radius
	self.r_edge = self.x + self.radius
end

function Silo:update(dt)
	-- Update silo with # of missiles
end

function Silo:render()
	love.graphics.setColor(1, 0, 0, 1)
	love.graphics.rectangle('fill', 
			self.x - self.radius, 
			self.y, self.radius * 2, 
			self.height)
end