Missile = Class {}

function Missile:init(x)
	self.target = math.random(1, 6)
	self.x1 = x
	self.x2 = x
	if self.target < 4 then
		self.fx = math.random(cities[self.target].l_edge, 
							  cities[self.target].r_edge)
	elseif self.target < 6 then
		self.fx = math.random(silos[self.target - 3].l_edge,
							  silos[self.target - 3].r_edge)
	else
		self.fx = math.random(25, WINDOW_WIDTH - 25)
	end

	self.y1 = 0
	self.y2 = 0
	self.fy = FLOOR_HEIGHT

	self.dx = self.fx - self.x1
	if self.dx == 0 then
	    -- Avoid divide by zero
	    self.dx = 0.01
	end
	self.dy = self.fy - self.y1
	self.speed = 75
	self.slope = self.dy / self.dx
	
	if self.slope > 0 then
	    self.angle = math.atan(self.slope) - math.pi
	else
		self.angle = math.atan(self.slope)
	end

	self.exprad = 0
	self.expmaxrad = 45
	self.expdr_grow = 60
	self.expdr_shrink = 90
	self.explen = 360

	self.growing = true
	self.impacted = false
end

function Missile:update(dt)
	if self.y2 + (self.dy * dt) > self.fy and self.growing == true then
	    self.y2 = FLOOR_HEIGHT
	    self.impacted = true
	    self.exprad = self.exprad + self.expdr_grow * dt
	    if self.exprad >= self.expmaxrad then
	        self.growing = false
	    end
	elseif self.y2 + (self.dy * dt) > self.fy then
		self.y2 = FLOOR_HEIGHT
		if self.explen > 0 then
			self.explen = self.explen - 1
		elseif self.explen == 0 then
		    if self.exprad - self.expdr_shrink * dt >= 0 then
	    		self.exprad = self.exprad - self.expdr_shrink * dt
	    	else
	    		self.exprad = 0
	    	end
		end
	else
		self.x2 = self.x2 + ((1 / self.slope) * self.speed) * dt
		self.y2 = self.y2 + self.speed * dt
	end
end

function Missile:render()
	-- Draw the missile path
	if self.impacted == false then
	    love.graphics.setColor(1,0,0,1)
	    love.graphics.setLineWidth(1)
		love.graphics.line(self.x1, self.y1, self.x2, self.y2)
		love.graphics.setColor(1,1,1,1)
		love.graphics.setLineWidth(5)

		love.graphics.push()
		love.graphics.translate(self.x2, self.y2)
		love.graphics.rotate(self.angle)
		love.graphics.line(0, 0, 20, 0)
		love.graphics.pop()
		-- love.graphics.line(self.x2 - ((1 / self.slope) * self.speed) / 4, self.y2 - self.speed / 4, self.x2, self.y2)
	end
	love.graphics.setColor(1,1,1,1)
	if self.exprad > 0 then
	    love.graphics.arc('fill', self.x2, self.y2, self.exprad, math.pi, 2 * math.pi)
	end
end