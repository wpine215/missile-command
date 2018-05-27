Missile = Class {}

function Missile:init(x)
	self.x1, self.x2 = x, x
	self.y1, self.y2 = 0, 0

	self.fx = math.random(10, WINDOW_WIDTH - 10)
	self.dx = (self.fx - self.x1) / 10
	-- self.dx = math.random(-50, 50)
	self.dy = math.random(50, 100)

	self.ymax = FLOOR_HEIGHT

	self.exprad = 0
	self.expdr = 20
	self.expmax = 20
end

function Missile:update(dt)
	if self.y2 + self.dy * dt > FLOOR_HEIGHT and self.exprad <= self.expmax then
	    self.y2 = FLOOR_HEIGHT
	    self.exprad = self.exprad + self.expdr * dt
	elseif self.y2 + self.dy * dt > FLOOR_HEIGHT and self.exprad > self.expmax then
		self.y2 = FLOOR_HEIGHT
	else
		self.x2 = self.x2 + self.dx * dt
		self.y2 = self.y2 + self.dy * dt
	end
end

function Missile:render()
	-- Draw the missile path
	love.graphics.setColor(0,1,0,1)
	love.graphics.line(self.x1, self.y1, self.x2, self.y2)
	if self.exprad > 0 then
	    love.graphics.circle('fill', self.x2, self.y2, self.exprad)
	end
end