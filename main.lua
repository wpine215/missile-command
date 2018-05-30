Class = require 'class'
require 'Missile'
require 'City'
require 'Silo'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

MID_X = WINDOW_WIDTH / 2
MID_Y = WINDOW_WIDTH / 2

FLOOR_HEIGHT = 550

function love.load()
	love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		resizable = false,
		vsync = false
	})

	--love.mouse.setVisible(false)
  	--love.mouse.setGrabbed(true)
  	--cursor = love.graphics.newImage("crosshair.png")

	font = love.graphics.newFont(48)

	math.randomseed(os.time())
	
	cities = {}
	cities[1] = City(1 * WINDOW_WIDTH / 6, FLOOR_HEIGHT, 45, 45)
	cities[2] = City(3 * WINDOW_WIDTH / 6, FLOOR_HEIGHT, 45, 45)
	cities[3] = City(5 * WINDOW_WIDTH / 6, FLOOR_HEIGHT, 45, 45)

	silos = {}
	silos[1] = Silo(2 * WINDOW_WIDTH / 6, FLOOR_HEIGHT)
	silos[2] = Silo(4 * WINDOW_WIDTH / 6, FLOOR_HEIGHT)

	missiles = {}
	for i=1,8 do
		missiles[i] = Missile(love.math.random(0, WINDOW_WIDTH))
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
	cities[1]:render()
	cities[2]:render()
	cities[3]:render()
	silos[1]:render()
	silos[2]:render()

	love.graphics.setLineWidth(2)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.line(0, FLOOR_HEIGHT, WINDOW_WIDTH, FLOOR_HEIGHT)

	for _, missile in ipairs(missiles) do
		missile:render(dt)
	end

	--love.graphics.draw(cursor, love.mouse.getX() - cursor:getWidth() / 2, love.mouse.getY() - cursor:getHeight() / 2)
end