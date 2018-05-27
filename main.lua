Class = require 'class'
require 'Missile'
require 'City'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

MID_X = WINDOW_WIDTH / 2
MID_Y = WINDOW_WIDTH / 2

FLOOR_HEIGHT = 550

function love.load()
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = true
	})

	font = love.graphics.newFont(48)

	math.randomseed(os.time())

	missiles = {}
	for i=1,5 do
		missiles[i] = Missile(math.random(25, WINDOW_WIDTH - 25))
	end
	
	city1 = City(WINDOW_WIDTH / 5, FLOOR_HEIGHT)
	city2 = City(WINDOW_WIDTH / 2, FLOOR_HEIGHT)
	city3 = City(4 * WINDOW_WIDTH / 5, FLOOR_HEIGHT)
end

function love.update(dt)
	for _, missile in ipairs(missiles) do
		missile:update(dt)
	end
end

function love.keypressed(key)
	if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
	love.graphics.setLineWidth(2)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.line(0, FLOOR_HEIGHT, WINDOW_WIDTH, FLOOR_HEIGHT)

	city1:render()
	city2:render()
	city3:render()

	for _, missile in ipairs(missiles) do
		missile:render(dt)
	end
end