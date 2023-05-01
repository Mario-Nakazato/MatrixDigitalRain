require "matrix"
utf8 = require "utf8"

function love.load(arg)
  
  if arg[#arg] == "-debug" then require("mobdebug").start() end -- ZeroBrane Studio para Debug
  
  tempo = true
  timer = 0
  
  tamanho = 16
  
  katakana = love.graphics.newFont("msgothic.ttc", tamanho)
  
  ct, lt = love.graphics.getDimensions()
  
  tsims = {}
  
  x = 0
  
  for i = 1, math.floor(ct /tamanho) do
  
    sims = matrix.simbolos()
    sims:gerar(x)
    table.insert(tsims, sims)
    
    print(sims.atributo)
    print(love.getVersion())
    
    x = x +tamanho
    
  end
  
end

function love.update(dt)
  
  if not tempo then
    return
  end
  
  timer = timer +dt
  
  if timer > 32 then
    love.load(arg)
  end
  
  for c, v in pairs(tsims) do
    v:chuva(dt)
  end
  
end

function love.draw()
  
  love.graphics.setFont(katakana)
  for c, v in pairs(tsims) do
    v:desenhar()
  end
  
end

function love.keypressed(tecla, cod, repeticao)
  
  if tecla == "f5" then
  
    love.load({})
  
  elseif tecla == "f1" then
    
    tempo = not tempo
    
  elseif tecla == "f3" then
    love.window.minimize()
  end
  
end

function love.keyreleased(tecla, cod)
  
  
  
end

function love.mousepressed(x, y, botao, toque, repeticao)
  
  
  
end

function love.mousereleased(x, y, botao, toque, repeticao)
  
  
  
end

function love.mousemoved(x, y, dx, dy, toque)
  
  
  
end

function love.wheelmoved(x, y)
  
  
  
end

function love.mousefocus(foco)
  
  
  
end

function love.resize(c, l)
  
  
  
end

function love.focus(foco)
  
  
  
end

function love.quit()
  
  
  
end
--[[
function inicioContato(a, b, contato) 
  
  
  
end

function fimContato(a, b, contato)
  
  
  
end

function preContato(a, b, contato)
  
  
  
end

--function posContato(a, b, contato, normalImpulso, tangenteImpulso, normalImpulso1, tangenteImpulso1)
function posContato(a, b, contato, normalImpulso, tangenteImpulso)
  
  
  
end

function love.touchpressed(id, x, y, dx, dy, pressao)
  
  
  
end

function love.touchreleased(id, x, y, dx, dy, pressao)
  
  
  
end

function love.touchmoved(id, x, y, dx, dy, pressao)
  
  
  
end

function love.displayrotated(indice, orientacao)
  
  
  
end

function love.textedited(texto, inicio, tamanho)
  
  
  
end

function love.textinput(texto)
  
  
  
end

function love.directorydropped(caminho)
  
  
  
end

function love.filedropped(arquivo)
  
  
  
end

function love.errorhandler(erro)
  
  
  
end

function love.lowmemory()
  
  
  
end

function love.threaderror(thread, erro)
  
  
  
end

function love.visible(visivel)-- Esta funcao CallBack não funciona, utilize visivel = love.window.isMinimized()
end
--]]