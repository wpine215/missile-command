Missile = Class {}

function Missile:init(x)
	self.x1, self.x2 = x, x
	self.y1, self.y2 = 0, 0

	self.target = math.random(1, 3)
	-- self.fx = math.random(cities[target].l_edge, cities[target].r_edge)
	self.fx = cities[2].x
	self.dx = (self.fx - self.x1) / 10
	-- self.dx = math.random(-50, 50)
	self.dy = 75

	self.ymax = FLOOR_HEIGHT

	self.exprad = 0
	self.expmaxrad = 45

	self.expdr_grow = 60
	self.expdr_shrink = 90
	self.exp_duration = 90

	self.growing = true
	self.impacted = false
end

function Missile:update(dt)
	if self.y2 + self.dy * dt > FLOOR_HEIGHT and self.growing == true then
	    self.y2 = FLOOR_HEIGHT
	    self.impacted = true
	    self.exprad = self.exprad + self.expdr_grow * dt
	    if self.exprad >= self.expmaxrad then
	        self.growing = false
	    end
	elseif self.y2 + self.dy * dt > FLOOR_HEIGHT then
		self.y2 = FLOOR_HEIGHT
		if self.exp_duration > 0 then
			self.exp_duration = self.exp_duration - 1
		elseif self.exp_duration == 0 then
		    if self.exprad - self.expdr_shrink * dt >= 0 then
	    		self.exprad = self.exprad - self.expdr_shrink * dt
	    	else
	    		self.exprad = 0
	    	end
		end
	else
		self.x2 = self.x2 + self.dx * dt
		self.y2 = self.y2 + self.dy * dt
	end
end

function Missile:render()
	-- Draw the missile path
	if self.impacted == false then
	    love.graphics.setColor(1,0,0,1)
	    love.graphics.setLineWidth(1)
		love.graphics.line(self.x1, self.y1, self.x2, self.y2)
		love.graphics.setColor(1,1,1,1)
		love.graphics.setLineWidth(3)
		love.graphics.line(self.x2 - self.dx / 4, self.y2 - self.dy / 4, self.x2, self.y2)
	end
	love.graphics.setColor(1,1,1,1)
	if self.exprad > 0 then
	    -- love.graphics.circle('fill', self.x2, self.y2, self.exprad)
	    love.graphics.arc('fill', self.x2, self.y2, self.exprad, math.pi, 2 * math.pi)
	end
end