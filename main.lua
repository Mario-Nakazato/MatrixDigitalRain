require "/src/matrix"
utf8 = require "utf8"

function love.load(arg, unfilteredArg)
    if arg[#arg] == "-debug" then require("mobdebug").start() end -- ZeroBrane Studio para Debug

    tempo = true
    
    katakana = love.graphics.newFont("/src/msgothic.ttc", tamanho)
    love.graphics.setFont(katakana)

    ct, lt = love.graphics.getDimensions()
    tamanho = 16

    sims = matrix.instanciar(ct, lt, tamanho)
end

function love.update(dt)
    if not tempo then
        return
    end

    sims:update(dt)
end

function love.draw()
    sims:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "f5" then
        --love.load({})
        ct, lt = love.graphics.getDimensions()
        sims = matrix.instanciar(ct, lt, tamanho)
    elseif key == "f1" then
        tempo = not tempo
    elseif key == "f3" then
        love.window.minimize()
    end
end

--[[
function love.keyreleased(key, scancode)
end

function love.mousepressed(x, y, button, istouch, presses)
end

function love.mousereleased(x, y, button, istouch, presses)
end

function love.mousemoved(x, y, dx, dy, istouch)
end

function love.wheelmoved(x, y)
end

function love.mousefocus(focus)
end

function love.resize(w, h)
end

function love.focus(focus)
end

function love.quit()
end

function love.touchpressed(id, x, y, dx, dy, pressure)
end

function love.touchreleased(id, x, y, dx, dy, pressure)
end

function love.touchmoved(id, x, y, dx, dy, pressure)
end

function love.displayrotated(index, orientation)
end

function love.textedited(text, start, length)
end

function love.textinput(text)
end

function love.directorydropped(path)
end

function love.filedropped(file)
end

function love.errorhandler(msg)
end

function love.lowmemory()
end

function love.threaderror(thread, errorstr)
end

function love.visible(visible)-- Esta funcao CallBack não funciona, utilize visivel = love.window.isMinimized()
end

--love.physics world callbacks
function beginContact(a, b, coll)
end

function endContact(a, b, coll)
end

function preSolve(a, b, coll)
end

--postSolve(fixture1, fixture2, contact, normal_impulse1, tangent_impulse1, normal_impulse2, tangent_impulse2)
function postSolve(a, b, coll, normalimpulse, tangentimpulse)
end
--love.physics world callbacks
--]]
