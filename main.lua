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
	
	cities = {}
	cities[1] = City(WINDOW_WIDTH / 5, FLOOR_HEIGHT, 30, 45)
	cities[2] = City(WINDOW_WIDTH / 2, FLOOR_HEIGHT, 30, 45)
	cities[3] = City(4 * WINDOW_WIDTH / 5, FLOOR_HEIGHT, 30, 45)

	missiles = {}
	for i=1,8 do
		missiles[i] = Missile(love.math.random(25, WINDOW_WIDTH - 25))
	end
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

	cities[1]:render()
	cities[2]:render()
	cities[3]:render()

	for _, missile in ipairs(missiles) do
		missile:render(dt)
	end
end