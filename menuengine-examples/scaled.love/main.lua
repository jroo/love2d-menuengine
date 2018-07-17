require "menuengine"

function love.load()
    
    INTERNAL_RES = {}
    INTERNAL_RES.x = 256
    INTERNAL_RES.y = 144
    
    EXTERNAL_RES = {}
    EXTERNAL_RES.x = 640
    EXTERNAL_RES.y = 360
    
    love.window.setMode(EXTERNAL_RES.x, EXTERNAL_RES.y)
    love.graphics.setFont(love.graphics.newFont(12))
    
    mainmenu = menuengine.new(20,20)
    mainmenu:addEntry("Mouse works, as", function()end)
    mainmenu:addEntry("you can see, on", function()end)
    mainmenu:addEntry("scaled Screens too!", function()end)
end


function love.update(dt)
    mainmenu:update()
end


function love.draw()
    -- Scale Resolution
    love.graphics.scale(love.graphics.getWidth() / INTERNAL_RES.x, love.graphics.getHeight() / INTERNAL_RES.y)
    
    love.graphics.clear()
    mainmenu:draw()
end


function love.keypressed(key, scancode, isrepeat)
    menuengine.keypressed(scancode)
    
    if scancode == "escape" then
        love.event.quit()
    end
end


function love.mousemoved(x, y, dx, dy, istouch)
    -- Scale Mouse Position
    x = x * (INTERNAL_RES.x / love.graphics.getWidth() )
    y = y * (INTERNAL_RES.y / love.graphics.getHeight() )
    menuengine.mousemoved(x, y)
end
